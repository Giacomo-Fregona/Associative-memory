%mostra l'immagine in bianco e nero del vettore x come immagine con m pixel
%per colonna.
%Nel caso x sia una matrice, mostra in diverse figure l'immagine data da
%ciascuna colonna della sua matrice come vettore
function vedi(x,m)
    if size(x,2)==1
        M=v_to_m(x,m);
        M=0.5*M+1.5*M;
        colormap([1,1,1;0,0,0]);
        image(M);
    else s=size(x,2);
        for j=1:s
           figure(j)
           vedi(x(:,j),m)
        end
    end