load('~/spowell/humidity_retrieval/revelle/retarded.mat')

[A,B] = system('date +%Y%m%d');
datestamp = B(1:8);
clear A B
timestamp = '000000';

figure(3)
pcolor(0:3:(numfiles-237-1)*3,0:0.1:(maxheight-0.1),frdiff(:,238:end)), shading interp, colormap(flipud(baroclinic)), caxis([-200 200])
set(gca,'XTick',[0:24:24*numfiles/8]);
set(gca,'XTickLabel',[0:1:numfiles/8]);
ylabel('Height (km)','FontSize',14);
xlabel('Days since November 8, 2011, 00Z','FontSize',14);
ylabel(colorbar,'Percentage of time-mean vapor density (g m^{-3})');
title('Revelle soundings:  Vapor density deviation','FontSize',16);

pname = strcat(['timemean_humidity_', datestamp, '_', timestamp, '.png']);

print ('-dpng', pname);

%return
close all


