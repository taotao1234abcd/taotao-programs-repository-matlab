
% ¶ÁĞ´csvÎÄ¼ş

clear;close all;format long;clc;


data_x = csvread('data/data_x.csv');

csvwrite('data_x.csv', data_x);
