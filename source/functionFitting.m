% functionFitting.m
% ����y = x^3 - 6x^2 + 5x - 3��������������ŵ�����
close all; clear; clc;
xi = linspace(0,5);
y = xi.^3 -  6.*xi.^2 + 5.*xi - 3;
yi = y + 8 .* rand(1,100) - 4; %���ž��ȷֲ���[-4,4]
plot(xi,y,'k-','LineWidth',0.75);
hold on; grid on;
scatter(xi,yi,10,'m');

% ����������2��
f2 = polyfit(xi,yi,2);
fy = polyval(f2,xi);
plot(xi,fy,'--','Color',[0.8500 0.3250 0.0980]);

% ����������3��
f3 = polyfit(xi,yi,3);
fy = polyval(f3,xi);
plot(xi,fy,'r:');

% ����������4��
f4 = polyfit(xi,yi,4);
fy = polyval(f4,xi);
plot(xi,fy,'g-.');

title('y=x^3-6x^2+5x-3����������');
legend('ԭ����','������ŵ�','�������','�������','�Ĵ����');