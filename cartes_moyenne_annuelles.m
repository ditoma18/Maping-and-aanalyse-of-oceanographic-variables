%% CARTES MOYENNES ANNUELES
clear, clc, close all
addpath(genpath('C:\Users\HP\Desktop\matlab\M_MAP\m_map'))
%% cartes moyennes annuelle de la température de surface de la mer[°C](2023)
Temperature=ncread('SST.nc','sst');
temperature=Temperature-273;
cmin=22;
cmax=30;
lon=ncread('SST.nc','longitude');
lat=ncread('SST.nc','latitude');
[X,Y]=meshgrid(lon,lat);
sst=squeeze(temperature(:,:,1:12));
sst_mean=squeeze(nanmean(sst,3));
figure(1)
m_proj('miller','lat',[-2 20],'lon',[-25 15]);
hold on
m_pcolor(X,Y,sst_mean'); shading flat;
m_gshhs_h('patch',[0.4 0.4 0.4]);
m_coast('line','color',[0.8 0.8 0.8],'linewidth',2);
m_grid('box','on','tickdir','in','xtick',(-15:5:20),'ytick',...
(-15:5:20),'fontsize',5,'fontweight','bold');
axis equal tight
colormap(jet);
% Charger le fichier de formes globale 
g_w = shaperead('world-administrative-boundaries.shp'); 
% Tracer les frontières 
for k = 1:length(g_w)
    long = g_w(k).X;
    lati = g_w(k).Y;
    m_line(long, lati, 'color', 'k', 'LineWidth',1);
end
% Ajouter les noms des pays
cn = {'Mauritanie','Sénégal','Gambie','Guinée-Bissau','Guinée','Sierra Leone','Libéria',"Côte d'ivoire",'Ghana','Togo','Bénin'};
lonlabels = [-13, -15, -15.5, -15, -12.5, -12.5, -10, -5.5, -1, 1, 2.3];
latlabels = [18, 16, 13.5, 12, 10.5, 8.5, 6.5, 8.5 ,7, 8.9, 10];
% Ajouter l'étiquette de texte sur la carte
for k = 1:length(cn)
    m_text(lonlabels(k), latlabels(k), cn(k), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'FontSize', 7, 'Color', 'k');
end
colorbar;
cb=colorbar('xtick',cmin:2:cmax,'xticklabel',cmin:2:cmax);
set(get(cb,'label'),'string','°C','FontSize',10,'FontName',...
'Times News Roman','FontWeight','Bold');
m_northarrow(-5,2,2,'type',4,'linewi',.7);
caxis([cmin cmax]) 
title('TEMPERATURE MOYENNE ANNUELLE DE LA TEMPERATURE DE SURFACE DE LA MER','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
xlabel('Longitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
ylabel('Latitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');

%% carte moyenne annuelle de la variation de l'epaisseur de la couche de mélange[m](2023)
couche_mel=ncread('MLD.nc','mlotst');
cmin= 5;
cmax=30;
lon=ncread('MLD.nc','longitude');
lat=ncread('MLD.nc','latitude');
[X,Y]=meshgrid(lon,lat);
cm=squeeze(couche_mel(:,:,1:12));
cm_mean=squeeze(nanmean(cm,3));
figure(2)
m_proj('miller','lat',[-2 20],'lon',[-25 15]);
hold on
m_pcolor(X,Y,cm_mean'); shading flat;
m_gshhs_h('patch',[0.4 0.4 0.4]);
m_coast('line','color',[0.8 0.8 0.8],'linewidth',2);
m_grid('box','on','tickdir','in','xtick',(-15:5:20),'ytick',...
(-15:5:20),'fontsize',5,'fontweight','bold');
axis equal tight
colormap(jet);
% Charger le fichier de formes globale 
g_w = shaperead('world-administrative-boundaries.shp'); 
% Tracer les frontières 
for k = 1:length(g_w)
    long = g_w(k).X;
    lati = g_w(k).Y;
    m_line(long, lati, 'color', 'k', 'LineWidth',1);
end
% Ajouter les noms des pays
cn = {'Mauritanie','Sénégal','Gambie','Guinée-Bissau','Guinée','Sierra Leone','Libéria',"Côte d'ivoire",'Ghana','Togo','Bénin'};
lonlabels = [-13, -15, -15.5, -15, -12.5, -12.5, -10, -5.5, -1, 1, 2.3];
latlabels = [18, 16, 13.5, 12, 10.5, 8.5, 6.5, 8.5 ,7, 8.9, 10];
% Ajouter l'étiquette de texte sur la carte
for k = 1:length(cn)
    m_text(lonlabels(k), latlabels(k), cn(k), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'FontSize', 7, 'Color', 'k');
end
colorbar;
cb=colorbar('xtick',cmin:6:cmax,'xticklabel',cmin:6:cmax);
set(get(cb,'label'),'string','m','FontSize',10,'FontName',...
'Times News Roman','FontWeight','Bold');
m_northarrow(-5,2,2,'type',4,'linewi',.7);
caxis([cmin cmax])
title('EPAISSEURE MOYENNE ANNUELE DE LA COUCHE DE MELANGE','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
xlabel('Longitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
ylabel('Latitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');

%% carte moyenne annuelle de la concenteation en nitate [mmol/m3](2023)
No3=ncread('NO3.nc','no3');
cmin=0;
cmax=3;
lon=ncread('NO3.nc','longitude');
lat=ncread('NO3.nc','latitude');
[X,Y]=meshgrid(lon,lat);
no3=squeeze(No3(:,:,1:12));
no3_mean=squeeze(nanmean(no3,3));
figure(3)
m_proj('miller','lat',[-2 20],'lon',[-25 15]);
hold on
m_pcolor(X,Y,no3_mean'); shading flat;
m_gshhs_h('patch',[0.4 0.4 0.4]);
m_coast('line','color',[0.8 0.8 0.8],'linewidth',2);
m_grid('box','on','tickdir','in','xtick',(-15:5:20),'ytick',...
(-15:5:20),'fontsize',5,'fontweight','bold');
axis equal tight
colormap(jet);
% Charger le fichier de formes globale 
g_w = shaperead('world-administrative-boundaries.shp'); 
% Tracer les frontières 
for k = 1:length(g_w)
    long = g_w(k).X;
    lati = g_w(k).Y;
    m_line(long, lati, 'color', 'k', 'LineWidth',1);
end
% Ajouter les noms des pays
cn = {'Mauritanie','Sénégal','Gambie','Guinée-Bissau','Guinée','Sierra Leone','Libéria',"Côte d'ivoire",'Ghana','Togo','Bénin'};
lonlabels = [-13, -15, -15.5, -15, -12.5, -12.5, -10, -5.5, -1, 1, 2.3];
latlabels = [18, 16, 13.5, 12, 10.5, 8.5, 6.5, 8.5 ,7, 8.9, 10];
% Ajouter l'étiquette de texte sur la carte
for k = 1:length(cn)
    m_text(lonlabels(k), latlabels(k), cn(k), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'FontSize', 7, 'Color', 'k');
end
colorbar;
cb=colorbar('xtick',cmin:0.5:cmax,'xticklabel',cmin:0.5:cmax);
set(get(cb,'label'),'string','mmol.m^-^3','FontSize',10,'FontName',...
'Times News Roman','FontWeight','Bold');
m_northarrow(-5,2,2,'type',4,'linewi',.7); 
caxis([cmin cmax]) 
title('CONCENTRATION MOYENNE ANNUELE DE NITRATE','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
xlabel('Longitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
ylabel('Latitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');

%% Carte moyenne annuelle de la production primaire net  [mg/m3/day] (2023)
Pp=ncread('PP.nc','nppv');
cmin=15;
cmax=40;
lon=ncread('PP.nc','longitude');
lat=ncread('PP.nc','latitude');
[X,Y]=meshgrid(lon,lat);
pp=squeeze(Pp(:,:,1:12));
pp_mean=squeeze(nanmean(pp,3));
figure(4)
m_proj('miller','lat',[-2 20],'lon',[-25 15]);
hold on
m_pcolor(X,Y,pp_mean'); shading flat;
m_gshhs_h('patch',[0.4 0.4 0.4]);
m_coast('line','color',[0.8 0.8 0.8],'linewidth',2);
m_grid('box','on','tickdir','in','xtick',(-15:5:20),'ytick',...
(-15:5:20),'fontsize',5,'fontweight','bold');
axis equal tight
colormap('jet');
% Charger le fichier de formes globale 
g_w = shaperead('world-administrative-boundaries.shp'); 
% Tracer les frontières 
for k = 1:length(g_w)
    long = g_w(k).X;
    lati = g_w(k).Y;
    m_line(long, lati, 'color', 'k', 'LineWidth',1);
end
% Ajouter les noms des pays
cn = {'Mauritanie','Sénégal','Gambie','Guinée-Bissau','Guinée','Sierra Leone','Libéria',"Côte d'ivoire",'Ghana','Togo','Bénin'};
lonlabels = [-13, -15, -15.5, -15, -12.5, -12.5, -10, -5.5, -1, 1, 2.3];
latlabels = [18, 16, 13.5, 12, 10.5, 8.5, 6.5, 8.5 ,7, 8.9, 10];
% Ajouter l'étiquette de texte sur la carte
for k = 1:length(cn)
    m_text(lonlabels(k), latlabels(k), cn(k), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'FontSize', 7, 'Color', 'k');
end
colorbar;
cb=colorbar('xtick',cmin:3:cmax,'xticklabel',cmin:3:cmax);
set(get(cb,'label'),'string','mg/m^3/day','FontSize',10,'FontName',...
'Times News Roman','FontWeight','Bold');
m_northarrow(-5,2,2,'type',4,'linewi',.7);
caxis([cmin cmax]);
title('PRODUCTION PRIMAIRE MOYENNE ANNUELLE','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
xlabel('Longitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
ylabel('Latitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold')

%% Sauvegardes
saveas(1,'sstfig','png')
saveas(2,'melfig','png')
saveas(3,'nitfig','png')
saveas(4,'ppfig','png')