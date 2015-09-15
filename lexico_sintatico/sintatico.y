%error-verbose
%{
 #include<stdio.h>
	int prod = 0;
 void yyerror(const char *p){ printf("error %s\n",p);}
 extern FILE *yyin;

%}
%union{
	int val;
	float valf;
	char *sym;
}
%token <val> integer
%token <valf> real
%token <sym> sum sub EOL power mul divisor mod id sen cos tan absoluto lparen rparen
%type <val> S E F G H I J K
%%
run: S run | S

S: E EOL {/*prod++; printf("S:EEOL\n"); */printf("reconheceu\n"); /*return 0;*/}

E: F G {/*prod++; printf("E:FG\n");*/}

G: sum F G {/*prod++; printf("SUM F\n");*/}
| sub F G {/*printf("SUB F\n");*/}
| {/*printf("lambda\n");*/}

F: H I {/*printf("HI\n");*/}

I: power H I {/*printf("POWER H\n");*/}
| {/*printf("lambda\n");*/}

H: J K {/*printf("JK \n");*/}

K: mul J K {/*printf(" MUL J\n");*/}
| divisor J K {/*printf("DIVISOR J\n");*/}
| mod J K {/*printf("mod J\n");*/}
| {/*printf("lambda\n");*/}

J: id {/*printf("id:\n");*/}
| sub id {/*printf("-id:\n"); */}
| real { /*printf("real\n"); */}
| integer { /*printf("integer\n");*/}
| sub integer {/*printf("integer negative\n");*/}
| lparen E rparen {/*printf("()\n");*/}
| sen lparen E rparen {/*printf("sen()\n");*/}
| cos lparen E rparen {/*printf("cos()\n");*/}
| tan lparen E rparen {/*printf("cos()\n");*/}
| absoluto lparen E rparen {/*printf("abs()\n");*/}
| error EOL {}

%%
int main(int argc, char **argv){
	yyin = fopen(argv[1],"r");
	yyparse();
	fclose(yyin);
	return 0;
}
/*int main(int argc, char **argv){
	yyin = fopen(argv[1],"r");
	yylex();
	fclose(yyin);
	return 0;
}*/
