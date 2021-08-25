%Fecha: 24/08/2021
%Fecha ActualizaciÃ³n:
%
%Descripción:
%Realiza estegonagrafia de imagen sobre imagen a color
%LSB de 4 bits
%Imagenes en color (RGB) de mismo tamaño
%Codigo para MATLAB
%

clc 
clear all 

mesaje01='---> Esteganografía de imagen sobre imagen';
disp(mesaje01);

%Lectura de Imagen Cubierta y Secreta
ImRGBCover=imread('4.2.01.tiff');
ImRGBSecrete=imread('4.2.05.tiff');

%Imagen Esteganografica
ImRGBEstego= estegoRGB(ImRGBCover,ImRGBSecrete);
imwrite(ImRGBEstego,'ImRGBEstego.png');

%Lectura de la imagen esteganografica
ImRGBEstego=imread('ImRGBEstego.png');

%Recuperar Imagen Secretea
ImRestore = imestegoinv03(ImRGBEstego);


figure(1);
subplot(2,2,1), imshow(ImRGBCover);
title('Imagen cubierta');

subplot(2,2,2), imshow(ImRGBSecrete);
title('Imagen secreta');

subplot(2,2,3), imshow(ImRGBEstego);
title('Imagen Estego');

subplot(2,2,4), imshow(ImRestore)
title('Imagen Recuperada')
