clc;
clear;
% The datas are coming from the following known function
y=@(x) x.^3+4.001.*x.^2+4.002.*x+1.101;
% Taking the data inputs
x=input("Enter the x-coordinates of the data points as row vector: ");
fprintf("\n Rule of the given function is : f(x)=x^3+4.001x^2+4.002x+1.101.\n");
f=y(x);
% Displaying the data points 
fprintf("\n The data is given in a table as: \n\n ");
D=['        x    ' '       f(x)    '];
disp(D);
disp(cell2mat(compose('%14.8f', [x ; f]')));
N=length(x);
a=zeros(1,N-1);
b=zeros(1,N-1);
for j=1:N-1
    a(j)=f(j);
    b(j)=(f(j+1)-f(j))/(x(j+1)-x(j));
end
k=1:N-1;
fprintf("\n The coefficients of a_j, b_j of the sub-spline S_j are given in a table as: \n\n ");
D=['        j    ' '        a_j    ' '       b_j    '];
disp(D);
S=[k; a ; b]';
disp(cell2mat(compose('%14.8f', S)));

% Finding values of Spline (which approximates the given data) at some point
w=input("\n Enter the point at which we want to find the value of the function : ");
i=1;
while i<= N-1
    if (w-x(i)>=0) && (w-x(i+1)<=0)
        k=i;
        i=N;
    end
    i=i+1;
end
v=a(k)+b(k)*(w-x(k));
fprintf("\n The value of the Spline at %2.2f is : %14.8f \n\n", w, v);

% Later part is optional
% Printing the graph of original function
fplot(@(x) x.^3+4.001.*x.^2+4.002.*x+1.101, [x(1) x(N)], ':m');
hold on

% Printing the graph of linear Spline
grid on
plot(x,f, '-b*');
xlabel('x-axis (x-->)')
ylabel('y-axis (f(x)-->)')
legend('x^3+4.001x^2+4.002x+1.101', 'Linear spline', 'Location', 'northwest')