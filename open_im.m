%trasforma un'immagine .bmp in una matrice di -1 ed 1
function M=open_im(filename);
    N=imread(filename); %apre l'immagine come matrice uint8
    
    %metto come commento la vecchia versione del codice (per 3 colori
    %diversi)
    
    %A=double(N(:,:,1)); 
    %B=double(N(:,:,2)); 
    %C=double(N(:,:,3)); %crea le matrici ausiliarie A,B,C
    %M=A+B+C;
    %M(M<400)=1; M(M>=400)=-1; %divide in bianco (=-1) e nero (=+1) i colori con soglia arbitraria fissata a 600 (i colori sono da 0 a 255x3)
    
    %segue nuova versione
    M=double(N);
    M(M<80)=1; M(M>=80)=-1;