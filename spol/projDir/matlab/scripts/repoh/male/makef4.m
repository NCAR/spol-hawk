load('~/spowell/humidity_retrieval/male/retarded.mat')

[A,B] = system('date +%Y%m%d');
datestamp = B(1:8);
clear A B
timestamp = '000000';

figure(4)
pcolor(0:6:(numfiles-125-1)*6,0:0.1:(maxheight-0.1),amwind(:,126:end)), shading interp, colormap(flipud(baroclinic)), caxis([-20 20])
set(gca,'XTick',[0:24:24*numfiles/4]);
set(gca,'XTickLabel',[0:1:numfiles/4]);
ylabel('Height (km)','FontSize',14);
xlabel('Days since November 1, 2011, 00Z','FontSize',14);
ylabel(colorbar,'Meridional wind (m s^{-1})','FontSize',14);
title('Male soundings:  Meridional wind','FontSize',16);

pname = strcat(['vwind_', datestamp, '_', timestamp, '.png']);

print ('-dpng', pname);

%return
close all


