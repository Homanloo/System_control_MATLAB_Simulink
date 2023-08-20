function F = StStFun(y)
% Calculation of steady-state values of state variales.

% Unpacking the initial values:
CA1_ss = y(1);
T1_ss = y(2);
T2_ss = y(3);
qc = y(4);

% Constant values:
CA2_ss = 0.005;
q = 100;
v = 100;
rho = 1000;
CAf = 1;
hA = 1.67*10^5;
E_R = 10000;
Tf = 350;
cp = 0.239;
k0 = 7.2*10^10;
Tcf = 350;
dH = 4.78*10^4;


% Differential equations of the system at steady-state condition:

F(1) = (q/v)*(CAf-CA1_ss) - k0*CA1_ss*exp(-E_R/T1_ss);
F(2) = (q/v)*(Tf - T1_ss) + (k0*dH*CA1_ss/(rho*cp))*exp(-E_R/T1_ss) + (qc/v)*(1-exp(-hA/(rho*cp*qc)))*(Tcf - T1_ss);
F(3) = (q/v)*(CA1_ss - CA2_ss) - k0*CA2_ss*exp(-E_R/T2_ss);
F(4) = (q/v)*(T1_ss - T2_ss) + (k0*dH*CA2_ss/(rho*cp))*exp(-E_R/T2_ss) + (qc/v)*(1-exp(-hA/(rho*cp*qc)))*(T1_ss-T2_ss+(exp(-hA/(rho*cp*qc)))*(Tcf-T1_ss));