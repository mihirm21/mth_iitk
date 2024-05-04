clc;
clear;
% Writing the function
% g=@(x) x-x^3-4*x^2+10 ;
% g=@(x) (10/x - 4*x)^(1/2) ;
% g=@(x) (1/2)*(10-x^3)^(1/2) ;
  g=@(x) (10/(4+x))^(1/2) ;
% g=@(x) x- (x^3+4*x^2-10)/(3*x^2+8*x) ;
 fprintf("\n The given equation is: x^3+4x^2-10=0. \n");
% Putting initial approximations
x_0=input('\n Enter the first initial approximation: ');
% Putting stopping criteria
N=input('\n Enter the maximum number of iterations: ');
eps=input('\n Enter the measure of accuracy: ');
% Data of iterations storing matrix
X=zeros(1,3);
fprintf("\n The Fixed-point iterations are given as:\n\n");
D=['        k    ' '       x_k   ' '      g(x_k)   '];
disp(D);
X_0=[1 x_0 g(x_0);];
disp(cell2mat(compose('%14.10f',X_0)));
% Starting iterations
p=1;
k=1;
while (k<=N && p==1)
    x=g(x_0);
    X=[k x g(x)];
    disp(cell2mat(compose('%14.10f',X)));
    if (abs(x-x_0)<= eps)
        fprintf("\n An approximate solution (with tolerance %f) of the given equation is %14.10f .\n", eps, x);
        p=0;
    end
    x_0=x;
    k=k+1;
end
if k==N+1
    fprintf("\n Maximum number of iteraton reached.  The method fail after %d iterations.\n", N);
end