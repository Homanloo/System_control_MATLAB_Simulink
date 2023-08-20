clc
clear

% Initializing the PI controller:
kp = 500;
ki = 600;
% Packing the controller variables:
k = [kp, ki];

% Runing the Simulink file and getting the data as variable simout:
opt = simset('Solver', 'Ode15s', 'SrcWorkspace', 'Current');
simout = sim("part2.slx", [0 25], opt);

% Optimizing the objective function in order to tune the controller:
opt = optimset('Display', 'Iter', 'MaxIter', 20);
k_opt = fminsearch(@obj_fun, k, opt);

% Printing the results:
kp = k_opt(1);
ki = k_opt(2);
formatspec = 'Kp_opt: %.0f\nKi_opt: %.0f\n';
fprintf(formatspec,kp,ki)
