clc
clear
close all

%************************** OMR_3维************************************%
%读初始状态
x_initial = xlsread('x_initial.xlsx');
y_initial = xlsread('y_initial.xlsx');
phi_initial = xlsread('phi_initial.xlsx');
%**********************************************************************%
Num = size(x_initial,2); % number of OMR

%% formation set
%********************** 一阶跟踪结构 **********************************%
s=[   4     3      2   1       5];
t=[   1     2      5   5      6];
G = digraph(s,t);
fkx = x_initial(1,:);
fky = y_initial(1,:);
fkphi = phi_initial(1,:);
% fkx=[   -30    -30   -60   -60   -20    0];
% fky=[   -30     10   10    -30   -10  -10];
% figure
% plot(G,'XData',fkx,'YData',fky,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18)
% hold on
%*********************************************************************%
%******************* 增量后的一阶结构 ********************************%
s_add=[   4     3      2   1       5 7  7];
t_add=[   1     2      5   5      6  3  4];
G_add = digraph(s_add,t_add);
x_initial_add = [-70;20;0;0.5;0.5;0];
% fkx=[   -30    -30   -60   -60   -20    0  -70];
% fky=[   -30     10   10    -30   -10  -10  -10];
% figure
% plot(G_add,'XData',fkx,'YData',fky,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18)
% hold on
%*********************************************************************%
%***************** 增量二阶子图结构 ***********************************%
s_y=[2 3 2 4  3  2   4   5];
t_y=[1 1 3 1  4  5   5   1];
G_y = digraph(s_y,t_y);
fkx_y=[   -70   -80   -70   -60   -70];
fky_y=[   -10   -10   0    -10   -20];
fkphi_y = fkphi(1:5);
%**********************************************************************%
bias = 5;
%***************** 二阶子图结构 ***************************************%
s_y2=[2 3 2 4  3  2   4   5];
t_y2=[1 1 3 1  4  5   5   1];
G_y2 = digraph(s_y2,t_y2);
fkx_y2 = [fkx(1), fkx(1)-bias, fkx(1), fkx(1)+bias, fkx(1)];
fky_y2 = [fky(1), fky(1), fky(1)+bias, fky(1), fky(1)-bias];
fkphi_y2 = fkphi(1:5);

s_y3=[2 3 2 4  3  2   4   5];
t_y3=[1 1 3 1  4  5   5   1];
G_y3 = digraph(s_y3,t_y3);
fkx_y3 = [fkx(2), fkx(2)-bias, fkx(2), fkx(2)+bias, fkx(2)];
fky_y3 = [fky(2), fky(2), fky(2)+bias, fky(2), fky(2)-bias];
fkphi_y3 = fkphi(1:5);

s_y4=[2 3 2 4  3  2   4   5];
t_y4=[1 1 3 1  4  5   5   1];
G_y4 = digraph(s_y4,t_y4);
fkx_y4 = [fkx(3), fkx(3)-bias, fkx(3), fkx(3)+bias, fkx(3)];
fky_y4 = [fky(3), fky(3), fky(3)+bias, fky(3), fky(3)-bias];
fkphi_y4 = fkphi(1:5);

s_y5=[2 3 2 4  3  2   4   5];
t_y5=[1 1 3 1  4  5   5   1];
G_y5 = digraph(s_y5,t_y5);
fkx_y5 = [fkx(4), fkx(4)-bias, fkx(4), fkx(4)+bias, fkx(4)];
fky_y5 = [fky(4), fky(4), fky(4)+bias, fky(4), fky(4)-bias];
fkphi_y5 = fkphi(1:5);

s_y6=[2 3 2 4  3  2   4   5];
t_y6=[1 1 3 1  4  5   5   1];
G_y6 = digraph(s_y6,t_y6);
fkx_y6 = [fkx(5), fkx(5)-bias, fkx(5), fkx(5)+bias, fkx(5)];
fky_y6 = [fky(5), fky(5), fky(5)+bias, fky(5), fky(5)-bias];
fkphi_y6 = fkphi(1:5);
%**********************************************************************%
%% 仿真设置
T=1; % measurement time step
tf=30; % simulation length
add = 0.5;
signal_add = 0;
dt1=0.002;% time step for integration
lb=2;
ub=2;
%************** 神经网络初始化 *********************%
ell = 52;%神经元数目
W = zeros(ell*Num,3*Num);%初始权重矩阵
sigma = 2;%径基宽度，径基宽度决定了径向基函数下降的快慢
rho = 1;%更新系数
lbtf=ub*tf;

Num_y=numel(fkx_y);
Num_y2=numel(fkx_y2);
Num_y3=numel(fkx_y3);
Num_y4=numel(fkx_y4);
Num_y5=numel(fkx_y5);
Num_y6=numel(fkx_y6);

W_y = zeros(ell*Num_y,3*Num_y);%初始权重矩阵
W_y2 = zeros(ell*Num_y2,3*Num_y2);%初始权重矩阵
W_y3 = zeros(ell*Num_y3,3*Num_y3);%初始权重矩阵
W_y4 = zeros(ell*Num_y4,3*Num_y4);%初始权重矩阵
W_y5 = zeros(ell*Num_y5,3*Num_y5);%初始权重矩阵
W_y6 = zeros(ell*Num_y6,3*Num_y6);%初始权重矩阵

%% 状态变量初始化
%***************** 一阶 ***********************************************%
x = [];
for i=1:Num
    x=[x;x_initial(1,i)];
    x=[x;y_initial(1,i)];
    x=[x;phi_initial(1,i)];
end
for i=1:Num
    x=[x;x_initial(2,i)];
    x=[x;y_initial(2,i)];
    x=[x;phi_initial(2,i)];
end
Xarray=x;
[A_N,L,B,ld]=graphpart(G,Num);
dotH=0;
uarray=zeros(3*Num,1);
phiuarray=zeros(3*Num,1);
%***************** 二阶 ***********************************************%
[A_N_y,L_y,B_y,ld_y]=graphpart(G_y,Num_y);
[A_N_y2,L_y2,B_y2,ld_y2]=graphpart(G_y2,Num_y2);
[A_N_y3,L_y3,B_y3,ld_y3]=graphpart(G_y3,Num_y3);
[A_N_y4,L_y4,B_y4,ld_y4]=graphpart(G_y4,Num_y4);
[A_N_y5,L_y5,B_y5,ld_y5]=graphpart(G_y5,Num_y5);
[A_N_y6 ,L_y6,B_y6,ld_y6]=graphpart(G_y6,Num_y6);

x_y0=[-72 20 -70  22   -68 20  -70  18]; v_y0=rand*[-4;9;0;-8;0;0;4;-9;0;1;-4;0;]';
x_y02=[-32 -30 -30  -28   -28 -30  -30  -32]; v_y2=rand*[10;-5;-8;0;4;-9;1;-4;]';
x_y03=[-32  10 -30   12   -28  10  -30    8]; v_y3=rand*[10;-5;-4;9;4;-9;1;-4;]';
x_y04=[-62  10 -60   12   -58  10  -60    8]; v_y4=rand*[10;-5;-4;9;-8;0;1;-4;]';
x_y05=[-62  -30 -60  -28  -58  -30  -60  -32]; v_y5=rand*[10;-5;-4;9;-8;0;4;-9;]';
x_y06=[-22  -10 -20  -8   -18  -10  -20  -12]; v_y6=rand*[10;-5;-4;9;-8;0;4;-9;]';

 uarray_y=zeros(3*Num_y,1);
 phiuarray_y=zeros(3*Num_y,1); 
 
 x_y2 = [x(1:3)];
 for i=1:1:Num_y2-1
     x_y2 = [x_y2;x_y02((2*i-1):(2*i))';0];
 end
 x_y2 = [x_y2;x((3*(Num)+1):(3*(Num+1)))];
 for i=1:1:Num_y2-1
     x_y2 = [x_y2;v_y2((2*i-1):(2*i))';0];
 end
 Xarray_y2=x_y2;
 uarray_y2=zeros(3*Num_y2,1);
 phiuarray_y2=zeros(3*Num_y2,1);

 x_y3 = [x(4:6)];
 for i=1:1:Num_y3-1
     x_y3 = [x_y3;x_y03((2*i-1):(2*i))';0];
 end
 x_y3 = [x_y3;x((3*(Num+1)+1):(3*(Num+2)))];
 for i=1:1:Num_y3-1
     x_y3 = [x_y3;v_y3((2*i-1):(2*i))';0];
 end
 Xarray_y3=x_y3;
 uarray_y3=zeros(3*Num_y3,1);
 phiuarray_y3=zeros(3*Num_y3,1); 

 x_y4 = [x(7:9)];
 for i=1:1:Num_y4-1
     x_y4 = [x_y4;x_y04((2*i-1):(2*i))';0];
 end
 x_y4 = [x_y4;x((3*(Num+2)+1):(3*(Num+3)))];
 for i=1:1:Num_y4-1
     x_y4 = [x_y4;v_y4((2*i-1):(2*i))';0];
 end
 Xarray_y4=x_y4;
 uarray_y4=zeros(3*Num_y4,1);
 phiuarray_y4=zeros(3*Num_y4,1); 

  x_y5 = [x(10:12)];
 for i=1:1:Num_y5-1
     x_y5 = [x_y5;x_y05((2*i-1):(2*i))';0];
 end
 x_y5 = [x_y5;x((3*(Num+3)+1):(3*(Num+4)))];
 for i=1:1:Num_y5-1
     x_y5 = [x_y5;v_y5((2*i-1):(2*i))';0];
 end
 Xarray_y5=x_y5;
 uarray_y5=zeros(3*Num_y5,1);
 phiuarray_y5=zeros(3*Num_y5,1);



 %% 仿真
 for t=0: T: tf
   t
   if t==0
       bar_varepsilon1=0;bar_varepsilon2=0;
       dot_bar_varepsilon1=0;dot_bar_varepsilon2=0;
       
       %***************** 二阶 ***********************%
        bar_varepsilon1_y=0;bar_varepsilon2_y=0;
        dot_bar_varepsilon1_y=0;dot_bar_varepsilon2_y=0;
        
        bar_varepsilon1_y2=0;bar_varepsilon2_y2=0;
        dot_bar_varepsilon1_y2=0;dot_bar_varepsilon2_y2=0;
        
        bar_varepsilon1_y3=0;bar_varepsilon2_y3=0;
        dot_bar_varepsilon1_y3=0;dot_bar_varepsilon2_y3=0;
        
        bar_varepsilon1_y4=0;bar_varepsilon2_y4=0;
        dot_bar_varepsilon1_y4=0;dot_bar_varepsilon2_y4=0;
        
        bar_varepsilon1_y5=0;bar_varepsilon2_y5=0;
        dot_bar_varepsilon1_y5=0;dot_bar_varepsilon2_y5=0;
        
     

   end
   for tau = dt1+t :dt1: t+1 
       if tau == add*tf
           signal_add = 1;
           %********* 增量系统状态更新 *************************************%
           x_initial_add(1) = x(1,end)-50;
           x_initial_add(2) = x(2,end)+17;
           fkx_y=[   x_initial_add(1)   x_initial_add(1)-2   x_initial_add(1)   x_initial_add(1)+2   x_initial_add(1)];
           fky_y=[   x_initial_add(2)   x_initial_add(2)   x_initial_add(2)+2    x_initial_add(2)   x_initial_add(2)-2];
           x_y0=[x_initial_add(1)-2 x_initial_add(2) 0 x_initial_add(1)  x_initial_add(2)+2 0  x_initial_add(1)+2 x_initial_add(2) 0  x_initial_add(1)  x_initial_add(2)-2 0];
           x_y=[x_initial_add(1:3);x_y0';x_initial_add(4:6);v_y0'];
           Xarray_y=x_y;
           %****************************************************************%
           temp_x2 = x(3*Num+1:6*Num);
           temp_x1 = [x(1:3*Num);x_initial_add(1:3);temp_x2;x_initial_add(4:6)];
           x = temp_x1;
           Num = numel(x)/6;
           [A_N,L,B,ld]=graphpart(G_add,Num);
           fkx=[   -30    -30   -60   -60   -20    0  -70];
           fky=[   -30     10   10    -30   -10  -10  -10];
           fkphi = zeros(1,Num);
           bar_varepsilon1=[bar_varepsilon1;0;0;0];bar_varepsilon2 = [bar_varepsilon2;0;0;0];
           dot_bar_varepsilon1=[dot_bar_varepsilon1;0;0;0];dot_bar_varepsilon2=[dot_bar_varepsilon2;0;0;0];

           %*********** 神经网络大小更新 ************************%
           W = [W, zeros(ell*6,3)];
           W = [W;zeros(ell,3*Num)];
           %*********** 状态矩阵更新 ****************************%
           temp_X = Xarray(3*(Num-1)+1:end,:);
           temp_XX = [Xarray(1:3*(Num-1),:);zeros(3,size(Xarray,2));temp_X;zeros(3,size(Xarray,2))];
           Xarray = temp_XX;
           Xarray(3*Num-2:3*Num) = [x_initial_add(1:3)];
           Xarray(6*Num-2:6*Num) = [x_initial_add(4:6)];
           %************ 真实输入更新 ****************************%
           uarray = [uarray; zeros(3,size(uarray,2))];
           %************ 控制量更新 *******************************%
           phiuarray=[phiuarray;zeros(3,size(phiuarray,2))];
       end
       [Delta_State,u,phiu,varepsilon1,varepsilon2,Delta_W,bar_varepsilon1,bar_varepsilon2,dot_bar_varepsilon1,dot_bar_varepsilon2]=...
           slidingcontrol3(tau,x,L,B,fkx,fky,fkphi,A_N,dotH,W,bar_varepsilon1,bar_varepsilon2,dot_bar_varepsilon1,dot_bar_varepsilon2,lbtf,dt1,signal_add);
       x=x+Delta_State*dt1;
       W = W + Delta_W * dt1;
       Xarray=[Xarray x];
       uarray=[uarray u];
       phiuarray=[phiuarray phiu]; 
%        

       %********** 二阶 **********************%
       if signal_add ==1
        u_ldy=phiu(19:21);
          [Delta_State_y,u_y,phiu_y,varepsilon1_y,varepsilon2_y,Delta_W_y,bar_varepsilon1_y,bar_varepsilon2_y,dot_bar_varepsilon1_y,dot_bar_varepsilon2_y]=...
            slidingcontrol4(tau,x_y,L_y,B_y,fkx_y,fky_y,fkphi_y,A_N_y,W_y,bar_varepsilon1_y,bar_varepsilon2_y,dot_bar_varepsilon1_y,dot_bar_varepsilon2_y,lbtf,dt1,u_ldy);
        x_y=x_y+Delta_State_y*dt1;
        W_y = W_y + Delta_W_y * dt1;
        Xarray_y=[Xarray_y x_y];
        uarray_y=[uarray_y u_y];
        phiuarray_y=[phiuarray_y phiu_y]; 
       end
%        
        u_ldy2=phiu(1:3);
 
        [Delta_State_y2,u_y2,phiu_y2,varepsilon1_y2,varepsilon2_y2,Delta_W_y2,bar_varepsilon1_y2,bar_varepsilon2_y2,dot_bar_varepsilon1_y2,dot_bar_varepsilon2_y2]=...
            slidingcontrol4(tau,x_y2,L_y2,B_y2,fkx_y2,fky_y2,fkphi_y2,A_N_y2,W_y2,bar_varepsilon1_y2,bar_varepsilon2_y2,dot_bar_varepsilon1_y2,dot_bar_varepsilon2_y2,lbtf,dt1,u_ldy2);
        x_y2=x_y2+Delta_State_y2*dt1;
        W_y2 = W_y2 + Delta_W_y2 * dt1;
        Xarray_y2=[Xarray_y2 x_y2];
        uarray_y2=[uarray_y2 u_y2];
        phiuarray_y2=[phiuarray_y2 phiu_y2];  
        u_ldy3=phiu(4:6); 

           [Delta_State_y3,u_y3,phiu_y3,varepsilon1_y3,varepsilon2_y3,Delta_W_y3,bar_varepsilon1_y3,bar_varepsilon2_y3,dot_bar_varepsilon1_y3,dot_bar_varepsilon2_y3]=...
            slidingcontrol4(tau,x_y3,L_y3,B_y3,fkx_y3,fky_y3,fkphi_y3,A_N_y3,W_y3,bar_varepsilon1_y3,bar_varepsilon2_y3,dot_bar_varepsilon1_y3,dot_bar_varepsilon2_y3,lbtf,dt1,u_ldy3);
        x_y3=x_y3+Delta_State_y3*dt1;
        W_y3 = W_y3 + Delta_W_y3 * dt1;
        Xarray_y3=[Xarray_y3 x_y3];
        uarray_y3=[uarray_y3 u_y3];
        phiuarray_y3=[phiuarray_y3 phiu_y3];  
        u_ldy4=phiu(7:9);    

          [Delta_State_y4,u_y4,phiu_y4,varepsilon1_y4,varepsilon2_y4,Delta_W_y4,bar_varepsilon1_y4,bar_varepsilon2_y4,dot_bar_varepsilon1_y4,dot_bar_varepsilon2_y4]=...
            slidingcontrol4(tau,x_y4,L_y4,B_y4,fkx_y4,fky_y4,fkphi_y4,A_N_y4,W_y4,bar_varepsilon1_y4,bar_varepsilon2_y4,dot_bar_varepsilon1_y4,dot_bar_varepsilon2_y4,lbtf,dt1,u_ldy4);
        x_y4=x_y4+Delta_State_y4*dt1;
        W_y4 = W_y4 + Delta_W_y4 * dt1;
        Xarray_y4=[Xarray_y4 x_y4];
        uarray_y4=[uarray_y4 u_y4];
        phiuarray_y4=[phiuarray_y4 phiu_y4]; 
        u_ldy5=phiu(10:12);

          [Delta_State_y5,u_y5,phiu_y5,varepsilon1_y5,varepsilon2_y5,Delta_W_y5,bar_varepsilon1_y5,bar_varepsilon2_y5,dot_bar_varepsilon1_y5,dot_bar_varepsilon2_y5]=...
            slidingcontrol4(tau,x_y5,L_y5,B_y5,fkx_y5,fky_y5,fkphi_y5,A_N_y5,W_y5,bar_varepsilon1_y5,bar_varepsilon2_y5,dot_bar_varepsilon1_y5,dot_bar_varepsilon2_y5,lbtf,dt1,u_ldy5);
        x_y5=x_y5+Delta_State_y5*dt1;
        W_y5 = W_y5 + Delta_W_y5 * dt1;
        Xarray_y5=[Xarray_y5 x_y5];
        uarray_y5=[uarray_y5 u_y5];
        phiuarray_y5=[phiuarray_y5 phiu_y5]; 
        u_ldy6=phiu(13:15);   



   end
end
 save('smooth_1')
 %% 画图
t = 0:dt1:tf+1;
t_A = 0:dt1:tf*add;
n = size(t_A,2);
%**************** Fig 3: foramtion ************************************%
% % (a)
% figure
% plot(G,'XData',fkx,'YData',fky,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18);hold on;
% plot(G_y2,'XData',fkx_y2,'YData',fky_y2,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18);hold on;
% plot(G_y3,'XData',fkx_y3,'YData',fky_y3,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18);hold on;
% plot(G_y4,'XData',fkx_y4,'YData',fky_y4,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18);hold on;
% plot(G_y5,'XData',fkx_y5,'YData',fky_y5,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18);hold on;
% plot(G_y6,'XData',fkx_y6,'YData',fky_y6,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18);hold on;
% % (b)
% figure
% plot(G,'XData',fkx,'YData',fky,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18);hold on;
% plot(G_y2,'XData',fkx_y2,'YData',fky_y2,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18);hold on;
% plot(G_y3,'XData',fkx_y3,'YData',fky_y3,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18);hold on;
% plot(G_y4,'XData',fkx_y4,'YData',fky_y4,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18);hold on;
% plot(G_y5,'XData',fkx_y5,'YData',fky_y5,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18);hold on;
% plot(G_y6,'XData',fkx_y6,'YData',fky_y6,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18);hold on;
% plot(G_y,'XData',fkx_y,'YData',fky_y,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','7^{2}','7^{3}','7^{4}','7^{5}'},'EdgeColor','#3ECE00','NodeColor','#3ECE00');hold on;
% plot(fkx_y(1),fky_y(1),'hr','MarkerSize',10);
% s_add=[1 1];
% t_add=[2 3];
% G_add=digraph(s_add,t_add);
% fkx=[-70 -60 -60];
% fky=[-10 10 -30];
% plot(G_add,'XData',fkx,'YData',fky,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18,'LineStyle',':','EdgeColor','#3ECE00','NodeColor','#3ECE00','NodeLabel',{'7',' ',' '})
% hold on
% plot(fkx(1),fky(1),'hr','MarkerSize',10);
%**********************************************************************%
%*************** 路径图 ***********************************************%
figure('NumberTitle', 'on') 
plot(Xarray(1,:),Xarray(2,:),'-','Color','#F3B617','LineWidth',2); hold on;
plot(Xarray(4,:),Xarray(5,:),'-.','Color','#973EE3' ,'LineWidth',2); hold on;
plot(Xarray(7,:),Xarray(8,:),':','Color','#A63D40','LineWidth',2);hold on;
plot(Xarray(10,:),Xarray(11,:),'--','Color','#3ECE00','LineWidth',2);hold on;
plot(Xarray(13,:),Xarray(14,:),'-.','Color','#567DF4','LineWidth',2);hold on;%*
plot(Xarray(16,:),Xarray(17,:),'--','Color','#14281D','LineWidth',2);hold on;

plot(Xarray_y2(1,:),Xarray_y2(2,:),'-','Color','#973EE3','LineWidth',2); hold on;
plot(Xarray_y2(4,:),Xarray_y2(5,:),'-.','Color','#973EE3' ,'LineWidth',2); hold on;
plot(Xarray_y2(7,:),Xarray_y2(8,:),':','Color','#973EE3','LineWidth',2);hold on;
plot(Xarray_y2(10,:),Xarray_y2(11,:),'--','Color','#973EE3','LineWidth',2);hold on;
plot(Xarray_y2(13,:),Xarray_y2(14,:),'-.','Color','#973EE3','LineWidth',2);hold on;%*

plot(Xarray_y3(1,:),Xarray_y3(2,:),'-','Color','#A63D40','LineWidth',2); hold on;
plot(Xarray_y3(4,:),Xarray_y3(5,:),'-.','Color','#A63D40' ,'LineWidth',2); hold on;
plot(Xarray_y3(7,:),Xarray_y3(8,:),':','Color','#A63D40','LineWidth',2);hold on;
plot(Xarray_y3(10,:),Xarray_y3(11,:),'--','Color','#A63D40','LineWidth',2);hold on;
plot(Xarray_y3(13,:),Xarray_y3(14,:),'-.','Color','#A63D40','LineWidth',2);hold on;%*

plot(Xarray_y4(1,:),Xarray_y4(2,:),'-','Color','#A63D40','LineWidth',2); hold on;
plot(Xarray_y4(4,:),Xarray_y4(5,:),'-.','Color','#A63D40' ,'LineWidth',2); hold on;
plot(Xarray_y4(7,:),Xarray_y4(8,:),':','Color','#A63D40','LineWidth',2);hold on;
plot(Xarray_y4(10,:),Xarray_y4(11,:),'--','Color','#A63D40','LineWidth',2);hold on;
plot(Xarray_y4(13,:),Xarray_y4(14,:),'-.','Color','#A63D40','LineWidth',2);hold on;%*

plot(Xarray_y5(1,:),Xarray_y5(2,:),'-','Color','#3ECE00','LineWidth',2); hold on;
plot(Xarray_y5(4,:),Xarray_y5(5,:),'-.','Color','#3ECE00' ,'LineWidth',2); hold on;
plot(Xarray_y5(7,:),Xarray_y5(8,:),':','Color','#3ECE00','LineWidth',2);hold on;
plot(Xarray_y5(10,:),Xarray_y5(11,:),'--','Color','#3ECE00','LineWidth',2);hold on;
plot(Xarray_y5(13,:),Xarray_y5(14,:),'-.','Color','#3ECE00','LineWidth',2);hold on;%*

plot(Xarray(19,n:end),Xarray(20,n:end),'Color','#3ECE00','LineWidth',2);hold on;

plot(Xarray_y(1,:),Xarray_y(2,:),'-','Color','r','LineWidth',2); hold on;
plot(Xarray_y(4,:),Xarray_y(5,:),'-.','Color','r' ,'LineWidth',2); hold on;
plot(Xarray_y(7,:),Xarray_y(8,:),':','Color','r','LineWidth',2);hold on;
plot(Xarray_y(10,:),Xarray_y(11,:),'--','Color','r','LineWidth',2);hold on;
plot(Xarray_y(13,:),Xarray_y(14,:),'-.','Color','r','LineWidth',2);hold on;%*
% plot(Xarray_y6(1,:),Xarray_y6(2,:),'-','Color','#567DF4','LineWidth',2); hold on;
% plot(Xarray_y6(4,:),Xarray_y6(5,:),'-.','Color','#567DF4' ,'LineWidth',2); hold on;
% plot(Xarray_y6(7,:),Xarray_y6(8,:),':','Color','#567DF4','LineWidth',2);hold on;
% plot(Xarray_y6(10,:),Xarray_y6(11,:),'--','Color','#567DF4','LineWidth',2);hold on;
% plot(Xarray_y6(13,:),Xarray_y6(14,:),'-.','Color','#567DF4','LineWidth',2);hold on;%*

plot(G,'XData',Xarray(1:3:3*(Num-1)-1,1),'YData',Xarray(2:3:3*(Num-1),1),'LineWidth',2,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#083DB3','NodeColor','#083DB3','NodeLabel',{'  1','  2','  3','  4','  5','  6'});hold on;
plot(G_y2,'XData',Xarray_y2(1:3:13,1),'YData',Xarray_y2(2:3:14,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#567DF4','NodeColor','#567DF4','NodeLabel',{' ',' ',' ',' ',' '});hold on;
plot(G_y3,'XData',Xarray_y3(1:3:13,1),'YData',Xarray_y3(2:3:14,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#567DF4','NodeColor','#567DF4','NodeLabel',{' ',' ',' ',' ',' '});hold on;
plot(G_y4,'XData',Xarray_y4(1:3:13,1),'YData',Xarray_y4(2:3:14,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#567DF4','NodeColor','#567DF4','NodeLabel',{' ',' ',' ',' ',' '});hold on;
plot(G_y5,'XData',Xarray_y5(1:3:13,1),'YData',Xarray_y5(2:3:14,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#567DF4','NodeColor','#567DF4','NodeLabel',{' ',' ','  ',' ',' '});hold on;

s_mid =[1 1];
t_mid =[2 3];
G_mid = digraph(s_mid,t_mid);
Xarray_mid = [Xarray(19:20,n:end);Xarray(7:8,n:end);Xarray(10:11,n:end)];
plot(G_mid,'XData',Xarray_mid(1:2:5,1),'YData',Xarray_mid(2:2:6,1),'LineWidth',2,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#3ECE00','NodeColor','#3ECE00','NodeLabel',{'  7','  3','  4'},'LineStyle',':');hold on;
%plot(G2_y,'XData',Xarray_y(1:2:9,1),'YData',Xarray_y(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#3ECE00','NodeColor','#3ECE00','NodeLabel',{' ',' ',' ',' ',' '});hold on;
plot(G,'XData',Xarray(1:3:3*(Num-1)-1,n),'YData',Xarray(2:3:3*(Num-1),n),'LineWidth',2,'EdgeAlpha',0.7,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#083DB3','NodeColor','#083DB3','NodeLabel',{'  1','  2','  3','  4','  5','  6'});hold on;
plot(G_y2,'XData',Xarray_y2(1:3:13,n),'YData',Xarray_y2(2:3:14,n),'LineWidth',1.5,'EdgeAlpha',0.5,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#567DF4','NodeColor','#567DF4','NodeLabel',{' ',' ',' ',' ',' '});hold on;
plot(G_y3,'XData',Xarray_y3(1:3:13,n),'YData',Xarray_y3(2:3:14,n),'LineWidth',1.5,'EdgeAlpha',0.5,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#567DF4','NodeColor','#567DF4','NodeLabel',{' ',' ',' ',' ',' '});hold on;
plot(G_y4,'XData',Xarray_y4(1:3:13,n),'YData',Xarray_y4(2:3:14,n),'LineWidth',1.5,'EdgeAlpha',0.5,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#567DF4','NodeColor','#567DF4','NodeLabel',{' ',' ',' ',' ',' '});hold on;
plot(G_y5,'XData',Xarray_y5(1:3:13,n),'YData',Xarray_y5(2:3:14,n),'LineWidth',1.5,'EdgeAlpha',0.5,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#567DF4','NodeColor','#567DF4','NodeLabel',{' ',' ','  ',' ',' '});hold on;

plot(G,'XData',Xarray(1:3:3*(Num-1)-1,1),'YData',Xarray(2:3:3*(Num-1),1),'LineWidth',2,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#083DB3','NodeColor','#083DB3','NodeLabel',{'  1','  2','  3','  4','  5','  6'});hold on;
%***********************************************************************%