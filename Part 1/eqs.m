function dxdt = eqs(x,u)
% Arranging the system of equations.

% Unpacking the state variables:
CA1 = x(1);
T1 = x(2);
CA2 = x(3);
T2 = x(4);

% Unpacking the inpute variables:
q = u(1);
CAf = u(2);
Tf = u(3);
qc = u(4);

% Constants:
v = 100;
rho = 1000;
hA = 1.67*10^5;
E_R = 10000;
cp = 0.239;
k0 = 7.2*10^10;
Tcf = 350;
dH = 4.78*10^4;

% Four differential equations:
dCA1 = (q/v)*(CAf-CA1) - k0*CA1*exp(-E_R/T1);
dT1 = (q/v)*(Tf - T1) + (k0*dH*CA1/(rho*cp))*exp(-E_R/T1) + (qc/v)*(1-exp(-hA/(rho*cp*qc)))*(Tcf - T1);
dCA2 = (q/v)*(CA1-CA2) - k0*CA2*exp(-E_R/T2);
dT2 = (q/v)*(T1-T2) + (k0*dH*CA2/(rho*cp))*exp(-E_R/T2) + (qc/v)*(1-exp(-hA/(rho*cp*qc)))*(T1-T2+(exp(-hA/(rho*cp*qc)))*(Tcf-T1));

% Packing the system of equation to insert it into the s-function solver:
dxdt = [dCA1 dT1 dCA2 dT2];
