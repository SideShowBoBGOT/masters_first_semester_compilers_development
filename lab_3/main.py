import os
import re
import dataclasses
import enum
import typing
import pathlib
from typing import Iterator

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

Token = TokenLparen | TokenRparen | TokenIdentifier

def panic(msg: str):
    print(msg)
    exit(-1)

def tokenize(filepath: pathlib.Path | str) -> Iterator[Token]:
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

LispElement: typing.TypeAlias = list[TokenIdentifier] | TokenIdentifier

def build_lisp_tree(elements: list[LispElement], tokenizer: typing.Iterator[Token], lparens: list[TokenLparen]):
    for token in tokenizer:
        if isinstance(token, TokenLparen):
            lparens.append(token)
            sub_elements: list[LispElement] = []
            build_lisp_tree(sub_elements, tokenizer, lparens)
            elements.append(sub_elements)
        elif isinstance(token, TokenRparen):
            lparens.pop()
        else:
            elements.append(token)

def main():
    filepath = 'example.txt'
    lparens: list[TokenLparen] = []
    lisp_tree: list[LispElement] = []
    build_lisp_tree(lisp_tree, tokenize(filepath), lparens)
    if len(lparens) > 0:
        panic(f'Error: Umatched paren at line {lparens[-1].line_number}, position {lparens[-1].column_number}')
    del lparens
    


if __name__ == '__main__':
    main()
