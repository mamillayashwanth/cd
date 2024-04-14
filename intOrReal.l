%{
#include<string.h>
#include<stdio.h>
%}

%%
[-+]?[0-9]+\.[0-9]+ {
    printf("Real:%s\n",yytext);
}
[-+]?[0-9]+  {
    printf("Integer:%s\n",yytext);
}

. {

}
%%

int main(){
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}