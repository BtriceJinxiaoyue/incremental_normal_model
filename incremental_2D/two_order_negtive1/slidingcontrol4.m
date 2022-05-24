function [Delta_State,u,phiu,varepsilon1,varepsilon2,Delta_W,bar_varepsilon1,bar_varepsilon2,dot_bar_varepsilon1,dot_bar_varepsilon2]=...
    slidingcontrol4(t,x,L,B,fkx,fky,A_N,W,bar_varepsilon1,bar_varepsilon2,dot_bar_varepsilon1,dot_bar_varepsilon2,lbtf,dt1,u_ldy)
ld=find(sum(B)==1);%leader
Num=numel(L(1,:));   %ֵΪ3
I = eye(2);
H=L+B;
H11=inv(H);
F=kron(L+B,I);
F1=inv(F);
b=sum(B);
b=b';
x_1=x(1:10);
x_2=x(11:20);
% omega=sum(sum(F.^2))*sum(sum(F1.^2));
% omega=norm(F)*norm(F1);
c0=8;%\varpi_{0}
if 10<t && t<lbtf
    c1=6*(50-t);
else if t>=lbtf
        c1=6*(32-lbtf);
     else
         c1 = 6*15;
     end
end 
% if 10<t 
%     c1=6*(30-t);
% else
%     c1 = 6*15;
% end 
%c1=20;
% if t>=10
%     c1 = 50;
% end
c2=50;
mu=1;
%���������˲���Ʋ���
tau = 100;
dt=0.0005;
%alpha=411/221;
% rho1=2;
% rho2=2;
% CH=[zeros(2*Num) eye(2*Num);zeros(2*Num) zeros(2*Num)];

G1 = zeros(2*Num,1);
G2 = zeros(2*Num,1);
X11=[ ];X12=[ ];X21=[ ];X22=[ ];
for i = 1:Num
    x_11 = x_1(2*i-1); x_12 = x_1(2*i);%һ��X����Y����
    x_21 = x_2(2*i-1); x_22 = x_2(2*i);%����X����Y����
    X11(i)=  x_11;X12(i)=  x_12;
    X21(i)=  x_21;X22(i)=  x_22;
%     G1(2*i-1:2*i) = [sin(x_11) ;sin(x_12) ];
%     G2(2*i-1:2*i) = [sin(x_21).*cos(x_21);cos(x_22).*cos(x_22)];
%     G1(2*i-1:2*i) = [-x_11*cos(t);-x_12*cos(t) ];
%     G2(2*i-1:2*i) = [-x_21*sin(t);-x_22*sin(t)];
%  G1(2*i-1:2*i) = [x_11 ;x_12 ];
%  G2(2*i-1:2*i) = [x_21;x_22];
end


tildef=zeros(10,1);%formation keep distance
for i=1:Num
    for j=1:Num
        if A_N(i,j)>0
            tildef(2*i-1,:)=tildef(2*i-1,:)+A_N(i,j)*(fkx(i)-fkx(j));
            tildef(2*i,:)=tildef(2*i,:)+A_N(i,j)*(fky(i)-fky(j));
        end
    end
end
tildefx=zeros(10,1);%formation keep distance
tildefv=zeros(10,1);
if t>lbtf
    for i=1:Num
        for j=1:Num
            if A_N(i,j)>0
                temp=fkx(i)-fkx(j);
                temp2=fky(i)-fky(j);
                ttemp=norm([temp,temp2]);
                %%%��������
%                 tildefx(2*i-1,:)=tildefx(2*i-1,:)+A_N(i,j)*(temp/(ttemp+eps)*15*sin(t-lbtf-dt1));
%                 tildefx(2*i,:)=tildefx(2*i,:)+A_N(i,j)*(temp2/(ttemp+eps)*15*sin(t-lbtf-dt1));
%����
                tildefx(2*i-1,:)=tildefx(2*i-1,:)+A_N(i,j)*(temp/(ttemp+eps)*15*sin(t-lbtf-dt1))*0;
                tildefx(2*i,:)=tildefx(2*i,:)+A_N(i,j)*(temp2/(ttemp+eps)*15*sin(t-lbtf-dt1))*0;
            end
        end
    end
end

alpha11=[];
%u_ldy=[cos(t);sin(t)];%leader's input
tildex=x(1:2*Num)-kron(ones(Num,1),x(2*ld-1:2*ld));
% varepsilon1=F*tildex+tildef+tildefx;
varepsilon1=F*tildex-tildef-tildefx;
if t == [dt1]
    bar_varepsilon1 =varepsilon1;
    dot_bar_varepsilon1 = -tau*(bar_varepsilon1 -varepsilon1);
else
    bar_varepsilon1 = bar_varepsilon1 + dot_bar_varepsilon1*dt;
    dot_bar_varepsilon1 = -tau*(bar_varepsilon1 -varepsilon1);
end
alpha1=-F1*(c1*varepsilon1+dot_bar_varepsilon1)-x(2*Num+1:4*Num);
varepsilon2=x(2*Num+1:4*Num)-8.*alpha1;%��ʽ10
if t == [dt1]
    bar_varepsilon2 =varepsilon2;
    dot_bar_varepsilon2 = -tau*(bar_varepsilon2 -varepsilon2);
else
    bar_varepsilon2 = bar_varepsilon2 + dot_bar_varepsilon2*dt;
    dot_bar_varepsilon2= -tau*(bar_varepsilon2 -varepsilon2);
end
xd1=x(2*ld-1:2*ld);
xd2=x(4*ld-1:4*ld);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%�����������
ell = 52;%��Ԫ��Ŀ
sigma = 2;%������ȣ�������Ⱦ����˾���������½��Ŀ���
rho = 1;
phi1 = zeros(ell,1); phi2 = zeros(ell,1);  phi3 = zeros(ell,1);%7����������2��ά���ϵ����ز����
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

u2=-c2*varepsilon2-1.5*F_hat-F*varepsilon1;
% u2=-1/alpha/c1*(F1)*diag(varepsilon2.^(1-alpha))*varepsilon2;%
% % u2=-mu*(F1)*(varepsilon2+dotH*(varepsilon1-tildef))-F1*tildefv;%
% u3=-(F1)*sign(diag(varepsilon2.^(alpha-1))*S)*(omega*rho1*sum(F*tildex)+omega*rho2*sum(F*tildev)+c);
% % u3=-(F1)*sign(S)*(f+c0);
u=u1+u2;
u(1:2)=u_ldy;
%  phiu= u; 
u_h=100;
phiu= u_h*tanh(u/ u_h);
phiu(1:2)=u_ldy;
% % dx=CH*x+[zeros(2*Num,1);-x(1:2*Num)-x(1:2*Num)*cos(t)-x(2*Num+1:4*Num)*sin(t)-cos(x(2*Num+1:4*Num))+u];
H0 = [zeros(2*Num) eye(2*Num); zeros(2*Num) zeros(2*Num)];
H1 = [zeros(2*Num);eye(2*Num)];
H2 = [eye(2*Num) ;zeros(2*Num)];
G1 = -0.01*sin(x(1:10,1));
% if t>lbtf
%   G1 = zeros(2*Num,1);
% end
Delta_State = H0 * x + H1 * (phiu+G2)+H2*G1;
Delta_W =-mu*Phi*(dot_bar_varepsilon2+varepsilon1+c2*varepsilon2)';

end
