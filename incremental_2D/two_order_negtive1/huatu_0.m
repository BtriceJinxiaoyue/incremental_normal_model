clc
clear
close all

% %% 0_1
% s=[   4     3      2   1       5];
% t=[   1     2      5   5      6];
% G = digraph(s,t);
% fkx=[   -30    -30   -60   -60   -20    0];
% fky=[   -30     10   10    -30   -10  -10];
% figure
% plot(G,'XData',fkx,'YData',fky,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18)
% hold on
% plot(fkx(6),fky(6),'hr','MarkerSize',10)
% 
% s_y2=[2 3 2 4  3  2   4   5];   
% t_y2=[1 1 3 1  4  5   5   1];
% G_y2 = digraph(s_y2,t_y2);
% fkx_y2=[   -30   -40  -30   -20   -30];      %%%等会儿删
% fky_y2=[   -30   -30  -20   -30   -40];
% plot(G_y2,'XData',fkx_y2,'YData',fky_y2,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','1^{2}','1^{3}','1^{4}','1^{5}'},'EdgeColor','#567DF4','NodeColor','#567DF4')
% hold on
% plot(fkx_y2(1),fky_y2(1),'hr','MarkerSize',10)
% 
% s_y3=[2 3 2 4  3  2   4   5];
% t_y3=[1 1 3 1  4  5   5   1];
% G_y3 = digraph(s_y3,t_y3);
% fkx_y3=[   -30   -40  -30   -20   -30];
% fky_y3=[    10    10   20    10    0];
% plot(G_y3,'XData',fkx_y3,'YData',fky_y3,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','2^{2}','2^{3}','2^{4}','2^{5}'},'EdgeColor','#567DF4','NodeColor','#567DF4')
% hold on
% plot(fkx_y3(1),fky_y3(1),'hr','MarkerSize',10)
% 
% s_y4=[2 3 2 4  3  2   4   5];
% t_y4=[1 1 3 1  4  5   5   1];
% G_y4 = digraph(s_y4,t_y4);
% fkx_y4=[   -60   -70  -60   -50   -60];
% fky_y4=[    10    10   20    10   0];
% plot(G_y4,'XData',fkx_y4,'YData',fky_y4,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','3^{2}','3^{3}','3^{4}','3^{5}'},'EdgeColor','#567DF4','NodeColor','#567DF4')
% hold on
% plot(fkx_y4(1),fky_y4(1),'hr','MarkerSize',10)
% 
% s_y5=[2 3 2 4  3  2   4   5];
% t_y5=[1 1 3 1  4  5   5   1];
% G_y5 = digraph(s_y5,t_y5);
% fkx_y5=[   -60   -70  -60   -50   -60];
% fky_y5=[   -30   -30  -20   -30   -40];
% plot(G_y5,'XData',fkx_y5,'YData',fky_y5,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','4^{2}','4^{3}','4^{4}','4^{5}'},'EdgeColor','#567DF4','NodeColor','#567DF4')
% hold on
% plot(fkx_y5(1),fky_y5(1),'hr','MarkerSize',10)
% 
% s_y6=[2 3 2 4  3  2   4   5];
% t_y6=[1 1 3 1  4  5   5   1];
% G_y6 = digraph(s_y6,t_y6);
% fkx_y6=[   -20   -30  -20    -10   -20];
% fky_y6=[   -10   -10   -0    -10   -20];
% plot(G_y6,'XData',fkx_y6,'YData',fky_y6,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','5^{2}','5^{3}','5^{4}','5^{5}'},'EdgeColor','#567DF4','NodeColor','#567DF4')
% hold on
% plot(fkx_y6(1),fky_y6(1),'hr','MarkerSize',10)

%% 0_2
s=[   4     3      2   1       5];
t=[   1     2      5   5      6];
G = digraph(s,t);
fkx=[   -30    -30   -60   -60   -20    0];
fky=[   -30     10   10    -30   -10  -10];
figure
plot(G,'XData',fkx,'YData',fky,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18)
hold on
plot(fkx(6),fky(6),'hr','MarkerSize',10)

s_y2=[2 3 2 4  3  2   4   5];   
t_y2=[1 1 3 1  4  5   5   1];
G_y2 = digraph(s_y2,t_y2);
fkx_y2=[   -30   -40  -30   -20   -30];      %%%等会儿删
fky_y2=[   -30   -30  -20   -30   -40];
plot(G_y2,'XData',fkx_y2,'YData',fky_y2,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','1^{2}','1^{3}','1^{4}','1^{5}'},'EdgeColor','#567DF4','NodeColor','#567DF4')
hold on
plot(fkx_y2(1),fky_y2(1),'hr','MarkerSize',10)

s_y3=[2 3 2 4  3  2   4   5];
t_y3=[1 1 3 1  4  5   5   1];
G_y3 = digraph(s_y3,t_y3);
fkx_y3=[   -30   -40  -30   -20   -30];
fky_y3=[    10    10   20    10    0];
plot(G_y3,'XData',fkx_y3,'YData',fky_y3,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','2^{2}','2^{3}','2^{4}','2^{5}'},'EdgeColor','#567DF4','NodeColor','#567DF4')
hold on
plot(fkx_y3(1),fky_y3(1),'hr','MarkerSize',10)

s_y4=[2 3 2 4  3  2   4   5];
t_y4=[1 1 3 1  4  5   5   1];
G_y4 = digraph(s_y4,t_y4);
fkx_y4=[   -60   -70  -60   -50   -60];
fky_y4=[    10    10   20    10   0];
plot(G_y4,'XData',fkx_y4,'YData',fky_y4,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','3^{2}','3^{3}','3^{4}','3^{5}'},'EdgeColor','#567DF4','NodeColor','#567DF4')
hold on
plot(fkx_y4(1),fky_y4(1),'hr','MarkerSize',10)

s_y5=[2 3 2 4  3  2   4   5];
t_y5=[1 1 3 1  4  5   5   1];
G_y5 = digraph(s_y5,t_y5);
fkx_y5=[   -60   -70  -60   -50   -60];
fky_y5=[   -30   -30  -20   -30   -40];
plot(G_y5,'XData',fkx_y5,'YData',fky_y5,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','4^{2}','4^{3}','4^{4}','4^{5}'},'EdgeColor','#567DF4','NodeColor','#567DF4')
hold on
plot(fkx_y5(1),fky_y5(1),'hr','MarkerSize',10)

s_y6=[2 3 2 4  3  2   4   5];
t_y6=[1 1 3 1  4  5   5   1];
G_y6 = digraph(s_y6,t_y6);
fkx_y6=[   -20   -30  -20    -10   -20];
fky_y6=[   -10   -10   -0    -10   -20];
plot(G_y6,'XData',fkx_y6,'YData',fky_y6,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','5^{2}','5^{3}','5^{4}','5^{5}'},'EdgeColor','#567DF4','NodeColor','#567DF4')
hold on
plot(fkx_y6(1),fky_y6(1),'hr','MarkerSize',10)

s_add=[1 1];
t_add=[2 3];
G_add=digraph(s_add,t_add);
fkx=[-70 -60 -60];
fky=[-10 10 -30];
plot(G_add,'XData',fkx,'YData',fky,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18,'LineStyle',':','EdgeColor','#3ECE00','NodeColor','#3ECE00','NodeLabel',{'7',' ',' '})
hold on
plot(fkx(1),fky(1),'hr','MarkerSize',10)



s_y=[2 3 2 4  3  2   4   5];
t_y=[1 1 3 1  4  5   5   1];
G_y = digraph(s_y,t_y);
fkx_y=[   -70   -80   -70   -60   -70];
fky_y=[   -10   -10   0    -10   -20];
plot(G_y,'XData',fkx_y,'YData',fky_y,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','7^{2}','7^{3}','7^{4}','7^{5}'},'EdgeColor','#3ECE00','NodeColor','#3ECE00')
hold on
plot(fkx_y(1),fky_y(1),'hr','MarkerSize',10)


% s_add=[   4     3      2   1       5 7  7];
% t_add=[   1     2      5   5      6  3  4];
% G_add = digraph(s_add,t_add);
% 
% fkx=[   -30    -30   -60   -60   -20    0  -70];
% fky=[   -30     10   10    -30   -10  -10  -10];
% figure
% plot(G_add,'XData',fkx,'YData',fky,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18)
% hold on
% plot(fkx(6),fky(6),'hr','MarkerSize',10)