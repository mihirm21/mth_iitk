clc;
clear;
fprintf('\n');
n=input('Enter the number of unknowns (equations): ');
a=input('Enter the entries the coefficient matrix rowwise: ');
b=input('Enter the entries of the right hand side centor: ');
fprintf("The augmented matrix corresponding to the system is givne by: \n");
A=[a, b];
disp(A);
x=zeros(n,1);
% fprintf('The system is given as:\n');
m=eye(n);
% Gaussian Elimination
fprintf("Gaussian elimination steps: \n");
% Step-1
for i=1:n-1
    % Step-2
    fprintf("Step- %d \n\n", i);
    %fprintf('\t');
    p=0;
    for l=i:n
      if p==0 && A(l,i)~=0
          p=l;
      end
    end
    % Step-3
    if p~=0
        if p~=i
            R=A(i,:);
            A(i,:)=A(p,:);
            A(p,:)=R;
        end
        % Step-4
        for k=i+1:n
            % Step-5
            m(k,i)=A(k,i)/A(i,i);
            % Step-6
            A(k,:)=A(k,:)-m(k,i).*A(i,:);
        end
    end
    disp(A);
end
% Step-7
if p~=0
    if A(n,n)==0
        if A(n,n+1)==0
            fprintf("No unique solution exists.\n");
        else
            fprintf("No solution exists.\n");
        end
    else
    % Backward Substitution
    % Step-8
    x(n)=A(n,n+1)/A(n,n);
    for i=n-1:-1: 1
        s=0;
        for j=i+1:n
            s=s+A(i,j)*x(j);
        end
        x(i)=(A(i,n+1)-s)/A(i,i);
    end
    fprintf("Solution of the system is given by: \n");
    disp(x);
    end
end

if p==0
    fprintf("No unique solution exists.\n");
end