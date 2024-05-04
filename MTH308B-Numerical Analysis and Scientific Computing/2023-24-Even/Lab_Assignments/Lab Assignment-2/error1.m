clc;
clear;
a=input('Enter the point at which the derivative has to be calculated: ');
n=input('Enter the total number of approximations: ');
x=zeros(1,n);
y=zeros(1,n);
z=zeros(1,n);
w=zeros(1,n);
X_r=zeros(1,n);
Y_r=zeros(1,n);
for k=1:n
    h=10^(-k);
    %h=1/k;
    df=cos(a);
    df_h=(sin(a+h)-sin(a))/h;
    E=abs(df-df_h);
    x(k)=h;
    z(k)=df;
    w(k)=df_h;
    y(k)=E;
    X_r(n+1-k)=x(k);
    Y_r(n+1-k)=y(k);
end
format long
fprintf("\t\t h \t\t\t\t\t f' \t\t\t\t f'_h \t\t\t\t Error \n");
A=[x ; z; w; y ;]';
disp(A);
%grid on
loglog(X_r, Y_r,'--ro');