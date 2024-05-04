clc;
clear;
% The datas are coming from the following known function
% y=@(x) x.*log(x);
% dy=@(x) 1+log(x);
 y=@(x) x.*cos(x)-2*x.^2+3*x-1;
 dy=@(x) cos(x)-x.*sin(x)-4*x+3;
% Taking the data inputs
x=input("Enter the x-coordinates of the data points as row vector: ");
fprintf("\n Rule of the given function is : f(x)=x*cos(x)-2*x^2+3*x-1.\n");
f=y(x);
df=dy(x);
% Displaying the data points 
fprintf("\n The data is given in a table as: \n\n ");
D=['       x    ' '       f(x)    ' '      df(x)    '];
disp(D); 
disp(cell2mat(compose('%14.8f', [x ; f; df]')));
N=length(x);
z=zeros(1,2*N);
Q=zeros(2*N,2*N);
% constructing the divided difference table
for i=1:N
    z(2*i-1)=x(i);
    z(2*i)=x(i);
    Q(2*i-1,1)=f(i);
    Q(2*i,1)=f(i);
    Q(2*i-1,2)=df(i);
end
for i=1:N-1
    Q(2*i,2)=(Q(2*i+1,1)-Q(2*i,1))/(z(2*i+1)-z(2*i));
end
for j=3:2*N
    for i=1:2*N+1-j
        Q(i,j)=(Q(i+1,j-1)-Q(i,j-1))/(z(i+j-1)-z(i));
    end
end
fprintf("\n Hermite divided difference table is given as: \n\n");
disp(cell2mat(compose('%14.8f', [z' Q])));
fprintf("\n In the above table the entries of the first rows (from 2nd to %dth columns) \n", 2*N+1);
fprintf("are required to contruct the interpolating polynomial.\n");

% Finding values of Hemite polynomial(which approximates the given data) at some point
w=input("\n Enter the point at which we want to find the value of the function : ");
v=Q(1,1);
for k=2:2*N
    m=1;
    for j=1:k-1
        m=m*(w-z(j));
    end
    v=v+Q(1,k)*m;
end
fprintf("\n The value of the Hermite interpolating polynomial (of degree less than or equal to %d  \n", 2*N-1);
fprintf("for the given data) at %2.2f is :%14.8f \n\n", w, v);