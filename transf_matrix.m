%% Question 1: Line Diagram with coordinate frames
% 
% <<Robot Dynamics_1.jpg>>
% 

%% Question 2: DH Parameter Table
% 
% <<Robot Dynamics_2.jpg>>
% 

%% Question 2 Defining the variables
clear all
clc
syms t0 t1 t2 t3 t4 t5
theta = [t0 t1+(pi/2) t2 t3 t4 t5]
d = [290 0 0 302 0 72]
a = [0 -270 -70 0 0 0]
alpha = [-pi/2 0 pi/2 -pi/2 pi/2 0]
dof = 6;
T = cell(dof,1);
T_mult = cell(dof,1);
origins = [];
M = eye(4,4);
%% Question 3(b,c)
for i = 1:dof
    T{i} = simplify(dhparam2matrix(theta(i), d(i), a(i), alpha(i))); % The function is Question 3(a)
    T{i}
    M = M*T{i};
    T_mult{i} = M;
end
%% Question 4
T05 = T{1}*T{2}*T{3}*T{4}*T{5}*T{6}

%% Question 5
conf_home = round(subs(T05,{t0, t1, t2, t3, t4, t5},{0 , 0, 0, 0 , 0 , 0 }))

%% Question 6
conf_1 = round(subs(T05,{t0, t1, t2, t3, t4, t5},{deg2rad(-45), deg2rad(30), deg2rad(-30), deg2rad(-30), deg2rad(-45), deg2rad(180)}))
disp('The Cartesian position of the robot tip is:')
conf_1(1:3,4)
disp('The unit vector representing the approach vector of the robot in this configuration is:')
conf_1(1:3,3)

%% Question 7
q = [0 0 0 0 0 0];
Tr = plotarm(q(1),q(2),q(3),q(4),q(5),q(6))

%% Question 8
hold off
q = [-20 10 10 10 -20 10];
conf_unique_1 = plotarm(q(1),q(2),q(3),q(4),q(5),q(6));
fprintf('The Robot model and stick figure for configuration 1 are:')
%%
%
% <<Rob_conf_1_model.png>>
%
%%
%
% <<Rob_conf_1_stick.png>>
%
fprintf('\nThe T matrix for configuration 1 is:')
disp(conf_unique_1)
fprintf('\nThe linear jog for configuration 1 is:\n')
%%
%
% <<Rob_conf_1_joint.png>>
%
hold off
q = [-20 -40 20 10 -30 10];
conf_unique_2 = plotarm(q(1),q(2),q(3),q(4),q(5),q(6));
fprintf('The Robot model and stick figure for configuration 2 are:')
%%
%
% <<Rob_conf_2_model.png>>
%
%%
%
% <<Rob_conf_2_stick.png>>
%
fprintf('\nThe T matrix for configuration 2 is:\n')
disp(conf_unique_2)
fprintf('\nThe linear jog for configuration 2 is:\n')
%%
%
% <<Rob_conf_2_joint.png>>
%
hold off
q = [-45 10 10 10 10 10];
conf_unique_3 = plotarm(q(1),q(2),q(3),q(4),q(5),q(6));
fprintf('The Robot model and stick figure for configuration 3 are:')
%%
%
% <<Rob_conf_3_model.png>>
%
%%
%
% <<Rob_conf_3_stick.png>>
%
fprintf('\nThe T matrix for configuration 3 is:\n')
disp(conf_unique_3)
fprintf('\nThe linear jog for configuration 3 is:\n')
%%
%
% <<Rob_conf_3_joint.png>>
%
hold off
q = [-45 0 0 90 -15 45];
conf_unique_4 = plotarm(q(1),q(2),q(3),q(4),q(5),q(6));
fprintf('The Robot model and stick figure for configuration 4 are:')
%%
%
% <<Rob_conf_4_model.png>>
%
%%
%
% <<Rob_conf_4_stick.png>>
%
fprintf('\nThe T matrix for configuration 4 is:\n')
disp(conf_unique_4)
fprintf('\nThe linear jog for configuration 4 is:\n')
%%
%
% <<Rob_conf_4_joint.png>>
%
hold off
q = [0 90 -110 45 15 60];
conf_unique_5 = plotarm(q(1),q(2),q(3),q(4),q(5),q(6));
fprintf('The Robot model and stick figure for configuration 5 are:')
%%
%
% <<Rob_conf_5_model.png>>
%
%%
%
% <<Rob_conf_5_stick.png>>
%
fprintf('\nThe T matrix for configuration 5 is:\n')
disp(conf_unique_5)
fprintf('\nThe linear jog for configuration 5 is:\n')
%%
%
% <<Rob_conf_5_joint.png>>
%
