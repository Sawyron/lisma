grammar Lisma;
prog: state+ EOF;
state:
	'state' ID LPAREN expr RPAREN LBRACKET (diff_def | alg_def)* RBRACKET 'from' ID (
		',' ID
	)*;
diff_def: ID '\'' '=' expr;
alg_def: ID '=' expr;
expr:
	expr BIN_OP expr
	| NUMBER
	| LPAREN expr RPAREN
	| L_UN_OP expr
	| ID LPAREN expr* RPAREN
	| ID;
ID: [a-zA-Z_$]([a-zA-Z_$0-9])*;
SIGN: '+' | '-';
BIN_OP:
	SIGN
	| '*'
	| '/'
	| '&&'
	| '||'
	| '^'
	| '=='
	| '!='
	| '<'
	| '<='
	| '>'
	| '>=';
L_UN_OP: '!';
LPAREN: '(';
RPAREN: ')';
LBRACKET: '{';
RBRACKET: '}';
FORMAT: [\r\n\t ]+ -> skip;
NUMBER: SIGN? [0-9]+ ('.' [0-9]+)?;