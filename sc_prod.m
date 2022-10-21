function sc=sc_prod(x,y,n)
    sc=0;
    for j=1:n;
        sc=sc+x(j)*y(j);
    end
end