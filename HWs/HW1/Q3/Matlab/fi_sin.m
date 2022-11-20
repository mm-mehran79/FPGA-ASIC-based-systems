clc
clear
t = linspace(0,2*pi,1024);
%generate function:
x1 = sin(t);
x2 = cos(t);
%make functions' output fixed-point:
x1_f = fi(x1,1,16, 14, 'RoundingMethod', 'Floor');
x2_f = fi(x2,1,16, 14, 'RoundingMethod', 'Floor');
%convert to binary:
x1_bin = bin(x1_f);
x2_bin = bin(x2_f);
%save binary data to file:
x1_file = fopen('sin.mem','w');
x2_file = fopen('cos.mem','w');
fwrite(x1_file,x1_bin)
fwrite(x2_file,x2_bin)
fclose(x1_file);
fclose(x2_file);