function [x]=SOR(a,b,w)

n=length(a);
x=zeros(n,1);
r=zeros(n,1);
xold=100;
xnew=0;

while norm(xnew-xold)>=10^(-8) 
    xold=xnew;
    
for i=1:n
    sum1=0;
    for j=1:i-1
        sum1=sum1+a(i,j)*x(j);
    end
    
    sum2=0;
    for j=i:n
        sum2=sum2+a(i,j)*x(j);
    end
    
    r(i)=b(i)-sum1-sum2;
    x(i)=x(i)+(w/a(i,i))*r(i);
end
    xnew=x;
end
end

