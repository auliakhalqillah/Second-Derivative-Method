% This file is used to plot results of:
%   1. SecondForwardDif.f95
%   2. SecondBackwardDif.f95
%   3. SecondCenterDif.f95
%
% Created by: Aulia Khalqillah,S.Si(2019)
%
% Load Data
fwd = load('SecondFdiffOut.txt');
bwd = load('SecondBdiffOut.txt');
cwd = load('SecondFdiffOut.txt');

% Take element data of fwd
f_iter = fwd(:,1);
f_data = fwd(:,2);
f_func = fwd(:,3);
f_fwd = fwd(:,4);
f_a = fwd(:,5);
f_res = fwd(:,6);

% Take element data of bwd
b_iter = bwd(:,1);
b_data = bwd(:,2);
b_func = bwd(:,3);
b_bwd = bwd(:,4);
b_a = bwd(:,5);
b_res = bwd(:,6);

% Take element data of cwd
c_iter = cwd(:,1);
c_data = cwd(:,2);
c_func = cwd(:,3);
c_cwd = cwd(:,4);
c_a = cwd(:,5);
c_res = cwd(:,6);

% Plot
subplot(211)
plot(f_data,f_func,'linewidth',2.)
xlabel('Data X')
ylabel('F(X)')
title('Original Function of F(X) = X^3')

subplot(212)
plot(f_data,f_fwd,'b','linewidth',2.)
hold on
plot(b_data,b_bwd,'r','linewidth',2.)
hold on
plot(c_data,c_cwd,'g','linewidth',2.)
xlabel('Data X')
ylabel('F"(X)')
title('Second Derivative Using Forward, Backward, and Center Difference')
legend('Second Derivative - Forward','Second Derivative - Backward', 'Second Derivative - Center', 'Location', 'NorthWest' )
