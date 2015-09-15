%option noyywrap
%{
   #include<string.h>
   #include<stdio.h>
   #include "sintatico.tab.h"
   //int col=1, line=1;
%}
%%
"+"        { /*printf("PLUS\n"); col+=yyleng; */return sum;}
"-"        { /*printf("MINUS\n"); col+=yyleng; */ return sub; }
"*"        { /*printf("MULTIPLY\n"); col+=yyleng; */ return mul; }
"%"	   { /*printf("REMAINDER\n");  col+=yyleng; */ return mod; }
"/"	   { /*printf("DIVISOR\n");  col+=yyleng; */ return divisor; }
"("        { /*printf("L_PAREN\n");  col+=yyleng; */ return lparen; }
")"        { /*printf("R_PAREN\n");  col+=yyleng; */ return rparen; }
"^"        { /*printf("POWER\n");  col+=yyleng; */ return power; }
"sen"	   { /*printf("sin\n"); col+=yyleng; */ return sen; }
"cos"	   { /*printf("cos\n"); / col+=yyleng; */ return cos; }
"tan"	   { /*printf("tan\n"); / col+=yyleng; */ return tan; }
"abs"	   { /*printf("abs\n"); / col+=yyleng; */ return absoluto; }
[_a-zA-Z][_a-zA-Z0-9]* { /*printf("IDENTIFIER(%s)\n",yytext); col+=yyleng; */ return id; }
[0-9]+"."[0-9]+ { /*printf("NUM_FLOAT(%s)\n",yytext); col+=yyleng; */  yylval.valf = atof(yytext); return real; }
[0-9]+ { /*printf("NUM_INTEGER(%s)\n",yytext); col+=yyleng; */ yylval.val = atoi(yytext); return integer; }
[ ]+ {/*col+=yyleng;*/}
<<EOF>> { return 0 /*return EOL*/; }
[\t]+	{/*col+= (yyleng*8);*/}
[\n] { /*col=1; line++;  */return EOL; }

.	{ /*printf("ERRO: LINHA: %d COLUNA: %d\n",line,col); col+=yyleng; */}
%%
/*int main(int argc, char **argv){
	yyin = fopen(argv[1],"r");
	yylex();
	fclose(yyin);
	return 0;
}*/
