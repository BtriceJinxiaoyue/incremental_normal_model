function [A_N,L,B,ld,dotH,fkx,fky]=graphswitch(G,G2,Num,tf,lb,ub,t,Deltax,Deltay,Deltax_lt,Deltay_lt)
A_lt=full(adjacency(G)); % last adjacency matrix
D_lt=outdegree(G);   % last degree matrix
A = full(adjacency(G2));   %adjacency matrix
D=outdegree(G2);   %degree matrix
A_N=zeros(Num,Num);
D_N=zeros(Num,1);
olt=(t-lb*tf)/(ub*tf-lb*tf);%overline t
S_Q=3*olt*olt-2*olt*olt*olt;
dotH=(6*olt-6*olt*olt)/(ub*tf-lb*tf)*0.17;
% S_Q=1/(1+exp(-olt));
% dotH=S_Q*(1-S_Q);

for i=1:Num
    if D(i)>0
        temp=A_lt(i,:)./D_lt(i);
        A_N(i,:)=temp+(A(i,:)./D(i)-temp)*S_Q;
        D_N(i)=D(i)./D(i);
    else
        B(i)=1;
    end
end
fkx=Deltax_lt+(Deltax-Deltax_lt)*S_Q;
fky=Deltay_lt+(Deltay-Deltay_lt)*S_Q;
B=diag(B);
D_N=diag(D_N);
L=D_N-A_N;
ld=find(sum(B)==1);%leader
end