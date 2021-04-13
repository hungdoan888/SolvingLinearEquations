%Using LU factorization to solve for a Ax=b (modified)
function [x, y, L, U]=LUfactor(A,b,L,U)

%begin solving for Ly=b
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

%begin solving for Ux=y
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
