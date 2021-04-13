%LDMT factorization
function [L, D]=LDMTfactor(A)

n=length(A);

for k=1:n
    
    d(k)=A(k,k);
    
    for i=k:n
        
        l(i,k)=A(i,k)/d(k);
        
        for j=k:i
            
            A(i,j)=A(i,j)-l(i,k)*d(k)*l(j,k);
        end
    end
end

D=diag(d);
L=l;
end