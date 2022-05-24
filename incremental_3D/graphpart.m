function [A_N,L,B,ld]=graphpart(G2,Num)
A = full(adjacency(G2));   %adjacency matrix
D=outdegree(G2);   %degree matrix
A_N=zeros(Num,Num);
D_N=zeros(Num,1);
for i=1:Num
    if D(i)>0
        A_N(i,:)=A(i,:)./D(i);
        D_N(i)=D(i)./D(i);
        B(i)=0;
    else
        B(i)=1;
    end
end
B=diag(B);
D_N=diag(D_N);
L=D_N-A_N;
ld=find(sum(B)==1);%leader
end