clc;
clear;
% The datas are coming from the following known function
% f=@(x) x*log(x);
 f=@(x) x^3*exp(x);
% f=@(x) sin(exp(x)-2);
%  f=@(x) sqrt(x)-x^2;
fprintf("\n Rule of the given function is : f(x)=x^3e^x.\n");
% Taking the data inputs
a=input("Enter the left end point of the interval of integration: ");
b=input("Enter the right end point of the interval of integration: ");
h=input("Enter the lenth of the partition(lenth of the equally spaced sub intervals): ");
% N=input("Enter the number of the partitions of the interval: ");
N=(b-a)/h;
% h=(b-a)/N;
T=(f(a)+f(b))/2;
for i=1:N-1
    T=T+f(a+i*h);
end
fprintf("The value of the integration is : %10.6f.\n\n", h*T);
