clear;
clc,
n=input('\n Enter the dimension of the square matrix :  ');
A=input('\n Enter the entries of the matrix (row-wise) : ');
x=input ('\n Enter an initial guess (as a column vector) : ');
TOL=input('\n Enter the tolerance : ');
N=input('\n Enter the maximum number of iterations : ');
fprintf("\n The given matrix is:\n");
disp(A);
i=1;
while i<=n
    if abs(x(i))==norm(x,"inf")
        p=i;
        i=n;
    end
    i=i+1;
end
z=x;
Mu=0;
k=1;
while k<=N
    y=A*x;
    mu=y(p);
    Mu=[Mu mu];
    i=1;
    while i<=n
        if abs(y(i))==norm(y,"inf")
            p=i;
            i=n;
        end
        i=i+1;
    end
    if y(p)==0
        fprintf("An eigen vector is: \n");
        disp(x);
        fprintf("0 is an eigen value.\n" );
        k=N;
    end
    ERR=norm((x-y./y(p)), "inf");
    x=y./y(p);
    z=[z x];
    if ERR<TOL
        fprintf("An approximation of dominant eigen value is: %10.6f \n", mu );
        fprintf("An eigen vector corresponding to the dominant eigen value is: \n ");
        disp(x);
        k=N;
    end
    k=k+1;
end
fprintf("\n The iterations for eigen vector are given as:\n\n");
disp(cell2mat(compose('%10.6f',z)));
Mu(:,1)='';
fprintf("\n The iterations for eigen value are given as:\n\n");
disp(cell2mat(compose('%10.6f', Mu)));
fprintf("\n An approximation of the dominant eigen value is: %.2f \n", mu );
fprintf("\n An eigen vector corresponding to the dominant eigen value is: \n\n ");
% disp(cell2mat(compose('%10.4f', x)));
disp(x);

 

  
   