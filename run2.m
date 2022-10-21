%versione modificata di run1 che non plotta le immagini e non fa pause. Da
%inoltre dei feedback diversi
function T=run2(W,S)
    n=size(S,1);
    l=zeros(n,1);
    for h=1:n
       l(h)=calcola_s(W,S,h); 
    end
    x=random_jfixed(S,l);
    y=0;
    while (x>=1)*(y<=500)
        y=y+1;
        S(x)=-S(x);
        %segue codice dovuto al fatto che W è triangolare superiore
        if x==1
        u=W(1,:);
        else
            if x==n
            u=W(:,n);
            else u=W(:,x)+(W(x,:).'); u(x)=u(x)-W(x,x); 
            end
        end
        %aggiorniamo l
        l=l+2*u*S(x);
        x=random_jfixed(S,l);
    end
    %segue codice per dare feedback sul risultato raggiunto
    if x>1
        T=0;
    else T=S;
    end