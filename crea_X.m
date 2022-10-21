%crea una matrice X avente su ciascuna colonna gli esempi il cui numero
%corrisponde a quelli contenuti nell'array N (vettore riga)
function X=crea_X(N)
    X=[];
    m=size(N,2);
    for j=1:m
        filename=string(N(1,j));
        filename=join([filename,'.bmp'],{''});
        X(:,j)=apri(filename);
    end
