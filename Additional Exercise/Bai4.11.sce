clear;
clc;

n = -5:3;

// y(n) = x_e(n+2) - j*x_o(n)
y_real = [0.5 0 1 2 1 0 0.5 0 0];
y_imag = [0 0 -0.5 0 2 0 -2 0 0.5];

// Do thi phan thuc
scf(1);
clf();
plot2d3(n, y_real);
xgrid();
xtitle("Phan thuc cua y(n)", "Chi so thoi gian n", "Re{y(n)}");

// Do thi phan ao
scf(2);
clf();
plot2d3(n, y_imag);
xgrid();
xtitle("Phan ao cua y(n)", "Chi so thoi gian n", "Im{y(n)}");

disp([n' y_real' y_imag']);
