function ImRestore = imestegoinv03(ImRGBEstego)
%Fecha:24/08/2021
%
%Descripción
%IMRGBEstego es una imagen en formato RGB
%Usa la función imestegoinv01 para recuperar 
%de cada canal los bits menos significaivos
%donde esta una imagen secreta
%
%
    %Separa lso canales R G B
    ImREstego=ImRGBEstego(:,:,1);
    ImGEstego=ImRGBEstego(:,:,2);
    ImBEstego=ImRGBEstego(:,:,3);

    %Aplica la función imestegoinv01 que
    %recupera una imagen oculta en los
    %bits menos significativos 
    ImRRestore =imestegoinv01(ImREstego);
    ImGRestore =imestegoinv01(ImGEstego);
    ImBRestore =imestegoinv01(ImBEstego);

    %Integra la imagen secreta en RGB
    ImRestore=uint8(zeros(size(ImRGBEstego)));
    ImRestore(:,:,1)=ImRRestore;
    ImRestore(:,:,2)=ImGRestore;
    ImRestore(:,:,3)=ImBRestore;
end

