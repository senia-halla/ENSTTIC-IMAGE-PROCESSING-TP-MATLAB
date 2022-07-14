clc ;
clear all ; 
close all ; 

%Erreur 1 : 
% Error using imread>get_full_filename (line 567)
% File "rose.jpeg" does not exist.

% Nous devons ajouter le chemin et concatener : Vu que cette image n'existe
% pas dans le bibliotheque Matlab

chemin_img_tp2 = 'E:\cours\SEMESTRE 2\TI\TP\TP2\image_TP2\';
img_rose = 'rose.jpeg';
ima = imread(cat(2,chemin_img_tp2,img_rose),'jpeg');
imshow(ima);

x = double(imread(cat(2,chemin_img_tp2,img_rose),'jpeg'));
[r,c,w]=size(x);

%niveau de couleur d'une image 
B=256;
%quantized to q levels 
 %q=4;
% q=8 ;
 q=14 ;
 %q = input('Entrez une valeur pour le niveau de quantification q : ');
 
%facteur de quantization
L=B/q;

% On crée un vecteur E : fonction de quantification qui va contenir les
% valeur de niveau de couleur quantifié 
% Dans ce vecteur chaque 64 valeur est representé par un niveau de couleur => On a 4 levels 

E=zeros(256,1);
for i=0:255,
   % Le vecteur E va etre séparé en q parties : chaque partie ayant le meme niveau de couleur 
    E(i+1,1)=floor(i/L)*L+L/2;
end

% On va créer une nouvelle matrice y : ayant la meme taille que l'image
% original x et qui va etre rempli par ses valeurs discrete 
y= zeros(size(x));
for ch=1:w
     for i=1:r,
         for j=1:c,
            % L'image y contint les valeur de x quntifié par le vecteur E 
             y(i,j,ch)=E(x(i,j,ch)+1);
         end
     end
end
 figure(1);
 plot(0:255,E);
 title('Representation de la fonction de quantification'); 
 figure(2);
 imagesc(uint8(y))
 title('Affichage de l"image en niveau de couleur quantiié ');
 
 




 


