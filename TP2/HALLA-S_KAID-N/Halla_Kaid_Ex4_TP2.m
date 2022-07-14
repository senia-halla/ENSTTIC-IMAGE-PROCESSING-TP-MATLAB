clc ; 
clear all ;
close all ; 


% il s'agit de l'algorithm de sur echantillonage (upsampling) aussi appelé "zoom"

%L'image resultante du zoom aura des dimensions  plus large que notre image original
%et cela va dependre d'un facteur de sur-échantillonnage  (la variable zoom dnas notre cas)

%Pour déterminer  l'intensité  des pixels ajouté  dans l'image resultante
%On se base sur l'intensité du plus proche voisin


%lire une image 
% on convertie l'imege en double pour pouvoir effectuer les diff operation
% sur notre matrice 

im= double((imread('onion.png')));
% imshow(imread('onion.png'));

 % dimensions de l'image original
[r c d] = size(im);     

%definir le facteur de zoom
zoom=5; 
% zoom = 2;
% zoom = 10;

% les nouvelles dimensions de l'image  zoomé 
rn = floor(zoom*r);  
cn = floor(zoom*c);

%allocation d'une matrice pour l'image resultante 
im_zoom = zeros(rn,cn,d);

%Le plus proche voisin 
for i = 1:rn;
    x = i/zoom;
    %chaque case prendera l'intensité de son voisinage Pour interpoler la valeur du pixel
    near_i = round(x);
    
    % La condition nous permet de ne pas depasser la taille de notre matrice
    % (Matlab indexé 1)
    if near_i == 0
        near_i = 1;
    end
    
    
    %On fait de meme pour chaque colonne :
   for j = 1:cn;
        y = j/zoom;
        near_j = round(y);
        if near_j == 0
            near_j = 1;
        end
        
        % On récupere les valeur de pixel de notre image zoomer a partir de
        % l'image original : 
        im_zoom(i,j,:) = im(near_i,near_j,:);
   end
end

% Apres avoir terminer les calcul en re-converti notre imge en uint8 et on
% l'affiche : 

imshow(uint8(im_zoom))
