%%% CARTE SAISONNIERE DE LA L'EPAISSEUR DE LA COUCHE DE MELANGE %%%
clear, clc, close all
addpath(genpath('C:\Users\HP\Desktop\matlab\M_MAP\m_map'))
lon=ncread('MLD.nc','longitude');
lat=ncread('MLD.nc','latitude');
cmin=5;
cmax=30;
COUCHE_MEL = ncread('MLD.nc','mlotst');
couche=squeeze(COUCHE_MEL(:,:,1:12));

%% PLOTS
%JANVIER-FEVRIER
HIVER=nanmean(couche(:,:,[1,2]),3);
[X,Y] = meshgrid(lon, lat);
subplot(2,2,1);
m_proj('mercator','lat',[-2 20],'lon',[-25 15]);
hold on
m_pcolor(X,Y,HIVER'); shading flat;
m_gshhs_h('patch',[0.4 0.4 0.4]);
m_coast('line','color',[0.8 0.8 0.8],'linewidth',2);
m_grid('box','on','tickdir','in','xtick',(-25:5:15),'ytick',...
(-2:5:20),'fontsize',5,'fontweight','bold');
axis equal tight
colormap('jet'); 
% Charger le fichier de formes globale 
g_w = shaperead('world-administrative-boundaries.shp'); 
% Tracer les frontières 
for k = 1:length(g_w)
    long = g_w(k).X;
    lati = g_w(k).Y;
    m_line(long, lati, 'color', 'k', 'LineWidth',0.25);
end
colorbar;
cb=colorbar('xtick',cmin:5:cmax,'xticklabel',cmin:5:cmax);
set(get(cb,'label'),'string','m','FontSize',7,'FontName',...
'Times News Roman','FontWeight','Bold');
caxis([cmin cmax])
title('MLD  JANVIER-FEVRIER','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
xlabel('Longitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
ylabel('Latitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');

%%  MARS-AVRIL-MAI
PRINTEMP = nanmean(couche(:,:,3:5),3);
subplot(2,2,2);
m_proj('mercator','lat',[-2 20],'lon',[-25 15]);
hold on
m_pcolor(X,Y,PRINTEMP'); shading flat;
m_gshhs_h('patch',[0.4 0.4 0.4]);
m_coast('line','color',[0.8 0.8 0.8],'linewidth',2);
m_grid('box','on','tickdir','in','xtick',(-25:5:15),'ytick',...
(-2:5:20),'fontsize',5,'fontweight','bold');
axis equal tight
colormap(jet);
% Charger le fichier de formes globale 
g_w = shaperead('world-administrative-boundaries.shp'); 
% Tracer les frontières 
for k = 1:length(g_w)
    long = g_w(k).X;
    lati = g_w(k).Y;
    m_line(long, lati, 'color', 'k', 'LineWidth',0.25);
end
colorbar;
cb=colorbar('xtick',cmin:5:cmax,'xticklabel',cmin:5:cmax);
set(get(cb,'label'),'string','m','FontSize',7,'FontName',...
'Times News Roman','FontWeight','Bold');
caxis([cmin cmax])
title('MLD  MARS-AVRIL-MAI','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
xlabel('Longitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
ylabel('Latitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');

%% JUIN-JUILLET-AOUT
ETE = nanmean(couche(:,:,6:8),3);
subplot(2,2,3);
m_proj('mercator','lat',[-2 20],'lon',[-25 15]);
hold on
m_pcolor(X,Y,ETE'); shading flat;
m_gshhs_h('patch',[0.4 0.4 0.4]);
m_coast('line','color',[0.8 0.8 0.8],'linewidth',2);
m_grid('box','on','tickdir','in','xtick',(-25:5:15),'ytick',...
(-2:5:20),'fontsize',5,'fontweight','bold');
axis equal tight
colormap(jet); 
% Charger le fichier de formes globale 
g_w = shaperead('world-administrative-boundaries.shp'); 
% Tracer les frontières 
for k = 1:length(g_w)
    long = g_w(k).X;
    lati = g_w(k).Y;
    m_line(long, lati, 'color', 'k', 'LineWidth',0.25);
end
colorbar;
cb=colorbar('xtick',cmin:5:cmax,'xticklabel',cmin:5:cmax);
set(get(cb,'label'),'string','m','FontSize',7,'FontName',...
'Times News Roman','FontWeight','Bold');
caxis([cmin cmax])
title('MLD  JUIN-JUILLET-AOUT','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
xlabel('Longitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
ylabel('Latitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold')

%% SEPTEMBRE-OCTOBRE-NOVEMBRE
AUTOMNE = nanmean(couche(:,:,9:11),3);
subplot(2,2,4);
m_proj('mercator','lat',[-2 20],'lon',[-25 15]);
hold on
m_pcolor(X,Y,AUTOMNE'); shading flat;
m_gshhs_h('patch',[0.4 0.4 0.4]);
m_coast('line','color',[0.8 0.8 0.8],'linewidth',2);
m_grid('box','on','tickdir','in','xtick',(-25:5:15),'ytick',...
(-2:5:20),'fontsize',5,'fontweight','bold');
axis equal tight
colormap(jet);
% Charger le fichier de formes globale 
g_w = shaperead('world-administrative-boundaries.shp'); 
% Tracer les frontières 
for k = 1:length(g_w)
    long = g_w(k).X;
    lati = g_w(k).Y;
    m_line(long, lati, 'color', 'k', 'LineWidth',0.25);
end
colorbar;
cb=colorbar('xtick',cmin:5:cmax,'xticklabel',cmin:5:cmax);
set(get(cb,'label'),'string','m','FontSize',7,'FontName',...
'Times News Roman','FontWeight','Bold');
caxis([cmin cmax])
title( 'MLD  SEPTEMBRE-OCTOBRE-NOVEMBRE','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
xlabel('Longitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
ylabel('Latitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');

saveas(1,'saismel','png')

