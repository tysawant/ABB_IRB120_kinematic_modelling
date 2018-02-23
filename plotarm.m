function T = plotarm(q1, q2, q3, q4, q5, q6)
    syms t0 t1 t2 t3 t4 t5
    d = [290 0 0 302 0 72];
    a = [0 -270 -70 0 0 0];
    theta = [t0 t1+(pi/2) t2 t3 t4 t5];
    alpha = [-pi/2 0 pi/2 -pi/2 pi/2 0];
    dof = 6;
    M = eye(4,4);
    Tr = cell(dof,1);
    T_mult = cell(dof,1);
    origins = [];
    for i = 1:dof
        Tr{i} = dhparam2matrix(theta(i), d(i), a(i), alpha(i));
        M = M*Tr{i};
        T_mult{i} = M;
    end
    for i = 1:dof
        T_mult{i} = round(T_mult{i});
        origins = [origins T_mult{i}(1:3,4)];
    end
    T5 = T_mult{6};
    
%% Plotting the stick model
    origins = double(subs(origins,{t0 t1 t2 t3 t4 t5},{deg2rad(q1), deg2rad(q2), deg2rad(q3), deg2rad(q4), deg2rad(q5), deg2rad(q6)}));
    plot3(origins(1,:),origins(2,:),origins(3,:),'or')
    hold on
    plot3(origins(1,:),origins(2,:),origins(3,:),'b')
    ee_o = double(subs(T5(1:3,4),{t0 t1 t2 t3 t4 t5},{deg2rad(q1), deg2rad(q2), deg2rad(q3), deg2rad(q4), deg2rad(q5), deg2rad(q6)}));
    ee_x = double(subs((T5(1:3,4)+ 50*T5(1:3,1)),{t0 t1 t2 t3 t4 t5},{deg2rad(q1), deg2rad(q2), deg2rad(q3), deg2rad(q4), deg2rad(q5), deg2rad(q6)}));
    ee_y = double(subs((T5(1:3,4)+ 50*T5(1:3,2)),{t0 t1 t2 t3 t4 t5},{deg2rad(q1), deg2rad(q2), deg2rad(q3), deg2rad(q4), deg2rad(q5), deg2rad(q6)}));
    ee_z = double(subs((T5(1:3,4)+ 50*T5(1:3,3)),{t0 t1 t2 t3 t4 t5},{deg2rad(q1), deg2rad(q2), deg2rad(q3), deg2rad(q4), deg2rad(q5), deg2rad(q6)}));
    plot3([ee_o(1),ee_x(1)],[ee_o(2),ee_x(2)],[ee_o(3),ee_x(3)],'r')
    plot3([ee_o(1),ee_y(1)],[ee_o(2),ee_y(2)],[ee_o(3),ee_y(3)],'g')
    plot3([ee_o(1),ee_z(1)],[ee_o(2),ee_z(2)],[ee_o(3),ee_z(3)],'b')
    axis([-1004 1004 -1004 1004 -1004 1004])
    T = subs(T5,{t0, t1, t2, t3, t4, t5},{deg2rad(q1), deg2rad(q2), deg2rad(q3), deg2rad(q4), deg2rad(q5), deg2rad(q6)});
end