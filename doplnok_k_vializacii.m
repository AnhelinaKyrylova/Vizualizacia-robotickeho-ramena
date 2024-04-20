%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Autor : Anhelina Kyrylova                       %%%%%%%%%%%%%%%
%%%%%%%%%%% Vykreslenie pracovného priestoru v dvoch rezoch %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Vykreslenie pracovného priestoru v dvoch rezoch
figure(2)
title('Pracovny priestor')
%prva faza phi3 = 0 phi2 <-55, 125>
Phi2 = -55 : 1 : 125;
Zc0 = l1 + l2.*cosd(Phi2) + l3.*cosd(Phi2);
Yc0 = l2.*sind(Phi2) + l3.*sind(Phi2);
plot(Yc0, Zc0, 'b');
hold on
%druha faza phi2 = 125 phi3 <0, 150>
Phi2 = 125;
Phi3 = 0 : 1 : 150;
Zc0 = l1 + l2*cosd(Phi2) + l3.*cosd(Phi2 + Phi3);
Yc0 = l2*sind(Phi2) + l3.*sind(Phi2 + Phi3);
plot(Yc0, Zc0, 'b'); %% 'b' - blue color
%tret'a faza phi3 = 150 phi2 <125, -55>
PHI2 = 125 : -1 : -55;
PHI3 = 150;
Zc0 = l1 + l2*cosd(PHI2) + l3.*cosd(PHI2 + PHI3);
Yc0 = l2*sind(PHI2) + l3.*sind(PHI2 + PHI3);
plot(Yc0, Zc0, 'b');
%stvrta faza phi2 = -55 phi3 = <150, 0>
PHI_2 = -55;
PHI_3 = 150 : -1 : 0;
Zc0 = l1 + l2*cosd(PHI_2) + l3.*cosd(PHI_2 + PHI_3);
Yc0 = l2*sind(PHI_2) + l3.*sind(PHI_2 + PHI_3);
plot(Yc0, Zc0, 'b');
len = 0 : 1 : 559;
plot(zeros(1, 560), len, 'LineWidth', 2);
plot(0, l1, '.', 'Color', 'r', 'MarkerSize', 20);
plot(0, l1+l2, '.', 'Color', 'g', 'MarkerSize', 20);
plot(0, l1+l2+l3, '.', 'Color', 'y', 'MarkerSize', 20);
xlabel('y[mm]'); ylabel('z[mm]');
grid on
hold off
%%Vykreslenie pracovného priestoru
%prva faza phi3 = 0 phi2 <-55, 125>
FI2 = -55 : 1 : 125;
Zc0 = l1 + l2.*cosd(FI2) + l3.*cosd(FI2);
Yc0 = l2.*sind(FI2) + l3.*sind(FI2);
plot3(zeros(1, 181), Yc0, Zc0, 'b');
hold on
%druha faza phi2 = 125 phi3 <0, 150>
FI2 = 125;
FI3 = 0 : 1 : 150;
Zc0 = l1 + l2*cosd(FI2) + l3.*cosd(FI2 + FI3);
Yc0 = l2*sind(FI2) + l3.*sind(FI2 + FI3);
plot3(zeros(1, 151), Yc0, Zc0, 'b');
%tretia fáza phi3 = 150 phi2 <125, -55>
FI2 = 125 : -1 : -55;
FI3 = 150;
Zc0 = l1 + l2*cosd(FI2) + l3.*cosd(FI2 + FI3);
Yc0 = l2*sind(FI2) + l3.*sind(FI2 + FI3);
plot3(zeros(1, 181), Yc0, Zc0, 'b');%% b - color blue
%štvrtá fáza phi2 = -55 phi3 = <150, 0>
FI2 = -55;
FI3 = 150 : -1 : 0;
Zc0 = l1 + l2*cosd(FI2) + l3.*cosd(FI2 + FI3);
Yc0 = l2*sind(FI2) + l3.*sind(FI2 + FI3);
plot3(zeros(1, 151), Yc0, Zc0, 'b');
axis([-400 400 -400 400 -100 600]);
Fi1 = -90 : 1 : 90;
Zc0 = 0*Fi1;
Xc0 = (l3+l2).*sind(Fi1);
Yc0 = (l3+l2).*cosd(Fi1);
plot3(Xc0, Yc0, Zc0, '--', 'color', 'm');
plot3(-356:356:356, zeros(1, 3), zeros(1, 3), '--', 'color', 'm');
FI2 = -55;
FI3 = 0;
l = (l3+l2)*sind(FI2);
Zc0 = 0*Fi1;
Xc0 = l.*sind(Fi1);
Yc0 = l.*cosd(Fi1);
plot3(Xc0, Yc0, Zc0, '--', 'color', 'm');%% m - color magenta
hold off