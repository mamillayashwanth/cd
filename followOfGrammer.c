 #include<stdio.h>
#include<ctype.h>
#include<string.h>
char productions[10][20];
int n=10;
int nonTerminal[26];
char subResult[100];
int subresult_pos=0;
int boolean[26];
int flag=0;
void First(char c){
    if(c<65 || c>90){ // fistst or any terminal;
        subResult[subresult_pos++]=c;
        subResult[subresult_pos]='\0';
    }
    for(int i=0;i<n;i++){
        if(productions[i][0]==c){
            
            First(productions[i][3]);
            
        }
    }
}

void Follow(char c){
    int in=0;
    for(int i=0;i<n;i++){
        for(int j=3;j<strlen(productions[i]);j++){
            if(productions[i][j]==c){
                in=1;
                if(j+1==strlen(productions[i])){
                    if(productions[i][j]!=productions[i][0]){
                        Follow(productions[i][0]);
                    }
                    else{
                        flag=1;
                    }
                    
                }
                else{
                    First(productions[i][j+1]);
                }
            }
            
            
        }
    }
    if(in==0)flag=1;
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
        boolean[i]=0;
    }
    for(int i=0;i<26;i++){
        if(nonTerminal[i]==1){
           
            Follow(i+'A');
            if(flag==1){
                printf("Follow of %c:{ $ %s }\n",i+'A',subResult);
            }
            else{
                printf("Follow of %c:{  %s }\n",i+'A',subResult);
            }
            flag=0;
            subresult_pos=0;
            for(int i=0;i<26;i++){
                boolean[i]=0;
            }
        }
    }

}

