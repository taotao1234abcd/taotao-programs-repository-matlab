clear;close all;clc;

global G M R;
% G=6.67259*10^(-11);
% M=5.977*10^24;
% R=6371000;

G=6.67*10^(-11);
M=6*10^24;
R=6400000;

y=0;
t=0;
n=0;

h=0.5;  % 改进欧拉法的积分步长

x=-(R+3500000);


r=abs(x);

vx=0;
vy=yuanguidao_v(r);

v=sqrt(vx^2+vy^2);

flag=0;


while flag<8 && r>R
    n=n+1;
    t(n+1)=t(n)+h;
    
    axp=-G*M*x(n)/(x(n)^2+y(n)^2)^1.5;
    ayp=-G*M*y(n)/(x(n)^2+y(n)^2)^1.5;
    vxp=vx(n)+axp*h;
    vyp=vy(n)+ayp*h;
    xp=x(n)+vx(n)*h;
    yp=y(n)+vy(n)*h;
    
    axc=-G*M*xp/(xp^2+yp^2)^1.5;
    ayc=-G*M*yp/(xp^2+yp^2)^1.5;
    vxc=vx(n)+axc*h;
    vyc=vy(n)+ayc*h;
    xc=x(n)+vxp*h;
    yc=y(n)+vyp*h;
    
    vx(n+1)=(vxp+vxc)/2;
    vy(n+1)=(vyp+vyc)/2;
    
    x(n+1)=(xp+xc)/2;
    y(n+1)=(yp+yc)/2;
    
    v(n+1)=sqrt(vx(n+1)^2+vy(n+1)^2);
    
    r=sqrt(x(n+1)^2+y(n+1)^2);
    
    if n>1
        if y(n)*y(n-1)<=0
            flag=flag+1;
            
            if flag==3
                vy(n+1)=sign(vy(n+1))*sqrt((7700)^2-(vx(n+1))^2);
            elseif flag==6
                vy(n+1)=sign(vy(n+1))*sqrt((yuanguidao_v(r))^2-(vx(n+1))^2);
            end

        end
    end
    
end


hua_circle([0,0],6371000);
hold on;
plot(x,y,'r');
comet(x,y,0);
hold off;

plot(t/60,v/1000);
axis([0,max(t)/60,0,1.15*max(v)/1000]);
xlabel('t (min)');
ylabel('v (km / s)');
grid on;



function hua_circle(O,R)
theta=0:0.05:2*pi;
x=O(1)+R*cos(theta);
y=O(2)+R*sin(theta);
plot(x,y,'-')
circle_earth=fill(x,y,'k');
set(circle_earth,'edgealpha',1,'facealpha',0.2)
axis equal;
end

function [v] = yuanguidao_v(r)
global G M;
v = sqrt(G*M/r);
end

