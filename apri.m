%crea un vettore dato il nome del file.bmp
function x=apri(filename);
    M=open_im(filename);
    x=m_to_v(M);