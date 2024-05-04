clc;
clear;
% Taking the data inputs
x=input("Enter the x-coordinates of the data points as row vector : ");
f=input("Enter the y-coordinates of the data points as row vector : ");
N1=length(x);
N2=length(f);
p=0;
while (p==0)
    if N1~=N2
        fprintf("Please check the number of data points and re-enter.");
        x=input("Enter the x-coordinates of the data points as row vector : ");
        f=input("Enter the y-coordinates of the data points as row vector : ");
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
for j=1:N-1
    a(j)=f(j);
    b(j)=(f(j+1)-f(j))/(x(j+1)-x(j));
end
k=1:N-1;
fprintf("\n The coefficients of a_j, b_j of the sub-spline S_j are given in a table as: \n\n ");
D=['        j    ' '        a_j    ' '        b_j    '];
disp(D);
disp(cell2mat(compose('%14.8f', [k; a ; b]')));

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
% Printing the graph of linear Spline
grid on
plot(x,f, '-b*');
xlabel('x-axis (x-->)')
ylabel('y-axis (f(x)-->)')
legend('Linear spline', 'Location', 'northwest')