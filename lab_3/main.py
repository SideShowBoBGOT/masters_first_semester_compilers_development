import os
import sys
import re
import dataclasses
import enum
import typing
import pathlib
import typing

class TokenLparen(typing.NamedTuple):
    line_number: int
    column_number: int

class TokenRparen(typing.NamedTuple):
    line_number: int
    column_number: int

class TokenIdentifier(typing.NamedTuple):
    line_number: int
    column_number: int
    value: str

type Token = TokenLparen | TokenRparen | TokenIdentifier

def panic(msg: str) -> typing.NoReturn:
    print(msg)
    sys.exit(-1)

def tokenize(filepath: pathlib.Path | str) -> typing.Iterator[Token]:
    lparen_re = re.compile(r'[(]')
    rparen_re = re.compile(r'[)]')
    identifier_re = re.compile(r'[a-zA-Z!$%&*/+\-:<=>?^_~\.0-9]+')
    empty_re = re.compile(r'[ \t\r]+')
    newline_re = re.compile(r'[\n]')

    with open(filepath, 'r') as file:
        data = file.read()

    offset = 0
    line_number = 1
    last_newline_offset = 0
    column_number = offset - last_newline_offset + 1

    while offset < len(data):
        subdata = data[offset:]
        if (resmatch := lparen_re.match(subdata)):
            match_len = resmatch.end()
            offset += match_len
            yield TokenLparen(line_number, column_number)
        elif (resmatch := rparen_re.match(subdata)):
            match_len = resmatch.end()
            offset += match_len
            yield TokenRparen(line_number, column_number)
        elif (resmatch := identifier_re.match(subdata)):
            match_len = resmatch.end()
            offset += match_len
            yield TokenIdentifier(line_number, column_number, resmatch.group(0))
        elif (resmatch := empty_re.match(subdata)):
            match_len = resmatch.end()
            offset += match_len
        elif (resmatch := newline_re.match(subdata)):
            line_number += 1
            last_newline_offset = offset + 1
            offset += 1
        else:
            panic(f"Error: Unrecognized symbol at line {line_number}, position {column_number}")

@dataclasses.dataclass(frozen=True, slots=True)
class LispList:
    lparen: TokenLparen
    elements: list[typing.Union['LispList', 'TokenIdentifier']] = dataclasses.field(default_factory=list)

def build_lisp_tree(lisp_list: LispList, tokenizer: typing.Iterator[Token], lparens: list[TokenLparen]):
    for token in tokenizer:
        if isinstance(token, TokenLparen):
            lparens.append(token)
            sub_lisp_list = LispList(token)
            build_lisp_tree(sub_lisp_list, tokenizer, lparens)
            lisp_list.elements.append(sub_lisp_list)
        elif isinstance(token, TokenRparen):
            lparens.pop()
            return
        else:
            lisp_list.elements.append(token)

def at_line(token: Token):
    return f'at line {token.line_number}, column {token.column_number}'

def check_lisp_element_is_type(el: list[TokenIdentifier] | TokenIdentifier):
    assert isinstance(el, TokenIdentifier)

import enum

class VarType(enum.StrEnum):
    INT = 'int'
    FLOAT = 'float'
    BOOL = 'bool'

@dataclasses.dataclass(slots=True)
class SyntaxFunctionDefinition:
    name: str = ''
    return_type: VarType = VarType.INT
    arguments: list[VarType] = dataclasses.field(default_factory=list)
    variables: list[VarType] = dataclasses.field(default_factory=list)
    statements: list = dataclasses.field(default_factory=list)

IDENTIFIER_RE = re.compile("[a-zA-Z!$%&*/:<=>?^_~][a-zA-Z!$%&*/:<=>?^_~0-9]*|[+]|[-]")
INT_RE = re.compile("[+-]?[0-9]+")
FLOAT_RE = re.compile("[+-]?[0-9]+[.][0-9]+")

class VarTypePair(typing.NamedTuple):
    n: str
    t: VarType

def syntax_parse_arg_list(arg_list: LispList | TokenIdentifier):
    if isinstance(arg_list, LispList):
        syn_arg_list: list[VarTypePair] = []
        for name_type_pair in arg_list.elements:
            if isinstance(name_type_pair, LispList):
                if len(name_type_pair.elements) != 2:
                    panic(f'Error: Name type pair must have 2 elements {at_line(name_type_pair.lparen)}')
                arg_name = name_type_pair.elements[0]
                if isinstance(arg_name, TokenIdentifier):
                    if IDENTIFIER_RE.fullmatch(arg_name.value) is None:
                        panic(f'Error: Argument name does not match identifier pattern {at_line(arg_name)}')
                    arg_type = name_type_pair.elements[1]
                    if isinstance(arg_type, TokenIdentifier):
                        if arg_type.value not in VarType:
                            panic(f'Error: Argument type is not valid {at_line(arg_type)}')
                        syn_arg_list.append(VarTypePair(arg_name.value, VarType(arg_type.value)))
                    else:
                        panic(f'Error: Argument type must be an atom {at_line(arg_type.lparen)}')
                else:
                    panic(f'Error: Argument name must be an atom {at_line(arg_name.lparen)}')
            else:
                panic(f'Error: Name type pair must be a list {at_line(name_type_pair)}')
        return syn_arg_list
    else:
        panic(f'Error: Argument list must be a list {at_line(arg_list)}')

def check_atom_identifier(lisp_element: LispList | TokenIdentifier) -> TokenIdentifier:
    if isinstance(lisp_element, TokenIdentifier):
        if IDENTIFIER_RE.fullmatch(lisp_element.value):
            return lisp_element
        else:
            panic(f'Error: Element is not valid identifier {at_line(lisp_element)}')
    else:
        panic(f'Error: Element must be an atom {at_line(lisp_element.lparen)}')

class SyntaxBool(enum.StrEnum):
    TRUE = 'true'
    FALSE = 'false'

@dataclasses.dataclass(slots=True)
class SyntaxConstantBool:
    value: TokenIdentifier

@dataclasses.dataclass(slots=True)
class SyntaxConstantFloat:
    value: TokenIdentifier

@dataclasses.dataclass(slots=True)
class SyntaxConstantInt:
    value: TokenIdentifier

@dataclasses.dataclass(slots=True)
class SyntaxVariable:
    value: TokenIdentifier

type SyntaxVariableOrConstant = SyntaxVariable | SyntaxConstantInt | SyntaxConstantFloat | SyntaxConstantBool

def syntax_parse_var_or_const(lisp_element: LispList | TokenIdentifier) -> SyntaxVariableOrConstant:
    if isinstance(lisp_element, TokenIdentifier):
        if lisp_element.value in SyntaxBool:
            return SyntaxConstantBool(lisp_element)
        elif INT_RE.fullmatch(lisp_element.value):
            return SyntaxConstantInt(lisp_element)
        elif FLOAT_RE.fullmatch(lisp_element.value):
            return SyntaxConstantFloat(lisp_element)
        else:
            return SyntaxVariable(lisp_element)
    else:
        panic(f'Error: Element must be an atom {at_line(lisp_element.lparen)}')

@dataclasses.dataclass(slots=False)
class SyntaxFunctionCall:
    name: TokenIdentifier
    arguments: list[SyntaxVariableOrConstant]

type SyntaxVarOrConstOrFuncCall = SyntaxVariableOrConstant | SyntaxFunctionCall

def syntax_parse_var_or_const_or_func_call(statement_argument: LispList | TokenIdentifier) -> SyntaxVarOrConstOrFuncCall:
    if isinstance(statement_argument, TokenIdentifier):
        return syntax_parse_var_or_const(statement_argument)
    else:
        name = check_atom_identifier(statement_argument.elements[0])
        arguments: list[SyntaxVariableOrConstant] = []
        for el in statement_argument.elements[1:]:
            arguments.append(syntax_parse_var_or_const(el))
        return SyntaxFunctionCall(name, arguments)

@dataclasses.dataclass(slots=True)
class SyntaxStatementSet:
    dest: TokenIdentifier
    src: SyntaxVarOrConstOrFuncCall

@dataclasses.dataclass(slots=True)
class SyntaxStatementReturn:
    value: SyntaxVarOrConstOrFuncCall

@dataclasses.dataclass(slots=True)
class SyntaxStatementIf:
    condition: SyntaxVarOrConstOrFuncCall
    true_branch: list['SyntaxStatement']
    false_branch: list['SyntaxStatement']

@dataclasses.dataclass(slots=True)
class SyntaxStatementWhile:
    condition: SyntaxVarOrConstOrFuncCall
    statements: list['SyntaxStatement']

type SyntaxStatement = SyntaxStatementSet | SyntaxStatementIf | SyntaxStatementWhile | SyntaxStatementReturn

def syntax_parse_statement_list(lisp_statement_list: LispList | TokenIdentifier) -> list[SyntaxStatement]:
    if isinstance(lisp_statement_list, LispList):
        statements: list[SyntaxStatement] = []
        for lisp_statement in lisp_statement_list.elements:
            if isinstance(lisp_statement, LispList):
                if len(lisp_statement.elements) == 0:
                    panic(f'Error: Statement must be a non-empty list {at_line(lisp_statement.lparen)}')
                statement_name = lisp_statement.elements[0]
                if isinstance(statement_name, TokenIdentifier):
                    if statement_name.value == 'set':
                        if len(lisp_statement.elements) != 3:
                            panic(f'Error: Set statement list must have 3 elements {at_line(lisp_statement.lparen)}')
                        statements.append(
                            SyntaxStatementSet(
                                check_atom_identifier(lisp_statement.elements[1]),
                                syntax_parse_var_or_const_or_func_call(lisp_statement.elements[2])
                            )
                        )
                    elif statement_name.value == 'if':
                        if len(lisp_statement.elements) != 4:
                            panic(f'Error: If statement list must have 4 elements {at_line(lisp_statement.lparen)}')
                        statements.append(
                            SyntaxStatementIf(
                                syntax_parse_var_or_const_or_func_call(lisp_statement.elements[1]),
                                syntax_parse_statement_list(lisp_statement.elements[2]),
                                syntax_parse_statement_list(lisp_statement.elements[3]),
                            )
                        )
                    elif statement_name.value == 'while':
                        if len(lisp_statement.elements) != 3:
                            panic(f'Error: While statement list must have 3 elements {at_line(lisp_statement.lparen)}')
                        statements.append(
                            SyntaxStatementWhile(
                                syntax_parse_var_or_const_or_func_call(lisp_statement.elements[1]),
                                syntax_parse_statement_list(lisp_statement.elements[2]),
                            )
                        )
                    elif statement_name.value == 'return':
                        if len(lisp_statement.elements) != 2:
                            panic(f'Error: Return statement list must have 2 elements {at_line(lisp_statement.lparen)}')
                        statements.append(
                            SyntaxStatementReturn(syntax_parse_var_or_const_or_func_call(lisp_statement.elements[1]))
                        )
                    else:
                        panic(f'Error: Statement name is not valid {at_line(statement_name)}')
                else:
                    panic(f'Error: Statement name must be an atom {at_line(statement_name.lparen)}')
            else:
                panic(f'Error: Statement must be a list {at_line(lisp_statement)}')
        return statements 
    else:
        panic(f'Error: Statement list must be a list {at_line(lisp_statement_list)}')


def main():
    filepath = 'example.txt'
    lparens: list[TokenLparen] = []
    lisp_tree = LispList(TokenLparen(0, 0))
    build_lisp_tree(lisp_tree, tokenize(filepath), lparens)

    if len(lparens) > 0:
        panic(f'Error: Unmatched paren {at_line(lparens[-1])}')
    del lparens

    fn_defs: list[SyntaxFunctionDefinition] = []
    for fn_def in lisp_tree.elements:
        syn_fn_def = SyntaxFunctionDefinition()
        if isinstance(fn_def, LispList):
            if len(fn_def.elements) != 6:
                panic('')
            if isinstance(fn_def.elements[0], TokenIdentifier):
                if fn_def.elements[0].value != 'fn':
                    panic(f'Error: Function must start with fn {at_line(fn_def.elements[0])}')
                if isinstance(fn_def.elements[1], TokenIdentifier):
                    if IDENTIFIER_RE.fullmatch(fn_def.elements[1].value) is None:
                        panic(f'Error: Function name does not match identifier pattern {at_line(fn_def.elements[1])}')
                    syn_fn_def.name = fn_def.elements[1].value
                    if isinstance(fn_def.elements[2], TokenIdentifier):
                        if fn_def.elements[2].value not in VarType:
                            panic(f'Error: Function return type is not valid {at_line(fn_def.elements[2])}')
                        syn_fn_def.return_type = VarType(fn_def.elements[2].value)
                        syn_fn_def.arguments = syntax_parse_arg_list(fn_def.elements[3])
                        syn_fn_def.variables = syntax_parse_arg_list(fn_def.elements[4])
                        syn_fn_def.statements = syntax_parse_statement_list(fn_def.elements[5])
                        fn_defs.append(syn_fn_def)
                    else:
                        panic(f'Error: Function return type must be an atom {at_line(fn_def.elements[2].lparen)}')
                else:
                    panic(f'Error: Function name must be an atom {at_line(fn_def.elements[1].lparen)}')
            else:
                panic(f'Error: Function must start with atom {at_line(fn_def.elements[0].lparen)}')
        else:
            panic(f'Error: Function definition must be a list {at_line(fn_def)}')
        

if __name__ == '__main__':
    main()
