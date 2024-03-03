clc;
clear;
i=0;
x=2;
while (x>1)
    i=i+1;
    d=2^(-i);
    x=1+d;
end

fprintf('\n The machine epsilon is 2^(-%d).', i-1);
fprintf('\n From the theory, we conclude that the manitssa has %d bits in this machine. \n\n', i-1);