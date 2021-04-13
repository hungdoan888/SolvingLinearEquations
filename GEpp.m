function [A, b]=GEpp(C,b)

n=length(C);

A=[C b];

for k=1:n-1
    
    M=max(abs(A(k:n, k)));
    
    for j=k+1:n
        if M==abs(A(j,k))
            A([j k], :)=A([k j], :);
        end
    end     
   
    for i=k+1:n
        A(i,:)=A(i,:)-A(k,:)/A(k,k)*A(i,k);
    end
    
    
end

b=A(:, n+1);
A=A(:, 1:n);

end

