% Initialize Variables
x=[];
y1=[];
y2=[];
y3=[];
y4=[];
y5=[];
y6=[];
y7=[];
y8=[];

for n=5:5:200
    disp(n)
    C=full(gallery('tridiag',n,-1,2,-1));
    b=zeros(n,1);
    b(1)=1;
    b(n)=1;

    check=C^(-1)*b;

    %Gauss Elimination
    tic=cputime;
    [A,b1]=GE(C,b);
    [x1]=Bsub(A,b1);
    toc=cputime;
    y1 = [y1; toc-tic];

    %Gauss Elimination with Partial Pivoting
    tic=cputime;
    [A,b2]=GEpp(C,b);
    [x2]=Bsub(A,b2);
    toc=cputime;
    y2 = [y2; toc-tic];

    %Tridiagonal LU Factorization
    tic=cputime;
    [L, U]=TD(C);
    [y]=Fsub(L,b);
    [x3]=Bsub(U,y);
    toc=cputime;
    y3 = [y3; toc-tic];

    %Jacobi
    tic=cputime;
    [x4]=Jacobi(C,b);
    toc=cputime;
    y4 = [y4; toc-tic];

    %Gauss-Seidel
    tic=cputime;
    [x5]=GS(C,b);
    toc=cputime;
    y5 = [y5; toc-tic];

    %SOR .5
    tic=cputime;
    w=.5;
    [x6]=SOR(C,b,w);
    toc=cputime;
    y6 = [y6; toc-tic];

    %SOR 1
    tic=cputime;
    w=1;
    [x7]=SOR(C,b,w);
    toc=cputime;
    y7 = [y7; toc-tic];

    %SOR 1.5
    tic=cputime;
    w=1.5;
    [x8]=SOR(C,b,w);
    toc=cputime;
    y8 = [y8; toc-tic];

    x = [x; n];
end

figure(1)
plot(x,y1)
hold on;
plot(x,y2)
plot(x,y3)
plot(x,y4)
plot(x,y5)
plot(x,y6)
plot(x,y7)
plot(x,y8)

title('Solving for Ax=b')
xlabel('n')
ylabel('cputime(sec)')
legend('Gauss Elimination', 'Partial Pivoting', 'Tridiagonal LU', 'Jacobi', 'Gauss-Seidel', 'SOR .5', 'SOR 1', 'SOR 1.5', 'Location', 'northwest')

figure(2)
plot(x,y1)
hold on;
plot(x,y2)

title('Gauss Elimination')
xlabel('n')
ylabel('cputime(sec)')
legend('Gauss Elimination', 'Partial Pivoting', 'Location', 'northwest')

figure(3)
plot(x,y3)

title('Tridiagonal LU Factorization')
xlabel('n')
ylabel('cputime(sec)')
legend('TD LU Factorization', 'Location', 'northwest')

figure(4)
plot(x,y4)
hold on;
plot(x,y5)

title('Jacobi v. Gauss Seidel')
xlabel('n')
ylabel('cputime(sec)')
legend('Jacobi', 'Gauss-Seidel', 'Location', 'northwest')

figure(5)
plot(x,y6)
hold on;
plot(x,y7)
plot(x,y8)

title('Successive Overrelaxation Method')
xlabel('n')
ylabel('cputime(sec)')
legend('w=.5', 'w=1', 'w=1.5', 'Location', 'northwest')

figure(6) 
semilogy(x,y1)
hold on;
semilogy(x,y2)
semilogy(x,y3)
semilogy(x,y4)
semilogy(x,y5)
semilogy(x,y6)
semilogy(x,y7)
semilogy(x,y8)

title('Solving for Ax=b')
xlabel('n')
ylabel('cputime(sec)')
legend('Gauss Elimination', 'Partial Pivoting', 'Tridiagonal LU', 'Jacobi', 'Gauss-Seidel', 'SOR .5', 'SOR 1', 'SOR 1.5', 'Location', 'northwest')

figure(7)
loglog(x,y1)
hold on;
loglog(x,y2)
loglog(x,y3)
loglog(x,y4)
loglog(x,y5)
loglog(x,y6)
loglog(x,y7)
loglog(x,y8)

title('Solving for Ax=b')
xlabel('n')
ylabel('cputime(sec)')
legend('Gauss Elimination', 'Partial Pivoting', 'Tridiagonal LU', 'Jacobi', 'Gauss-Seidel', 'SOR .5', 'SOR 1', 'SOR 1.5', 'Location', 'northwest')

figure (11)
loglog(x,y4)
hold on;
loglog(x,y5)
loglog(x,y6)
loglog(x,y7)
loglog(x,y8)

title('Iterative Methods')
xlabel('n')
ylabel('cputime(sec)')
legend('Jacobi', 'Gauss-Seidel', 'SOR .5', 'SOR 1', 'SOR 1.5', 'Location', 'northwest')

figure(12) 
semilogy(x,y4)
hold on;
semilogy(x,y5)
semilogy(x,y6)
semilogy(x,y7)
semilogy(x,y8)

title('Iterative Methods')
xlabel('n')
ylabel('cputime(sec)')
legend('Jacobi', 'Gauss-Seidel', 'SOR .5', 'SOR 1', 'SOR 1.5', 'Location', 'northwest')


%{
figure (8)
plot(x,y1)
hold on;
plot(x,y2)
plot(x,y3)

title('Direct Methods')
xlabel('n')
ylabel('cputime(sec)')
legend('Gauss Elimination', 'Partial Pivoting', 'TD LU Factor', 'Location', 'northwest')

figure (9)
semilogy(x,y1)
hold on;
semilogy(x,y2)
semilogy(x,y3)

title('Direct Methods')
xlabel('n')
ylabel('cputime(sec)')
legend('Gauss Elimination', 'Partial Pivoting', 'TD LU Factor', 'Location', 'northwest')

figure (10)
loglog(x,y1)
hold on;
loglog(x,y2)
loglog(x,y3)

title('Direct Methods')
xlabel('n')
ylabel('cputime(sec)')
legend('Gauss Elimination', 'Partial Pivoting', 'TD LU Factor', 'Location', 'northwest')
%}

