/*GPL-2 License*/

DIGIT       [0-9]
ID          [a-zA-Z][a-zA-Z0-9_]*
DOIDO       [0-9]+[a-zA-Z0-9_]*
COMMENT     [#].*
WHITESPACE  [ \t]

%%

echo        {printf("");}
version     {fprintf(yyout, "Tcx %s 18 201838 15:45 0.1.1\n", yytext);}
inicio      {printf("");}
fin         {fprintf(yyout, " %d", yylineno);}

";"         {fprintf(yyout, "\n");}
":"         {printf("");}

{DIGIT}+    {fprintf(yyout, "DEC \"%s\" %d\n",yytext, yylineno);}
{ID}        {fprintf(yyout, "%s ",yytext);}

{WHITESPACE}+ {fprintf(yyout, "%s",yytext);}
{COMMENT}+ 

"\n"    yylineno++;

{DOIDO}     {fprintf(yyout, "ERROR: %s, %d\n",yytext, yylineno);}
.           {fprintf(yyout, "ERROR: %s, %d\n",yytext, yylineno);}

%%

int yywrap();

int main(int argc, char *argv[]){
    yyin = fopen(argv[1], "r");
    yyout = fopen(argv[2], "w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap(){
    return 1;
}
