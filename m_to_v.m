%Prende in input una matrice e costruisce un vettore incolonnando le
%colonne
function x=m_to_v(M)
    m=size(M); %m=numero di righe di M
    x=zeros(m(1)*m(2),1);
    for j=1:m(2);
        for k=1:m(1);
            x((j-1)*m(1)+k)=M(k,j);
        end
    end