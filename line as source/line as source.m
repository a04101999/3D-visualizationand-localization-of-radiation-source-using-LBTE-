tic
close all
clear
clc

E=100;
flux=100;
constant=30;
length=100;
n=100
y=[]
z=[]
x=[]    
r=[]
xmin=[]
xmax=[]
ymin=[]
ymax=[]
zmin=[]
zmax=[]
ma=[]
color=[]

for i=1:n
    x(i)=rand();
    y(i)=rand();
    z(i)=rand();
    color(i)=i;
end
disp('x y z values')
centers=[x;y;z];
for j=1:n
    r(j)=sqrt(x(j).^2+y(j).^2+z(j).^2);
    xmin(j)=0;
    xmax(j)=r(j);
end
disp('r')
dist=r;
syms xo
for k=1:n
    f(k)=(E.*flux.*constant)./((xo-x(k)).^2+y(k).^2+z(k).^2);
    %integral(f,xmin,xmax)
    %fu=int(f,xmin,xmax)
    dose(k)=int(f(k),0,10);
end
disp('dose')
for mn=1:n
    fun=(E.*flux.*constant)./dose(mn);
    fradius(mn)=fun;
end

disp('inv r')

disp('end')




% centers   : 3 x N matrix of [X;Y;Z] coordinates
% dist      : 1 x N vector of sphere radii

%% Plot spheres (fewer faces)
figure, hold on % One figure to rule them all
[x,y,z] = sphere(20); % 50x50-face sphere
for i = 1 : size(centers,2)
    h = surfl(dist(i) * x + centers(1,i), dist(i) * y + centers(2,i), dist(i) * z + centers(3,i));
    set(h, 'FaceAlpha', 0.15)
    shading interp
end

%% Plot intersection (more faces)
% Create a 1000x1000-face sphere (bigger number = better visualization)
[x,y,z] = sphere(50);

% Allocate space
xt = zeros([size(x), size(centers,2)]);
yt = zeros([size(y), size(centers,2)]);
zt = zeros([size(z), size(centers,2)]);
xm = zeros([size(x), size(centers,2), size(centers,2)]);
ym = zeros([size(y), size(centers,2), size(centers,2)]);
zm = zeros([size(z), size(centers,2), size(centers,2)]);

% Calculate each sphere
for i = 1 : size(centers, 2)
    xt(:,:,i) = dist(i) * x + centers(1,i);
    yt(:,:,i) = dist(i) * y + centers(2,i);
    zt(:,:,i) = dist(i) * z + centers(3,i);
end

% Determine whether the points of each sphere fall within another sphere
% Returns booleans
for i = 1 : size(centers, 2)
    [xm(:,:,:,i), ym(:,:,:,i), zm(:,:,:,i)] = insphere(xt, yt, zt, centers(1,i), centers(2,i), centers(3,i), dist(i)+0.001);
end

% Exclude values of x,y,z that don't fall in every sphere
xmsum = sum(xm,4);
ymsum = sum(ym,4);
zmsum = sum(zm,4);
xt(xmsum < size(centers,2)) = 0;
yt(ymsum < size(centers,2)) = 0;
zt(zmsum < size(centers,2)) = 0;

% Plot intersection
for i = 1 : size(centers,2)
    xp = xt(:,:,i);
    yp = yt(:,:,i);
    zp = zt(:,:,i);
    zp(~(xp & yp & zp)) = NaN;
    surf(xt(:,:,i), yt(:,:,i), zp, 'EdgeColor', 'none');
end
toc