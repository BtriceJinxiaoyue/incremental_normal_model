clc
clear
close all

load('instant_1');
t = 0:dt1:tf+1;
% %% 1_4/x轴位置
% figure('NumberTitle', 'on') 
% plot(t,Xarray(1,:),'-','Color','#F3B617','LineWidth',2); hold on;
% plot(t,Xarray(3,:),'-.','Color','#973EE3' ,'LineWidth',2); hold on;
% plot(t,Xarray(5,:),':','Color','#A63D40','LineWidth',2);hold on;
% plot(t,Xarray(7,:),'--','Color','#3ECE00','LineWidth',2);hold on;
% plot(t,Xarray(9,:),'-.','Color','#567DF4','LineWidth',2);hold on;%*
% plot(t,Xarray(11,:),'--','Color','#14281D','LineWidth',2);hold on;
% plot(t,Xarray(13,:),'Color','#DB162F','LineWidth',3);hold on;
% 
% plot(t,Xarray_y(3,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(5,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(7,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(9,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% 
% plot(t,Xarray_y2(3,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(5,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(7,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(9,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% 
% plot(t,Xarray_y3(3,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(5,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(7,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(9,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% 
% plot(t,Xarray_y4(3,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(5,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(7,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(9,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% 
% plot(t,Xarray_y5(3,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(5,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(7,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(9,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% 
% plot(t,Xarray_y6(3,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(5,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(7,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(9,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% 
% xlabel('\it{t}\rm{/s}','FontSize',16,'FontName','Times New Roman')
% ylabel('\it{X}\rm{_{1}/m}','FontSize',16,'FontName','Times New Roman')
% xlim([0 20])
% ylim([-80 80]);
% legend('X_{1,1}','X_{2,1}','X_{3,1}','X_{4,1}','X_{5,1}','X_{6,1}','x_{7,1}','FontSize',10)


% %% 1_5/x轴位置误差
% figure('NumberTitle', 'on') 
% plot(t,Xarray(1,:)-Xarray(13,:),'-','Color','#F3B617','LineWidth',2); hold on;
% plot(t,Xarray(3,:)-Xarray(13,:),'-.','Color','#973EE3' ,'LineWidth',2); hold on;
% plot(t,Xarray(5,:)-Xarray(13,:),':','Color','#A63D40','LineWidth',2);hold on;
% plot(t,Xarray(7,:)-Xarray(13,:),'--','Color','#3ECE00','LineWidth',2);hold on;
% plot(t,Xarray(9,:)-Xarray(13,:),'-.','Color','#567DF4','LineWidth',2);hold on;%*
% plot(t,Xarray(11,:)-Xarray(13,:),'--','Color','#14281D','LineWidth',2);hold on;
% plot(t,Xarray(13,:)-Xarray(13,:),'Color','#DB162F','LineWidth',3);hold on;
% xlabel('\it{t}\rm{/s}','FontSize',16,'FontName','Times New Roman')
% ylabel('\it{e}\rm{_{1}/m}','FontSize',16,'FontName','Times New Roman')
% xlim([0 20])
% ylim([-80 60]);
% legend('x_{1,1} - x_{7,1}','x_{2,1} - x_{7,1}','x_{3,1} - x_{7,1}','x_{4,1} - x_{7,1}','x_{5,1} - x_{7,1}','x_{6,1} - x_{7,1}','x_{7,1} - x_{7,1}','FontSize',10)


% %% 1_6/x轴二阶位置误差
% figure('NumberTitle', 'on') 
% h1=plot(t,Xarray_y(3,:)-Xarray(1,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(5,:)-Xarray(1,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(7,:)-Xarray(1,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(9,:)-Xarray(1,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% 
% h2=plot(t,Xarray_y2(3,:)-Xarray_y2(1,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(5,:)-Xarray_y2(1,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(7,:)-Xarray_y2(1,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(9,:)-Xarray_y2(1,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% 
% h3=plot(t,Xarray_y3(3,:)-Xarray_y3(1,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(5,:)-Xarray_y3(1,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(7,:)-Xarray_y3(1,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(9,:)-Xarray_y3(1,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% 
% h4=plot(t,Xarray_y4(3,:)-Xarray_y4(1,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(5,:)-Xarray_y4(1,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(7,:)-Xarray_y4(1,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(9,:)-Xarray_y4(1,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% 
% h5=plot(t,Xarray_y5(3,:)-Xarray_y5(1,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(5,:)-Xarray_y5(1,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(7,:)-Xarray_y5(1,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(9,:)-Xarray_y5(1,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% 
% h6=plot(t,Xarray_y6(3,:)-Xarray_y6(1,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(5,:)-Xarray_y6(1,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(7,:)-Xarray_y6(1,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(9,:)-Xarray_y6(1,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% 
% xlabel('\it{t}\rm{/s}','FontSize',16,'FontName','Times New Roman')
% ylabel('\it{E}\rm{_{1}/m}','FontSize',16,'FontName','Times New Roman')
% xlim([0 20])
% ylim([-8 8]);
% legend([h1,h2,h3,h4,h5,h6],'E_{1,1}','E_{2,1}','E_{3,1}','E_{4,1}','E_{5,1}','E_{6,1}','FontSize',10)



% %% 2_4/y轴位置
% figure('NumberTitle', 'on') 
% plot(t,Xarray(2,:),'-','Color','#F3B617','LineWidth',2); hold on;
% plot(t,Xarray(4,:),'-.','Color','#973EE3' ,'LineWidth',2); hold on;
% plot(t,Xarray(6,:),':','Color','#A63D40','LineWidth',2);hold on;
% plot(t,Xarray(8,:),'--','Color','#3ECE00','LineWidth',2);hold on;
% plot(t,Xarray(10,:),'-.','Color','#567DF4','LineWidth',2);hold on;%*
% plot(t,Xarray(12,:),'--','Color','#14281D','LineWidth',2);hold on;
% plot(t,Xarray(14,:),'Color','#DB162F','LineWidth',3);hold on;
% 
% plot(t,Xarray_y(4,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(6,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(8,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(10,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% 
% plot(t,Xarray_y2(4,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(6,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(8,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(10,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% 
% plot(t,Xarray_y3(4,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(6,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(8,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(10,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% 
% plot(t,Xarray_y4(4,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(6,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(8,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(10,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% 
% plot(t,Xarray_y5(4,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(6,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(8,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(10,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% 
% plot(t,Xarray_y6(4,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(6,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(8,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(10,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% 
% xlabel('\it{t}\rm{/s}','FontSize',16,'FontName','Times New Roman')
% ylabel('\it{Y}\rm{_{1}/m}','FontSize',16,'FontName','Times New Roman')
% xlim([0 20])
% ylim([-45 85]);
% legend('Y_{1,1}','Y_{2,1}','Y_{3,1}','Y_{4,1}','Y_{5,1}','Y_{6,1}','y_{7,1}','FontSize',10)
% 

% %% 2_5/y轴位置误差
% figure('NumberTitle', 'on') 
% plot(t,Xarray(2,:)-Xarray(14,:),'-','Color','#F3B617','LineWidth',2); hold on;
% plot(t,Xarray(4,:)-Xarray(14,:),'-.','Color','#973EE3' ,'LineWidth',2); hold on;
% plot(t,Xarray(6,:)-Xarray(14,:),':','Color','#A63D40','LineWidth',2);hold on;
% plot(t,Xarray(8,:)-Xarray(14,:),'--','Color','#3ECE00','LineWidth',2);hold on;
% plot(t,Xarray(10,:)-Xarray(14,:),'-.','Color','#567DF4','LineWidth',2);hold on;%*
% plot(t,Xarray(12,:)-Xarray(14,:),'--','Color','#14281D','LineWidth',2);hold on;
% plot(t,Xarray(14,:)-Xarray(14,:),'Color','#DB162F','LineWidth',3);hold on;
% xlabel('\it{t}\rm{/s}','FontSize',16,'FontName','Times New Roman')
% ylabel('\it{e}\rm{_{1}/m}','FontSize',16,'FontName','Times New Roman')
% xlim([0 20])
% ylim([-42 65]);
% legend('y_{1,1} - y_{7,1}','y_{2,1} - y_{7,1}','y_{3,1} - y_{7,1}','y_{4,1} - y_{7,1}','y_{5,1} - y_{7,1}','y_{6,1} - y_{7,1}','y_{7,1} - y_{7,1}','FontSize',10)

% %% 2_6/y轴二阶位置误差
% figure('NumberTitle', 'on') 
% h1=plot(t,Xarray_y(4,:)-Xarray_y(2,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(6,:)-Xarray_y(2,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(8,:)-Xarray_y(2,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(10,:)-Xarray_y(2,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% 
% h2=plot(t,Xarray_y2(4,:)-Xarray_y2(2,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(6,:)-Xarray_y2(2,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(8,:)-Xarray_y2(2,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(10,:)-Xarray_y2(2,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% 
% h3=plot(t,Xarray_y3(4,:)-Xarray_y3(2,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(6,:)-Xarray_y3(2,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(8,:)-Xarray_y3(2,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(10,:)-Xarray_y3(2,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% 
% h4=plot(t,Xarray_y4(4,:)-Xarray_y4(2,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(6,:)-Xarray_y4(2,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(8,:)-Xarray_y4(2,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(10,:)-Xarray_y4(2,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% 
% h5=plot(t,Xarray_y5(4,:)-Xarray_y5(2,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(6,:)-Xarray_y5(2,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(8,:)-Xarray_y5(2,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(10,:)-Xarray_y5(2,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% 
% h6=plot(t,Xarray_y6(4,:)-Xarray_y6(2,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(6,:)-Xarray_y6(2,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(8,:)-Xarray_y6(2,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(10,:)-Xarray_y6(2,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% 
% xlabel('\it{t}\rm{/s}','FontSize',16,'FontName','Times New Roman')
% ylabel('\it{E}\rm{_{1}/m}','FontSize',16,'FontName','Times New Roman')
% xlim([0 20])
% ylim([-7 6]);
% legend([h1,h2,h3,h4,h5,h6],'E_{1,1}','E_{2,1}','E_{3,1}','E_{4,1}','E_{5,1}','E_{6,1}','FontSize',10)


% %% 3_4/x轴速度
% figure('NumberTitle', 'on') 
% plot(t,Xarray(15,:),'-','Color','#F3B617','LineWidth',2); hold on;
% plot(t,Xarray(17,:),'-.','Color','#973EE3' ,'LineWidth',2); hold on;
% plot(t,Xarray(19,:),':','Color','#A63D40','LineWidth',2);hold on;
% plot(t,Xarray(21,:),'--','Color','#3ECE00','LineWidth',2);hold on;
% plot(t,Xarray(23,:),'-.','Color','#567DF4','LineWidth',2);hold on;%*
% plot(t,Xarray(25,:),'--','Color','#14281D','LineWidth',2);hold on;
% plot(t,Xarray(27,:),'Color','#DB162F','LineWidth',3);hold on;
% 
% plot(t,Xarray_y(13,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(15,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(17,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(19,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% 
% plot(t,Xarray_y2(13,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(15,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(17,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(19,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% 
% plot(t,Xarray_y3(13,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(15,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(17,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(19,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% 
% plot(t,Xarray_y4(13,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(15,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(17,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(19,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% 
% plot(t,Xarray_y5(13,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(15,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(17,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(19,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% 
% plot(t,Xarray_y6(13,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(15,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(17,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(19,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% 
% xlabel('\it{t}\rm{/s}','FontSize',16,'FontName','Times New Roman')
% ylabel('\it{X}\rm{_{2}/m\cdots^{-1}}','FontSize',16,'FontName','Times New Roman')
% xlim([0 20])
% ylim([-15 45]);
% legend('X_{1,2}','X_{2,2}','X_{3,2}','X_{4,2}','X_{5,2}','X_{6,2}','x_{7,2}','FontSize',10)

% %% 3_5/x轴速度误差
% figure('NumberTitle', 'on') 
% plot(t,Xarray(15,:)-Xarray(27,:),'-','Color','#F3B617','LineWidth',2); hold on;
% plot(t,Xarray(17,:)-Xarray(27,:),'-.','Color','#973EE3' ,'LineWidth',2); hold on;
% plot(t,Xarray(19,:)-Xarray(27,:),':','Color','#A63D40','LineWidth',2);hold on;
% plot(t,Xarray(21,:)-Xarray(27,:),'--','Color','#3ECE00','LineWidth',2);hold on;
% plot(t,Xarray(23,:)-Xarray(27,:),'-.','Color','#567DF4','LineWidth',2);hold on;%*
% plot(t,Xarray(25,:)-Xarray(27,:),'--','Color','#14281D','LineWidth',2);hold on;
% plot(t,Xarray(27,:)-Xarray(27,:),'Color','#DB162F','LineWidth',3);hold on;
% xlabel('\it{t}\rm{/s}','FontSize',16,'FontName','Times New Roman')
% ylabel('\it{e}\rm{_{2}/m\cdots^{-1}}','FontSize',16,'FontName','Times New Roman')
% xlim([0 20])
% ylim([-15 40]);
% legend('x_{1,2} - x_{7,2}','x_{2,2} - x_{7,2}','x_{3,2} - x_{7,2}','x_{4,2} - x_{7,2}','x_{5,2} - x_{7,2}','x_{6,2} - x_{7,2}','x_{7,2} - x_{7,2}','FontSize',10)

% %% 3_6/x轴二阶速度误差
% figure('NumberTitle', 'on') 
% h1=plot(t,Xarray_y(13,:)-Xarray_y(11,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(15,:)-Xarray_y(11,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(17,:)-Xarray_y(11,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(19,:)-Xarray_y(11,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% 
% h2=plot(t,Xarray_y2(13,:)-Xarray_y2(11,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(15,:)-Xarray_y2(11,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(17,:)-Xarray_y2(11,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(19,:)-Xarray_y2(11,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% 
% h3=plot(t,Xarray_y3(13,:)-Xarray_y3(11,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(15,:)-Xarray_y3(11,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(17,:)-Xarray_y3(11,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(19,:)-Xarray_y3(11,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% 
% h4=plot(t,Xarray_y4(13,:)-Xarray_y4(11,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(15,:)-Xarray_y4(11,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(17,:)-Xarray_y4(11,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(19,:)-Xarray_y4(11,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% 
% h5=plot(t,Xarray_y5(13,:)-Xarray_y5(11,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(15,:)-Xarray_y5(11,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(17,:)-Xarray_y5(11,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(19,:)-Xarray_y5(11,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% 
% h6=plot(t,Xarray_y6(13,:)-Xarray_y6(11,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(15,:)-Xarray_y6(11,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(17,:)-Xarray_y6(11,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(19,:)-Xarray_y6(11,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% 
% xlabel('\it{t}\rm{/s}','FontSize',16,'FontName','Times New Roman')
% ylabel('\it{E}\rm{_{2}/m}','FontSize',16,'FontName','Times New Roman')
% xlim([0 20])
% ylim([-25 15]);
% legend([h1,h2,h3,h4,h5,h6],'E_{1,2}','E_{2,2}','E_{3,2}','E_{4,2}','E_{5,2}','E_{6,2}','FontSize',10)


% %% 4_4/y轴速度
% figure('NumberTitle', 'on') 
% plot(t,Xarray(16,:),'-','Color','#F3B617','LineWidth',2); hold on;
% plot(t,Xarray(18,:),'-.','Color','#973EE3' ,'LineWidth',2); hold on;
% plot(t,Xarray(20,:),':','Color','#A63D40','LineWidth',2);hold on;
% plot(t,Xarray(22,:),'--','Color','#3ECE00','LineWidth',2);hold on;
% plot(t,Xarray(24,:),'-.','Color','#567DF4','LineWidth',2);hold on;%*
% plot(t,Xarray(26,:),'--','Color','#14281D','LineWidth',2);hold on;
% plot(t,Xarray(28,:),'Color','#DB162F','LineWidth',3);hold on;
% 
% plot(t,Xarray_y(14,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(16,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(18,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(20,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% 
% plot(t,Xarray_y2(14,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(16,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(18,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(20,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% 
% plot(t,Xarray_y3(14,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(16,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(18,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(20,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% 
% plot(t,Xarray_y4(14,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(16,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(18,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(20,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% 
% plot(t,Xarray_y5(14,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(16,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(18,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(20,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% 
% plot(t,Xarray_y6(14,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(16,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(18,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(20,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% 
% xlabel('\it{t}\rm{/s}','FontSize',16,'FontName','Times New Roman')
% ylabel('\it{Y}\rm{_{2}/m\cdots^{-1}}','FontSize',16,'FontName','Times New Roman')
% xlim([0 20])
% ylim([-12 17]);
% legend('Y_{1,2}','Y_{2,2}','Y_{3,2}','Y_{4,2}','Y_{5,2}','Y_{6,2}','y_{7,2}','FontSize',10)


% %% 4_5/y轴速度误差
% figure('NumberTitle', 'on') 
% plot(t,Xarray(16,:)-Xarray(28,:),'-','Color','#F3B617','LineWidth',2); hold on;
% plot(t,Xarray(18,:)-Xarray(28,:),'-.','Color','#973EE3' ,'LineWidth',2); hold on;
% plot(t,Xarray(20,:)-Xarray(28,:),':','Color','#A63D40','LineWidth',2);hold on;
% plot(t,Xarray(22,:)-Xarray(28,:),'--','Color','#3ECE00','LineWidth',2);hold on;
% plot(t,Xarray(24,:)-Xarray(28,:),'-.','Color','#567DF4','LineWidth',2);hold on;%*
% plot(t,Xarray(26,:)-Xarray(28,:),'--','Color','#14281D','LineWidth',2);hold on;
% plot(t,Xarray(28,:)-Xarray(28,:),'Color','#DB162F','LineWidth',3);hold on;
% xlabel('\it{t}\rm{/s}','FontSize',16,'FontName','Times New Roman')
% ylabel('\it{e}\rm{_{2}/m\cdots^{-1}}','FontSize',16,'FontName','Times New Roman')
% xlim([0 20])
% ylim([-15 15]);
% legend('y_{1,2} - y_{7,2}','y_{2,2} - y_{7,2}','y_{3,2} - y_{7,2}','y_{4,2} - y_{7,2}','y_{5,2} - y_{7,2}','y_{6,2} - y_{7,2}','y_{7,2} - y_{7,2}','FontSize',10)

% %% 4_6/y轴二阶速度误差
% figure('NumberTitle', 'on') 
% h1=plot(t,Xarray_y(14,:)-Xarray_y(12,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(16,:)-Xarray_y(12,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(18,:)-Xarray_y(12,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(20,:)-Xarray_y(12,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% 
% h2=plot(t,Xarray_y2(14,:)-Xarray_y2(12,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(16,:)-Xarray_y2(12,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(18,:)-Xarray_y2(12,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% plot(t,Xarray_y2(20,:)-Xarray_y2(12,:),'-.','Color','#973EE3' ,'LineWidth',1.5); hold on;
% 
% h3=plot(t,Xarray_y3(14,:)-Xarray_y3(12,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(16,:)-Xarray_y3(12,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(18,:)-Xarray_y3(12,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(t,Xarray_y3(20,:)-Xarray_y3(12,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% 
% h4=plot(t,Xarray_y4(14,:)-Xarray_y4(12,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(16,:)-Xarray_y4(12,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(18,:)-Xarray_y4(12,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(t,Xarray_y4(20,:)-Xarray_y4(12,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% 
% h5=plot(t,Xarray_y5(14,:)-Xarray_y5(12,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(16,:)-Xarray_y5(12,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(18,:)-Xarray_y5(12,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(t,Xarray_y5(20,:)-Xarray_y5(12,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% 
% h6=plot(t,Xarray_y6(14,:)-Xarray_y6(12,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(16,:)-Xarray_y6(12,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(18,:)-Xarray_y6(12,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(t,Xarray_y6(20,:)-Xarray_y6(12,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% 
% xlabel('\it{t}\rm{/s}','FontSize',16,'FontName','Times New Roman')
% ylabel('\it{E}\rm{_{2}/m}','FontSize',16,'FontName','Times New Roman')
% xlim([0 20])
% ylim([-20 15]);
% legend([h1,h2,h3,h4,h5,h6],'E_{1,2}','E_{2,2}','E_{3,2}','E_{4,2}','E_{5,2}','E_{6,2}','FontSize',10)

% %% 5_2/路径图
% figure('NumberTitle', 'on')              %图3瞬态过度位置追踪
% plot(Xarray(1,:),Xarray(2,:),'-','Color','#F3B617','LineWidth',1.5);hold on;
% plot(Xarray(3,:),Xarray(4,:),'-.','Color','#973EE3' ,'LineWidth',1.5);hold on;
% plot(Xarray(5,:),Xarray(6,:),':','Color','#A63D40','LineWidth',1.5);hold on;
% plot(Xarray(7,:),Xarray(8,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
% plot(Xarray(9,:),Xarray(10,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
% plot(Xarray(11,:),Xarray(12,:),'--','Color','#14281D','LineWidth',1.5);hold on;
% plot(Xarray(13,:),Xarray(14,:),'Color','#DB162F','LineWidth',2);hold on;
% 
% plot(Xarray_y(1,:),Xarray_y(2,:),'-','Color','#F3B617','LineWidth',1);hold on;
% plot(Xarray_y(3,:),Xarray_y(4,:),'-.','Color','#F3B617','LineWidth',1);hold on;
% plot(Xarray_y(5,:),Xarray_y(6,:),':','Color','#F3B617','LineWidth',1);hold on;
% plot(Xarray_y(7,:),Xarray_y(8,:),'--','Color','#F3B617','LineWidth',1);hold on;
% plot(Xarray_y(9,:),Xarray_y(10,:),'-.','Color','#F3B617','LineWidth',1);hold on;%*
% 
% plot(Xarray_y2(1,:),Xarray_y2(2,:),'-','Color','#973EE3','LineWidth',1);hold on;
% plot(Xarray_y2(3,:),Xarray_y2(4,:),'-.','Color','#973EE3','LineWidth',1);hold on;
% plot(Xarray_y2(5,:),Xarray_y2(6,:),':','Color','#973EE3','LineWidth',1);hold on;
% plot(Xarray_y2(7,:),Xarray_y2(8,:),'--','Color','#973EE3','LineWidth',1);hold on;
% plot(Xarray_y2(9,:),Xarray_y2(10,:),'-.','Color','#973EE3','LineWidth',1);hold on;%*
% 
% plot(Xarray_y3(1,:),Xarray_y3(2,:),'-','Color','#A63D40','LineWidth',1);hold on;
% plot(Xarray_y3(3,:),Xarray_y3(4,:),'-.','Color','#A63D40','LineWidth',1);hold on;
% plot(Xarray_y3(5,:),Xarray_y3(6,:),':','Color','#A63D40','LineWidth',1);hold on;
% plot(Xarray_y3(7,:),Xarray_y3(8,:),'--','Color','#A63D40','LineWidth',1);hold on;
% plot(Xarray_y3(9,:),Xarray_y3(10,:),'-.','Color','#A63D40','LineWidth',1);hold on;%*
% % 
% plot(Xarray_y4(1,:),Xarray_y4(2,:),'-','Color','#3ECE00','LineWidth',1);hold on;
% plot(Xarray_y4(3,:),Xarray_y4(4,:),'-.','Color','#3ECE00','LineWidth',1);hold on;
% plot(Xarray_y4(5,:),Xarray_y4(6,:),':','Color','#3ECE00','LineWidth',1);hold on;
% plot(Xarray_y4(7,:),Xarray_y4(8,:),'--','Color','#3ECE00','LineWidth',1);hold on;
% plot(Xarray_y4(9,:),Xarray_y4(10,:),'-.','Color','#3ECE00','LineWidth',1);hold on;%*
% 
% plot(Xarray_y5(1,:),Xarray_y5(2,:),'-','Color','#567DF4','LineWidth',1);hold on;
% plot(Xarray_y5(3,:),Xarray_y5(4,:),'-.','Color','#567DF4','LineWidth',1);hold on;
% plot(Xarray_y5(5,:),Xarray_y5(6,:),':','Color','#567DF4','LineWidth',1);hold on;
% plot(Xarray_y5(7,:),Xarray_y5(8,:),'--','Color','#567DF4','LineWidth',1);hold on;
% plot(Xarray_y5(9,:),Xarray_y5(10,:),'-.','Color','#567DF4','LineWidth',1);hold on;%*
% 
% plot(Xarray_y6(1,:),Xarray_y6(2,:),'-','Color','#14281D','LineWidth',1);hold on;
% plot(Xarray_y6(3,:),Xarray_y6(4,:),'-.','Color','#14281D','LineWidth',1);hold on;
% plot(Xarray_y6(5,:),Xarray_y6(6,:),':','Color','#14281D','LineWidth',1);hold on;
% plot(Xarray_y6(7,:),Xarray_y6(8,:),'--','Color','#14281D','LineWidth',1);hold on;
% plot(Xarray_y6(9,:),Xarray_y6(10,:),'-.','Color','#14281D','LineWidth',1);hold on;%*
% 
% plot(G,'XData',Xarray(1:2:13,1),'YData',Xarray(2:2:14,1),'LineWidth',2,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#083DB3','NodeColor','#083DB3','NodeLabel',{'  1','  2','  3','  4','  5','  6',' 7'});hold on;
% plot(G2,'XData',Xarray(1:2:13,end),'YData',Xarray(2:2:14,end),'LineWidth',2,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#083DB3','NodeColor','#083DB3','NodeLabel',{'  1','  2','  3','  4','  5','  6',' 7'});hold on;
% 
% plot(G_y,'XData',Xarray_y(1:2:9,1),'YData',Xarray_y(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#F3B617','NodeColor','#F3B617','NodeLabel',{' ',' ',' ',' ',' '});hold on;
% plot(G_y2,'XData',Xarray_y2(1:2:9,1),'YData',Xarray_y2(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#973EE3','NodeColor','#973EE3','NodeLabel',{' ',' ',' ',' ',' '});hold on;
% plot(G_y3,'XData',Xarray_y3(1:2:9,1),'YData',Xarray_y3(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#A63D40','NodeColor','#A63D40','NodeLabel',{' ',' ',' ',' ',' '});hold on;
% plot(G_y4,'XData',Xarray_y4(1:2:9,1),'YData',Xarray_y4(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#3ECE00','NodeColor','#3ECE00','NodeLabel',{' ',' ',' ',' ',' '});hold on;
% plot(G_y5,'XData',Xarray_y5(1:2:9,1),'YData',Xarray_y5(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#567DF4','NodeColor','#567DF4','NodeLabel',{' ',' ','  ',' ',' '});hold on;
% plot(G_y6,'XData',Xarray_y6(1:2:9,1),'YData',Xarray_y6(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#14281D','NodeColor','#14281D','NodeLabel',{' ',' ',' ',' ',' }'});hold on;
% 
% plot(G2_y,'XData',Xarray_y(1:2:9,end),'YData',Xarray_y(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#F3B617','NodeColor','#F3B617','NodeLabel',{' ',' ',' ',' ',' '});hold on;
% plot(G2_y2,'XData',Xarray_y2(1:2:9,end),'YData',Xarray_y2(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#973EE3','NodeColor','#973EE3','NodeLabel',{' ',' ',' ',' ',' '});hold on;
% plot(G2_y3,'XData',Xarray_y3(1:2:9,end),'YData',Xarray_y3(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#A63D40','NodeColor','#A63D40','NodeLabel',{' ',' ',' ',' ',' '});hold on;
% plot(G2_y4,'XData',Xarray_y4(1:2:9,end),'YData',Xarray_y4(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#3ECE00','NodeColor','#3ECE00','NodeLabel',{' ',' ',' ',' ',' '});hold on;
% plot(G2_y5,'XData',Xarray_y5(1:2:9,end),'YData',Xarray_y5(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#567DF4','NodeColor','#567DF4','NodeLabel',{' ',' ',' ',' ',' '});hold on;
% plot(G2_y6,'XData',Xarray_y6(1:2:9,end),'YData',Xarray_y6(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#14281D','NodeColor','#14281D','NodeLabel',{' ',' ',' ',' ',' '});hold on;

%title('集群系统跟踪—包围控制路径图','FontSize',16,'FontName','宋体')

%% 6_3输入图
figure('NumberTitle', 'on')                 %11
h1=plot(t,phiuarray,'-r','LineWidth',1);hold on;
h2=plot(t,uarray,'--b','LineWidth',0.5);hold on;
h3=plot([0,tf],[100,100],'--k','LineWidth',0.5);hold off;
set(gca,'FontSize',12); set(gcf,'Color','White');
xlabel('\it{t}\rm{/s}','FontSize',16,'FontName','Times New Roman');
ylabel('\it{u(v)}\rm{/m\cdots^{-2}}','FontSize',16,'FontName','Times New Roman');
legend([h1(1),h2(1)],'u(v)','v','FontSize',10);
axis([0, tf, -200, 500]);

figure('NumberTitle', 'on') 
h1=plot(t,phiuarray_y,'-r','LineWidth',1);hold on;
h2=plot(t,uarray_y,'--b','LineWidth',0.5);hold on;
h3=plot([0,tf],[100,100],'--k','LineWidth',0.5);hold off;
set(gca,'FontSize',12); set(gcf,'Color','White');
xlabel('\it{t}\rm{/s}','FontSize',16,'FontName','Times New Roman');
ylabel('\it{u(v)}\rm{/m\cdots^{-2}}','FontSize',16,'FontName','Times New Roman');
legend([h1(1),h2(1)],'u(v)','v','FontSize',10);
axis([0, tf, -200, 500]);


% %% 0_1_2 结构图
% %**************** 跟踪结构 ********************
% s=[1     1       5     4      3   2       6];
% t=[4     5       2     3      6   6      7];
% G = digraph(s,t);
% fkx=[   -70   -30    -30   -60   -60   -20    0];
% fky=[   -10   -30     10   10    -30   -10  -10];
% % figure
% % plot(G,'XData',fkx,'YData',fky,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18)
% % hold on
% % plot(fkx(7),fky(7),'hr','MarkerSize',10)
% x = fkx;
% y = fky;
% %**************** 包围结构 *********************%
% s2 =[     4     5     1     2     2     3     3     4     5  6  6   6];
% t2 =[     1     1     7     7     5     4     7     7     7  7  3   2];
% G2 = digraph(s2,t2);
% fkx2 =[   -20.07   10.06    10.05   -10.04   -10.03   20.02    0.01];
% fky2 =[   -10.07   -30.06   10.05   10.04    -30.03   -10.02  -10.01];
% % figure
% % plot(G2,'XData',fkx2,'YData',fky2,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18)
% % hold on
% % plot(fkx2(7),fky2(7),'hr','MarkerSize',10)
% 
% %*************** 二阶子图结构 ***************************%
% %********** 跟踪结构 ****************%
% % s_y=[2 3 2 4  3  2   4   5];
% % t_y=[1 1 3 1  4  5   5   1];
% % G_y = digraph(s_y,t_y);
% % fkx_y=[   -70   -80   -70   -60   -70];
% % fky_y=[   -10   -10   -0    -10   -20];
% % % plot(G_y,'XData',fkx_y,'YData',fky_y,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','1^{2}','1^{3}','1^{4}','1^{5}'},'EdgeColor','#F3B617','NodeColor','#F3B617')
% % % hold on
% % % plot(fkx_y(1),fky_y(1),'hr','MarkerSize',10)
% % % 
% % s_y2=[2 3 2 4  3  2   4   5];   
% % t_y2=[1 1 3 1  4  5   5   1];
% % G_y2 = digraph(s_y2,t_y2);
% % fkx_y2=[   -30   -40  -30   -20   -30];      %%%等会儿删
% % fky_y2=[   -30   -30  -20   -30   -40];
% % % plot(G_y2,'XData',fkx_y2,'YData',fky_y2,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','2^{2}','2^{3}','2^{4}','2^{5}'},'EdgeColor','#973EE3','NodeColor','#973EE3')
% % % hold on
% % % plot(fkx_y2(1),fky_y2(1),'hr','MarkerSize',10)
% % % 
% % s_y3=[2 3 2 4  3  2   4   5];
% % t_y3=[1 1 3 1  4  5   5   1];
% % G_y3 = digraph(s_y3,t_y3);
% % fkx_y3=[   -30   -40  -30   -20   -30];
% % fky_y3=[    10    10   20    10    0];
% % % plot(G_y3,'XData',fkx_y3,'YData',fky_y3,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','3^{2}','3^{3}','3^{4}','3^{5}'},'EdgeColor','#A63D40','NodeColor','#A63D40')
% % % hold on
% % % plot(fkx_y3(1),fky_y3(1),'hr','MarkerSize',10)
% % % 
% % s_y4=[2 3 2 4  3  2   4   5];
% % t_y4=[1 1 3 1  4  5   5   1];
% % G_y4 = digraph(s_y4,t_y4);
% % fkx_y4=[   -60   -70  -60   -50   -60];
% % fky_y4=[    10    10   20    10   0];
% % % plot(G_y4,'XData',fkx_y4,'YData',fky_y4,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','4^{2}','4^{3}','4^{4}','4^{5}'},'EdgeColor','#3ECE00','NodeColor','#3ECE00')
% % % hold on
% % % plot(fkx_y4(1),fky_y4(1),'hr','MarkerSize',10)
% % % 
% % s_y5=[2 3 2 4  3  2   4   5];
% % t_y5=[1 1 3 1  4  5   5   1];
% % G_y5 = digraph(s_y5,t_y5);
% % fkx_y5=[   -60   -70  -60   -50   -60];
% % fky_y5=[   -30   -30  -20   -30   -40];
% % % plot(G_y5,'XData',fkx_y5,'YData',fky_y5,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','5^{2}','5^{3}','5^{4}','5^{5}'},'EdgeColor','#567DF4','NodeColor','#567DF4')
% % % hold on
% % % plot(fkx_y5(1),fky_y5(1),'hr','MarkerSize',10)
% % % 
% % s_y6=[2 3 2 4  3  2   4   5];
% % t_y6=[1 1 3 1  4  5   5   1];
% % G_y6 = digraph(s_y6,t_y6);
% % fkx_y6=[   -20   -30  -20    -10   -20];
% % fky_y6=[   -10   -10   -0    -10   -20];
% % % plot(G_y6,'XData',fkx_y6,'YData',fky_y6,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','6^{2}','6^{3}','6^{4}','6^{5}'},'EdgeColor','#14281D','NodeColor','#14281D')
% % % hold on
% % % plot(fkx_y6(1),fky_y6(1),'hr','MarkerSize',10)
% % %**************** 包围拓扑 **********************%
% % s2_y =[ 2  3  2  4  3  2   4   5];
% % t2_y =[ 1  1  3  1  4  5   5   1];
% % G2_y = digraph(s2_y,t2_y);
% % fkx2_y =[   -20.07   -28.07    -20.07   -12.07      -20.07];
% % fky2_y =[   -10.07   -10.07    -2.07     -10.07      -18.07];
% % % plot(G2_y,'XData',fkx2_y,'YData',fky2_y,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','1^{2}','1^{3}','1^{4}','1^{5}'},'EdgeColor','#F3B617','NodeColor','#F3B617')
% % % hold on
% % % plot(fkx2_y(1),fky2_y(1),'hr','MarkerSize',10)
% % % 
% % s2_y2 =[ 2  3  2  4  3  2   4   5];   
% % t2_y2 =[ 1  1  3  1  4  5   5   1];
% % G2_y2 = digraph(s2_y2,t2_y2);
% % fkx2_y2 =[   10.06     2.06      10.06      18.06      10.06];
% % fky2_y2 =[  -30.06   -30.06    -22.06     -30.06    -38.06];
% % % plot(G2_y2,'XData',fkx2_y2,'YData',fky2_y2,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','2^{2}','2^{3}','2^{4}','2^{5}'},'EdgeColor','#973EE3','NodeColor','#973EE3')
% % % hold on
% % % plot(fkx2_y2(1),fky2_y2(1),'hr','MarkerSize',10)
% % % 
% % % 
% % s2_y3 =[ 2  3  2  4  3  2   4   5];
% % t2_y3 =[ 1  1  3  1  4  5   5   1];
% % G2_y3 = digraph(s2_y3,t2_y3);
% % fkx2_y3 =[   10.05     2.05      10.05      18.05      10.05];
% % fky2_y3 =[   10.05   10.05     18.05       10.05     2.05];
% % % plot(G2_y3,'XData',fkx2_y3,'YData',fky2_y3,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','3^{2}','3^{3}','3^{4}','3^{5}'},'EdgeColor','#A63D40','NodeColor','#A63D40')
% % % hold on
% % % plot(fkx2_y3(1),fky2_y3(1),'hr','MarkerSize',10)
% % % 
% % % 
% % s2_y4 =[ 2  3  2  4  3  2   4   5];
% % t2_y4 =[ 1  1  3  1  4  5   5   1];
% % G2_y4 = digraph(s2_y4,t2_y4);
% % fkx2_y4 =[  -10.04     -18.04    -10.04      -2.04      -10.04];
% % fky2_y4 =[   10.04    10.04     18.04       10.04      2.04];
% % % plot(G2_y4,'XData',fkx2_y4,'YData',fky2_y4,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','4^{2}','4^{3}','4^{4}','4^{5}'},'EdgeColor','#3ECE00','NodeColor','#3ECE00')
% % % hold on
% % % plot(fkx2_y4(1),fky2_y4(1),'hr','MarkerSize',10)
% % % 
% % s2_y5 =[ 2  3  2  4  3  2   4   5];
% % t2_y5 =[ 1  1  3  1  4  5   5   1];
% % G2_y5 = digraph(s2_y5,t2_y5);
% % fkx2_y5 =[  -10.03     -18.03    -10.03      -2.03      -10.03];
% % fky2_y5 =[  -30.03    -30.03    -22.03     -30.03    -38.03];
% % % plot(G2_y5,'XData',fkx2_y5,'YData',fky2_y5,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','5^{2}','5^{3}','5^{4}','5^{5}'},'EdgeColor','#567DF4','NodeColor','#567DF4')
% % % hold on
% % % plot(fkx2_y5(1),fky2_y5(1),'hr','MarkerSize',10)
% % % 
% % s2_y6 =[ 2  3  2  4  3  2   4   5];
% % t2_y6 =[ 1  1  3  1  4  5   5   1];
% % G2_y6 = digraph(s2_y6,t2_y6);
% % fkx2_y6 =[  20.02     12.02      20.02      28.02       20.02];
% % fky2_y6 =[ -10.02    -10.02     -2.02      -10.02     -18.02];
% % % plot(G2_y6,'XData',fkx2_y6,'YData',fky2_y6,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','6^{2}','6^{3}','6^{4}','6^{5}'},'EdgeColor','#14281D','NodeColor','#14281D')
% % % hold on
% % % plot(fkx2_y6(1),fky2_y6(1),'hr','MarkerSize',10)