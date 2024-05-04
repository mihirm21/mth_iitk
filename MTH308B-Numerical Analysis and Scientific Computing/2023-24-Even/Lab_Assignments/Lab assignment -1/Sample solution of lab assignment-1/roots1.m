%clc;
%clear;
a=input('Enter the co-efficient of the quadratic term of the equation: ');
while (a==0)
a=input('Re-enter a non number for the co-efficient of the quadratic term of the equation: ');
end

b=input('Enter the co-efficient of the 1st degree term of the equation: ');
c=input('Enter the co-efficient of the 0th degree term of the equation: ');
while (c==0)
c=input('Re-enter a non number for the the 0th degree term of the equation: ');
end
M=max([abs(a), abs(b), abs(c)]);
a=a/M;
b=b/M;
c=c/M;
if (a~=0 && c~=0 && b^2~=0 && 4*a*c~=0)
    if ((b^2-4*a*c)<0)
        if b==0
            x=0;
        else
            x=-b^2/(2*a);
        end
        y=sqrt(4*a*c-b^2)/(2*a);
        fprintf('Roots of the given equation are %f +i %f and %f -i %f respectively.\n', x, y, x, y)
    else
        x_1=(-b+sqrt(b^2-4*a*c))/(2*a);
        x_2=(-b-sqrt(b^2-4*a*c))/(2*a);
        fprintf('Roots of the given equation are %.5f and %.5f respectively.\n', x_1, x_2);
        fprintf('We can also the calculate the roots as:');
        z_1=(2*c)/(-b-sqrt(b^2-4*a*c));
        z_2=(2*c)/(-b+sqrt(b^2-4*a*c));
        fprintf(' %.5f and %.5f respectively.\n', z_1, z_2);
    end
else
    fprintf('There is and under-flow error for the inputs for either of the coefficients a and c. Please re-run the program with modified input values for the coefficients.\n ');
end
