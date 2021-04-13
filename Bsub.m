function [x]=Bsub(U, y)

n=length(U);
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
end