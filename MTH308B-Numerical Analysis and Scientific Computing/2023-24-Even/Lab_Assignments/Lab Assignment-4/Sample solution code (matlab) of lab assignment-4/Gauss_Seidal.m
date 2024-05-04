clc;
clear;
% Giving all inputs
n=input('\n Enter the numbr of equations:  ');
A=input('\n Enter the entries of the coefficient matrix row-wise: ');
b=input('\n Enter the RHS given data of the system (as column vector) : ');
x=input('\n Enter the initial guess (as column vector): ');
m=input('\n Enter the maximum number of iteration: ');
% y=zeros(n,1);
% Creating a matrix to store the results of each iteration
X=zeros(n,m+1);
% Storing the initial data in the first column of a matrix X
X(:,1)=x;
% Checking the necessary condition on the diagonal elements of A to run the iteration
w=0;
for i=1:n
    if A(i,i)==0
        w=w+1;
        fprintf("Gauss-Seidal itereation can not be used. May need to do equations swapping. \n");
    end
end
if w==0
    % Starting the iteration
    for k=1:m
        for i=1:n
            z=0;
            for j=i+1:n
                z=z+A(i,j)*x(j);
            end
            u=0;
            for j=1:i-1
                u=u+A(i,j)*x(j);
            end
            x(i)=(1/A(i,i))*(b(i)-u-z);
        end
        % y=x;
        % Storing the results of each iteration in the matrix X
        X(:,k+1)=x;
    end
    % Printing the outputs
    fprintf("\n %d number of Gauss-Seidal iterations  are given as (columnwise):\n\n", m);
    % disp(X);
    % To get the output in 6 decimal places
    disp(cell2mat(compose('%10.6f',X)));
    fprintf("\n");
end

