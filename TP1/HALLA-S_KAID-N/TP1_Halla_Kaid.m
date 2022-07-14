%% Partie 1 : Lecture et affichage d'une image
%Q1 : inisialisation de l'environnement Matlab
clear all ; 
close all ;

%Q4 : création du variable du chemin à l'image 
chemin = 'C:\Users\HallaSenia\Desktop\SEMESTRE 2\TI\TP\TP1\image_TP1\';

%Q5 : création de variable contenant le nom de l'image avec extension 
img = 'fruits.jpg';

%Q7 : Lire l'image --> la fonction imread() 
ima=imread(cat(2,chemin,img),'jpg');
imshow(ima)
title('image fruits.png')

%Q8 : le format de l'image lue dans le gestionnaire de variables whos.
whos 

%Q9 : Affichage de l'image avec les différents fonctions 
    % 1. en utilisant la fonction imshow : 
figure(1); imshow(ima)
title('image avec imshow')
    %2. en utilisant le fonction imtool :
figure(2); imtool(ima)
title('image avec imtool')
    %3. en utilisant la fonction image :
figure(3); image(ima)
title('image avec image')
    %4. en utilisant la fonction imagesec :
figure(4); imagesc(ima)
title('image avec imagesc')
   
%Q10 : La meme image en format double 
img_d = double(ima);
imshow(img_d)
title('image double')

%Q11 : Division de l'image par 255 
img_d1 = img_d/255;
imshowpair(img_d1,img_d1,'montage')
title('Comaparaison entre image double et image double / 255')

%Q12 : La fonction im2double
img_2_d = im2double(ima);

%Q13 : Comparaison des deux images 
imshowpair(img_d,img_2_d,'montage')
title('Comaparaison entre image double et image conveti avec im2double ')
size(img_2_d)
size(img_d)

%Q14 : Conversion en niveaux de gris : (Nous avons utilisé deux méthodes)
    %Méthode 1 :
img_gray = rgb2gray(ima);
imshow(img_gray)
title('Conversion de l"image en degré de gris avec rgb2gray()')
imwrite(img_gray,'img_gray.jpg')
    %Méthode 2 : -Ce qui est demader dans la fiche TP-
img_gray_1 = ima(:,:,1)*0.1 + ima(:,:,2)*0.1 + ima(:,:,3)*0.8;
img_gray_2 = ima(:,:,1)*0.1 + ima(:,:,2)*0.8 + ima(:,:,3)*0.1;
img_gray_3 = ima(:,:,1)*0.8 + ima(:,:,2)*0.1 + ima(:,:,3)*0.1;

montage({img_gray_1,img_gray_2,img_gray_3},'size' ,[1 3])
title('image avec 3 différents Coefficients ')

%Q15 : Sauvegarder L'image 
image1 = cat(2,img_gray_1,img_gray_2);
image2 = cat(2,image1,img_gray_3);
imwrite(image2,'montage_comparaison.jpg')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Partie 2 : Types D’Image Dans MATLAB 
clear all;
close all;

%Q1_1 : Charger l'image CouleursAdditifs.tif
chemin = 'C:\Users\HallaSenia\Desktop\SEMESTRE 2\TI\TP\TP1\image_TP1\';
img = 'CouleursAdditifs.tif';
ima=imread(cat(2,chemin,img),'tif');
imshow(ima)
title('image CouleursAdditifs.tif')

%Q1_2 : Caractéristiques de l'image avec imageinfo
imageinfo('CouleursAdditifs.tif');


%Q2_1 : Création d'une image True color 
RGB=reshape(ones(64,1)*reshape(jet(64),1,192),[64,64,3]);
figure(1);imshow(RGB)
title('Image RGB')

%Q2_2 Affichage des plan R G B Séparément 
figure(2);
subplot(3,2,1); imshow(RGB(:,:,1)) % 1 : position 1 => R
title('Le plan R')
subplot(3,2,2); imshow(RGB(:,:,2)) % 2 : position 2 => G
title('Le plan G')
subplot(3,2,3); imshow(RGB(:,:,3)) % 3 : position 3 => B
title('Le plan B')


    % jet and reshape : 
        % jet(M) : crée une matrice Mx3 conteneant le code des couleurs d'une palate de couleur 
        % Reshape(vecteur(x0:xn),L,C) : créer une matrice de L ligne et C colonne la prmiere case de cette matrice est x0 et la derniere xn

%Q3_1 : Charger l'iamge indexé : 
[X, map]=imread('CouleursAdditifs.tif') ;

%Q3_2 : Afficher l'image et ces caractéristiques 
imshow(X,map)
title('Affichage de l"image Indexé')
imwrite([X,map],'ColeursAdditifIndex.tif'); %Sauvegarder l'image %
imageinfo('ColeursAdditifIndex.tif')

%Q3_3 : Comparer l'image original et l'indexé 
size(X)
size(ima)


%Q4_1 : Conversion en image binaire avec im2bw 
ima_binaire = im2bw(ima);
imshow(ima_binaire)
title('Conversion en image binaire avec La fnction im2bw()')
imwrite(ima_binaire,'ima_binaire.tif')

%Q4_2 : Binariser l'image avec graythresh
I = imread('CouleursAdditifs.tif');
level = graythresh(I);
ima_binarise = im2bw(I,level);

%Q4_3 : Affichage de l'image et comparer avec résultat précédent 
imshow(ima_binarise)
title('Conversion en image binaire avec La fnction graythresh()')
imwrite(ima_binarise,'ima_binarise.tif')

size(ima_binaire)
size(ima_binarise)
img_montage = cat(2,ima_binarise,ima_binaire);
imshow(img_montage);
title('Comparaison entre image binariser avec la fonction im2bw() et graythresh()')
imwrite(img_montage,'montage_binaire.tif')


%Q4_4 : les caractéristiques de ces images 
imageinfo('ima_binaire.tif')
imageinfo('ima_binarise.tif') 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Partie 3 :Propriétés D’Une Image  
clear all;
close all; 

%Q1 : Afficher les des pixels de la ligne 11 jusqu'à la ligne 14 et de la colonne 44 jusqu’à 50.
ima_gray = imread('img_gray_1.jpg');
ima_gray(11:14,44:50)
imshow(ima_gray(11:14,44:50))
title('Partie de l"image :lignes 11 à 14 , colonne 44 à 50 ')

%Q2 : Afficher la dimension de l'image. Stocker le nombre de ligne dans "nl", nombre de colonne "nc".
[nl,nc]=size(ima_gray)

%Q3 : Mettre la valeur max de chaque ligne dans un vecteur maxlig
maxligne = max(ima_gray ,[], 2) ;

%Q4 : Faire de même avec le maximum, le minimum et la moyenne
minligne = min(ima_gray , [],2) ;
moyligne = mean(ima_gray,2) ;

%Q5 : Faire un tracé de ces trois vecteurs sur le même graphique. 
figure(1);
plot(maxligne,'blue')
hold on
plot(minligne,'red')
hold on
plot(moyligne,'green')
legend('maxligne','minligne','moyligne')
title('moyenne , maximum et minimum des lignes ')

%Q6 : Faire un tracé du maximum en fonction du minimum
figure(2);
plot(minligne,maxligne)
xlabel('minligne')
ylabel('maxligne')
title('max en fonction du min')


%Q7 : Calculer la moyenne, le max et le min et la somme de toute l'image, puis de la partie centrale decelle-ci (entre 100 et 200 en x et en y)
maxx = max(maxligne)
minn = min(minligne)
moyy= mean(moyligne)
summ = sum(sum(ima_gray))
 
ima_gray_part = ima_gray(100:200,100:200);
max2 = max(max(ima_gray_part ,[], 2))
min2 = min(min(ima_gray_part ,[], 2))
moy2 = mean(mean(ima_gray_part, 2))
sum2 = sum(sum(ima_gray_part))

%Q8 : Tacer l'histogramme de l'image, avec « imhist », puis avec « plot ».
figure(3);
plot(ima_gray)
title('plot')

figure(4);
imhist(ima_gray)
title('imhist')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
