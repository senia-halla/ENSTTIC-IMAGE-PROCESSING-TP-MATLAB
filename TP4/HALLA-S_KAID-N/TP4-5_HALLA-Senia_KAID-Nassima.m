clc;
clear;
close all;

%% Filtre moyenneuur 
im1=imread("cameraman.tif");
vect2=fspecial('average',3);
imfilt_average2=filter2(vect2,im1,'same');
figure,subplot(1,2,1); imshow(im1);
subplot(1,2,2); imshow(imfilt_average2/255);

imfilt_average2=filter2(vect2,im1,'valid');
figure,subplot(1,2,1); imshow(im1);
subplot(1,2,2); imshow(imfilt_average2/255);

imfilt_average2=filter2(vect2,im1,'full');
figure,subplot(1,2,1); imshow(im1);
subplot(1,2,2); imshow(imfilt_average2/255);

% Commentaire  et Comparaison : 
%avec same l image est apparue avec un cadre==> elle renvoie une image qui
%a la meme taille 
% avec valid l'image reultante est sans cadres ==> elle renvoie une image
% avec une taille inferieure (254*254)
%avec  full  l'mage resultatnte est apparue avec un cadre prononcé ==> elle
%renvoie une image avec une taille superieure (258*258)



%% Filtre gaussien
img_ng=imread("cameraman.tif");
[r,c,w] = size(img_ng) ;
im_bruit=imnoise(img_ng,'gaussian',0.02);
sigma1=3;
a=ceil(3*sigma1);
vect=fspecial('gaussian',5*sigma1,sigma1);
gaussien=conv2(double(vect),double(im_bruit));
figure, subplot(1,3,1); imshow(img_ng); title("Image Original");
subplot(1,3,2); imshow(im_bruit); title("Image Bruité");
subplot(1,3,3); imshow(gaussien/255); title("Image Filtré");
 

%%%image en couleur 
figure;
chemin = 'E:\cours\SEMESTRE 2\Traitement DIimage\TP\TP4\';
img = 'img_couleur.jpg';
img_couleur=imread(cat(2,chemin,img),'jpg');
imshow(img_couleur)
im_bruit=imnoise(img_couleur,'gaussian');
sigma=1;
a=ceil(3*sigma);
vect2=fspecial('gaussian',5*sigma,sigma);
 
 
for i=1:3
    gauss(:,:,i)=conv2(double(vect2),double(im_bruit(:,:,i)));
end
figure, subplot(1,3,1); imshow(img_couleur); title("Image Original");
subplot(1,3,2); imshow(im_bruit); title("Image Bruité");
subplot(1,3,3); imshow(gauss/255); title("Image Filtré");
 
figure
surf(1:5*sigma1,1:5*sigma1,vect);

%%filtre weiner 
for i=1:3
weiner(:,:,i)=wiener2(im_bruit(:,:,i),[5*sigma 5*sigma]);
end
figure
subplot(1,2,1)
imshow(im_bruit); title("image bruité");
subplot(1,2,2)
imshow(weiner); title(" image filtré");

%comparaison entre weiner et gauss 
figure
subplot(1,3,1)
imshow(im_bruit); title("image bruité");
subplot(1,3,2)
imshow(gauss/255); title("image filtré avec gauss");
subplot(1,3,3)
imshow(weiner); title(" image filtré avec weiner");



%% Filtre Passe Haut : Detection De Contour 
clc;
clear;
close all;

image =imread('circuit.tif') ;


Px = [-1 0 1;-1 0 1]; %grad de l'image par rapport a x (F(x+1)-F(x-1))
Imagex= filter2 (Px, image);%calcul de l'intensité de variation de l'image par rapport a x

Py= Px';%grad de l'image par rapport a y
Imagey=filter2(Py,image);%calcul de l'intensité de variation de l'image par rapport a y
edge=(sqrt(Imagex.^2+ Imagey.^2)/255);%module de grad de l'image   
figure,
subplot(1,3,1); imshow(Imagex/255); title("Les Contours Horizontaux");
subplot(1,3,2); imshow(Imagey/255); title("Les Contours Verticaux");
subplot(1,3,3); imshow(edge); title("Les Contours");

%Le programme détecte les conteurs 

%Un autre programme : filtre de Prewitt

%Le seuillage
Px = [-1 -1 -1;-0 0 0; 1 1 1];
Imagex= filter2(Px, image);
Py= Px';
Imagey=filter2(Py,image); 
edge =(sqrt(Imagex.^2+ Imagey.^2)/255)>0.3;   
figure,
subplot(1,3,1); imshow(Imagex/255); title("Les Contours Horizontaux");
subplot(1,3,2); imshow(Imagey/255); title("Les Contours Verticaux");
subplot(1,3,3); imshow(edge); title("Les Contours");

%% Morphologie Mathématique
clear all
close all

image=imread ('AT3_1m4_01.tif') ;
im=image ;
x=im2bw(im);
se=[0 1 0;1 1 1;0 1 0];
im2=imopen(x,se);
se2=strel('disk',10);
closebw = imclose(x,se2) ;

subplot(1,4,1); imshow(image); title("Image Original");
subplot(1,4,2); imshow(x); title("Image Bianaire");
subplot(1,4,3); imshow(im2); title("Ouverture");
subplot(1,4,4); imshow(closebw); title("Fermuture");