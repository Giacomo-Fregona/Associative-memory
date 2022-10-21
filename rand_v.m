%crea un vettore randomico di +-1 di dimensione n
function x=rand_v(n);
    x=rand(n,1);
    x(x<=0.5)=-1;
    x(x>0.5)=1;