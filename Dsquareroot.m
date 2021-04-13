function [Dsqrt]=Dsquaeroot(D)
n=length(D);

k=1;
while k<=n
    
    d(k)=D(k,k)^(1/2);

    k=k+1;
end

Dsqrt=diag(d);
end