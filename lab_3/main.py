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

Token: typing.TypeAlias = TokenLparen | TokenRparen | TokenIdentifier

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

def main():
    filepath = 'example.txt'
    lparens: list[TokenLparen] = []
    lisp_tree = LispList(TokenLparen(0, 0))
    build_lisp_tree(lisp_tree, tokenize(filepath), lparens)

    if len(lparens) > 0:
        panic(f'Error: Unmatched paren {at_line(lparens[-1])}')
    del lparens

    idetifier_re = re.compile("[a-zA-Z!$%&*/:<=>?^_~][a-zA-Z!$%&*/:<=>?^_~0-9]*|[+]|[-]")

    for fn_def in lisp_tree.elements:
        syn_fn_def = SyntaxFunctionDefinition()
        if not isinstance(fn_def, LispList):
            panic(f'Error: Function definition must be a list {at_line(fn_def)}')
        if len(fn_def.elements) != 6:
            panic('')
        if not isinstance(fn_def.elements[0], TokenIdentifier):
            panic(f'Error: Function must start with atom {at_line(fn_def.elements[0].lparen)}')
        if fn_def.elements[0].value != 'fn':
            panic(f'Error: Function must start with fn {at_line(fn_def.elements[0])}')
        if not isinstance(fn_def.elements[1], TokenIdentifier):
            panic(f'Error: Function name must be an atom {at_line(fn_def.elements[1].lparen)}')
        if idetifier_re.fullmatch(fn_def.elements[1].value) is None:
            panic(f'Error: Function name does not match identifier pattern {at_line(fn_def.elements[1])}')
        syn_fn_def.name = fn_def.elements[1].value
        if not isinstance(fn_def.elements[2], TokenIdentifier):
            panic(f'Error: Function return type must be an atom {at_line(fn_def.elements[2].lparen)}')
        if fn_def.elements[2].value not in VarType:
            panic(f'Error: Function return type is not valid {at_line(fn_def.elements[2])}')
        syn_fn_def.return_type = VarType(fn_def.elements[2].value)
        



if __name__ == '__main__':
    main()
