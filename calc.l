%{
#include<stdio.h>
#include<string.h>
char op='\0';
int a=-100,b=-100;
%}

%%
[0-9]+ {
    if(a==-100){
        a=yytext[0]-48;
    }
    else{
        b=yytext[0]-48;
        switch(op){
            case '+':
                printf("%d",a+b);
                break;
            case '-':
                printf("%d",a-b);
                break;
            default:
                printf("Operator need to update....");
        }
        a=-100;
        b=-100;
    }
}
\+ {op='+';}
- {op='-';}
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