clc
clear
close all
% 一阶系统的硕士毕设代码——平滑变化
%% 初始化
%**************** 跟踪结构 ********************
s=[   4     3      2   1       5];
t=[   1     2      5   5      6];
G = digraph(s,t);
fkx=[   -30    -30   -60   -60   -20    0];
fky=[   -30     10   10    -30   -10  -10];
% figure
% plot(G,'XData',fkx,'YData',fky,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18)
% hold on
% plot(fkx(7),fky(7),'hr','MarkerSize',10)
x = fkx;
y = fky;
%**************** 增量后的结构 ******************%
s_add=[   4     3      2   1       5 7  7];
t_add=[   1     2      5   5      6  3  4];
G_add = digraph(s_add,t_add);
x_initial_add = [-70;20;2;2];
% fkx=[   -30    -30   -60   -60   -20    0  -70];
% fky=[   -30     10   10    -30   -10  -10  -10];
% figure
% plot(G,'XData',fkx,'YData',fky,'LineWidth',3,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18)
% hold on
% plot(fkx(7),fky(7),'hr','MarkerSize',10)
%**************** 包围结构 *********************%
s2 =[     4     5     1     2     2     3     3     4     5  6  6   6];
t2 =[     1     1     7     7     5     4     7     7     7  7  3   2];
G2 = digraph(s2,t2);
fkx2 =[   -20.07   10.06    10.05   -10.04   -10.03   20.02    0.01];
fky2 =[   -10.07   -30.06   10.05   10.04    -30.03   -10.02  -10.01];
% figure
% plot(G2,'XData',fkx2,'YData',fky2,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',15,'NodeFontSize',18)
% hold on
% plot(fkx2(7),fky2(7),'hr','MarkerSize',10)

%*************** 二阶子图结构 ***************************%
%********** 跟踪结构 ****************%
s_y=[2 3 2 4  3  2   4   5];
t_y=[1 1 3 1  4  5   5   1];
G_y = digraph(s_y,t_y);
fkx_y=[   -70   -72   -70   -68   -70];
fky_y=[   20   20   22    20   18];
% plot(G_y,'XData',fkx_y,'YData',fky_y,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','1^{2}','1^{3}','1^{4}','1^{5}'},'EdgeColor','#F3B617','NodeColor','#F3B617')
% hold on
% plot(fkx_y(1),fky_y(1),'hr','MarkerSize',10)

s_y2=[2 3 2 4  3  2   4   5];   
t_y2=[1 1 3 1  4  5   5   1];
G_y2 = digraph(s_y2,t_y2);
fkx_y2=[   -30   -32  -30   -28   -30];      %%%等会儿删
fky_y2=[   -30   -30  -28   -30   -32];
% plot(G_y2,'XData',fkx_y2,'YData',fky_y2,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','2^{2}','2^{3}','2^{4}','2^{5}'},'EdgeColor','#973EE3','NodeColor','#973EE3')
% hold on
% plot(fkx_y2(1),fky_y2(1),'hr','MarkerSize',10)
% 
s_y3=[2 3 2 4  3  2   4   5];
t_y3=[1 1 3 1  4  5   5   1];
G_y3 = digraph(s_y3,t_y3);
fkx_y3=[   -30   -32  -30   -28   -30];
fky_y3=[    10    10   12    10    8];
% plot(G_y3,'XData',fkx_y3,'YData',fky_y3,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','3^{2}','3^{3}','3^{4}','3^{5}'},'EdgeColor','#A63D40','NodeColor','#A63D40')
% hold on
% plot(fkx_y3(1),fky_y3(1),'hr','MarkerSize',10)
% 
s_y4=[2 3 2 4  3  2   4   5];
t_y4=[1 1 3 1  4  5   5   1];
G_y4 = digraph(s_y4,t_y4);
fkx_y4=[   -60   -62  -60   -58   -60];
fky_y4=[    10    10   12    10   8];
% plot(G_y4,'XData',fkx_y4,'YData',fky_y4,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','4^{2}','4^{3}','4^{4}','4^{5}'},'EdgeColor','#3ECE00','NodeColor','#3ECE00')
% hold on
% plot(fkx_y4(1),fky_y4(1),'hr','MarkerSize',10)
% 
s_y5=[2 3 2 4  3  2   4   5];
t_y5=[1 1 3 1  4  5   5   1];
G_y5 = digraph(s_y5,t_y5);
fkx_y5=[   -60   -62  -60   -58   -60];
fky_y5=[   -30   -30  -28   -30   -32];
% plot(G_y5,'XData',fkx_y5,'YData',fky_y5,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','5^{2}','5^{3}','5^{4}','5^{5}'},'EdgeColor','#567DF4','NodeColor','#567DF4')
% hold on
% plot(fkx_y5(1),fky_y5(1),'hr','MarkerSize',10)
% 
s_y6=[2 3 2 4  3  2   4   5];
t_y6=[1 1 3 1  4  5   5   1];
G_y6 = digraph(s_y6,t_y6);
fkx_y6=[   -20   -22  -20    -18   -20];
fky_y6=[   -10   -10   -8    -10   -12];
% plot(G_y6,'XData',fkx_y6,'YData',fky_y6,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','6^{2}','6^{3}','6^{4}','6^{5}'},'EdgeColor','#14281D','NodeColor','#14281D')
% hold on
% plot(fkx_y6(1),fky_y6(1),'hr','MarkerSize',10)
%**************** 包围拓扑 **********************%
s2_y =[ 2  3  2  4  3  2   4   5];
t2_y =[ 1  1  3  1  4  5   5   1];
G2_y = digraph(s2_y,t2_y);
fkx2_y =[   -20.07   -22    -20.07   -18      -20.7];
fky2_y =[   -10.07   -10.07    -8     -10      -12];
% plot(G2_y,'XData',fkx2_y,'YData',fky2_y,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','1^{2}','1^{3}','1^{4}','1^{5}'},'EdgeColor','#F3B617','NodeColor','#F3B617')
% hold on
% plot(fkx2_y(1),fky2_y(1),'hr','MarkerSize',10)
% 
s2_y2 =[ 2  3  2  4  3  2   4   5];   
t2_y2 =[ 1  1  3  1  4  5   5   1];
G2_y2 = digraph(s2_y2,t2_y2);
fkx2_y2 =[   10.06     8      10.06      12      10.06];
fky2_y2 =[  -30.06   -30.06    -28     -30.06    -32];

% plot(G2_y2,'XData',fkx2_y2,'YData',fky2_y2,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','2^{2}','2^{3}','2^{4}','2^{5}'},'EdgeColor','#973EE3','NodeColor','#973EE3')
% hold on
% plot(fkx2_y2(1),fky2_y2(1),'hr','MarkerSize',10)
% 
% 
s2_y3 =[ 2  3  2  4  3  2   4   5];
t2_y3 =[ 1  1  3  1  4  5   5   1];
G2_y3 = digraph(s2_y3,t2_y3);
fkx2_y3 =[   10.05     8      10.05      12      10.05];
fky2_y3 =[   10.05   10.05     12       10.05     8];

% plot(G2_y3,'XData',fkx2_y3,'YData',fky2_y3,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','3^{2}','3^{3}','3^{4}','3^{5}'},'EdgeColor','#A63D40','NodeColor','#A63D40')
% hold on
% plot(fkx2_y3(1),fky2_y3(1),'hr','MarkerSize',10)
% 
% 
s2_y4 =[ 2  3  2  4  3  2   4   5];
t2_y4 =[ 1  1  3  1  4  5   5   1];
G2_y4 = digraph(s2_y4,t2_y4);
fkx2_y4 =[  -10.04     -12    -10.04      -8      -10.04];
fky2_y4 =[   10.04    10.04     12       10.04      8];

% plot(G2_y4,'XData',fkx2_y4,'YData',fky2_y4,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','4^{2}','4^{3}','4^{4}','4^{5}'},'EdgeColor','#3ECE00','NodeColor','#3ECE00')
% hold on
% plot(fkx2_y4(1),fky2_y4(1),'hr','MarkerSize',10)
% 
s2_y5 =[ 2  3  2  4  3  2   4   5];
t2_y5 =[ 1  1  3  1  4  5   5   1];
G2_y5 = digraph(s2_y5,t2_y5);
fkx2_y5 =[  -10.03     -12    -10.03      -8      -10.03];
fky2_y5 =[  -30.03    -30.03    -28     -30.03    -32];
% plot(G2_y5,'XData',fkx2_y5,'YData',fky2_y5,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','5^{2}','5^{3}','5^{4}','5^{5}'},'EdgeColor','#567DF4','NodeColor','#567DF4')
% hold on
% plot(fkx2_y5(1),fky2_y5(1),'hr','MarkerSize',10)
% 
s2_y6 =[ 2  3  2  4  3  2   4   5];
t2_y6 =[ 1  1  3  1  4  5   5   1];
G2_y6 = digraph(s2_y6,t2_y6);
fkx2_y6 =[  20.02     18      20.02      22       20.02];
fky2_y6 =[ -10.02    -10.02     -8      -10.02     -12];
% plot(G2_y6,'XData',fkx2_y6,'YData',fky2_y6,'LineWidth',2,'EdgeAlpha',1,'ArrowSize',12,'NodeFontSize',13,'NodeLabel',{'','6^{2}','6^{3}','6^{4}','6^{5}'},'EdgeColor','#14281D','NodeColor','#14281D')
% hold on
% plot(fkx2_y6(1),fky2_y6(1),'hr','MarkerSize',10)
%*************** 更新初始化 *********************%
R(1,:)=fkx2;
R(2,:)=fky2;
R1=R;
Num=numel(x);
[A_N,L,B,ld]=graphpart(G,Num);
x_initial=[];
for i=1:Num
    x_initial=[x_initial;x(i)];
    x_initial=[x_initial;y(i)];
end
x_initial;
v_initial=[-4;9;-8;0;4;-9;1;-4;15;10;2;2];
%initial state include position and velocity
x0=[x_initial;
    v_initial];
%% 仿真设置
T=1; % measurement time step
tf=30; % simulation length
add = 0.5;
signal_add = 0;
dt1=0.002;% time step for integration
x=x0;
Xarray=x;
% Uarray=zeros(Num,1);
% Sarray=[];
lb=2;
ub=2;
%************** 一阶初始化 **************************%
dotH=0;
Deltax_lt=fkx;
Deltay_lt=fky;
Deltax=R1(1,:);
Deltay=R1(2,:);
uarray=zeros(2*Num,1);
phiuarray=zeros(2*Num,1);
%************** 二阶初始化 **************************%
x_y0=[-72 20 -70  22   -68 20  -70  18]; v_y0=rand*[-4;9;-8;0;4;-9;1;-4;]';
x_y02=[-32 -30 -30  -28   -28 -30  -30  -32]; v_y2=rand*[10;-5;-8;0;4;-9;1;-4;]';
x_y03=[-32  10 -30   12   -28  10  -30    8]; v_y3=rand*[10;-5;-4;9;4;-9;1;-4;]';
x_y04=[-62  10 -60   12   -58  10  -60    8]; v_y4=rand*[10;-5;-4;9;-8;0;1;-4;]';
x_y05=[-62  -30 -60  -28  -58  -30  -60  -32]; v_y5=rand*[10;-5;-4;9;-8;0;4;-9;]';
x_y06=[-22  -10 -20  -8   -18  -10  -20  -12]; v_y6=rand*[-4;9;-8;0;4;-9;1;-4;]';

Num_y=numel(fkx_y);
Num_y2=numel(fkx_y2);
Num_y3=numel(fkx_y3);
Num_y4=numel(fkx_y4);
Num_y5=numel(fkx_y5);
Num_y6=numel(fkx_y6);

[A_N_y,L_y,B_y,ld_y]=graphpart(G_y,Num_y);
[A_N_y2,L_y2,B_y2,ld_y2]=graphpart(G_y2,Num_y2);
[A_N_y3,L_y3,B_y3,ld_y3]=graphpart(G_y3,Num_y3);
[A_N_y4,L_y4,B_y4,ld_y4]=graphpart(G_y4,Num_y4);
[A_N_y5,L_y5,B_y5,ld_y5]=graphpart(G_y5,Num_y5);
[A_N_y6 ,L_y6,B_y6,ld_y6]=graphpart(G_y6,Num_y6);

Deltax_lt_y=fkx_y;
 Deltay_lt_y=fky_y;
 Deltax_y=fkx2_y ;
 Deltay_y=fky2_y ;
 uarray_y=zeros(2*Num_y,1);
 phiuarray_y=zeros(2*Num_y,1); 
 
 Deltax_lt_y2=fkx_y2;
 Deltay_lt_y2=fky_y2;
 Deltax_y2=fkx2_y2 ;
 Deltay_y2=fky2_y2 ;
 uarray_y2=zeros(2*Num_y2,1);
 phiuarray_y2=zeros(2*Num_y2,1); 
 
 Deltax_lt_y3=fkx_y3;
 Deltay_lt_y3=fky_y3;
 Deltax_y3=fkx2_y3 ;
 Deltay_y3=fky2_y3 ;
 uarray_y3=zeros(2*Num_y3,1);
 phiuarray_y3=zeros(2*Num_y3,1); 
 
 Deltax_lt_y4=fkx_y4;
 Deltay_lt_y4=fky_y4;
 Deltax_y4=fkx2_y4 ;
 Deltay_y4=fky2_y4 ;
 uarray_y4=zeros(2*Num_y4,1);
 phiuarray_y4=zeros(2*Num_y4,1); 
 
 Deltax_lt_y5=fkx_y5;
 Deltay_lt_y5=fky_y5;
 Deltax_y5=fkx2_y5 ;
 Deltay_y5=fky2_y5 ;
 uarray_y5=zeros(2*Num_y5,1);
 phiuarray_y5=zeros(2*Num_y5,1); 
 
 Deltax_lt_y6=fkx_y6;
 Deltay_lt_y6=fky_y6;
 Deltax_y6=fkx2_y6 ;
 Deltay_y6=fky2_y6 ;
 uarray_y6=zeros(2*Num_y6,1);
 phiuarray_y6=zeros(2*Num_y6,1);

Xarray_y=[];
Xarray_y2=[];
Xarray_y3=[];
Xarray_y4=[];
Xarray_y5=[];
Xarray_y6=[];
%初始化
% x_y=[x_initial_add(1:2);x_y0';x_initial_add(3:4);v_y0'];
% Xarray_y=x_y;
x_y2=[x(1:2);x_y02';x(13:14);v_y2'];
Xarray_y2=x_y2;
x_y3=[x(3:4);x_y03';x(15:16);v_y3'];
Xarray_y3=x_y3;
x_y4=[x(5:6);x_y04';x(17:18);v_y4'];
Xarray_y4=x_y4;
x_y5=[x(7:8);x_y05';x(19:20);v_y5'];
Xarray_y5=x_y5;
x_y6=[x(9:10);x_y06';x(21:22);v_y6'];
Xarray_y6=x_y6;
%************** 神经网络初始化 *********************%
ell = 52;%神经元数目
W = zeros(ell*Num,2*Num);%初始权重矩阵
sigma = 2;%径基宽度，径基宽度决定了径向基函数下降的快慢
rho = 1;%更新系数
lbtf=ub*tf;

%************* 二阶初始化 ***************************%
W_y = zeros(ell*Num_y,2*Num_y);%初始权重矩阵
W_y2 = zeros(ell*Num_y2,2*Num_y2);%初始权重矩阵
W_y3 = zeros(ell*Num_y3,2*Num_y3);%初始权重矩阵
W_y4 = zeros(ell*Num_y4,2*Num_y4);%初始权重矩阵
W_y5 = zeros(ell*Num_y5,2*Num_y5);%初始权重矩阵
W_y6 = zeros(ell*Num_y6,2*Num_y6);%初始权重矩阵

%************** 系统更新 ****************************%
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
        
        bar_varepsilon1_y6=0;bar_varepsilon2_y6=0;
        dot_bar_varepsilon1_y6=0;dot_bar_varepsilon2_y6=0;

   end
   for tau = dt1+t :dt1: t+1 
       if lb*tf<tau&&tau<ub*tf
            [A_N,L,B,ld,dotH,fkx,fky]=graphswitch(G,G2,Num,tf,lb,ub,tau,Deltax,Deltay,Deltax_lt,Deltay_lt);
        else
            if  tau==ub*tf
                [A_N,L,B,ld]=graphpart(G2,Num); dotH=0; fkx=R1(1,:);
                fky=R1(2,:);
            end
       end
       if tau == add*tf
           signal_add = 1;
           %********* 增量系统状态更新 *************************************%
           x_initial_add(1) = x(1,end)-105;
           x_initial_add(2) = x(2,end)+17;
           fkx_y=[   x_initial_add(1)   x_initial_add(1)-2   x_initial_add(1)   x_initial_add(1)+2   x_initial_add(1)];
           fky_y=[   x_initial_add(2)   x_initial_add(2)   x_initial_add(2)+2    x_initial_add(2)   x_initial_add(2)-2];
           x_y0=[x_initial_add(1)-2 x_initial_add(2) x_initial_add(1)  x_initial_add(2)+2   x_initial_add(1)+2 x_initial_add(2)   x_initial_add(1)  x_initial_add(2)-2];
           x_y=[x_initial_add(1:2);x_y0';x_initial_add(3:4);v_y0'];
           Xarray_y=x_y;
           %****************************************************************%
           temp_x2 = x(2*Num+1:4*Num);
           temp_x1 = [x(1:2*Num);x_initial_add(1:2);temp_x2;x_initial_add(3:4)];
           x = temp_x1;
           Num = numel(x)/4;
           [A_N,L,B,ld]=graphpart(G_add,Num);
           fkx=[   -30    -30   -60   -60   -20    0  -70];
           fky=[   -30     10   10    -30   -10  -10  -10];
           bar_varepsilon1=[bar_varepsilon1;0;0];bar_varepsilon2 = [bar_varepsilon2;0;0];
           dot_bar_varepsilon1=[dot_bar_varepsilon1;0;0];dot_bar_varepsilon2=[dot_bar_varepsilon2;0;0];

           %*********** 神经网络大小更新 ************************%
           W = [W, zeros(ell*6,2)];
           W = [W;zeros(ell,2*Num)];
           %*********** 状态矩阵更新 ****************************%
           temp_X = Xarray(2*(Num-1)+1:end,:);
           temp_XX = [Xarray(1:2*(Num-1),:);zeros(2,size(Xarray,2));temp_X;zeros(2,size(Xarray,2))];
           Xarray = temp_XX;
           Xarray(2*Num-1:2*Num) = [x_initial_add(1:2)];
           Xarray(4*Num-1:4*Num) = [x_initial_add(3:4)];
           %************ 真实输入更新 ****************************%
           uarray = [uarray; zeros(2,size(uarray,2))];
           %************ 控制量更新 *******************************%
           phiuarray=[phiuarray;zeros(2,size(phiuarray,2))];
       end
       [Delta_State,u,phiu,varepsilon1,varepsilon2,Delta_W,bar_varepsilon1,bar_varepsilon2,dot_bar_varepsilon1,dot_bar_varepsilon2]=slidingcontrol3(tau,x,L,B,fkx,fky,A_N,dotH,W,bar_varepsilon1,bar_varepsilon2,dot_bar_varepsilon1,dot_bar_varepsilon2,lbtf,dt1,signal_add);
       x=x+Delta_State*dt1;
       W = W + Delta_W * dt1;
       Xarray=[Xarray x];
       uarray=[uarray u];
       phiuarray=[phiuarray phiu]; 
%        

       %********** 二阶 **********************%
       if signal_add ==1
        u_ldy=phiu(13:14);
          [Delta_State_y,u_y,phiu_y,varepsilon1_y,varepsilon2_y,Delta_W_y,bar_varepsilon1_y,bar_varepsilon2_y,dot_bar_varepsilon1_y,dot_bar_varepsilon2_y]=...
            slidingcontrol4(tau,x_y,L_y,B_y,fkx_y,fky_y,A_N_y,W_y,bar_varepsilon1_y,bar_varepsilon2_y,dot_bar_varepsilon1_y,dot_bar_varepsilon2_y,lbtf,dt1,u_ldy);
        x_y=x_y+Delta_State_y*dt1;
        W_y = W_y + Delta_W_y * dt1;
        Xarray_y=[Xarray_y x_y];
        uarray_y=[uarray_y u_y];
        phiuarray_y=[phiuarray_y phiu_y]; 
       end
%        
        u_ldy2=phiu(1:2);
 
        [Delta_State_y2,u_y2,phiu_y2,varepsilon1_y2,varepsilon2_y2,Delta_W_y2,bar_varepsilon1_y2,bar_varepsilon2_y2,dot_bar_varepsilon1_y2,dot_bar_varepsilon2_y2]=...
            slidingcontrol4(tau,x_y2,L_y2,B_y2,fkx_y2,fky_y2,A_N_y2,W_y2,bar_varepsilon1_y2,bar_varepsilon2_y2,dot_bar_varepsilon1_y2,dot_bar_varepsilon2_y2,lbtf,dt1,u_ldy2);
        x_y2=x_y2+Delta_State_y2*dt1;
        W_y2 = W_y2 + Delta_W_y2 * dt1;
        Xarray_y2=[Xarray_y2 x_y2];
        uarray_y2=[uarray_y2 u_y2];
        phiuarray_y2=[phiuarray_y2 phiu_y2];  
        u_ldy3=phiu(3:4); 

           [Delta_State_y3,u_y3,phiu_y3,varepsilon1_y3,varepsilon2_y3,Delta_W_y3,bar_varepsilon1_y3,bar_varepsilon2_y3,dot_bar_varepsilon1_y3,dot_bar_varepsilon2_y3]=...
            slidingcontrol4(tau,x_y3,L_y3,B_y3,fkx_y3,fky_y3,A_N_y3,W_y3,bar_varepsilon1_y3,bar_varepsilon2_y3,dot_bar_varepsilon1_y3,dot_bar_varepsilon2_y3,lbtf,dt1,u_ldy3);
        x_y3=x_y3+Delta_State_y3*dt1;
        W_y3 = W_y3 + Delta_W_y3 * dt1;
        Xarray_y3=[Xarray_y3 x_y3];
        uarray_y3=[uarray_y3 u_y3];
        phiuarray_y3=[phiuarray_y3 phiu_y3];  
        u_ldy4=phiu(5:6);    

          [Delta_State_y4,u_y4,phiu_y4,varepsilon1_y4,varepsilon2_y4,Delta_W_y4,bar_varepsilon1_y4,bar_varepsilon2_y4,dot_bar_varepsilon1_y4,dot_bar_varepsilon2_y4]=...
            slidingcontrol4(tau,x_y4,L_y4,B_y4,fkx_y4,fky_y4,A_N_y4,W_y4,bar_varepsilon1_y4,bar_varepsilon2_y4,dot_bar_varepsilon1_y4,dot_bar_varepsilon2_y4,lbtf,dt1,u_ldy4);
        x_y4=x_y4+Delta_State_y4*dt1;
        W_y4 = W_y4 + Delta_W_y4 * dt1;
        Xarray_y4=[Xarray_y4 x_y4];
        uarray_y4=[uarray_y4 u_y4];
        phiuarray_y4=[phiuarray_y4 phiu_y4]; 
        u_ldy5=phiu(7:8);

          [Delta_State_y5,u_y5,phiu_y5,varepsilon1_y5,varepsilon2_y5,Delta_W_y5,bar_varepsilon1_y5,bar_varepsilon2_y5,dot_bar_varepsilon1_y5,dot_bar_varepsilon2_y5]=...
            slidingcontrol4(tau,x_y5,L_y5,B_y5,fkx_y5,fky_y5,A_N_y5,W_y5,bar_varepsilon1_y5,bar_varepsilon2_y5,dot_bar_varepsilon1_y5,dot_bar_varepsilon2_y5,lbtf,dt1,u_ldy5);
        x_y5=x_y5+Delta_State_y5*dt1;
        W_y5 = W_y5 + Delta_W_y5 * dt1;
        Xarray_y5=[Xarray_y5 x_y5];
        uarray_y5=[uarray_y5 u_y5];
        phiuarray_y5=[phiuarray_y5 phiu_y5]; 
        u_ldy6=phiu(9:10);   

         [Delta_State_y6,u_y6,phiu_y6,varepsilon1_y6,varepsilon2_y6,Delta_W_y6,bar_varepsilon1_y6,bar_varepsilon2_y6,dot_bar_varepsilon1_y6,dot_bar_varepsilon2_y6]=...
            slidingcontrol4(tau,x_y6,L_y6,B_y6,fkx_y6,fky_y6,A_N_y6,W_y6,bar_varepsilon1_y6,bar_varepsilon2_y6,dot_bar_varepsilon1_y6,dot_bar_varepsilon2_y6,lbtf,dt1,u_ldy6);
        x_y6=x_y6+Delta_State_y6*dt1;
        W_y6 = W_y6 + Delta_W_y6 * dt1;
        Xarray_y6=[Xarray_y6 x_y6];
        uarray_y6=[uarray_y6 u_y6];
        phiuarray_y6=[phiuarray_y6 phiu_y6];

   end
end
% 
save('smooth_1')
%********************* plot *********************************************%
t = 0:dt1:tf+1;
t_A = 0:dt1:tf*add;
n = size(t_A,2);
%% 1_1/x轴位置
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
% 
% 
% %% 1_2/x轴位置误差
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
% 
% 
% %% 1_3/x轴二阶位置误差
% figure('NumberTitle', 'on') 
% h1=plot(t,Xarray_y(3,:)-Xarray_y(1,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(5,:)-Xarray_y(1,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(7,:)-Xarray_y(1,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
% plot(t,Xarray_y(9,:)-Xarray_y(1,:),'-','Color','#F3B617','LineWidth',1.5); hold on;
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
% ylabel('\it{e}\rm{_{1}/m}','FontSize',16,'FontName','Times New Roman')
% xlim([0 20])
% ylim([-4 5]);
% legend([h1,h2,h3,h4,h5,h6],'E_{1,1}','E_{2,1}','E_{3,1}','E_{4,1}','E_{5,1}','E_{6,1}','FontSize',10)
% 
% 
% 
% %% 2_1/y轴位置
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
% 
% %% 2_2/y轴位置误差
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
% 
% %% 2_3/y轴二阶位置误差
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
% ylim([-4 5]);
% legend([h1,h2,h3,h4,h5,h6],'E_{1,1}','E_{2,1}','E_{3,1}','E_{4,1}','E_{5,1}','E_{6,1}','FontSize',10)
% 
% 
% %% 3_1/x轴速度
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
% 
% %% 3_2/x轴速度误差
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
% 
% %% 3_3/x轴二阶速度误差
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
% ylabel('\it{E}\rm{_{1}/m}','FontSize',16,'FontName','Times New Roman')
% xlim([0 20])
% ylim([-25 15]);
% legend([h1,h2,h3,h4,h5,h6],'E_{1,2}','E_{2,2}','E_{3,2}','E_{4,2}','E_{5,2}','E_{6,2}','FontSize',10)
% 
% 
% %% 4_1/y轴速度
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
% 
% 
% %% 4_2/y轴速度误差
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
% 
% %% 4_3/y轴二阶速度误差
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
% ylabel('\it{E}\rm{_{1}/m}','FontSize',16,'FontName','Times New Roman')
% xlim([0 20])
% ylim([-20 15]);
% legend([h1,h2,h3,h4,h5,h6],'E_{1,2}','E_{2,2}','E_{3,2}','E_{4,2}','E_{5,2}','E_{6,2}','FontSize',10)

%% 5_1/路径图
figure('NumberTitle', 'on')              %图3瞬态过度位置追踪
plot(Xarray(1,:),Xarray(2,:),'-','Color','#F3B617','LineWidth',1.5);hold on;
plot(Xarray(3,:),Xarray(4,:),'-.','Color','#973EE3' ,'LineWidth',1.5);hold on;
plot(Xarray(5,:),Xarray(6,:),':','Color','#A63D40','LineWidth',1.5);hold on;
plot(Xarray(7,:),Xarray(8,:),'--','Color','#3ECE00','LineWidth',1.5);hold on;
plot(Xarray(9,:),Xarray(10,:),'-.','Color','#567DF4','LineWidth',1.5);hold on;%*
plot(Xarray(11,:),Xarray(12,:),'--','Color','#14281D','LineWidth',1.5);hold on;
plot(Xarray(13,n:end),Xarray(14,n:end),'Color','#DB162F','LineWidth',2);hold on;

plot(Xarray_y(1,:),Xarray_y(2,:),'-','Color','#F3B617','LineWidth',1);hold on;
plot(Xarray_y(3,:),Xarray_y(4,:),'-.','Color','#F3B617','LineWidth',1);hold on;
plot(Xarray_y(5,:),Xarray_y(6,:),':','Color','#F3B617','LineWidth',1);hold on;
plot(Xarray_y(7,:),Xarray_y(8,:),'--','Color','#F3B617','LineWidth',1);hold on;
plot(Xarray_y(9,:),Xarray_y(10,:),'-.','Color','#F3B617','LineWidth',1);hold on;%*

plot(Xarray_y2(1,:),Xarray_y2(2,:),'-','Color','#973EE3','LineWidth',1);hold on;
plot(Xarray_y2(3,:),Xarray_y2(4,:),'-.','Color','#973EE3','LineWidth',1);hold on;
plot(Xarray_y2(5,:),Xarray_y2(6,:),':','Color','#973EE3','LineWidth',1);hold on;
plot(Xarray_y2(7,:),Xarray_y2(8,:),'--','Color','#973EE3','LineWidth',1);hold on;
plot(Xarray_y2(9,:),Xarray_y2(10,:),'-.','Color','#973EE3','LineWidth',1);hold on;%*

plot(Xarray_y3(1,:),Xarray_y3(2,:),'-','Color','#A63D40','LineWidth',1);hold on;
plot(Xarray_y3(3,:),Xarray_y3(4,:),'-.','Color','#A63D40','LineWidth',1);hold on;
plot(Xarray_y3(5,:),Xarray_y3(6,:),':','Color','#A63D40','LineWidth',1);hold on;
plot(Xarray_y3(7,:),Xarray_y3(8,:),'--','Color','#A63D40','LineWidth',1);hold on;
plot(Xarray_y3(9,:),Xarray_y3(10,:),'-.','Color','#A63D40','LineWidth',1);hold on;%*
% 
plot(Xarray_y4(1,:),Xarray_y4(2,:),'-','Color','#3ECE00','LineWidth',1);hold on;
plot(Xarray_y4(3,:),Xarray_y4(4,:),'-.','Color','#3ECE00','LineWidth',1);hold on;
plot(Xarray_y4(5,:),Xarray_y4(6,:),':','Color','#3ECE00','LineWidth',1);hold on;
plot(Xarray_y4(7,:),Xarray_y4(8,:),'--','Color','#3ECE00','LineWidth',1);hold on;
plot(Xarray_y4(9,:),Xarray_y4(10,:),'-.','Color','#3ECE00','LineWidth',1);hold on;%*

plot(Xarray_y5(1,:),Xarray_y5(2,:),'-','Color','#567DF4','LineWidth',1);hold on;
plot(Xarray_y5(3,:),Xarray_y5(4,:),'-.','Color','#567DF4','LineWidth',1);hold on;
plot(Xarray_y5(5,:),Xarray_y5(6,:),':','Color','#567DF4','LineWidth',1);hold on;
plot(Xarray_y5(7,:),Xarray_y5(8,:),'--','Color','#567DF4','LineWidth',1);hold on;
plot(Xarray_y5(9,:),Xarray_y5(10,:),'-.','Color','#567DF4','LineWidth',1);hold on;%*

plot(Xarray_y6(1,:),Xarray_y6(2,:),'-','Color','#14281D','LineWidth',1);hold on;
plot(Xarray_y6(3,:),Xarray_y6(4,:),'-.','Color','#14281D','LineWidth',1);hold on;
plot(Xarray_y6(5,:),Xarray_y6(6,:),':','Color','#14281D','LineWidth',1);hold on;
plot(Xarray_y6(7,:),Xarray_y6(8,:),'--','Color','#14281D','LineWidth',1);hold on;
plot(Xarray_y6(9,:),Xarray_y6(10,:),'-.','Color','#14281D','LineWidth',1);hold on;%*

plot(G,'XData',Xarray(1:2:2*(Num-1)-1,1),'YData',Xarray(2:2:2*(Num-1),1),'LineWidth',2,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#083DB3','NodeColor','#083DB3','NodeLabel',{'  1','  2','  3','  4','  5','  6'});hold on;
plot(G,'XData',Xarray(1:2:2*(Num-1)-1,end),'YData',Xarray(2:2:2*(Num-1),end),'LineWidth',2,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#083DB3','NodeColor','#083DB3','NodeLabel',{'  1','  2','  3','  4','  5','  6'});hold on;

plot(G_y,'XData',Xarray_y(1:2:9,1),'YData',Xarray_y(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#F3B617','NodeColor','#F3B617','NodeLabel',{' ',' ',' ',' ',' '});hold on;
plot(G_y2,'XData',Xarray_y2(1:2:9,1),'YData',Xarray_y2(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#973EE3','NodeColor','#973EE3','NodeLabel',{' ',' ',' ',' ',' '});hold on;
plot(G_y3,'XData',Xarray_y3(1:2:9,1),'YData',Xarray_y3(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#A63D40','NodeColor','#A63D40','NodeLabel',{' ',' ',' ',' ',' '});hold on;
plot(G_y4,'XData',Xarray_y4(1:2:9,1),'YData',Xarray_y4(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#3ECE00','NodeColor','#3ECE00','NodeLabel',{' ',' ',' ',' ',' '});hold on;
plot(G_y5,'XData',Xarray_y5(1:2:9,1),'YData',Xarray_y5(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#567DF4','NodeColor','#567DF4','NodeLabel',{' ',' ','  ',' ',' '});hold on;
plot(G_y6,'XData',Xarray_y6(1:2:9,1),'YData',Xarray_y6(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#14281D','NodeColor','#14281D','NodeLabel',{' ',' ',' ',' ',' }'});hold on;

plot(G2_y,'XData',Xarray_y(1:2:9,end),'YData',Xarray_y(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#F3B617','NodeColor','#F3B617','NodeLabel',{' ',' ',' ',' ',' '});hold on;
plot(G2_y2,'XData',Xarray_y2(1:2:9,end),'YData',Xarray_y2(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#973EE3','NodeColor','#973EE3','NodeLabel',{' ',' ',' ',' ',' '});hold on;
plot(G2_y3,'XData',Xarray_y3(1:2:9,end),'YData',Xarray_y3(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#A63D40','NodeColor','#A63D40','NodeLabel',{' ',' ',' ',' ',' '});hold on;
plot(G2_y4,'XData',Xarray_y4(1:2:9,end),'YData',Xarray_y4(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#3ECE00','NodeColor','#3ECE00','NodeLabel',{' ',' ',' ',' ',' '});hold on;
plot(G2_y5,'XData',Xarray_y5(1:2:9,end),'YData',Xarray_y5(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#567DF4','NodeColor','#567DF4','NodeLabel',{' ',' ',' ',' ',' '});hold on;
plot(G2_y6,'XData',Xarray_y6(1:2:9,end),'YData',Xarray_y6(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#14281D','NodeColor','#14281D','NodeLabel',{' ',' ',' ',' ',' '});hold on;

title('集群系统跟踪—包围控制路径图','FontSize',16,'FontName','宋体')

% %% 6_1输入图
% figure('NumberTitle', 'on')                 %11
% h1=plot(t,phiuarray,'-r','LineWidth',1);hold on;
% h2=plot(t,uarray,'--b','LineWidth',0.5);hold on;
% h3=plot([0,tf],[100,100],'--k','LineWidth',0.5);hold off;
% set(gca,'FontSize',12); set(gcf,'Color','White');
% xlabel('\it{t}\rm{/s}','FontSize',16,'FontName','Times New Roman');
% ylabel('\it{u(v)}\rm{/m\cdots^{-2}}','FontSize',16,'FontName','Times New Roman');
% legend([h1(1),h2(1)],'u(v)','v','FontSize',10);
% axis([0, tf, -200, 500]);
% 
% figure('NumberTitle', 'on') 
% h1=plot(t,phiuarray_y,'-r','LineWidth',1);hold on;
% h2=plot(t,uarray_y,'--b','LineWidth',0.5);hold on;
% h3=plot([0,tf],[100,100],'--k','LineWidth',0.5);hold off;
% set(gca,'FontSize',12); set(gcf,'Color','White');
% xlabel('\it{t}\rm{/s}','FontSize',16,'FontName','Times New Roman');
% ylabel('\it{u(v)}\rm{/m\cdots^{-2}}','FontSize',16,'FontName','Times New Roman');
% legend([h1(1),h2(1)],'u(v)','v','FontSize',10);
% axis([0, tf, -200, 500]);

%**************** test ***************************************************%
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
% % plot(Xarray_y2(1,:),Xarray_y2(2,:),'-','Color','#973EE3','LineWidth',1);hold on;
% % plot(Xarray_y2(3,:),Xarray_y2(4,:),'-.','Color','#973EE3','LineWidth',1);hold on;
% % plot(Xarray_y2(5,:),Xarray_y2(6,:),':','Color','#973EE3','LineWidth',1);hold on;
% % plot(Xarray_y2(7,:),Xarray_y2(8,:),'--','Color','#973EE3','LineWidth',1);hold on;
% % plot(Xarray_y2(9,:),Xarray_y2(10,:),'-.','Color','#973EE3','LineWidth',1);hold on;%*
% % 
% % plot(Xarray_y3(1,:),Xarray_y3(2,:),'-','Color','#A63D40','LineWidth',1);hold on;
% % plot(Xarray_y3(3,:),Xarray_y3(4,:),'-.','Color','#A63D40','LineWidth',1);hold on;
% % plot(Xarray_y3(5,:),Xarray_y3(6,:),':','Color','#A63D40','LineWidth',1);hold on;
% % plot(Xarray_y3(7,:),Xarray_y3(8,:),'--','Color','#A63D40','LineWidth',1);hold on;
% % plot(Xarray_y3(9,:),Xarray_y3(10,:),'-.','Color','#A63D40','LineWidth',1);hold on;%*
% % % 
% % plot(Xarray_y4(1,:),Xarray_y4(2,:),'-','Color','#3ECE00','LineWidth',1);hold on;
% % plot(Xarray_y4(3,:),Xarray_y4(4,:),'-.','Color','#3ECE00','LineWidth',1);hold on;
% % plot(Xarray_y4(5,:),Xarray_y4(6,:),':','Color','#3ECE00','LineWidth',1);hold on;
% % plot(Xarray_y4(7,:),Xarray_y4(8,:),'--','Color','#3ECE00','LineWidth',1);hold on;
% % plot(Xarray_y4(9,:),Xarray_y4(10,:),'-.','Color','#3ECE00','LineWidth',1);hold on;%*
% % 
% % plot(Xarray_y5(1,:),Xarray_y5(2,:),'-','Color','#567DF4','LineWidth',1);hold on;
% % plot(Xarray_y5(3,:),Xarray_y5(4,:),'-.','Color','#567DF4','LineWidth',1);hold on;
% % plot(Xarray_y5(5,:),Xarray_y5(6,:),':','Color','#567DF4','LineWidth',1);hold on;
% % plot(Xarray_y5(7,:),Xarray_y5(8,:),'--','Color','#567DF4','LineWidth',1);hold on;
% % plot(Xarray_y5(9,:),Xarray_y5(10,:),'-.','Color','#567DF4','LineWidth',1);hold on;%*
% % 
% % plot(Xarray_y6(1,:),Xarray_y6(2,:),'-','Color','#14281D','LineWidth',1);hold on;
% % plot(Xarray_y6(3,:),Xarray_y6(4,:),'-.','Color','#14281D','LineWidth',1);hold on;
% % plot(Xarray_y6(5,:),Xarray_y6(6,:),':','Color','#14281D','LineWidth',1);hold on;
% % plot(Xarray_y6(7,:),Xarray_y6(8,:),'--','Color','#14281D','LineWidth',1);hold on;
% % plot(Xarray_y6(9,:),Xarray_y6(10,:),'-.','Color','#14281D','LineWidth',1);hold on;%*
% 
% plot(G,'XData',Xarray(1:2:13,1),'YData',Xarray(2:2:14,1),'LineWidth',2,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#083DB3','NodeColor','#083DB3');hold on;
% plot(G2,'XData',Xarray(1:2:13,end),'YData',Xarray(2:2:14,end),'LineWidth',2,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#083DB3','NodeColor','#083DB3');hold on;
% 
% plot(G_y,'XData',Xarray_y(1:2:9,1),'YData',Xarray_y(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#F3B617','NodeColor','#F3B617','NodeLabel',{' ','1^{2}','1^{3}','1^{4}','1^{5}'});hold on;
% plot(G_y2,'XData',Xarray_y2(1:2:9,1),'YData',Xarray_y2(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#973EE3','NodeColor','#973EE3','NodeLabel',{' ','2^{2}','2^{3}','2^{4}','2^{5}'});hold on;
% plot(G_y3,'XData',Xarray_y3(1:2:9,1),'YData',Xarray_y3(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#A63D40','NodeColor','#A63D40','NodeLabel',{' ','3^{2}','3^{3}','3^{4}','3^{5}'});hold on;
% plot(G_y4,'XData',Xarray_y4(1:2:9,1),'YData',Xarray_y4(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#3ECE00','NodeColor','#3ECE00','NodeLabel',{' ','4^{2}','4^{3}','4^{4}','4^{5}'});hold on;
% plot(G_y5,'XData',Xarray_y5(1:2:9,1),'YData',Xarray_y5(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#567DF4','NodeColor','#567DF4','NodeLabel',{' ','5^{2}','5^{3}','5^{4}','5^{5}'});hold on;
% plot(G_y6,'XData',Xarray_y6(1:2:9,1),'YData',Xarray_y6(2:2:10,1),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#14281D','NodeColor','#14281D','NodeLabel',{' ','6^{2}','6^{3}','6^{4}','6^{5}'});hold on;
% 
% plot(G2_y,'XData',Xarray_y(1:2:9,end),'YData',Xarray_y(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#F3B617','NodeColor','#F3B617','NodeLabel',{' ','1^{2}','1^{3}','1^{4}','1^{5}'});hold on;
% plot(G2_y2,'XData',Xarray_y2(1:2:9,end),'YData',Xarray_y2(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#973EE3','NodeColor','#973EE3','NodeLabel',{' ','2^{2}','2^{3}','2^{4}','2^{5}'});hold on;
% plot(G2_y3,'XData',Xarray_y3(1:2:9,end),'YData',Xarray_y3(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#A63D40','NodeColor','#A63D40','NodeLabel',{' ','3^{2}','3^{3}','3^{4}','3^{5}'});hold on;
% plot(G2_y4,'XData',Xarray_y4(1:2:9,end),'YData',Xarray_y4(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#3ECE00','NodeColor','#3ECE00','NodeLabel',{' ','4^{2}','4^{3}','4^{4}','4^{5}'});hold on;
% plot(G2_y5,'XData',Xarray_y5(1:2:9,end),'YData',Xarray_y5(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#567DF4','NodeColor','#567DF4','NodeLabel',{' ','5^{2}','5^{3}','5^{4}','5^{5}'});hold on;
% plot(G2_y6,'XData',Xarray_y6(1:2:9,end),'YData',Xarray_y6(2:2:10,end),'LineWidth',1.5,'EdgeAlpha',1,'ArrowSize',10,'NodeFontSize',12,'EdgeColor','#14281D','NodeColor','#14281D','NodeLabel',{' ','6^{2}','6^{3}','6^{4}','6^{5}'});hold on;
% 
