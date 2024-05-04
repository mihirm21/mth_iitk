clc;
clear;
% The datas are coming from the following known function
% f=@(x) x*log(x);
  f=@(x) x^2*log(x^2+1);
% f=@(x) sin(exp(x)-2);
%  f=@(x) sqrt(x)-x^2;
fprintf("\n Rule of the given function is : f(x)=x^2log(x^2+1).\n");
% Taking the data inputs
a=input("Enter the left end point of the interval of integration: ");
b=input("Enter the right end point of the interval of integration: ");
h=input("Enter the lenth of the partition(lenth of the equally spaced sub intervals): ");
% N=input("Enter the number of the partitions of the interval: ");
N=(b-a)/(2*h);
% h=(b-a)/(2*N);
T=f(a)+f(b);
for i=1:N-1
    T=T+2*f(a+2*i*h);
end
for i=1:N
    T=T+4*f(a+(2*i-1)*h);
end
fprintf("The value of the integration is : %10.7f.\n\n", (h*T)/3);
