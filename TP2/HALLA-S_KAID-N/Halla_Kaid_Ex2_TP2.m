clc ; 
clear all ; 
close all ; 

img_cameraman = 'cameraman.tif';
ima_cameraman=imread(img_cameraman);
imshow(ima_cameraman)
title('image cameraman.tif')

% 1.	Appliquer une rotation anti horaires de 45° : 
ima_cameraman_rota = imrotate(ima_cameraman,45);
% 2.	Affichage du résultat : 
imshow(ima_cameraman_rota);
title('rotation de 45° a notre image cameraman')

% Le centre de rotation par defaut est le centre de notre image 
% La fonction rotate a une autre sigature qui prend aussi en parametre l'origin de roattion  

