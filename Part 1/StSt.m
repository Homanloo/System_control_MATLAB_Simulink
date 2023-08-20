clear
clc

% Setting up the initial conditions for iteration.
% Other values which are not so out of range will end up
% with the same results below:
CA1_ss_init = 0.5;
T1_ss_init = 400;
T2_ss_init = 450;
qc_init = 100;

% Packing up the initial conditions:
y0 = [CA1_ss_init, T1_ss_init, T2_ss_init, qc_init];

% Using fsolve to find the answers of 4-equations and 4-unknowns system.
% Open the StStFun.m file beforehand.
fun = @StStFun;
y = fsolve(fun,y0);

% Printing the results:
CA1_ss = y(1);
T1_ss = y(2);
T2_ss = y(3);
qc = y(4);
formatspec = '\nCA1_ss: %f   mol/lit \nT1_ss: %f  K \nT2_ss: %f  K \nqc_ss: %f   lit/min \n';
fprintf(formatspec, CA1_ss, T1_ss, T2_ss, qc)