#include<stdio.h>
#include<string.h>
#include<ctype.h>
char String[100];
const char *lookahead;
int E(){
    if(T()){
        if(Edash()){
            return 1;
        }
        return 0;
    }
    return 0;
}
int Edash(){
    if(*lookahead=='+'){
        lookahead++;
    
        if(T()){
            if(Edash()){
                return 1;
            }
            return 0;
        }
        return 0;
    }
    return 1;
}
int T(){
    if(F()){
        if(Tdash()){
            return 1;
        }
        return 0;
    }
    return 0;
}

int Tdash(){
    if(*lookahead=='*'){
        lookahead++;
        if(F()){
            if(Tdash()){
                return 1;
            }
            return 0;
        }
        return 0;
    }
    return 1;
}

int F(){
    if(*lookahead=='('){
        if(E()){
            if(*lookahead==')'){
                lookahead++;
                return 1;
            }
            return 0;
        }
        return 0;
    }
    else if(*lookahead=='i'){
        lookahead++;
        return 1;
    }
    return 0;
}
int main(){
    printf("Enter the string to parse:");
    scanf("%s",String);
    lookahead=String;
    if(E() && *lookahead=='\0'){
        printf("Stirng succesfully parsed!!");
    }
    else{
        printf("String unable to parse");
    }
    return 0;
}