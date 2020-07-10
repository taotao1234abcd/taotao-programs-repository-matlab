clear;close all;format long;clc;

% t = 0:0.001:3; % 原理想信号
% x = 220*exp(-0.25*t).*cos(2*pi*1.5*t+pi) + 10*exp(-0.1*t).*cos(2*pi*15*t+pi/2) + 1*exp(-0.5*t).*cos(2*pi*5*t) + 100*exp(-0.5*t);

run data_prony
t = data(:, 1);
x = data(:, 2);

mean_num_half = 20;
mean_num = mean_num_half * 2 + 1;
x1 = zeros(length(x), 1);
for i = (mean_num_half + 1):(length(x) - mean_num_half - 1)
    x1(i) = mean(x((i - mean_num_half):(i + mean_num_half)));
end

mean_num_half = 50;
mean_num = mean_num_half * 2 + 1;
x2 = zeros(length(x), 1);
for i = (mean_num_half + 1):(length(x) - mean_num_half - 1)
    x2(i) = mean(x1((i - mean_num_half):(i + mean_num_half)));
end
x = x2;
mean_x = mean(x(3*fix(length(x)/4):end));
x = x- mean_x;


x(1:22000) = [];
t(1:22000) = [];
x(2000:end) = [];
t(2000:end) = [];



if size(x, 1) > size(x, 2)
    x = x';
end
if size(t, 1) > size(t, 2)
    t = t';
end
subplot(211);
plot(t, x, 'r:');
legend('原波形');
grid on;

mn = 100; % prony模型的阶数
sf = 1/mean(diff(t)); % 采样频率
x_bias_list = -(max(x) - min(x))/2:(max(x) - min(x))/20:(max(x) - min(x))/2; % 直流偏移调整量的搜索范围
x_bias_list = [0];
error_list = [];
for x_bias = x_bias_list  
    [out, out_h, error] = get_prony(x, sf, mn, x_bias);
    error_list = [error_list, error];
end
error_min_index = find(error_list == min(error_list));
error_min_index = error_min_index(1);
x_bias = x_bias_list(error_min_index);
[out, out_h, error] = get_prony(x, sf, mn, x_bias);

subplot(212);
plot(out_h(1, :), out_h(2, :), 'r:', out_h(1, :), out_h(3, :));
legend('原波形', '拟合得到的波形');
grid on;


fprintf('计算结果见变量 out，各列从左到右依次为：频率(Hz) 幅值 阻尼系数 初相角(rad)\n');


hang = size(out, 1);
% invalid_hang = 2;
% index_list = [1:(invalid_hang - 1), (invalid_hang + 1):hang];
index_list = 1:22;
t = out_h(1, :);
y = 0 * t;
dt = 1/sf;
n = 0:(length(t)-1);
for i = index_list
%     y = y + out(i, 2)*exp(out(i, 3)*t).*cos(2*pi*out(i, 1)*t + out(i, 4));
    y = y + real(0.5*out(i, 2)*exp(1j*out(i, 4))*exp((out(i, 3) + 1j*2*pi*out(i, 1))*dt).^n) + real(0.5*out(i, 2)*exp(-1j*out(i, 4))*exp((out(i, 3) - 1j*2*pi*out(i, 1))*dt).^n);
end
y = y + mean(out_h(2, :)) - mean(y);

figure;
subplot(211);
plot(out_h(1, :), out_h(2, :), 'r:');
legend('原波形');
grid on;
subplot(212);
plot(out_h(1, :), out_h(2, :), 'r:', t, y);
legend('原波形', '根据所选频率拟合得到的波形');
grid on;



function [out, out_h, error] = get_prony(x, sf, mn, x_bias)

x = x + x_bias;
nm = 2 * mn;

n = fix(length(x)/2);
x = x(1, 1:2*n)';
dt = 1/sf;
t = 0:dt:(2*n-1)*dt;

L = length(x);
M = L/2;
for k=1:nm
    X1(:,k) = x(k:M-1+k);
end
for k=1:M
    X2(k,:) = -x(nm+k);
end
a = X1\X2;
a(nm+1) = 1;
a1 = a(nm+1:-1:1);
Z = roots(a1);
F1 = imag(log(Z))/(2*pi*dt);
D1 = real(log(Z))/dt;
for k = 0:(2*n-1)
    Zn(k+1,:) = [conj(Z').^k];
end
b = (inv(conj(Zn')*Zn)*conj(Zn')*x);

x1 = real(Zn*b);

[F2,I] = sort(F1);
m = 0;
for k = 1:nm-1
    m = m+1;
    II = I(k);
    F(m) = F1(II);
    D(m) = D1(II);
    A(m) = abs(b(II));
    theta(m) = angle(b(II));
end

out = real([F; 2*A; D; theta]');
out_h = [t; x'; x1'];
error = sum((x - x1).^2);

out(find(out(:, 1) == 0), 2) = out(find(out(:, 1) == 0), 2) / 2;
out = out(find(out(:, 1) >= 0), :);
out = -sortrows(-out, 2);
end





