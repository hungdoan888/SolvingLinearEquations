function [A, b]=GE(C,b)

n=length(C);

A=[C b];

for k=1:n-1
    
    for i=k+1:n
        A(i,:)=A(i,:)-A(k,:)/A(k,k)*A(i,k);
    end
    
end

b=A(:, n+1);
A=A(:, 1:n);

end
