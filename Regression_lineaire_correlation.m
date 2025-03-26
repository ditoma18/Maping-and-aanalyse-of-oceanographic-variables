                   %%% REGRESSION LINEAIRE %%%
clear;clc;close all
%% Moyenne mensuelle de la temp�rature de surface de la mer
Temperature=ncread('SST.nc','sst');
temperature=Temperature-273;
sst=squeeze(temperature(:,:,1:12));
sst_nanmean=squeeze(nanmean(sst,2));
sst_mean=sst_nanmean(:,1:12);
TEMP=nanmean(sst_mean);
%% Moyenne mensuelle de l'�paisseure de la couche de couche de m�lange
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

%% Appliction du modele de Regression lin�aire multiple
s = regstats(ppr',[COUCHE' NIT' TEMP']);
fstat = s.fstat;
coefficients = s.beta;
rsquare = s.rsquare;
adjrsquare = s.adjrsquare;
residus = s.r;
pp_predit = s.yhat;

%% PLOTS(pour v�rification des conditions d'application du mod�le de regression)
t= 1:12;
% plot pour v�rifier si la variance des r�sidus est approximativement
%constante pour toutes les valeurs de pp et si La moyenne des r�sidus est
%toujours approximativement nulle pour chaque valeur de X 
figure(1)
scatter(t,residus);
ylim([-2,2])
title 'diagramme de distribution des r�sidus'
%plot pour v�rifier si les r�sidus suivent une distribution normale
figure(2)
normplot(residus)
title('PLOT DE NORMALITE DES RESIDUS')
figure(3)
histogram(residus)
title('HISTOGRAMME DES RESIDUS')
% Plot pour comparer les valeurs r�elles et celle pr�dites par le mod�le
figure(4)
plot(t,ppr);
hold on;
plot(t,pp_predit);
title('comparaison entre les valeurs predites par le mod�le et les valeurs r�elles')
legend('pp r�elles', 'pp pr�dites')

%% corr�lation entre les variables
 X=[ppr' COUCHE' NIT' TEMP'];
 R=corrcoef(X);
 
 %% Sauvegardes
 saveas(1,'scatter res','png')
saveas(2,'norm res','png')
saveas(3,'histogram','png')
saveas(4,'comparaison','png')