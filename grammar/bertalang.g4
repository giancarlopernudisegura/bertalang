grammar bertalang;

@tokenfactory {
pub type LocalTokenFactory<\'input> = antlr_rust::token_factory::ArenaCommonFactory<\'input>;
}

file
    : statement* EOF
    ;

statement
    : variable_declaration
    | variable_assignment
    | function_declaration
    | while_loop
    | foreach_loop
    | if_statement
    | RETURN expression END
    | expression END
    ;

variable_declaration
    : (VAR | CONST) IDENTIFIER (COLON type)? IS expression END
    ;

variable_assignment
    : IDENTIFIER IS expression END
    ;

type
    : base_type
    | FIELD_TYPE LEFT_BRACKET type RIGHT_BRACKET
    ;

base_type
    : INTEGER_TYPE
    | FLOAT_TYPE
    | BOOLEAN_TYPE
    | STRING_TYPE
    | VOID_TYPE
    ;

function_declaration
    : type IDENTIFIER LEFT_PAREN (function_argument (COMMA function_argument)*)?
      RIGHT_PAREN LEFT_CURLY statement* RIGHT_CURLY
    ;

function_argument
    : IDENTIFIER COLON type
    ;

function_call
    : IDENTIFIER LEFT_PAREN (expression (COMMA expression)*)? RIGHT_PAREN
    ;

expression
    : function_call     # function
    | STRING_LITERAL    # literal
    | BOOLEAN_LITERAL   # literal
    | INTEGER_LITERAL   # literal
    | FLOAT_TYPE        # literal
    | IDENTIFIER        # id
    ;

while_loop
    : WHILE expression LEFT_CURLY statement* RIGHT_CURLY
    ;

foreach_loop
    : FOREACH IDENTIFIER IN expression LEFT_CURLY statement* RIGHT_CURLY
    ;

if_statement
    : IF expression LEFT_CURLY statement* RIGHT_CURLY (ELSE if_statement)?
    ;

END
    : 'eh!'
    ;

IS
    : 'is'
    ;

IN
    : 'in'
    ;

COLON
    : ':'
    ;

COMMA
    : ','
    ;

INTEGER_TYPE
    : [🚜🌾] ('8' | '16' | '32' | '64' | '128')
    ;

FLOAT_TYPE
    : '🛢️' ('32' | '64' | '128')
    ;

BOOLEAN_TYPE
    : 'oh yeah?'
    ;

STRING_TYPE
    : 'str'
    ;

FIELD_TYPE
    : 'field'
    ;

VOID_TYPE
    : '🐀'
    ;

ESC
    : '\\\\' | '\\"' | '\\n' | '\\r' | '\\t'
    ;

COMMENT
    : 'just so you know' .*? '\n' -> skip
    ;

VAR
    : 'buddy'
    ;

CONST
    : 'give\'r'
    ;

RETURN
    : 'send it'
    ;

PRINT
    : 'you know what?'
    ;

INPUT
    : 'hand me a dart'
    ;

WHILE
    : 'roll coal while'
    ;

FOREACH
    : 'for all of them'
    ;

IF
    : 'if fucking buddy over there says'
    ;

ELSE
    : 'else'
    ;

LEFT_BRACKET
    : '['
    ;

RIGHT_BRACKET
    : ']'
    ;

LEFT_PAREN
    : '('
    ;

RIGHT_PAREN
    : ')'
    ;

LEFT_CURLY
    : '{'
    ;

RIGHT_CURLY
    : '}'
    ;

STRING_LITERAL
    : '"' (ESC | ~["])* '"'
    ;

BOOLEAN_LITERAL
    : 'Alberta'
    | 'Quebec'
    ;

INTEGER_LITERAL
    : [0-9]+
    | '0x' [0-9a-fA-F]+
    | '0b' [01]+
    ;

IDENTIFIER
    : [a-zA-Z_] [a-zA-Z_0-9]*
    ;

WS
    : [ \t\r\n]+ -> skip
    ;
