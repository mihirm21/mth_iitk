clc;
clear;
% Writing the function
 f=@(x) x-cos(x);
 df=@(x) 1+sin(x);
 fprintf("\n The given equation is: x - cos(x)=0. \n");
%f=@(x) x-cos(x);
%f=@(x) exp(x)-2;
%f=@(x) sin(x)+x^2-1
% Cheking the hypothis of the iterations 
p=0;
while (p==0)
    % Putting initial approximations
    x_0=input('\n Enter the first initial approximation: ');
    if f(x_0)==0
        fprintf("\n A root of the given equation is %f .\n", x_0);
        p=2;
    end
    if df(x_0)==0
        fprintf("\n Newton-Raphson method cannot locate any root for the given equation.\n");
        fprintf("\n Restart the method by putting new initial guesses.\n");
    else   
        p=1;
    end
end
% Putting stopping criteria
N=input('\n Enter the maximum number of iterations: ');
eps=input('\n Enter the measure of accuracy: ');
% Data of iterations storing matrix
X=zeros(1,3);
fprintf("\n The Newton-Raphson iterations are given as:\n\n");
D=['        k    ' '       x_k   ' '      f(x_k)   '];
disp(D);
X_0=[1 x_0 f(x_0);];
disp(cell2mat(compose('%14.10f',X_0)));
% Starting iterations
k=1;
while (k<=N && p==1)
    x=x_0-f(x_0)/df(x_0);
    X=[k x f(x)];
    disp(cell2mat(compose('%14.10f',X)));
    if f(x)==0
        fprintf("\n A root of the given equation is %14.10f .\n", x);
        p=0;
    end
    if (abs(x-x_0)<= eps)
        fprintf("\n An approximate root (with tolerance %f) of the given equation is %14.10f .\n", eps, x);
        p=0;
    end
    x_0=x;
    k=k+1;
end
if k==N+1
    fprintf("\n Maximum number of iteraton reached.  The method fail after %d iterations.\n", N);
end