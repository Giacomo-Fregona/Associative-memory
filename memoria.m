%Input: X matrice rappresentante tutti gli esempi, S stato di partenza, k
%numero di pixel per colonna, una stringa che può essere 'p' o 'h' che 
%specifica come calcolare W. Calcola W con il metodo indicato,
%fa evolvere S stampandone man mano l'evoluzione. Al termine stampa il 
%prodotto scalare dello stato raggiunto con ciascuna delle colonne di X. 
%Fornisce infine in output lo stato raggiunto.
function T=memoria(X,S,k,p_oppure_h)
    n=size(X,1);
    m=size(X,2);
    vedi(X,k);
    pause(1);
    if p_oppure_h=='p'
        W=w_pin(X);
    end
    if p_oppure_h=='h'
        W=w_hebb(X);
    end
    figure(m+1);
    
    l=zeros(n,1);
    for h=1:n
       l(h)=calcola_s(W,S,h); 
    end
    x=random_jfixed(S,l);
    y=0;
    vedi(S,k); pause(0.001);
    while (x>=1)*(y<=10000)
        y=y+1;
        S(x)=-S(x);
        vedi(S,k); pause(0.000001);
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
        disp('Il programma si è arrestato perché è stato superato il numero massimo di iterazioni previste. S non ha raggiunto la stabilità.');
    else disp('Il programma si è arrestato poiché S ha raggiunto la stabilità'); T=S;
    end
    
    B=zeros(m,1);
    for j=1:m
        B(j)=sc_prod(X(:,j),S,n);
    end
    B.'
