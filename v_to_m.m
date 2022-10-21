%prende in input un vettore ed il numero di righe e crea una matrice con i
%valori del vettore
function M=v_to_m(x,m);
    k=size(x);
    n=(size(x,1))/m; %n sarà il numero di colonne della matrice M
    M=zeros(m,n);
    for j=1:k;
        if mod(j,m)==0;
            M(m,floor(j/m))=x(j);
        else M(mod(j,m),floor(j/m)+1)=x(j);
        end
        
    end
