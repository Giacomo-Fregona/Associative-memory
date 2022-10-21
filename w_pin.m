%calcola i pesi con il metodo della pseudoinversa
function W=w_pin(X)
    W=X*inv((X.')*X)*(X.');
    %poniamo ora o tutti i valori sotto la diagonale
    n=size(W,1);
    for j=1:n
        for k=j+1:n
            W(k,j)=0;
        end
    end
    