%{
#include<stdio.h>
#include<string.h>
#include<ctype.h>
int id=0;
char key[][20] = {
    "auto", "break", "case", "char", "const", 
    "continue", "default", "do", "double", "else", 
    "enum", "extern", "float", "for", "goto", 
    "if", "int", "long", "register", "return", 
    "short", "signed", "sizeof", "static", "struct", 
    "switch", "typedef", "union", "unsigned", "void", 
    "volatile", "while"
};
%}

%%
[_a-zA-Z][_a-zA-Z0-9]* {
    int flag=0;
    for(int i=0;i<32;i++){
        if(strcmp(yytext,key[i])==0){
            flag=1;
            break;
        }
    }
    if(flag==0){
        id++;
        printf("%s    ",yytext);
    }
}
. {

}
%%

int main(){
    FILE *fp = fopen("charSpaceTabs.c","r");
    yyin=fp;
    yylex();
    fclose(fp);
    printf("identifierCount:%d",id);
    return  0;
}
int yywrap(){
    return 1;
}