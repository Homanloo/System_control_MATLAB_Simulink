function Performance_Index = obj_fun(k)
% Tuning the controller using Performance Index method.

% Unpacking the controller parameters:
kp = k(1);
ki = k(2);

% Runing the Simulink file and getting the data as variable simout:
opt = simset('Solver', 'ode15s', 'SrcWorkspace', 'Current');
simout = sim("part2.slx", [0 25], opt);

% Creating the objective function:
error = simout.Error.Data;
t = simout.Error.time;
Performance_Index = trapz(t, error.^2);
