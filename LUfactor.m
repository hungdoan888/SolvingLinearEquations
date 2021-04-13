%Using LU factorization to solve for a Ax=b
function [x, y, L, U]=LUfactor(A,b)

%LU factorization
ALU=A;
[n,n]=size(ALU);

for k=1: n-1
    
    ALU(k+1:n,k)=ALU(k+1:n,k)/ALU(k,k);
    
    ALU(k+1:n,k+1:n)=ALU(k+1:n, k+1:n)-ALU(k+1: n, k)*ALU(k, k+1:n);
end

L=eye(n,n)+tril(ALU,-1);
U=triu(ALU);
%end LU factorization

%begin solving for Ly=b (Fsub)
n=length(b);
i=2;

y=b(1)/L(1,1);

while i<=n
    
    ysum=0;
    k=1;
    while k<=(i-1)
        
        ysum=ysum+(L(i,k)*y(k));
        
        k=k+1;
    end
    
    y(i,1)=(b(i)-ysum)/L(i,i);
    
    i=i+1;
end
%end solving for Ly=b

%begin solving for Ux=y (Bsub)
i=n-1;
x=[];
x(n,1)=y(n)/U(n,n);

while i>=1
    
    xsum=0;
    k=i+1;
    while k<=n
        
        xsum=xsum+(U(i,k)*x(k));
        
        k=k+1;
    end
    
    x(i,1)=(y(i)-xsum)/U(i,i);
    
    i=i-1;
end
%end solving for Ux=y
end



   