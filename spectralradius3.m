clc;

A=full(gallery('tridiag',n,-1,2,-1));
b=zeros(n,1);
b(1)=1;
b(n)=1;

for w=1:.01:1.99

    y(end+1)=max(abs(eig(A)));
    x(end+1)=w;

end

figure(1)
loglog(x,y)

title('Spectral Radius v. w')
xlabel('w')
ylabel('Spectral Radius')
legend('Spectral Radius', 'Location', 'northwest')