%%% CARTE SAISONNIERE DE LA PRODUCTION PRIMAIRE NETTE %%%
clear, clc, close all
addpath(genpath('C:\Users\HP\Desktop\matlab\M_MAP\m_map'))
lon=ncread('PP.nc','longitude');
lat=ncread('PP.nc','latitude');
cmin=15;
cmax=40;
PP=ncread('PP.nc','nppv');
pp=squeeze(PP(:,:,1:12));

%% PLOTS
%JANVIER-FEVRIER ( décembre 2022 omis)
HIVER=nanmean(pp(:,:,[1,2]),3);
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
set(get(cb,'label'),'string','mmol.m^-^3','FontSize',7,'FontName',...
'Times News Roman','FontWeight','Bold'); 
caxis([cmin cmax])
title('PP  JANVIER-FEVRIER (hiver)','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
xlabel('Longitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
ylabel('Latitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');


%%  MARS-AVRIL-MAI
PRINTEMPS = nanmean(pp(:,:,3:5),3);
subplot(2,2,2);
m_proj('mercator','lat',[-2 20],'lon',[-25 15]);
hold on
m_pcolor(X,Y,PRINTEMPS'); shading flat
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
set(get(cb,'label'),'string','mmol.m^-^3','FontSize',7,'FontName',...
'Times News Roman','FontWeight','Bold');
caxis([cmin cmax])
title('PP  MARS-AVRIL-MAI (printemps)','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
xlabel('Longitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
ylabel('Latitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');

%% JUIN-JUILLET-AOUT
ETE = nanmean(pp(:,:,6:8),3);
subplot(2,2,3);
m_proj('mercator','lat',[-2 20],'lon',[-25 15]);
hold on
m_pcolor(X,Y,ETE'); shading flat;
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
set(get(cb,'label'),'string','mmol.m^-^3','FontSize',7,'FontName',...
'Times News Roman','FontWeight','Bold');
caxis([cmin cmax])
title('PP  JUIN-JUILLET-AOUT (été)','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
xlabel('Longitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
ylabel('Latitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold')


%% SEPTEMBRE-OCTOBRE-NOVEMBRE
AUTOMNE = nanmean(pp(:,:,9:11),3);
subplot(2,2,4);
m_proj('mercator','lat',[-2 20],'lon',[-25 15]);
hold on
m_pcolor(X,Y,AUTOMNE'); shading flat;
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
set(get(cb,'label'),'string','mmol.m^-^3','FontSize',7,'FontName',...
'Times News Roman','FontWeight','Bold');
caxis([cmin cmax])
title('PP  SEPTEMBRE-OCTOBRE-NOVEMBRE (automne)','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
xlabel('Longitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');
ylabel('Latitude','FontSize',7,'FontName','Times News Roman',...
'FontWeight','Bold');

saveas(1,'saispp','png')

