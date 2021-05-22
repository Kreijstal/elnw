clc;
xdel(winsid());

exec("readLTspice.sci");

M = readLTspice("3_Simulation.txt", "Time", 6);
t = M(:,1)*1000;
u_E = M(:,2);
u_C1 = M(:,3);
u_C2 = M(:,4);
i_E = M(:,7)*1000;
i_C1 = M(:,5)*1000;
i_C2 = M(:,6)*1000;

// Hier beginnt euer Teil
