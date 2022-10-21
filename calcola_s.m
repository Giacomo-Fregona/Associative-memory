%dati lo stato S, la matrice di pesi W (triangolare superiore) e l'indice j, calcola il nuovo
%valore di s(j) (un numero reale, non +-1)
function s=calcola_s(W,S,j)
    n=size(S);
    if j==1
        x=W(1,:).';
    else
        if j==n
            x=W(:,n);
        else x=W(:,j)+(W(j,:).'); x(j)=x(j)-W(j,j); 
            %somma la j-esima colonna con la trasposta della j-esima colonna e sottrae in posto x(j) il valore W(j,j) 
            %che altrimenti sarebbe stato contato due volte
        end
    end
    s=sc_prod(S,x,n);