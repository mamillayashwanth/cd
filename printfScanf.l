%{
#include<stdio.h>
#include<stdlib.h>
int scanfCount=0;
int printfCount=0;
%}

%%
printf {
    printfCount++;
}
scanf {
    scanfCount++;
}

. {

}
%%
int main(){
    FILE * fp = fopen("charSpaceTabs.l","r");
    yyin=fp;
    yylex();
    fclose(fp);
    printf("scanf:%d\n",scanfCount);
    printf("printf:%d\n",printfCount);
    return 0;
}
int yywrap(){
    return 1;
}