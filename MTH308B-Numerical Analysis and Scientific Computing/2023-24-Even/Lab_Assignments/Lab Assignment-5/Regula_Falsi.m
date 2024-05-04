clc;
clear;
% Writing the function
 f=@(x) sqrt(x)-cos(x);
 fprintf("\n The given equation is: sqrt(x) - cos(x)=0. \n");
%f=@(x) x-cos(x);
%f=@(x) exp(x)-2;
%f=@(x) sin(x)+x^2-1
% Checking the hypothesis of the method
p=0;
while (p==0)
    a=input('\n Enter the left end point of the interval: ');
    b=input('\n Enter the right end point of the interval: ');
    y_0=f(a);
    y_1=f(b);
    if y_0==0
        fprintf("\n A root of the given equation is %f .\n", a);
        p=1;
    end
    if y_1==0
        fprintf("\n A root of the given equation is %f .\n", b);
        p=1;
    end
    if y_0*y_1>0
        fprintf("\n Regula-Falsi method cannot locate any root in the interval [%f, %f].\n", a,b);
        fprintf("\n Restart the method by putting new initial guesses.\n");
    end
    if y_0*y_1<0
        p=1;
    end
end
% Putting stopping criteria
N=input('\n Enter the maximum number of iterations: ');
% eps=input('\n Enter the measure of accuracy: ');
% Data of iterations storing matrix
X=zeros(1,5);
% Starting iterations
k=1;
while (k<=N && p==1)
    x=a-(y_0*(b-a))/(y_1-y_0);
    y=f(x);
    X=[k a b x y];
    if k==1
        fprintf("\n The Regula-Falsi iterations are given as:\n\n");
        D=['        k    ' '        a_k    ' '       b_k    ' '       x_k   ' '      f(x_k)   '];
        disp(D);
    end
    disp(cell2mat(compose('%14.9f',X)));
    if y==0
        fprintf("\n A root of the given equation is %f .\n", x);
        p=0;
    end
    if (y_0*y >0)
        a=x;
        y_0=y;
    else 
        b=x;
        y_1=y;
    end
    k=k+1;
end
if k==N+1
    fprintf("\n Maximum number of iteraton reached. \n An Aapproximate root of the given equation is %10.9f.\n\n", x);
end