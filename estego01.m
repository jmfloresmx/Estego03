function ImEstego01 = estego01(ImCover01,ImSecrete01)
%24/08/2021
%
%Descripción:
%Genera una imagen esteganografica mxn 
%Se usan los 4 bits MSB de cada byte de la imagen cubierta 
%Y de la imagen secreta para formar una imagen estego
%que oculta la imagen secreta en la cubierta
%
%Cada byte de la imagen estego es
% MSB|LSB(Estego)= MSB(cubierta)|MSB (Secreta)
%
%Trabaja para un canal (No RGB)
%

    [numf,numc]=size(ImCover01);
    VectCover=zeros(numf*numc,1);
    for i=1:numf
        for j=1:numc
            VectCover((i-1)*numf+j)=ImCover01(i,j);
        end
    end

    VectSecrete=zeros(numf*numc,1);
    for i=1:size(ImSecrete01,1)
        for j=1:size(ImSecrete01,1)
            VectSecrete((i-1)*numf+j)=ImSecrete01(i,j);
        end
    end

    %Enmascaramiento de los 4 bits más significativos de imagen cubierta
    VectCover2=zeros(numf*numc,1);
    %240='1111 0000'
    for i=1:numf*numc
        VectCover2(i)=bitand(VectCover(i),240);
    end

    %Enmascaramiento de los 4 bits más significativos de imagen secreta
    VectSecrete2=zeros(numf*numc,1);
    for i=1:numf*numc
        VectSecrete2(i)=bitand(VectSecrete(i),240);
    end

    %Corrimiento de los bits más significativos de la imagen secreta
     VectSecrete3=zeros(numf*numc,1);
    for i=1:numf*numc
      VectSecrete3(i)=bitshift(VectSecrete2(i),-4);
    end

    %Generación de la Estegoimagen
    VectEstego=zeros(numf*numc,1);
    for i=1:numf*numc
        VectEstego(i)=bitor(VectCover2(i),VectSecrete3(i));
    end

    ImEstego01=uint8(zeros(numf,numc));
    for i=1:numf
        for j=1:numc
            ImEstego01(i,j)=VectEstego((i-1)*numf+j);
        end
    end

end

