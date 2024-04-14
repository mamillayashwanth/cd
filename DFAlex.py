DFA={
    'i':set('n'),
    'n':set('t'),
    't':None
}

ip=input("Enter the input:");
c=0;
n=len(ip)

for lex in ip:
    c+=1
    if(lex not in DFA.keys()):
        print(ip[c-1:],'->Identifier')
        break
    cur = DFA[lex]
    if c==n and cur is  None:
        print(lex,'->keyword')
    else:
        print(lex,'->',cur)