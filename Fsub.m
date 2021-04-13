function [y]=Fsub(L,b)
n=length(b);
i=2;

y(1,1)=b(1)/L(1,1);

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
end