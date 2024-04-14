%{
#include<stdio.h>
#include<ctype.h>
#include<string.h>
int tabs=0;
int space=0;
int line=0;
int charcter=0;
%}
%%

\n {
    
    line++;
}
\t {
    tabs++;
}
" " {
    space++;
}
. {
    charcter++;

}
%%

int main(){
    FILE *fp = fopen("charSpaceTabs.l","r");
    yyin=fp;
    yylex();
    printf("Lines:%d\n",line);
    printf("Space:%d\n",space);
    printf("Line:%d\n",line);
    printf("charcter:%d\n",charcter);
    fclose(fp);
    return 0;
}

int yywrap(){
    return 1;
}