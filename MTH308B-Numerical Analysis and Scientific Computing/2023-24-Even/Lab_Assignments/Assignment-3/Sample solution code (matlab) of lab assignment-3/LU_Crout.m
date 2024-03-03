clc;
clear;
fprintf('\n');
n=input('Enter the dimension of the square matrix : ');
a=input('Enter the entries the matrix rowwise: ');
U=diag(ones(n,1));
L=zeros(n);
fprintf("Given matrix is: \n");
disp(a);
z=0;
% Step-1
if a(1,1)==0
    fprintf("Factorization is not possible. \n");
else
    L(1,1)=a(1,1);
    for j=2:n
        % Step-2
        L(j,1)=a(j,1)/U(1,1);
        U(1,j)=a(1,j)/L(1,1);        
    end
    % Step-3
    for i=2:n-1
        % Step-4
        s=0;
        for k=1:i-1
            s=s+L(i,k)*U(k,i);
        end
        L(i,i)=(a(i,i)-s)/U(i,i);
        if L(i,i)==0
            z=1;
            fprintf("Factorization is not possible. \n");
        else
        % Step-5
        for j=i+1:n
            t=0;
            for k=1:i-1
                t=t+L(j,k)*U(k,i);
            end
            L(j,i)=(a(j,i)-t)/U(i,i);
            r=0;
            for k=1:i-1
                r=r+L(i,k)*U(k,j);
            end
            U(i,j)=(a(i,j)-r)/L(i,i);
        end
        end
        if z==0
        % Step-6
        w=0;
        for k=1:n-1
            w=w+L(n,k)*U(k,n);
        end
        L(n,n)=(a(n,n)-w)/U(n,n);
        end
    end
    if z==0
    fprintf("Crout's LU decomposition of the givem matrix is: \n\n");
    disp([L U]);
    % disp(L);
    % disp(U);
    end
end