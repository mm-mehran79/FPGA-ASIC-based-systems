clc;
clear;
sin_file = fopen('sin.txt');
cos_file = fopen('cos.txt');
x_sin = fscanf(sin_file, '%x', Inf);
x_cos = fscanf(cos_file, '%x', Inf);
fclose(sin_file);
fclose(cos_file);
x_sin_fi = reinterpretcast(fi(x_sin,0,16,0),numerictype(1,16,14));
x_cos_fi = reinterpretcast(fi(x_cos,0,16,0),numerictype(1,16,14));
x_sin_double = double(x_sin_fi);
x_cos_double = double(x_cos_fi);
x = x_cos_double + 1i * x_sin_double;
pwelch(x)