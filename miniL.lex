%{
  int lineNum = 1, lineCol = 0;
%}

/*To define different patterns*/

DIGIT [0-9]
DIGIT_UNDERSCORE [0-9_]
LETTER [a-zA-Z]
LETTER_UNDERSCORE [a-zA-Z_]
CHAR [0-9a-zA-Z_]
ALPHANUMER [0-9a-zA-Z]
WHITESPACE [\t ]
NEWLINE [\n]

/* Define Rules */
%%

"-"       {printf("SUB \n"); ++lineCol;}
"+"       {printf("ADD\n"); ++lineCol;}

{LETTER}({CHAR}*{ALPHANUMER}+)? {
  printf("IDENT %s\n", yytext);
  lineCol += yyleng;
	}

{DIGIT}+ {
  printf("NUMBER %s\n", yytext);
  lineCol += yyleng;
       }

%%
//int yyparse();

int main(int argc, char* argv[]) {
  if (argc == 2) {
    yyin = fopen(argv[1], "r");
    if (yyin == 0) {
      printf("Error opening file: %s\n", argv[1]);
      exit(1);
    }
  }
  else {
    yyin = stdin;
  }

  yylex();
  //yyparse();
  
  return 0;
}
