clc;
close all;
clear all;

imchoisie=imread("pout.tif");
imshow(imchoisie);
[r,c]=size(imchoisie);
%% affichage de l'histogramme de l image choisie 
%avec la fonction imhist
 figure(1);
imhist(imchoisie);
title("Histogramme avec la fonction imhist")
%sans la fonction imhist
 H=zeros(256,1);
 for i=0:255
    H(i+1)=sum(imchoisie(:)==i);
 end
 figure(2);
 
 bar(0:255,H);
 title("Histogramme sans la fonction imhist")
%% affichage de l'histogramme cummulé 
% avec la fonction cumsum
Hc=cumsum(H);
figure(1);
bar(0:255,Hc);
title("Histogramme Cumulés avec la fonction cumsum")
%sans la fonction cumsum
Hc=zeros(256,1);
for i=2:256
 Hc(i)=Hc(i-1)+H(i);
end
figure(2);
bar(0:255,Hc);
title("Histogramme Cumulés sans la fonction cumsum")
%des exemples d'applications qui montrent l'interet de l histogramme cumulé
% on trouve  dans le domaines de la médecine : les radios et les scanners ex :la reconnaissance de cellules.
%% La Luminance 
somme=double(0);
for i=1:r
    for j=1:c
        somme = somme + double(imchoisie(i,j));
    end
end

luminance = somme / (r*c);

%% Le contraste 
% Formule de michelson 
Contraste_michelson=(max(imchoisie(:))-min(imchoisie(:)))/(max(imchoisie(:))+min(imchoisie(:)));
% Formule ecart type 
contraste_ecart_type = 0;
for i=1:r
  for j=1:c
    contraste_ecart_type = contraste_ecart_type + (double(imchoisie(i,j)) - luminance)^2;
  end
end

contraste_ecart_type = (contraste_ecart_type / (r*c))^0.5;
%Commentaire : pas les mm valeurs  pourquoi ?

%% modification sur les histogrammes
% Etirement 
%avec la fonction imadjust
im_Etire=imadjust(imchoisie);
 figure ,
 title("Attirement avec la fonction imdjust")
 subplot(221);imshow(imchoisie);title("original");
 subplot(222);plot(imhist(imchoisie));
 subplot(223);imshow(im_Etire);title("Ajuste");
 subplot(224);plot(imhist(im_Etire));
 %commentaire : l'etirement permet d'etaler l'histogramme sur toute les valeurs 
 % d'intensité possible, il décroit toute fois la qualité de l'image
 % ==>apparition de  interstices 
 %Egalisation
 im_Egalise=histeq(imchoisie);
 figure ,
 subplot(221);imshow(imchoisie);title("original");
 subplot(222);plot(imhist(imchoisie));
 subplot(223);imshow(im_Egalise);title("Apres egalisation");
 subplot(224);plot(imhist(im_Egalise));
 % commentaire :l'egalisation rend les intensité equiprobables il modifie l'histogramme
%de tel sorte a avoir un histogramme plat (plus au moins)
%une image egalisé est de meilleur qualité et visuellement plus plaisante

%comparaison de l'etiremnt et de l'egalisation de l image 
figure ,
 subplot(221);imshow(im_Etire);title("Etalé");
 subplot(222);plot(imhist(im_Etire));
 subplot(223);imshow(im_Egalise);title("Apres egalisation");
 subplot(224);plot(imhist(im_Egalise));

 
clear all ;
%egalisation et etiremnt d' une image de notre choix
im_couleur=imread('./Image_TP3/img_couleur.jpg');
imshow(im_couleur)

%etirement
for k=1:3
    im_etale(:,:,k)=imadjust(im_couleur(:,:,k));
end
  figure,
  title("etirement");
  subplot(321);plot(0:255,imhist(im_couleur(:,:,1)));title("Rouge");
  subplot(323);plot(0:255,imhist(im_couleur(:,:,2)));title("vert");
  subplot(325);plot(0:255,imhist(im_couleur(:,:,3)));title("Bleur");
  subplot(322);plot(0:255,imhist(im_etale(:,:,1)));title("Rouge apres etalement");
  subplot(324);plot(0:255,imhist(im_etale(:,:,2)));title("vert apres etalemnt");
  subplot(326);plot(0:255,imhist(im_etale(:,:,3)));title("Bleu apres etalemnt");

% %egalisation
for k=1:3
    im_egalise(:,:,k)=histeq(im_couleur(:,:,k));
 end
figure,
 title("egalisation");
  subplot(321);plot(0:255,imhist(im_couleur(:,:,1)));title("Rouge");
  subplot(323);plot(0:255,imhist(im_couleur(:,:,2)));title("vert");
  subplot(325);plot(0:255,imhist(im_couleur(:,:,3)));title("Bleu");
  subplot(322);plot(0:255,imhist(im_egalise(:,:,1))); title("Rouge apres egalisation");
  subplot(324);plot(0:255,imhist(im_egalise(:,:,2)));title("vert apres egalisation");
  subplot(326);plot(0:255,imhist(im_egalise(:,:,3)));title("Bleu apres egalisation");
 % affichage des images resultantes
 figure,
 subplot(131);imshow(im_couleur);title("image originale")
 subplot(133);imshow(im_egalise);title("image apres egalisation")
 subplot(132);imshow(im_etale);title("image apres etirement")
 
 clear all
%histogramme conjoint
% L’information mutuelle est issue de la théorie de l'information. Pour deux images données,
% l’information mutuelle permet de mesurer leur ressemblance.
% Le calcul d’information mutuelle de deux images est bas´e sur la densité conjointe de probabilité des niveaux de gris des images. Il est n´ecessaire pour estimer la densit´e conjointe
% de probabilit´e de calculer un histogramme conjoint des niveaux de gris entre ces deux images.
% evaluer la difference entre les deux image
I=imread("cameraman.tif"); % On utilise une matrice carrée pour que la taille de la matrice soit egal a la matrice transposée  
T= I';
Histo_conjoint=zeros(size(I,1),size(I,1));% size(I,1) returns the lengths of the specified dimensions in a 
                                          %row vector
                                          %hc est une matrice carre
 
 
 for i=1:size(I,1)
     for j=1:size(I,1)
        Histo_conjoint(j,i)=sum(I(i,:)==T(j,:));
     end
 end
 figure;
 subplot(131);imshow(I);title("image originale")
 subplot(133);imshow(T);title("image Transposée")
 subplot(132);imshow(Histo_conjoint);title("histo conjoint")
  