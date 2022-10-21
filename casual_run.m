%produce una esecuzione casuale del programma di dimensione k x (n/k)
function casual_run(n,k,m)
    X=zeros(n,m);
    for j=1:m
        X(:,j)=rand_v(n);
        figure(j+1); vedi(X(:,j),k);
    end
    W=w_pin(X);
    figure(1);
    S=rand_v(n);
    S=run1(W,S,k);
    B=zeros(m,1);
    for j=1:m
        B(j)=sc_prod(X(:,j),S,n);
    end
    B.'