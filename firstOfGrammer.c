#include<stdio.h>
#include<ctype.h>
#include<string.h>
char productions[10][20];
int n=10;
int nonTerminal[26];
char subResult[100];
int subresult_pos=0;

void First(char c){
    if(c<65 || c>90){ // first of  any terminal;
        subResult[subresult_pos++]=c;
        subResult[subresult_pos]='\0';
    }
    for(int i=0;i<n;i++){
        if(productions[i][0]==c){
            
            First(productions[i][3]);
            
        }
    }
}
int main(){
    printf("Enter the no of productions:\n");
    scanf("%d",&n);
    for(int i=0;i<n;i++){
        printf("Enter production %d:\n",i+1);
        scanf("%s",productions[i]);
        nonTerminal[productions[i][0]-'A']=1;
    }
    for(int i=0;i<26;i++){
        if(nonTerminal[i]==1){
           
            First(i+'A');
            printf("Fist of %c:{ %s }\n",i+'A',subResult);
            subresult_pos=0;
        }
    }

}

