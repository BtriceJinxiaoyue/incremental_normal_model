function [Delta_State,u,phiu,varepsilon1,varepsilon2,Delta_W,bar_varepsilon1,bar_varepsilon2,dot_bar_varepsilon1,dot_bar_varepsilon2]=...
    slidingcontrol4(t,x,L,B,fkx,fky,fkphi,A_N,W,bar_varepsilon1,bar_varepsilon2,dot_bar_varepsilon1,dot_bar_varepsilon2,lbtf,dt1,u_ldy)
ld=find(sum(B)==1);%leader
Num=numel(L(1,:));
I = eye(3);
H=L+B;
H11=inv(H);
F=kron(L+B,I);
F1=inv(F);
b=sum(B);
b=b';
x_1=x(1:3*Num);
x_2=x(3*Num+1:6*Num);
% omega=sum(sum(F.^2))*sum(sum(F1.^2));
% omega=norm(F)*norm(F1);
c0=8;%\varpi_{0}
c1=60;
c2=50;
mu=0.5;
%反步控制滤波设计参数
tau = 100;
dt=0.0005;
%alpha=411/221;
% rho1=2;
% rho2=2;
% CH=[zeros(2*Num) eye(2*Num);zeros(2*Num) zeros(2*Num)];

G1 = zeros(3*Num,1);
G2 = zeros(3*Num,1);
X11=[ ];X12=[ ];X21=[ ];X22=[ ];
for i = 1:Num
    x_11 = x_1(2*i-1); x_12 = x_1(2*i);%一阶X方向、Y方向
    x_21 = x_2(2*i-1); x_22 = x_2(2*i);%二阶X方向、Y方向
    X11(i)=  x_11;X12(i)=  x_12;
    X21(i)=  x_21;X22(i)=  x_22;
%     G1(2*i-1:2*i) = [sin(x_11) ;sin(x_12) ];
%     G2(2*i-1:2*i) = [sin(x_21).*cos(x_21);cos(x_22).*cos(x_22)];
%     G1(2*i-1:2*i) = [-x_11*cos(t);-x_12*cos(t) ];
%     G2(2*i-1:2*i) = [-x_21*sin(t);-x_22*sin(t)];
%  G1(2*i-1:2*i) = [x_11 ;x_12 ];
%  G2(2*i-1:2*i) = [x_21;x_22];
end


tildef=zeros(3*Num,1);%formation keep distance
for i=1:Num
    for j=1:Num
        if A_N(i,j)>0
            tildef(3*i-2,:)=tildef(3*i-2,:)+A_N(i,j)*(fkx(i)-fkx(j));
            tildef(3*i-1,:)=tildef(3*i-1,:)+A_N(i,j)*(fky(i)-fky(j));
            tildef(3*i,:)=tildef(3*i,:)+A_N(i,j)*(fkphi(i)-fkphi(j));
        end
    end
end
tildefx=zeros(3*Num,1);%formation keep distance
tildefv=zeros(3*Num,1);
tildefphi = zeros(3*Num,1);
if t>lbtf
    for i=1:Num
        for j=1:Num
            if A_N(i,j)>0
                temp=fkx(i)-fkx(j);
                temp2=fky(i)-fky(j);
                ttemp=norm([temp,temp2]);
                tildefx(2*i-1,:)=tildefx(2*i-1,:)+A_N(i,j)*(temp/(ttemp+eps)*10*sin(t-lbtf-dt1));
                tildefx(2*i,:)=tildefx(2*i,:)+A_N(i,j)*(temp2/(ttemp+eps)*10*sin(t-lbtf-dt1));
            end
        end
    end
end

alpha11=[];
u_ld=[cos(t)*2.5;sin(t)*2.5;0];%leader's input
tildex=x(1:3*Num)-kron(ones(Num,1),x(3*ld-2:3*ld));
% varepsilon1=F*tildex+tildef+tildefx;
varepsilon1=F*tildex-tildef-tildefx;
if t == [dt1]
    bar_varepsilon1 =varepsilon1;
    dot_bar_varepsilon1 = -tau*(bar_varepsilon1 -varepsilon1);
else
    bar_varepsilon1 = bar_varepsilon1 + dot_bar_varepsilon1*dt;
    dot_bar_varepsilon1 = -tau*(bar_varepsilon1 -varepsilon1);
end
alpha1=-F1*(c1*varepsilon1+dot_bar_varepsilon1)-x(3*Num+1:6*Num);
varepsilon2=x(3*Num+1:6*Num)-alpha1;%公式10
if t == [dt1]
    bar_varepsilon2 =varepsilon2;
    dot_bar_varepsilon2 = -tau*(bar_varepsilon2 -varepsilon2);
else
    bar_varepsilon2 = bar_varepsilon2 + dot_bar_varepsilon2*dt;
    dot_bar_varepsilon2= -tau*(bar_varepsilon2 -varepsilon2);
end
xd1=x(3*ld-2:3*ld-1);
xd2=x(3*(ld+Num)-2:3*(ld+Num)-1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%径向基神经网络
ell = 52;%神经元数目
sigma = 2;%径基宽度，径基宽度决定了径向基函数下降的快慢
rho = 1;
phi1 = zeros(ell,1); phi2 = zeros(ell,1);  phi3 = zeros(ell,1);%7个自主体在2个维度上的隐藏层输出
phi4 = zeros(ell,1); phi5 = zeros(ell,1); 
%phi6 = zeros(ell,1); phi7 = zeros(ell,1);
for i = 1:ell
    phi1(i) = exp(-(([X11(1);X12(1)] - [7;7]+[1/3;1/3]*i)'*([X11(1);X12(1)]  - [7;7]+[1/3;1/3]*i) +( xd1 - [7;7]+[1/3;1/3]*i)'*(xd1 - [7;7]+[1/3;1/3]*i) ...
        + ([X21(1);X22(1)] - [7;7]+[1/3;1/3]*i)'*([X21(1);X22(1)] - [7;7]+[1/3;1/3]*i))+(xd2 - [7;7]+[1/3;1/3]*i)'*(xd2 - [7;7]+[1/3;1/3]*i) / 4*sigma^2);
    phi2(i) = exp(-(([X11(2);X12(2)]  - [7;7]+[1/3;1/3]*i)'*([X11(2);X12(2)]  - [7;7]+[1/3;1/3]*i) +(xd1 - [7;7]+[1/3;1/3]*i)'*(xd1 - [7;7]+[1/3;1/3]*i) ...
        + ([X21(2);X22(2)] - [7;7]+[1/3;1/3]*i)'*([X21(2);X22(2)] - [7;7]+[1/3;1/3]*i))+(xd2 - [7;7]+[1/3;1/3]*i)'*(xd2 - [7;7]+[1/3;1/3]*i) / 4*sigma^2);
     phi3(i) = exp(-(([X11(3);X12(3)]  - [7;7]+[1/3;1/3]*i)'*([X11(3);X12(3)]  - [7;7]+[1/3;1/3]*i) +(xd1 - [7;7]+[1/3;1/3]*i)'*(xd1 - [7;7]+[1/3;1/3]*i) ...
         + ([X21(3);X22(3)]  - [7;7]+[1/3;1/3]*i)'*([X21(3);X22(3)]  - [7;7]+[1/3;1/3]*i))+(xd2 - [7;7]+[1/3;1/3]*i)'*(xd2 - [7;7]+[1/3;1/3]*i) / 4*sigma^2);
     phi4(i) = exp(-(([X11(4);X12(4)]  - [7;7]+[1/3;1/3]*i)'*([X11(4);X12(4)]  - [7;7]+[1/3;1/3]*i) +(xd1 - [7;7]+[1/3;1/3]*i)'*(xd1 - [7;7]+[1/3;1/3]*i) ...
        + ([X21(4);X22(4)] - [7;7]+[1/3;1/3]*i)'*([X21(4);X22(4)]  - [7;7]+[1/3;1/3]*i))+(xd2 - [7;7]+[1/3;1/3]*i)'*(xd2 - [7;7]+[1/3;1/3]*i) / 4*sigma^2);
     phi5(i) = exp(-(([X11(5);X12(5)]  - [7;7]+[1/3;1/3]*i)'*([X11(5);X12(5)]  - [7;7]+[1/3;1/3]*i) +(xd1 - [7;7]+[1/3;1/3]*i)'*(xd1 - [7;7]+[1/3;1/3]*i) ...
        + ([X21(5);X22(5)] - [7;7]+[1/3;1/3]*i)'*([X21(5);X22(5)] - [7;7]+[1/3;1/3]*i))+(xd2 - [7;7]+[1/3;1/3]*i)'*(xd2 - [7;7]+[1/3;1/3]*i) / 4*sigma^2);
%     phi6(i) = exp(-(([X11(6);X12(6)]  - [7;7]+[1/3;1/3]*i)'*([X11(6);X12(6)] - [7;7]+[1/3;1/3]*i) +(xd1- [7;7]+[1/3;1/3]*i)'*(xd1- [7;7]+[1/3;1/3]*i) ...
%         + ([X21(6);X22(6)]  - [7;7]+[1/3;1/3]*i)'*([X21(6);X22(6)]  - [7;7]+[1/3;1/3]*i))+(xd2- [7;7]+[1/3;1/3]*i)'*(xd2 - [7;7]+[1/3;1/3]*i) / 4*sigma^2);
%     phi7(i) = exp(-(([X11(2);X12(2)]  - [7;7]+[1/3;1/3]*i)'*([X11(2);X12(2)]  - [7;7]+[1/3;1/3]*i) +(xd1 - [7;7]+[1/3;1/3]*i)'*(xd1- [7;7]+[1/3;1/3]*i) ...
%         + ([X21(7);X22(7)]  - [7;7]+[1/3;1/3]*i)'*([X21(7);X22(7)]  - [7;7]+[1/3;1/3]*i))+(xd2 - [7;7]+[1/3;1/3]*i)'*(xd2- [7;7]+[1/3;1/3]*i) / 4*sigma^2);
end
Phi  = [phi1; phi2; phi3; phi4; phi5];
%Phi  = [phi1; phi2; phi3; phi4; phi5; phi6; phi7];
F_hat = W' * Phi;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
u1=kron(b,u_ldy);

% u1=(F1)*kron(b,u_ld);
% alpha11=[0 ;alpha1];
% dotalp1=diff(alpha11,1);
% u1=-(F1)*(dotH*(varepsilon2-tildefx)+varepsilon1-dotalp1+c2*(varepsilon2-alpha1))-(F1)*tildefv;
% %  u1=(F)*kron(b,u_ld);

u2=-c2*varepsilon2-F_hat-F*varepsilon1;
% u2=-1/alpha/c1*(F1)*diag(varepsilon2.^(1-alpha))*varepsilon2;%
% % u2=-mu*(F1)*(varepsilon2+dotH*(varepsilon1-tildef))-F1*tildefv;%
% u3=-(F1)*sign(diag(varepsilon2.^(alpha-1))*S)*(omega*rho1*sum(F*tildex)+omega*rho2*sum(F*tildev)+c);
% % u3=-(F1)*sign(S)*(f+c0);
u=u1+u2;
%u(1:3)=u_ldy;
%  phiu= u; 
u_h=100;
phiu= u_h*tanh(u/ u_h);
phiu(1:3)=u_ldy;
% % dx=CH*x+[zeros(2*Num,1);-x(1:2*Num)-x(1:2*Num)*cos(t)-x(2*Num+1:4*Num)*sin(t)-cos(x(2*Num+1:4*Num))+u];
H0 = [zeros(3*Num) eye(3*Num); zeros(3*Num) zeros(3*Num)];
H1 = [zeros(3*Num);eye(3*Num)];
H2 = [eye(3*Num) ;zeros(3*Num)];
%G1 = -0.01*sin(x(1:3*Num,1));
% if t>lbtf
%   G1 = zeros(2*Num,1);
% end
Delta_State = H0 * x + H1 * (phiu+G2)+H2*G1;
if isnan(Delta_State)
   pause
end
Delta_W =-mu*Phi*(dot_bar_varepsilon2+varepsilon1+c2*varepsilon2)';

end
