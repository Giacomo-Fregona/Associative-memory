%crea una matrice randomica di +-1 di dimensione n x m
function x=random_X(n,m)
    x=rand(n,m);
    x(x<=0.5)=-1;
    x(x>0.5)=1;