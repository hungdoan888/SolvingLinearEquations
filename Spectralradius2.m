clc;

i=1;
x=[];
y=[];
for w=1:.1:1.9
for n=5:5:100
C=full(gallery('tridiag',n,-1,2,-1));
b=zeros(n,1);
b(1)=1;
b(n)=1;

%SOR .5
tic=cputime;
[x1]=SOR(C,b,w);
toc=cputime;
y(i,end+1)=toc-tic;

x(i,end+1)=n;
end

figure(1) 
plot(x(i,:),y(i,:))
hold on;

i=i+1;
end

title('Values of w for SOR')
xlabel('n')
ylabel('cputime(sec)')
legend('w=1', 'w=1.1', 'w=1.2', 'w=1.3', 'w=1.4', 'w=1.5', 'w=1.6', 'w=1.7', 'w=1.8', 'w=1.9',  'Location', 'northwest')
