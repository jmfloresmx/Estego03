function ImRestore=imestegoinv01(ImEstego)
%Fecha:24/08/2021
%
%Descripción:
%ImEstego es una matriz mxn que es una imagen
%Tomar los 4 bits LSM de cada Byte de dato
%Los lleva a la posición MSB
%Y forma ImRestore que es una imagen mxn

    %
    [numf,numc]=size(ImEstego);
    VectEstego=zeros(numf*numc,1);
    for i=1:numf
        for j=1:numc
            VectEstego((i-1)*numf+j)=ImEstego(i,j);
        end
    end

    %Enmascaramiento de los 4 bits LS de imagen
    %15='0000 1111'
    VectRestore1=zeros(numf*numc,1);
    for i=1:numf*numc
        VectRestore1(i)=bitand(VectEstego(i),15);
    end

    %Corrimiento de los bits más significativos de la imagen
    VectRestore2=zeros(numf*numc,1);
    for i=1:numf*numc
      VectRestore2(i)=bitshift(VectRestore1(i),4);
    end

    %Forma la matriz de imagen
    ImRestore=zeros(numf,numc);
    for i=1:numf
        for j=1:numc
            ImRestore(i,j)=VectRestore2((i-1)*numf+j);
        end
    end
    
end

