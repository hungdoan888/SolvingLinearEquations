function [Di]=Dinverse(D)

n=length(D);
k=1;

while k<=n
    
    d(k)=1/D(k,k);
    
    k=k+1;
end

Di=diag(d);
end