%dati due vettori S,l, sceglie a caso una coordinata tale che Sj=/=sgn(lj)
function j=random_jfixed(S,l)
    l(l>=0)=1;
    l(l<0)=-1;
    S=S-l;
    n=size(S,1);
    u=1; T=[];
    for k=1:n
        if S(k)~=0
            T(u)=k;
            u=u+1;
        end
    end
    n=size(T,2);
    if n==0
        j=0;
    else j=randi(n); j=T(j);
    end