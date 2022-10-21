%viene fornita una matrice di pesi W triangolare superiore ed un numero k, fornisce una stima del numero
%di stati stabili e della dimensione dei loro bacini di attrazione
%calcolando l'esito di k "ricordi" partendo da stati iniziali casuali. Non fa
%differenza tra gli stati ed i loro negativi
function stima_bacini_di_attrazione(X,p_oppure_h,k)
    if p_oppure_h=='p'
        W=w_pin(X);
    end
    if p_oppure_h=='h'
        W=w_hebb(X);
    end
    n=size(W,1);
    A=[]; A(1)=0;%A terrà conto del numero di volte in cui S termina in ciascuno stato. 
    %La posizione 1 conta il numero di volte in cui S non ha raggiunto uno stato stabile
    global B;
    B=[];
    global B;%B terrà memoria di quali siano gli stati stabili già scoperti. E' una matrice con n righe in cui ciascuna colonna rappresenta uno stato stabile scoperto
    for j=1:k
        S=rand_v(n);
        T=run2(W,S);
        if T==0
            A(1)=A(1)+1;%il che esaurisce il caso in cui S non sia finito in uno stato stabile
        else b=size(B,2);
            if b==0
                B(:,1)=T;
                A(2)=1;%il che esaurisce il caso in cui S sia il primo stato stabile scoperto
            else l=1; h=0;   
                while l<=b
                    if abs(sc_prod(T,B(:,l),n))~=n
                        l=l+1;
                    else h=l; l=b+2;
                    end
                end
                if h==0%(cioè nel caso in cui lo stato trovato sia nuovo)
                    B(:,b+1)=T; A(b+2)=1;
                else A(h+1)=A(h+1)+1; %cioè si tiene conto del fatto che un vettore sia finito in tale stato
                end 
            end
        end
    end
    A=A*100/k;
    s=size(A,2);
    C=[];
    for j=1:s;
        C(j)=j-1;
    end
    b=size(B,2);
    %fprintf('sono stati trovati %5.0f \t stati stabili. La prima componente del seguente vettore indica quante volte in percentuale lo stato raggiunto non fosse stabile. Le altre quante volte S abbia raggiunto il corrispondente stato',b)
    %A
    fprintf('sono stati trovati %5.0f \t stati stabili.',b)
    e=bar(C,A,'FaceColor',[1 .4118 .1608]);
    e.FaceColor = 'flat';
    e.CData(1,:) = [0.6510    0.6510    0.6510];
    for j=2:s
        for r=1:size(X,2)
            if abs(sc_prod(X(:,r),B(:,j-1),n))==n
                e.CData(j,:) = [.6353 .0784 .1843];
            end
        end
    end    