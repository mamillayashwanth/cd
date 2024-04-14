#include<stdio.h>
int main(){
    FILE * fp = fopen("capitalize.l","r");
    char ch;
    int character=0;
    int space=0;
    int line=0;
    int tabs=0;
    ch=getc(fp);
    while(ch!=EOF){
        if(ch==' '){
            space++;
        }
        else if(ch=='\t'){
            tabs++;
        }
        else if(ch=='\n'){
            line++;
        }
        else{
            character++;
        }
        ch=getc(fp);

    }
    printf("character:%d\n",character);
    printf("spaces:%d\n",space);
    printf("line:%d\n",line);
    printf("tabs:%d\n",tabs);
    return 0;
}