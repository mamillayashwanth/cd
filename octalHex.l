%{
#include<stdio.h>
#include<string.h>
%}

%%
0[xX][0-9a-fA-F]+ {
    printf("Hexadecimal:%s\n",yytext);
}
[0-7]+ {
    printf("Octal:%s\n",yytext);
}
. {
    //printf("Invalid:%s\n",yytext);
}
%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}
