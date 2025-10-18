import sys
import dataclasses
from typing import Optional, List, Tuple

@dataclasses.dataclass
class TokenEntry:
    token: str
    line: int
    index: Optional[int]  


token_table: List[TokenEntry] = []
id_table: dict[str, int] = {}
const_table: dict[Tuple[str, str], int] = {}
_id_counter = 0
_const_counter = 0

def add_token(token: str, line: int, index: Optional[int] = None) -> str:
    token_table.append(TokenEntry(token, line, index))
    return token

def add_id(lexeme: str) -> Tuple[str, int]:
    global _id_counter
    if lexeme not in id_table:
        _id_counter += 1
        id_table[lexeme] = _id_counter
    return ("ID", id_table[lexeme])

def add_const(lexeme: str, ctype: str) -> Tuple[str, int]:
    global _const_counter
    key = (lexeme, ctype)
    if key not in const_table:
        _const_counter += 1
        const_table[key] = _const_counter
    return (ctype, const_table[key])

class Source:
    def __init__(self, text: str):
        self.text = text
        self.n = len(text)
        self.i = 0
        self.line = 1
        self.col = 0

    def eof(self) -> bool:
        return self.i >= self.n

    def peek(self) -> str:
        if self.i >= self.n:
            return ''
        return self.text[self.i]

    def get(self) -> str:
        if self.i >= self.n:
            return ''
        ch = self.text[self.i]
        self.i += 1
        if ch == '\n':
            self.line += 1
            self.col = 0
        else:
            self.col += 1
        return ch

    def unget(self):
        if self.i == 0:
            return
        self.i -= 1
        ch = self.text[self.i]
        if ch == '\n':
            
            self.line -= 1
            
            j = self.i - 1
            c = 0
            while j >= 0 and self.text[j] != '\n':
                c += 1
                j -= 1
            self.col = c
        else:
            self.col -= 1
            if self.col < 0:
                self.col = 0

def is_ws(c: str) -> bool:
    return c in ' \t\r\n'

def is_digit(c: str) -> bool:
    return '0' <= c <= '9'

def is_id_start(c: str) -> bool:
    
    return (c.isalpha() or c == '_' or c in '+-*/^<=>')

def is_id_body(c: str) -> bool:
    
    return (c.isalpha() or c.isdigit() or c == '_' or c in '+-*/^<=>')


TYPES = {
    'int': 'TYPE_INTEGER',
    'real': 'TYPE_REAL',
    'string': 'TYPE_STRING',
    'bool': 'TYPE_BOOL',
}
KEYWORDS = {
    'fn': 'KEYWORD_FN',
    'let': 'KEYWORD_LET',
    'if': 'KEYWORD_IF',
    'while': 'KEYWORD_WHILE',
}
BOOLS = {'true', 'false'}

def classify_id(lexeme: str) -> Tuple[str, Optional[int]]:
    
    if lexeme in TYPES:
        return (TYPES[lexeme], None)
    if lexeme in KEYWORDS:
        return (KEYWORDS[lexeme], None)
    if lexeme in BOOLS:
        tok, idx = add_const(lexeme, 'LITERAL_BOOL')
        return ('LITERAL_BOOL', idx)
    tok, idx = add_id(lexeme)
    return (tok, idx)





def error(line: int, col: int, msg: str):
    print(f"Помилка на рядку {line}, позиція {col}: {msg}")
    sys.exit(1)

def lex(source: Source):
    while True:
        
        while not source.eof() and is_ws(source.peek()):
            source.get()

        if source.eof():
            break

        ch = source.get()

        
        if ch == '(':
            add_token('LPAREN', source.line)
            continue
        if ch == ')':
            add_token('RPAREN', source.line)
            continue

        
        if ch == '"':
            buf = []
            while True:
                if source.eof():
                    error(source.line, source.col, "Незакритий рядок")
                c = source.get()
                if c == '"':
                    lexeme = ''.join(buf)
                    tok, idx = add_const(lexeme, 'LITERAL_STRING')
                    add_token('LITERAL_STRING', source.line, idx)
                    break
                if c == '\n' or c == '\r':
                    error(source.line, source.col, "Рядок перенесено до закриття '\"'")
                if c == '\\':
                    
                    if source.eof():
                        error(source.line, source.col, "Незавершена escape-послідовність")
                    e = source.get()
                    
                    if e == 'n':
                        buf.append('\n')
                    elif e == 'r':
                        buf.append('\r')
                    elif e == 't':
                        buf.append('\t')
                    elif e == '"':
                        buf.append('"')
                    elif e == '\\':
                        buf.append('\\')
                    else:
                        
                        buf.append(e)
                else:
                    buf.append(c)
            continue

        
        if ch in '+-':
            nxt = source.peek()
            if is_digit(nxt):
                
                buf = [ch]
                
                while is_digit(source.peek()):
                    buf.append(source.get())
                if source.peek() == '.':
                    
                    buf.append(source.get())  
                    if not is_digit(source.peek()):
                        error(source.line, source.col, "Після крапки очікується цифра")
                    while is_digit(source.peek()):
                        buf.append(source.get())
                    lexeme = ''.join(buf)
                    tok, idx = add_const(lexeme, 'LITERAL_REAL')
                    add_token('LITERAL_REAL', source.line, idx)
                else:
                    lexeme = ''.join(buf)
                    tok, idx = add_const(lexeme, 'LITERAL_INTEGER')
                    add_token('LITERAL_INTEGER', source.line, idx)
                continue
            else:
                
                
                pass

        
        if ch.isdigit():
            buf = [ch]
            while is_digit(source.peek()):
                buf.append(source.get())
            if source.peek() == '.':
                buf.append(source.get())  
                if not is_digit(source.peek()):
                    error(source.line, source.col, "Після крапки очікується цифра")
                while is_digit(source.peek()):
                    buf.append(source.get())
                lexeme = ''.join(buf)
                tok, idx = add_const(lexeme, 'LITERAL_REAL')
                add_token('LITERAL_REAL', source.line, idx)
            else:
                lexeme = ''.join(buf)
                tok, idx = add_const(lexeme, 'LITERAL_INTEGER')
                add_token('LITERAL_INTEGER', source.line, idx)
            continue

        
        if is_id_start(ch):
            buf = [ch]
            while is_id_body(source.peek()):
                buf.append(source.get())
            lexeme = ''.join(buf)
            tok, idx = classify_id(lexeme)
            add_token(tok, source.line, idx)
            continue

        
        error(source.line, source.col, f"Неприпустимий символ '{ch}'")

def lexical_analysis(filename: str):
    global token_table, id_table, const_table, _id_counter, _const_counter
    token_table = []
    id_table = {}
    const_table = {}
    _id_counter = 0
    _const_counter = 0

    with open(filename, 'r', encoding='utf-8') as f:
        text = f.read()

    src = Source(text)
    lex(src)
    
    print("Таблиця розбору:")
    for e in token_table:
        print((e.token, e.line, e.index))

    print("\nТаблиця ідентифікаторів:")
    for k, v in sorted(id_table.items(), key=lambda kv: kv[1]):
        print(f"{v}: {k}")

    print("\нТаблиця констант:")
    for (lexeme, ctype), idx in sorted(const_table.items(), key=lambda kv: kv[1]):
        print(f"{idx}: {lexeme} ({ctype})")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Вкажіть шлях до файлу: python lexer.py program.txt")
        sys.exit(0)
    lexical_analysis(sys.argv[1])

