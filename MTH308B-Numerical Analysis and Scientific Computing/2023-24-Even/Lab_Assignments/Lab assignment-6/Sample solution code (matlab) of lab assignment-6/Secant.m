clc;
clear;
% Writing the function
f=@(x) x-cos(x);
 fprintf("\n The given equation is: x - cos(x)=0. \n");
% Cheking the hypothis of the iterations 
p=0;
while (p==0)
    % Putting initial approximations
    x_0=input('\n Enter the first initial approximation: ');
    x_1=input('\n Enter the second initial approximation: ');
    y_0=f(x_0);
    y_1=f(x_1);
    if y_0==0
        fprintf("\n A root of the given equation is %f .\n", x_0);
        p=2;
    end
    if y_1==0
        fprintf("\n A root of the given equation is %f .\n", x_1);
        p=2;
    end
    if p~=2
        if y_0==y_1
            fprintf("\n Secant method cannot locate any root for the given equation.\n");
            fprintf("\n Restart the method by putting new initial guesses.\n");
        else
            p=1;
        end
    end
end
% Putting stopping criteria
% if p==1
    N=input('\n Enter the maximum number of iterations: ');
    eps=input('\n Enter the measure of accuracy: ');
% end
% Data of iterations storing matrix
X=zeros(1,3);
fprintf("\n The Secant iterations are given as:\n\n");
D=['        k    ' '       x_k   ' '      f(x_k)   '];
disp(D);
X_0=[1 x_0 y_0; 2 x_1 y_1];
disp(cell2mat(compose('%14.10f',X_0)));
% Starting iterations
k=2;
while (k<=N && p==1)
    x=x_1-(y_1*(x_1-x_0))/(y_1-y_0);
    y=f(x);
    X=[k x y];
    disp(cell2mat(compose('%14.10f',X)));
    if y==0
        fprintf("\n A root of the given equation is %f .\n", x);
        p=0;
    end
    if (abs(x-x_1)<= eps)
        fprintf("\n An approximate root (with tolerance %f) of the given equation is %14.10f .\n", eps, x);
        p=0;
    end
    x_0=x_1;
    y_0=y_1;
    x_1=x;
    y_1=y;
    k=k+1;
end
if k==N+1
    fprintf("\n Maximum number of iteraton reached.  The method fail after %d iterations.", N);
end