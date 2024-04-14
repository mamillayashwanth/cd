%{
#include<stdio.h>
#include<string.h>
#include<ctype.h>
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
[a-zA-Z_][a-zA-Z0-9_]* {
    int flag=0;
    for(int i=0;i<32;i++){
        if(strcmp(yytext,key[i])==0){
            flag=1;
            break;
        }
    }
    if(flag==0){
        printf("Identifier:%s\n",yytext);
    }
    else{
        printf("KeyWord:%s\n",yytext);   
    }
}
[0-9]+ {printf("COnstant:%s\n",yytext);}
[\*-\+%/] {printf("Operator:%s\n",yytext);}
[\;\(\)\{\}\[\]] {
    printf("Delimeter:%s\n",yytext);
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