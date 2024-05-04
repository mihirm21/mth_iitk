clc;
clear;
% Taking the data inputs
x=input("Enter the x-coordinates of the data points as row vector: ");
f=input("Enter the y-coordinates of the data points as row vector: ");
L=input("Enter value of derivative of f at left end point : ");
R=input("Enter value of derivative of f at right end point : ");
N1=length(x);
N2=length(f);
p=0;
while (p==0)
    if N1~=N2
        fprintf("Please check the number of data points and re-enter.");
        x=input("Enter the x-coordinates of the data points as row vector : ");
        f=input("Enter the y-coordinates of the data points as row vector : ");
        L=input("Enter value of derivative of f at left end point : ");
        R=input("Enter value of derivative of f at right end point : ");
        N1=length(x);
        N2=length(f);
    else 
        N=N1;
        p=1;
        fprintf("\n The data is given in a table as: \n\n ");
        D=['        x    ' '       f(x)    '];
        disp(D);
        disp(cell2mat(compose('%14.8f', [x ; f]')));
    end
end
a=zeros(1,N-1);
b=zeros(1,N-1);
c=zeros(1,N-1);
d=zeros(1,N-1);
h=zeros(1,N-1);
v=zeros(1,N-2);
l=zeros(1,N-1);
u=zeros(1,N-1);
z=zeros(1,N-1);
for j=1:N-1
    a(j)=f(j);
    h(j)=(x(j+1)-x(j));
end
a(N)=f(N);
% Solving tridiagonal system
v(1)=3*(a(2)-a(1))/h(1)-3*L;
v(N)=3*R-3*(a(N)-a(N-1))/h(N-1);
for i=2:N-1
    v(i)=3*(a(i+1)-a(i))/h(i)- 3*(a(i)-a(i-1))/h(i-1);
end
l(1)=2*h(1);
u(1)=0.5;
z(1)=v(1)/l(1);
for i=2:N-1
    l(i)=2*(h(i-1)+h(i))- h(i-1)*u(i-1);
    u(i)=h(i)/l(i);
    z(i)=(v(i)-h(i-1)*z(i-1))/l(i);
end
l(N)=h(N-1)*(2-u(N-1));
z(N)=(v(N)-h(N-1)*z(N-1))/l(N);
c(N)=z(N);
for j=N-1:-1:1
    c(j)=z(j)-u(j)*c(j+1);
    b(j)=(a(j+1)-a(j))/h(j)- h(j)*(c(j+1)+2*c(j))/3;
    d(j)=(c(j+1)-c(j))/(3*h(j));
end
a(N)=[];
c(N)=[];
k=1:N-1;
S=[k; a ; b; c ;d]';
fprintf("\n The coefficients a_j, b_j, c_j, d_j of the sub-spline S_j are given in a table as: \n\n ");
D=['        j    ' '        a_j    ' '       b_j    ' '       c_j    ' '       d_j    '];
disp(D);
disp(cell2mat(compose('%14.8f', S)));

% Finding values of Spline (which approximates the given data) at some point
w=input("\n Enter the point at which we want to find the values of the function and its derivative. : ");
i=1;
while i<= N-1
    if (w-x(i)>=0) && (w-x(i+1)<=0)
        k=i;
        i=N;
    end
    i=i+1;
end
v=a(k)+b(k)*(w-x(k))+c(k)*(w-x(k))^2+d(k)*(w-x(k))^3;
fprintf("\n The value of the natural cubic Spline at %2.2f is : %14.8f \n", w, v);
dv=b(k)+2*c(k)*(w-x(k))+3*d(k)*(w-x(k))^2;
fprintf("\n The value of the derivative of the natural cubic Spline at %2.2f is : %14.8f \n\n", w, dv);