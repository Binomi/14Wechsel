reset
set terminal epslatex color
set output 'messung2.tex'
set xlabel '$\omega$ [kHz]'
set ylabel '$|Z|$ [k$\Omega$]'
set key top right

f(x)=sqrt(R**2+(x*L-1/(x*C))**2)
R=0.068
C=1.8
L=0.35

set fit logfile 'messung2.log'
fit f(x) 'messung2.dat' u (2*pi*$1/1000):($2/$5):(sqrt((0.01/$5)**2+(0.02*$2/$5)**2)) via R,L,C


p 'messung2.dat' u (2*pi*$1/1000):($2/$5):(sqrt((0.01/$5)**2+(0.02*$2/$5)**2)) w e t'Messwerte',\
f(x) lt -1 t'Fit nach Formel \eqref{eq:Scheinwiderstand_serie}'

set output
!epstopdf messung2.eps
!rm messung2.eps
