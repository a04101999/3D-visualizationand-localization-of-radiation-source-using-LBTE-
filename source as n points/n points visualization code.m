clear all
load('final_hack_prb_solved_three_points.mat')
format long
ml=double(solution.x1)
po=double(solution.y1)
iy=double(solution.z1)
centers=[x';y';z'];
grid on;

for i=1:n
radius(i)= sqrt((ml-x(i)).^2+(po-y(i)).^2+(iy-z(i)).^2)
end
dist=radius
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
title('Subplot for point (1 1 0)')
% Plot intersection
for i = 1 : size(centers,2)
    xp = xt(:,:,i);
    yp = yt(:,:,i);
    zp = zt(:,:,i);
    zp(~(xp & yp & zp)) = NaN;
    surf(xt(:,:,i), yt(:,:,i), zp, 'EdgeColor', 'none');
end
toc


fig1=gcf

hold on
grid on

load('final_hack_prb_solved_three_points.mat')
format long
ml=double(solution.x2)
po=double(solution.y2)
iy=double(solution.z2)
centers=[x';y';z'];

for i=1:n
radius(i)= sqrt((ml-x(i)).^2+(po-y(i)).^2+(iy-z(i)).^2)
end
dist=radius
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
title('Subplot for point (1 0 1)')
% Plot intersection
for i = 1 : size(centers,2)
    xp = xt(:,:,i);
    yp = yt(:,:,i);
    zp = zt(:,:,i);
    zp(~(xp & yp & zp)) = NaN;
    surf(xt(:,:,i), yt(:,:,i), zp, 'EdgeColor', 'none');
end
toc


fig2=gcf

hold on

grid on
load('final_hack_prb_solved_three_points.mat')
format long
ml=double(solution.x3)
po=double(solution.y3)
iy=double(solution.z3)
centers=[x';y';z'];

for i=1:n
radius(i)= sqrt((ml-x(i)).^2+(po-y(i)).^2+(iy-z(i)).^2)
end
dist=radius
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
title('Subplot for point (0 0 0)')
% Plot intersection
for i = 1 : size(centers,2)
    xp = xt(:,:,i);
    yp = yt(:,:,i);
    zp = zt(:,:,i);
    zp(~(xp & yp & zp)) = NaN;
    surf(xt(:,:,i), yt(:,:,i), zp, 'EdgeColor', 'none');
end
toc




hold on
fig3=gcf
