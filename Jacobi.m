function [x]=Jacobi(C,b)

n=length(C);
x=zeros(n,1);
y=x;
xold=100;
xnew=0;

while norm(xnew-xold)>=10^(-8) 
    xold=xnew;
    
for i=1:n
    sum1=0;
    for j=1:i-1
        sum1=sum1+C(i,j)*y(j);
    end
    
    sum2=0;
    for j=i+1:n
        sum2=sum2+C(i,j)*y(j);
    end
    
    x(i)=(b(i)-sum1-sum2)/C(i,i);
end
    y=x;
    xnew=x;
end

end