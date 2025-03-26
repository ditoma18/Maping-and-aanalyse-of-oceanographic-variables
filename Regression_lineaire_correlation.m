                   %%% REGRESSION LINEAIRE %%%
clear;clc;close all
%% Moyenne mensuelle de la température de surface de la mer
Temperature=ncread('SST.nc','sst');
temperature=Temperature-273;
sst=squeeze(temperature(:,:,1:12));
sst_nanmean=squeeze(nanmean(sst,2));
sst_mean=sst_nanmean(:,1:12);
TEMP=nanmean(sst_mean);
%% Moyenne mensuelle de l'épaisseure de la couche de couche de mélange
COUCHE_MEL = ncread('MLD.nc','mlotst');
couche=squeeze(COUCHE_MEL(:,:,1:12));
couche_nanmean=squeeze(nanmean(couche,2));
couche_mean=couche_nanmean(:,1:12);
COUCHE=nanmean(couche_mean);
%% Moyenne mensuelle de la concentration en nitrates
NITRATE=ncread('NO3.nc','no3');
nitrate=squeeze(NITRATE(:,:,1:12));
nitrate_nanmean=squeeze(nanmean(nitrate,2));
nitrate_mean=nitrate_nanmean(:,1:12);
NIT=nanmean(nitrate_mean);
%% MOyenne mensuellede la production primaire
PP=ncread('PP.nc','nppv');
pp=squeeze(PP(:,:,1:12));
pp_nanmean=squeeze(nanmean(pp,2));
pp_mean=pp_nanmean(:,1:12);
ppr=nanmean(pp_mean);

%% Appliction du modele de Regression linéaire multiple
s = regstats(ppr',[COUCHE' NIT' TEMP']);
fstat = s.fstat;
coefficients = s.beta;
rsquare = s.rsquare;
adjrsquare = s.adjrsquare;
residus = s.r;
pp_predit = s.yhat;

%% PLOTS(pour vérification des conditions d'application du modéle de regression)
t= 1:12;
% plot pour vérifier si la variance des résidus est approximativement
%constante pour toutes les valeurs de pp et si La moyenne des résidus est
%toujours approximativement nulle pour chaque valeur de X 
figure(1)
scatter(t,residus);
ylim([-2,2])
title 'diagramme de distribution des résidus'
%plot pour vérifier si les résidus suivent une distribution normale
figure(2)
normplot(residus)
title('PLOT DE NORMALITE DES RESIDUS')
figure(3)
histogram(residus)
title('HISTOGRAMME DES RESIDUS')
% Plot pour comparer les valeurs réelles et celle prédites par le modèle
figure(4)
plot(t,ppr);
hold on;
plot(t,pp_predit);
title('comparaison entre les valeurs predites par le modèle et les valeurs réelles')
legend('pp réelles', 'pp prédites')

%% corrélation entre les variables
 X=[ppr' COUCHE' NIT' TEMP'];
 R=corrcoef(X);
 
 %% Sauvegardes
 saveas(1,'scatter res','png')
saveas(2,'norm res','png')
saveas(3,'histogram','png')
saveas(4,'comparaison','png')