reset
set terminal epslatex color
set output 'phase.tex'
set xlabel '$\omega$ [kHz]'
set ylabel '$\varphi$ [rad]'
set key bottom right

set yrange [-2:2]

f(x)=atan((x*L-1/(x*C))/R)
R=0.0802836

g(x)=m*x+b

set fit logfile 'phase.log'
fit f(x) 'messung2.dat' u (2*pi*$1/1000):($6/180*pi):(pi/90) via C,L
fit [2*pi/1000*160:2*pi/1000*220] g(x) 'messung2.dat' u (2*pi*$1/1000):($6/180*pi):(pi/90) via m,b


p 'messung2.dat' u (2*pi*$1/1000):($6/180*pi):(pi/90) w e t'Messwerte', f(x) t'Theoriekurve nach \eqref{eq:phase_serie}', g(x) t 'linearer Fit um $\omega_R$'

set output
!epstopdf phase.eps
!rm phase.eps
