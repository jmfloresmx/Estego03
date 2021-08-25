function ImRGBEstego= estegoRGB(ImRGBCover,ImRGBSecrete)
%Fecha:24/08/2021
%
%Descripción:
%Aplica el algotimo esteganografico LSB de 4 bits
%en imagenes del mismo tamaño en formato RGB
%
    %Separa los canales de la imagen cubierta
    ImRCover=ImRGBCover(:,:,1);
    ImGCover=ImRGBCover(:,:,2);
    ImBCover=ImRGBCover(:,:,3);
    
    %Separa los canales de la imagen Secreta
    ImRSecrete=ImRGBSecrete(:,:,1);
    ImGSecrete=ImRGBSecrete(:,:,2);
    ImBSecrete=ImRGBSecrete(:,:,3);

    %Aplica el logaritmo LSB en 4 bits por canal
    ImEstegoR= estego01(ImRCover,ImRSecrete);
    ImEstegoG= estego01(ImGCover,ImGSecrete);
    ImEstegoB= estego01(ImBCover,ImBSecrete);

    %Integra los canales de la imagen estego
    ImRGBEstego=uint8(zeros(size(ImRGBCover)));
    ImRGBEstego(:,:,1)=ImEstegoR;
    ImRGBEstego(:,:,2)=ImEstegoG;
    ImRGBEstego(:,:,3)=ImEstegoB;

end

