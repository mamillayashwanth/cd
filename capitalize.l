%{
#include<stdio.h>
#include<string.h>
#include<ctype.h>
%}

%%
[a-zA-Z]+ {
    printf("%s---->:",yytext);
    for(int i=0;i<strlen(yytext);i++){
        if(yytext[i]>=97 && yytext[i]<=122){
            printf("%c",yytext[i]-32);
        }
        else{
            printf("%c",yytext[i]);
        }
    }
    printf("\n");

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