%aggiorna il valore di S dati W,S e l'indice da aggiornare j
function T=aggiorna_S(W,S,j)
    snew=calcola_s(W,S,j);
    snew=(snew>=0)-(snew<0);
    T=S;
    if snew==-1*S(j);
        n=size(S,1); x=zeros(n,1); x(j)=2*snew;
        %calcola il j esimo vettore della base standard moltiplicato per 2
        %volte snew
        T=S+x;
    end