import sys
from antlr4 import *

# Assuming your grammar file is named 'lab.g4', ANTLR generates these
from labLexer import labLexer
from labParser import labParser

def parse_file(file_path, start_rule_name):
    """
    Reads an input file and uses the ANTLR-generated parser to create a parse tree.
    """
    try:
        # Read the file content
        input_stream = FileStream(file_path, encoding='utf-8')
    except Exception as e:
        print(f"Error reading file: {e}")
        return

    # 1. Create a Lexer
    lexer = labLexer(input_stream)
    stream = CommonTokenStream(lexer)

    # 2. Create a Parser
    parser = labParser(stream)
    
    # Enable error reporting (optional, but useful)
    # parser.addErrorListener(ConsoleErrorListener.INSTANCE) 

    # 3. Invoke the starting rule dynamically
    # The 'start_rule_name' is the first rule the parser should match (e.g., 'program')
    try:
        start_rule = getattr(parser, start_rule_name)
        tree = start_rule()

        # 4. Print the parse tree in LISP format
        print("--- Parse Tree Output (LISP format) ---")
        print(tree.toStringTree(recog=parser))
        print("---------------------------------------")

        # Optional: Walk the tree (for actual compiler logic)
        # walker = ParseTreeWalker()
        # walker.walk(MyListener(), tree) # Use a custom Listener or Visitor here

    except AttributeError:
        print(f"Error: Start rule '{start_rule_name}' not found in the generated parser.")
    except Exception as e:
        print(f"Parsing error: {e}")


if __name__ == '__main__':
    # You are in the 'lab_6' directory, so the paths are local
    grammar_file = 'lab.g4' # For reference
    input_file = 'example.txt'
    
    # Use the same starting rule you used with antlr4-parse
    start_rule = 'program' 
    
    print(f"Parsing '{input_file}' using rule '{start_rule}'...")
    parse_file(input_file, start_rule)