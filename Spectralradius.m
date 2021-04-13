clc;
i=1;
for n=1:1:100
    
        A=full(gallery('tridiag',n,-1,2,-1));
        b=zeros(n,1);
        b(1)=1;
        b(n)=1;

        L=tril(A, -1);
        U=triu(A,1);
        D=2*eye(n);

        x=[];
        y=[];

        for w=1:.01:1.99
            BSOR=inv(D-w*L)*((1-w)*D+w*U);
            y(i,end+1)=max(abs(eig(BSOR)));
            x(i,end+1)=w;
        end

figure(1)
plot(x(i,:),y(i,:))
hold on;

i=i+1;
end

title('Spectral Radius v. w')
xlabel('w')
ylabel('Spectral Radius')

legend('n=1', 'n=2', 'n=3', 'n=4', 'n=5',  'Location', 'southeast')
