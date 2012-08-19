a = sortrows(csvread('UAnimalStats.csv',1),[2 1]);
p = sortrows(csvread('UPlantStats.csv',1),[2 1]);

symbol = ['v','o','p','*','d','s'];
color = ['r', 'g', 'b', 'c', 'm', 'k'];
j = 1;
figure(j);

hold on;

for i=1:6
	indx1 = (i - 1)*8 + 1;
	indx2 = indx1 + 7;

	density = strcat('Density=', num2str(a(indx1,2))); 
	
	%errorbar(a(indx1:indx2,1), a(indx1:indx2,3), a(indx1:indx2,5), symbol(i));
	plot1 = plot(a(indx1:indx2,1), a(indx1:indx2,3));%, symbol(i));
	set(plot1, 'Marker', symbol(i), 'Color', color(i));
	xlabel('AMT');
	ylabel('Average Path Distance');
	
	set(gca,'XLim',[0 180]);

	legs{i} = density;
end
legend(legs,-1);
hold off;

saveas(gcf, 'PathVsAMT.fig');
saveas(gcf, 'PathVsAMT.pdf');
close(figure(j));

j = j + 1;
figure(j);

hold on;

for i=1:6
	indx1 = (i - 1)*8 + 1;
	indx2 = indx1 + 7;

	density = strcat('Density=', num2str(a(indx1,2))); 

	%errorbar(a(indx1:indx2,1), a(indx1:indx2,4), a(indx1:indx2,6), symbol(i));
	plot1 = plot(a(indx1:indx2,1), a(indx1:indx2,6));%, symbol(i));
	set(plot1, 'Marker', symbol(i), 'Color', color(i));
	xlabel('AMT');
	ylabel('Average Maximum Distance');
	
	set(gca,'XLim',[0 180]);

	legs{i} = density;
end
legend(legs,0);
hold off;

saveas(gcf, 'MaxDVsAMT.fig');
saveas(gcf, 'MaxDVsAMT.pdf');
close(figure(j));

j = j + 1;
figure(j);

hold on;

for i=1:6
	indx1 = (i - 1)*8 + 1;
	indx2 = indx1 + 7;

	density = strcat('Density=', num2str(a(indx1,2))); 

	%errorbar(p(indx1:indx2,1), p(indx1:indx2,3), p(indx1:indx2,6), symbol(i));
	plot1 = plot(p(indx1:indx2,1), p(indx1:indx2,3));%, symbol(i));
	set(plot1, 'Marker', symbol(i), 'Color', color(i));
	xlabel('AMT');
	ylabel('Average Pollen Distance');
	
	set(gca,'XLim',[0 180]);

	legs{i} = density;
end
legend(legs,0);
hold off;

saveas(gcf, 'PollenDVsAMT.fig');
saveas(gcf, 'PollenDVsAMT.pdf');
close(figure(j));
	
j = j + 1;
figure(j);

hold on;

for i=1:6
	indx1 = (i - 1)*8 + 1;
	indx2 = indx1 + 7;

	density = strcat('Density=', num2str(a(indx1,2))); 
	
	%errorbar(p(indx1:indx2,1), p(indx1:indx2,4), p(indx1:indx2,7), symbol(i));
	plot1 = plot(p(indx1:indx2,1), p(indx1:indx2,6));%, symbol(i));
	set(plot1, 'Marker', symbol(i), 'Color', color(i));
	xlabel('AMT');
	ylabel('Average Maximum Pollen Distance');
	
	set(gca,'XLim',[0 180]);

	legs{i} = density;
end
legend(legs,0);
hold off;

saveas(gcf, 'MaxPollenVsAMT.fig');
saveas(gcf, 'MaxPollenVsAMT.pdf');
close(figure(j));

j = j + 1;
figure(j);

hold on;

for i=1:6
	indx1 = (i - 1)*8 + 1;
	indx2 = indx1 + 7;

	density = strcat('Density=', num2str(a(indx1,2))); 

	%errorbar(p(indx1:indx2,1), p(indx1:indx2,5), p(indx1:indx2,8), symbol(i));
	plot1 = plot(p(indx1:indx2,1), p(indx1:indx2,9));%, symbol(i));
	set(plot1, 'Marker', symbol(i), 'Color', color(i));
	xlabel('AMT');
	ylabel('Average Weighted Diversity of Fathers');
	
	set(gca,'XLim',[0 180]);

	legs{i} = density;
end
legend(legs,-1);
hold off;

saveas(gcf, 'WDFvsAMT.fig');
saveas(gcf, 'WDFvsAMT.pdf');
close(figure(j));

a = sortrows(csvread('NAnimalStats.csv',1),[2 1]);
p = sortrows(csvread('NPlantStats.csv',1),[2 1]);

j = j + 1;
figure(j);

hold on;

for i=1:6
	indx1 = (i - 1)*8 + 1;
	indx2 = indx1 + 7;

	density = strcat('Density=', num2str(a(indx1,2))); 
	
	%errorbar(a(indx1:indx2,1)/3, a(indx1:indx2,3), a(indx1:indx2,5), symbol(i));
	plot1 = plot(a(indx1:indx2,1), a(indx1:indx2,3));%, symbol(i));
	set(plot1, 'Marker', symbol(i), 'Color', color(i));
	xlabel('SDA');
	ylabel('Average Path Distance');
	
	set(gca,'XLim',[0 60]);

	legs{i} = density;
end
legend(legs,-1);
hold off;

saveas(gcf, 'PathVsSDA.fig');
saveas(gcf, 'PathVsSDA.pdf');
close(figure(j));

j = j + 1;
figure(j);

hold on;

for i=1:6
	indx1 = (i - 1)*8 + 1;
	indx2 = indx1 + 7;

	density = strcat('Density=', num2str(a(indx1,2))); 

	%errorbar(a(indx1:indx2,1)/3, a(indx1:indx2,4), a(indx1:indx2,6), symbol(i));
	plot1 = plot(a(indx1:indx2,1), a(indx1:indx2,6));%, symbol(i));
	set(plot1, 'Marker', symbol(i), 'Color', color(i));
	xlabel('SDA');
	ylabel('Average Maximum Distance');
	
	set(gca,'XLim',[0 60]);

	legs{i} = density;
end
legend(legs,0);
hold off;

saveas(gcf, 'MaxDVsSDA.fig');
saveas(gcf, 'MaxDVsSDA.pdf');
close(figure(j));

j = j + 1;
figure(j);

hold on;

for i=1:6
	indx1 = (i - 1)*8 + 1;
	indx2 = indx1 + 7;

	density = strcat('Density=', num2str(a(indx1,2))); 

	%errorbar(p(indx1:indx2,1)/3, p(indx1:indx2,3), p(indx1:indx2,6), symbol(i));
	plot1 = plot(p(indx1:indx2,1), p(indx1:indx2,3));%, symbol(i));
	set(plot1, 'Marker', symbol(i), 'Color', color(i));
	xlabel('SDA');
	ylabel('Average Pollen Distance');
	
	set(gca,'XLim',[0 60]);

	legs{i} = density;
end
legend(legs,0);
hold off;

saveas(gcf, 'PollenDVsSDA.fig');
saveas(gcf, 'PollenDVsSDA.pdf');
close(figure(j));
	
j = j + 1;
figure(j);

hold on;

for i=1:6
	indx1 = (i - 1)*8 + 1;
	indx2 = indx1 + 7;

	density = strcat('Density=', num2str(a(indx1,2))); 
	
	%errorbar(p(indx1:indx2,1)/3, p(indx1:indx2,4), p(indx1:indx2,7), symbol(i));
	plot1 = plot(p(indx1:indx2,1), p(indx1:indx2,6));%, symbol(i));
	set(plot1, 'Marker', symbol(i), 'Color', color(i));
	xlabel('SDA');
	ylabel('Average Maximum Pollen Distance');
	
	set(gca,'XLim',[0 60]);

	legs{i} = density;
end
legend(legs,0);
hold off;

saveas(gcf, 'MaxPollenVsSDA.fig');
saveas(gcf, 'MaxPollenVsSDA.pdf');
close(figure(j));

j = j + 1;
figure(j);

hold on;

for i=1:6
	indx1 = (i - 1)*8 + 1;
	indx2 = indx1 + 7;

	density = strcat('Density=', num2str(a(indx1,2))); 

	%errorbar(p(indx1:indx2,1)/3, p(indx1:indx2,5), p(indx1:indx2,8), symbol(i));
	plot1 = plot(p(indx1:indx2,1), p(indx1:indx2,9));%, symbol(i));
	set(plot1, 'Marker', symbol(i), 'Color', color(i));
	xlabel('SDA');
	ylabel('Average Weighted Diversity of Fathers');
	
	set(gca,'XLim',[0 60]);

	legs{i} = density;
end
legend(legs,-1);
hold off;

saveas(gcf, 'WDFvsSDA.fig');
saveas(gcf, 'WDFvsSDA.pdf');
close(figure(j));
