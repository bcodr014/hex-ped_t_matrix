axis = 2;
syms theta_l1 theta_l2 theta_r1 theta_r2;
syms a_l1 a_l2;
T = cell(axis,1);

theta_l = [(theta_l1-pi/2) theta_l2];
alpha_l = [-pi/2 0];
d_l = [0 a_l1+a_l2];
a_l = [0 0];
n_l = [theta_l; alpha_l; d_l; a_l];

n_l = transpose(n_l);


for i=1:axis
    T{i} = [cos(n_l(i,1)) -cos(n_l(i,2))*sin(n_l(i,1)) sin(n_l(i,2))*sin(n_l(i,1)) n_l(i,4)*cos(n_l(i,1)); sin(n_l(i,1)) cos(n_l(i,2))*cos(n_l(i,1)) -sin(n_l(i,2))*cos(n_l(i,1)) n_l(i,4)*sin(n_l(i,1)); 0 sin(n_l(i,2)) cos(n_l(i,2)) n_l(i,3); 0 0 0 1];
end
celldisp(T)
T_final = T{1,1};
for j = 2:axis
    T_final= T_final*T{j,1};
end
T_final