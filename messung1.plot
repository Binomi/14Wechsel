reset
set terminal epslatex color
set output 'messung1.tex'
set xlabel '$\omega^2$ [(kHz)$^2$]'
set ylabel '$|Z|^2$ [(k$\Omega )^2$]'
set key top left

#set xrange[0:0.001]

f(x)=m*x+b

set fit logfile 'messung1.log'
fit f(x) 'messung1.dat' u ((2*pi*$1/1000)**2):(($2/$3)**2):(sqrt((0.01*2*$2/$3**2)**2+(0.02*$3*2*$2**2/$3**3)**2)) via m,b
p 'messung1.dat' u ((2*pi*$1/1000)**2):(($2/$3)**2):(sqrt((0.01*2*$2/$3**2)**2+(0.02*$3*2*$2**2/$3**3)**2)) w e t'Messwerte' ,\
f(x) lt -1 t'Regressionsgerade'

set output
!epstopdf messung1.eps
!rm messung1.eps
