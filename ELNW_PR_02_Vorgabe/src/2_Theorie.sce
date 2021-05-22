clear;
clc;

t      = linspace(-1, 7, 801)';

u_E_zu = [zeros(200,1);
         3*ones(601,1)];
u_C_zu = [zeros(200,1);
         3 * (1 - exp(1 - t(201:801)))];
u_R_zu = [zeros(200,1);
         3 * exp(1 - t(201:801))];
i_zu   = [zeros(200,1);
         3 * exp(1 - t(201:801))];
D_zu   = [t, u_C_zu, u_R_zu, u_E_zu, i_zu];

u_E_ab = [3*ones(200,1);
         zeros(601,1)];
u_C_ab = [3*ones(200,1);
         3 * exp(1 - t(201:801))];
u_R_ab = [zeros(200,1);
         -3 * exp(1 - t(201:801))];
i_ab   = [zeros(200,1);
         -3 * exp(1 - t(201:801))];
D_ab   = [t, u_C_ab, u_R_ab, u_E_ab, i_ab];
