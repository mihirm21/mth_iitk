clc;
clear;

% Defining the function
f1=@ (x1, x2) 4*x1^2-20*x1+ (1/4)*x2^2+8;
f2=@ (x1, x2) (1/2)*x1*x2^2+2*x1-5*x2+8;

% Defining the Jacobian of function
df_11=@ (x1, x2) 8*x1-20;
df_12=@ (x1, x2) (1/2)*x2;
df_21=@ (x1, x2) (1/2)*x2^2+2;
df_22=@ (x1, x2) x1*x2-5;

fprintf("\n First equation of the given system is:4x_1^2-20x_1+ (1/4)x_2^2+8=0. \n");
fprintf("\n Second equation of the given system is: (1/2)x_1x_2^2+2x_1-5x_2+8=0. \n");
% Cheking the hypothis of the iterations 
p=0;
while (p==0)
    % Putting initial approximations
    x=input('\n Enter the first initial approximation (vector in colum format): ');
    b=[f1(x(1),x(2)); f2(x(1),x(2))];
    A=[df_11(x(1),x(2)), df_12(x(1),x(2)); df_21(x(1),x(2)), df_22(x(1),x(2))];
    if b(1)==0 && b(2)==0
        fprintf("\n A solution of the given system of equations is %f .\n", x_0);
        p=2;
    end
    if det(A)==0
        fprintf("\n Newton method cannot locate any root for the given system of equations.\n");
        fprintf("\n Restart the method by putting new initial guesses.\n");
    else   
        p=1;
    end
end
% Putting stopping criteria
N=input('\n Enter the maximum number of iterations: ');
eps=input('\n Enter the measure of accuracy: ');
% Data of iterations storing matrix
X=x;
% Starting iterations
k=1;
while (k<=N && p==1)
    x_0=x;
    % Solving the system J_F(x_k)y=F(x_k)
    y=A\b;
    % Calculating the iterations
    x=x-y;
    % Storing the values of each iterations
    X=[X, x];
    b=[f1(x(1),x(2)); f2(x(1),x(2))];
    A=[df_11(x(1),x(2)), df_12(x(1),x(2)); df_21(x(1),x(2)), df_22(x(1),x(2))];
    if  b(1)==0 && b(2)==0
        fprintf("\n A root of the given equation is %14.10f .\n", x);
        p=0;
    end
    if (norm((x-x_0),Inf)<= eps)
        fprintf("\n An approximate root (with tolerance %f) of the given system of equations is:\n", eps);
        disp(x);
        p=0;
    end
    k=k+1;
end
if k==N+1
    fprintf("\n Maximum number of iteraton reached.  The method fail after %d iterations.\n", N);
end
fprintf("The iterations are given as:\n\n");
% D=['        k    ' ; '       x_k   ' ];
% disp(D);
K=1:k;
disp(cell2mat(compose('%14d',K)));
fprintf("\n");
disp(cell2mat(compose('%14.10f',X)));




