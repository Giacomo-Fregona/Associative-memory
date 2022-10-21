%crea i pesi definiti dalla regola di Hebb
function W=w_hebb(X)
    n=size(X,1);
    m=size(X,2);
    W=zeros(n);
    for j=1:n;
        for k=1:j;
            W(k,j)=sc_prod(X(j,:),X(k,:),m);
        end
    end
    W=W/n;