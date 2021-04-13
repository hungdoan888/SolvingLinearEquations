clc;
n=10;

a=full(gallery('tridiag',n,-1,2,-1));
b=zeros(n,1);
b(1)=1;
b(n)=1;

x=zeros(n,1);
r=zeros(n,1);
xold=100;
xnew=0;
w=1;

I=eye(n);
L=tril(a, -1);
U=triu(a,1);
D=2*eye(n);

while norm(xnew-xold)>=10^(-30) 
    xold=xnew;
    
    BSOR=inv(I-w*inv(D)*L)*((1-w)*I+w*inv(D)*U);
    CSOR=w*inv(I-w*inv(D)*L)*inv(D)*b;
    
    x=BSOR*x+CSOR
    
    xnew=x;
end

x