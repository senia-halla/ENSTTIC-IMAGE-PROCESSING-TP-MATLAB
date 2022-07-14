clc ; 
clear all ; 
close all ; 

% 1.	Lire l’image et l'afficher  :
% L'image onion se trouve dans la bibliotheque de Matlab : c'est pour ca on
% spécifie pas le chemin 

img_poivron = 'onion.png';
ima_poivron=imread(img_poivron);
imshow(ima_poivron)
title('image onion.png de la bibliotheque Matlab')

% 2.	La résolution spatiale et la résolution spectrale de cette image :
[r,c,w] = size(ima_poivron);
resolution_spatial = [r,c] % La resolution spatiale  : C'est la taille de l'image  
resolution_spectral = w    % La resolution spectrale : C'est le codage de l'image 

% 3.	Translation horizontale de 20 pixels à droite : On décale de 60 la ligne 
ima_poivron_trans_20 = imtranslate(ima_poivron,[20,0]);
imshow(ima_poivron_trans_20)
title('Image décalé de 20 pixel Horizontalement')

% 4.	Translation de 50 lignes et 100 colonnes à droite : On décale de 50
% lignes et de 100 colonnes 

ima_poivron_trans_50_100 = imtranslate(ima_poivron,[50,100]);
imshow(ima_poivron_trans_50_100)
title('Image décalé de 50 ligne et 100 colonnes ')
 
 % 5.	Translation permettant de cacher le poivron jaune : 
ima_poivron_trans_jaune = imtranslate(ima_poivron,[60,0]);
imshow(ima_poivron_trans_jaune)
title('Caché le poivron jaune')

%ima_poivron_trans_jaune1(1:r,1+60:c+60,:) = ima_poivron;
% En utilisant cette methode on ecrase l'image d'origine contrairement a imtranslate
%imshowpair(ima_poivron_trans_jaune1,ima_poivron_trans_jaune, 'montage')

