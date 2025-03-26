
%% CYCLE SAISONNIER DES DIFFERENTES VARIABLES SUR LE MEME GRAPHIQUE
clear;clc;close all
%% moyennes sst
Temperature=ncread('SST.nc','sst');
temperature=Temperature-273;
sst=squeeze(temperature(:,:,1:12));
sst_nanmean=squeeze(nanmean(sst,2));
sst_mean=sst_nanmean(:,1:12);
TEMP=nanmean(sst_mean);
%% Moyenne production primaire
COUCHE_MEL = ncread('MLD.nc','mlotst');
couche=squeeze(COUCHE_MEL(:,:,1:12));
couche_nanmean=squeeze(nanmean(couche,2));
couche_mean=couche_nanmean(:,1:12);
COUCHE=nanmean(couche_mean);
%% Moyenne de concentration en nitrate 
NITRATE=ncread('NO3.nc','no3');
nitrate=squeeze(NITRATE(:,:,1:12));
nitrate_nanmean=squeeze(nanmean(nitrate,2));
nitrate_mean=nitrate_nanmean(:,1:12);
NIT=nanmean(nitrate_mean);
%% Moyenne de production primaire
PP=ncread('PP.nc','nppv');
pp=squeeze(PP(:,:,1:12));
pp_nanmean=squeeze(nanmean(pp,2));
pp_mean=pp_nanmean(:,1:12);
ppr=nanmean(pp_mean);

Mois=1:12;
figure
subplot(2,2,1)
plot(Mois,TEMP,'k','linewidth',2)
%grid on
xticks(1:12)
xticklabels({'J','F','M','A','Ma','J','Jt','A','S','O','N','D'})
xlabel('Mois','FontSize',10,'FontName','Times News Roman')
ylabel('°C','FontSize',10,'FontName','Times News Roman')
title('SST','FontSize',10,'FontName','Times News Roman')
subplot(2,2,2)
plot(Mois,COUCHE,'c','linewidth',2)
%grid on
ylim([14,18.2])
xticks(1:12)
xticklabels({'J','F','M','A','Ma','J','Jt','A','S','O','N','D'})
xlabel('Mois','FontSize',10,'FontName','Times News Roman')
ylabel('m','FontSize',10,'FontName','Times News Roman')
title('épaisseur de la couche de mélange','FontSize',10,'FontName','Times News Roman')

subplot(2,2,3)
plot(Mois, NIT,'g','linewidth',2)
ylim([0.1,0.85])
%grid on
xticks(1:12)
xticklabels({'J','F','M','A','Ma','J','Jt','A','S','O','N','D'})
xlabel('Mois','FontSize',10,'FontName','Times News Roman')
ylabel('mmol.m^-^3','FontSize',10,'FontName','Times News Roman')
title('concentration en nitrate','FontSize',10,'FontName','Times News Roman')

subplot(2,2,4)
plot(Mois,ppr,'b','linewidth',2)
%grid on
xticks(1:12)
xticklabels({'J','F','M','A','Ma','J','Jt','A','S','O','N','D'})
xlabel('Mois','FontSize',10,'FontName','Times News Roman')
ylabel('mg/m^3/day','FontSize',10,'FontName','Times News Roman')
title('production primaire net','FontSize',10,'FontName','Times News Roman')

%% Sauvegarde
saveas(1,'cycle','png')

