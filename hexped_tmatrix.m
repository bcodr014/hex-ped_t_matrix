axis = 2;
syms theta_l1 theta_l2 theta_r1 theta_r2;
syms a1 a2;

T_l = cell(axis,1);
theta_l = [theta_l1 theta_l2];
alpha_l = [pi/2 0];
d_l = [0 0];
a_l = [a1 a2];
n_l = [theta_l; alpha_l; d_l; a_l];

n_l = transpose(n_l);

T_r = cell(axis,1);
theta_r = [theta_r1 theta_r2];
alpha_r = [-pi/2 0];
d_r = [0 0];
a_r = [a1 a2];
n_r = [theta_r; alpha_r; d_r; a_r];

n_r = transpose(n_r);



for i=1:axis
    T_l{i} = [cos(n_l(i,1)) -cos(n_l(i,2))*sin(n_l(i,1)) sin(n_l(i,2))*sin(n_l(i,1)) n_l(i,4)*cos(n_l(i,1)); sin(n_l(i,1)) cos(n_l(i,2))*cos(n_l(i,1)) -sin(n_l(i,2))*cos(n_l(i,1)) n_l(i,4)*sin(n_l(i,1)); 0 sin(n_l(i,2)) cos(n_l(i,2)) n_l(i,3); 0 0 0 1];
    
    T_r{i} = [cos(n_r(i,1)) -cos(n_r(i,2))*sin(n_r(i,1)) sin(n_r(i,2))*sin(n_r(i,1)) n_r(i,4)*cos(n_r(i,1)); sin(n_r(i,1)) cos(n_r(i,2))*cos(n_r(i,1)) -sin(n_r(i,2))*cos(n_r(i,1)) n_r(i,4)*sin(n_r(i,1)); 0 sin(n_r(i,2)) cos(n_r(i,2)) n_r(i,3); 0 0 0 1];
end
celldisp(T_l)
celldisp(T_r)
Tleft_final = T_l{1,1};
Tright_final = T_r(1,1);
for j = 2:axis
    Tleft_final= Tleft_final*T_l{j,1};
    Tright_final = Tright_final*T_r{j,1};
end
Tleft_final
Tright_final