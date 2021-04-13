function [L, U]=TD(T)

n=length(T);
L=zeros(n);
U=zeros(n);

%Partitioning T in to a, b, and c
for i=1:n
    
    if i<=n-1
    a(i)=T(i,i+1);
    end
    
    if i<=n-1
    c(i)=T(i+1,i);
    end
    
    b(i)=T(i,i);
end

%Finding d
d(1)=b(1);
for i=1:n-1
    d(i+1)=b(i+1)-(a(i)*c(i)/d(i));
end

%Finding L
for i=1:n
    L(i,i)=L(i,i)+1;
end

for i=1:n-1
    L(i+1,i)=c(i)/d(i);
end

%Finding U
for i=1:n
    U(i,i)=d(i);
end

for i=1:n-1
    U(i,i+1)=a(i);
end

end
    
    