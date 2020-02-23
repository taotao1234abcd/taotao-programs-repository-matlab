clear;close all;clc;

global dis_infect proba_infect T_incubation T_treatment proba_death linedata
dis_infect = 0.01; % 感染距离，反映病毒的感染能力
proba_infect = 0.15; % 感染概率，反映人群的活动性
T_incubation = 14; % 潜伏期
T_treatment = 20; % 治疗期
proba_death = 0.1; % 死亡率

linedata = zeros(5, 0);


position = rand(10000, 2);
state = zeros(10000, 2); 
% 第一列为状态值，第二列为已进入此状态的时间
% 0为未感染，1为已感染在潜伏期，2为已发病已隔离，3为已康复，4为已死亡

temp_rand = randperm(10000, 10);
state(temp_rand, 1) = 1;

for t = 1:500
    move = 0.001 * randn(10000, 2);
    position = position + move;
    state(:, 2) = state(:, 2) + 1;
    state = infection(state, position);
    show_video(state, position);
    get_linedata(state);
end
figure;
plot(linedata(2, :), 'Color', [237, 136, 61]/255, 'LineWidth', 1);
hold on;
plot(linedata(3, :), 'Color', [255, 100, 100]/255, 'LineWidth', 1);
plot(linedata(4, :), 'Color', [0, 180, 180]/255, 'LineWidth', 1);
plot(linedata(5, :), 'Color', [120, 120, 120]/255, 'LineWidth', 1);
xlabel('Time');
ylabel('Number');
legend('Incubation Period', 'Sick and Isolated', 'Recovered', 'Dead')


function [state] = infection(state, position)
global dis_infect proba_infect T_incubation T_treatment proba_death
index_0 = find(state(:, 1) == 0)';
index_1 = find(state(:, 1) == 1)';
distance_array = get_distance(position(index_0, :), position(index_1, :));
[temp_x, temp_y] = find(distance_array < dis_infect);
rand_array = rand(max(size(temp_y)), 1);
temp = find(rand_array < proba_infect);
rand_array = zeros(size(rand_array));
rand_array(temp) = 1;
newadd_index_1 = index_0(temp_y);
state(newadd_index_1, 1) = rand_array;
state(newadd_index_1, 2) = 0;

index_12 = find(state(:, 1) == 1 & state(:, 2) > T_incubation)';
state(index_12, 1) = 2;
state(index_12, 2) = 0;
index_23 = find(state(:, 1) == 2 & state(:, 2) > T_treatment)';
rand_array = rand(max(size(index_23)), 1);
temp = find(rand_array < proba_death);
rand_array = 3 * ones(size(rand_array));
rand_array(temp) = 4;
state(index_23, 1) = rand_array;
state(index_23, 2) = 0;
end


function [out] = get_distance(pos1, pos2)
out = sqrt((pos1(:, 1)' - pos2(:, 1)).^2 + (pos1(:, 2)' - pos2(:, 2)).^2);
end


function show_video(state, position)
index_0 = find(state(:, 1) == 0)';
index_1 = find(state(:, 1) == 1)';
index_2 = find(state(:, 1) == 2)';
index_3 = find(state(:, 1) == 3)';
index_4 = find(state(:, 1) == 4)';

plot(position(index_0, 1), position(index_0, 2), '.', 'Color', [0, 110, 200]/255);
hold on;
plot(position(index_1, 1), position(index_1, 2), '.', 'Color', [237, 136, 61]/255);
plot(position(index_3, 1), position(index_3, 2), '.', 'Color', [0, 180, 180]/255);
axis equal;
hold off;
pause(0.01);

end

function get_linedata(state)
global linedata
index_0 = find(state(:, 1) == 0)';
index_1 = find(state(:, 1) == 1)';
index_2 = find(state(:, 1) == 2)';
index_3 = find(state(:, 1) == 3)';
index_4 = find(state(:, 1) == 4)';
newdata = [max(size(index_0)) max(size(index_1)) max(size(index_2)) max(size(index_3)) max(size(index_4))]';
linedata = [linedata, newdata];
end



