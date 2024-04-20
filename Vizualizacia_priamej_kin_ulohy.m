%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Autor : Anhelina Kyrylova                       %%%%%%%%%%%%%%%
%%%%%%%%%%% Vizualizacia robotickeho ramena                 %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;
%% Vizualizacia robotickeho ramena
%% velkosti
l1 = 203;
l2 = 178;
l3 = 178;
%% uhly phi (lubovolne)
phi1 = deg2rad(40);
phi2 = deg2rad(50);
phi3 = deg2rad(35);
phi_p = deg2rad(90);
%% Rotacia pre A ( Os Z )
R_ZA = [cos(phi1) -sin(phi1) 0 0;
sin(phi1) cos(phi1) 0 0;
0 0 1 0;
0 0 0 1];
%% Tranzlacia pre A ( OS Z )
T_ZA = [1 0 0 0;
0 1 0 0;
0 0 1 l1;
0 0 0 1];
%% Polohovy pomocny nulovy vektor
p1 = [0; 0; 0; 1];
%% Bod A
A = R_ZA * T_ZA * p1;
%% Rotacia pre B ( Os Z )
R_ZB = [cos(phi_p - phi1) -sin(phi_p - phi1) 0 0;
sin(phi_p - phi1) cos(phi_p - phi1) 0 0;
0 0 1 0;
0 0 0 1]
%% Rotacia pre B ( Os Y )
R_YB = [cos(phi2) 0 sin(phi2) 0;
0 1 0 0;
-sin(phi2) 0 cos(phi2) 0;
0 0 0 1]
%% Tranzlacia pre B ( Os Z )
T_ZB = [1 0 0 0;
0 1 0 0;
0 0 1 l2;
0 0 0 1]
%% Bod B
B = R_ZB * T_ZA * R_YB * T_ZB * p1
%% Rotacia pre C ( Os Z )
T_ZC = [1 0 0 0;
0 1 0 0;
0 0 1 l3;
0 0 0 1]
%% Rotacia pre C ( Os Y )
R_YC = [cos(phi3) 0 sin(phi3) 0;
0 1 0 0;
-sin(phi3) 0 cos(phi3) 0;
0 0 0 1]
%% Bod C
C = R_ZB * T_ZA * R_YB * T_ZB * R_YC * T_ZC * p1
%% Vykreslenie Manipulatora
X = [0 A(1) B(1) C(1)]
Y = [0 A(2) B(2) C(2)]
Z = [0 A(3) B(3) C(3)]
plot3(X, Y, Z, 'black-o','LineWidth', 2)
title('Vykreslenie manipulatora')
grid on
hold on
X_Vektor = [150; 0; 0; 1];
Y_Vektor = [0; 150; 0; 1];
Z_Vektor = [0; 0; 150; 1]; %% 150 pre dlžku šipok
%% arrow3 - funkcia na vykreslenie 3D šipok (možno použiť aj quiver3)
%% Os Z
arrow3([X(1), Y(1), Z(1)], [Z_Vektor(1), Z_Vektor(2), Z_Vektor(3)], 'b');%% 'b' - blue color
hold on
%% Os Y
arrow3([X(1), Y(1), Z(1)], [Y_Vektor(1), Y_Vektor(2), Y_Vektor(3)], 'g'); %% 'g'- green color
hold on
%% Os X
arrow3([X(1), Y(1), Z(1)], [X_Vektor(1), X_Vektor(2), X_Vektor(3)], 'r'); %% 'r' - red color
hold on
P_x = [90; 0; 0; 1];
P_y = [0; 90; 0; 1];
P_z = [0; 0; 90; 1];
Z2_Vektor = R_ZA * T_ZA * P_z;
Y2_Vektor = R_ZA * T_ZA * P_y;
X2_Vektor = R_ZA * T_ZA * P_x;
%% Os Z
arrow3([X(2), Y(2), Z(2)], [Z2_Vektor(1), Z2_Vektor(2), Z2_Vektor(3)], 'b'); %% 'b' - blue color
hold on
%% Os Y
arrow3([X(2), Y(2), Z(2)], [Y2_Vektor(1), Y2_Vektor(2), Y2_Vektor(3)], 'g'); %% 'g'- green color
hold on
%% Os X
arrow3([X(2), Y(2), Z(2)], [X2_Vektor(1), X2_Vektor(2), X2_Vektor(3)], 'r'); %% 'r' - red color
hold on
Z3_Vektor = R_ZA * T_ZA * R_YB * T_ZB * R_YB * P_z;
Y3_Vektor = R_ZA * T_ZA * R_YB * T_ZB * R_YB * P_y;
X3_Vektor = R_ZA * T_ZA * R_YB * T_ZB * R_YB * P_x;
%% Os Z
arrow3([X(3), Y(3), Z(3)], [Z3_Vektor(1), Z3_Vektor(2), Z3_Vektor(3)], 'b'); %% 'b' - blue color
hold on
%% Os Y
arrow3([X(3), Y(3), Z(3)], [Y3_Vektor(1), Y3_Vektor(2), Y3_Vektor(3)], 'g'); %% 'g'- green color
hold on
%% Os X
arrow3([X(3), Y(3), Z(3)], [X3_Vektor(1), X3_Vektor(2), X3_Vektor(3)], 'r'); %% 'r' - red color
hold on
