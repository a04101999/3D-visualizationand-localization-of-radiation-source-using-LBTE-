clear all
x = xlsread('datasets2D 3D.xlsx', 'Sheet1','A1:A1331');
y = xlsread('datasets2D 3D.xlsx', 'Sheet1','B1:B1331');
z = xlsread('datasets2D 3D.xlsx', 'Sheet1','C1:C1331');
dose = xlsread('datasets2D 3D.xlsx', 'Sheet1','F1:F1331');

no=max(dose)
c=dose./no
figure
scatter3(x,y,z,[],c,'filled')
hold on
v1=[0.1,0,0]
v2=[0.1,0,1]
v=[v2;v1]
plot3(v(:,1),v(:,2),v(:,3),'r')
scatter3(x(i),y(i),z(i),[],c(i),'filled')

tic
clear all
format long
n=10
x = xlsread('madhu.xlsx', 'Sheet1','A1:A4');
y = xlsread('madhu.xlsx', 'Sheet1','B1:B4');
z = xlsread('madhu.xlsx', 'Sheet1','C1:C4');
d = xlsread('madhu.xlsx', 'Sheet1','D1:D4');
c=d./max(d)
scatter3(x,y,z,[],c,'filled')
