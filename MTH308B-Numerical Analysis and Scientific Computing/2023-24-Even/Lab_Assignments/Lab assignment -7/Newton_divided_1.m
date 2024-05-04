clc;
clear;
% Interpolating polynomial where the data are coming from a known function
y=@(x) sin(x);
% Taking the data inputs
x=input("Enter the x-coordinates of the data points as row vector: ");
f=y(x);
N=length(x);
F=zeros(N);
% constructing the divided difference table
F(:,1)=f';
for j=2:N
    for i=1:N+1-j
        F(i,j)=(F(i+1,j-1)-F(i,j-1))/(x(i+j-1)-x(i));
    end
end
fprintf("\n Newton divided difference table is given as: \n\n");
disp(cell2mat(compose('%14.7f', [x' F])));
fprintf("\n In the above table the entries of the first rows (from 2nd to %dth columns) \n", N+1);
fprintf("are required to contruct the interpolating polynomial.\n");
z=input("\n Enter the point at which we want to find the value of the function : ");
v=F(1,1);
for k=2:N
    m=1;
    for j=1:k-1
        m=m*(z-x(j));
    end
    v=v+F(1,k)*m;
end
fprintf("\n The value of the interpolating polynomial (of degree less than or equal to %d  \n", N-1);
fprintf("for the given data) at %2.2f is :%14.7f \n\n", z, v);
