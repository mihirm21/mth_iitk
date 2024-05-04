clc;
clear;
% Taking the data inputs
x=input("Enter the x-coordinates of the data points as row vector: ");
f=input("Enter the y-coordinates of the data points as row vector: ");
N1=length(x);
N2=length(f);
p=0;
while (p==0)
    if N1~=N2
        fprintf("Please check the number of data points and re-enter.");
        x=input("Enter the x-coordinates of the data points as row vector: ");
        f=input("Enter the y-coordinates of the data points as row vector: ");
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
T=0;
for i=1:N-1
    T=T+(f(i)+f(i+1))*(x(i+1)-x(i));
end
fprintf("\n The value of the integration is : %10.6f.\n\n", T/2);