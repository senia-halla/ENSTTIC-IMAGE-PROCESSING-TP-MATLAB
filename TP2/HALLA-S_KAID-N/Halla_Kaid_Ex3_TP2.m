clc ;
close all;
clear all;

% Erreur 1 :
% Error using imread>get_full_filename (line 567)
%File "rose.jpeg" does not exist.
% I = imread('rose.jpeg');

%Solution : nous devons ajouter le chemien vers cette image et concatener

% lecture de l’image 
chemin_img_tp2 = 'E:\cours\SEMESTRE 2\TI\TP\TP2\image_TP2\';
img_rose = 'rose.jpeg';
I = imread(cat(2,chemin_img_tp2,img_rose),'jpeg');






% prendre les paramètres (ligne ,colonne, profondeur)
[j,k,c] = size(I);

% définir un facteur d'échantillonnage 
%scale = 5;
%scale = 17;
%scale = 26;
% On est entrain de modifier la résolution spatiale par un scale
% plus on augmente le scale : on réduit le nomre de pixel donc au aura une
% qualité médiocre 

scale = 50;



% Erreur en utilisation de round : elle peut arrondir a des valeur superieur 
% donc on peut depasser la taille de l'image 
% 
%  x_new = round(j/scale);
%  y_new = round(k/scale);


% Solution : on utilise floor : elle va toujours arrondir a des valeurs
% inferieur : donc impossible de depasser la taille de l'image : l'algo
% sera adequat pour toute valeur de scale 

%round  rounds towards nearest decimal or integer (applique la regle de l arrondie  qu on connait 
%floor  Round towards minus infinity : floor(X) rounds the elements of X to the nearest integers towards
%minus infinity. 


% calculer nouvelles  taille en divisant par le facteur scale et en arrondissant  
x_new = floor(j/scale);
y_new = floor(k/scale);


%On va recondtruire notre image avec des nouvelle pixel 
%definir une matrice de zeros 
M = zeros(x_new,y_new,c);

% boucle pour parcourir chaque canal de la nouvelle matrice 
for ch = 1:c
    
    %boucle pour parcourir les lignes de la nouvelle matrice 
    for count1 = 1:x_new
        
        %boucle pour parcourir les colonnes de la nouvelle matrice
        for count2 = 1:y_new
            %remplir la matrice de la nouvelle image avec les valeurs des pixel de l'image original
            %( correspondant au saut qu’on a fait ‘scale’)
            M(count1,count2,ch) = I(count1*scale,count2*scale,ch);
        end
        
    end
    
end

subplot(1,2,1); imagesc(uint8(I)); axis tight;
subplot(1,2,2); imagesc(uint8(M)); axis tight;