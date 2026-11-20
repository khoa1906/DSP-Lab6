clear;
clc;

N = 6001;
w = linspace(-%pi, %pi, N);

// ------------------------------------------------------------
// CAU (a): x(n) = u(n) - u(n-6), n = 0,...,5
// Xa(w) = exp(-j*5*w/2) * sin(3*w)/sin(w/2)
// ------------------------------------------------------------
denA = sin(w/2);
idx0 = find(abs(denA) < 1d-12);
denA(idx0) = 1;           
Xa = exp(-%i*5*w/2) .* (sin(3*w) ./ denA);
Xa(idx0) = 6;              

magA = abs(Xa);
phaseA = atan(imag(Xa), real(Xa));
idxA = find(magA < 1d-8);  
phaseA(idxA) = %nan;

scf(1); clf();
plot(w, magA);
xtitle('Part (a) - Magnitude spectrum', 'omega (rad/sample)', '|Xa(omega)|');
xgrid();
xs2png(1, 'Lab6_Bai4_9_a_bien_do.png');

scf(2); clf();
plot(w, phaseA);
xtitle('Part (a) - Phase spectrum', 'omega (rad/sample)', 'Phase (rad)');
xgrid();
xs2png(2, 'Lab6_Bai4_9_a_pha.png');

// ------------------------------------------------------------
// CAU (f): x(n) = 2 - n/2, |n| <= 4; 0 elsewhere
// Xf(w) = Rf(w) + j*If(w)
// Rf = 2 + 4*sum(cos(k*w)), k = 1,...,4
// If = sum(k*sin(k*w)), k = 1,...,4
// ------------------------------------------------------------
Rf = 2*ones(1, N) + 4*(cos(w) + cos(2*w) + cos(3*w) + cos(4*w));
If = sin(w) + 2*sin(2*w) + 3*sin(3*w) + 4*sin(4*w);
Xf = Rf + %i*If;

magF = abs(Xf);
phaseF = atan(imag(Xf), real(Xf));
idxF = find(magF < 1d-8);
phaseF(idxF) = %nan;

scf(3); clf();
plot(w, magF);
xtitle('Part (f) - Magnitude spectrum', 'omega (rad/sample)', '|Xf(omega)|');
xgrid();
xs2png(3, 'Lab6_Bai4_9_f_bien_do.png');

scf(4); clf();
plot(w, phaseF);
xtitle('Part (f) - Phase spectrum', 'omega (rad/sample)', 'Phase (rad)');
xgrid();
xs2png(4, 'Lab6_Bai4_9_f_pha.png');

// ------------------------------------------------------------
// CAU (g): x(n) = {-2, -1, 0, 1, 2}, x(0) = 0
// Xg(w) = -2j[sin(w) + 2sin(2w)]
// ------------------------------------------------------------
Xg = -2*%i*(sin(w) + 2*sin(2*w));

// Cac diem pho bang 0: omega = 0, +/-pi, +/-acos(-1/4)
omegaZero = acos(-1/4);
[tmp, idxPos] = min(abs(w - omegaZero));
[tmp, idxNeg] = min(abs(w + omegaZero));
Xg(idxPos) = 0;
Xg(idxNeg) = 0;

magG = abs(Xg);
phaseG = atan(imag(Xg), real(Xg));
idxG = find(magG < 1d-8);
phaseG(idxG) = %nan;        

scf(5); clf();
plot(w, magG);
xtitle('Part (g) - Magnitude spectrum', 'omega (rad/sample)', '|Xg(omega)|');
xgrid();
xs2png(5, 'Lab6_Bai4_9_g_bien_do.png');

scf(6); clf();
plot(w, phaseG);
xtitle('Part (g) - Phase spectrum', 'omega (rad/sample)', 'Phase (rad)');
xgrid();
xs2png(6, 'Lab6_Bai4_9_g_pha.png')
