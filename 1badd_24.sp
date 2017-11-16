*1bit adder 24

.options post method=gear ingold=2 measform=1

* Model include
.include ../16nm_HP.pm

* source
.param vdd=0.7v
vcc vcc 0 vdd dc vdd

Vain ain 0 0 pwl(0,vdd 200n,vdd 200.01n,0)
Vbin bin 0 0 pwl(0,vdd 200n,vdd 200.01n,0)
Vcin cin 0 0 pwl(0,vdd 200n,vdd 200.01n,0)
************************************
*Vain ain 0 0 pulse 0 vdd 20n 0.1n 0.1n 19.9n 40n
*Vbin bin 0 0 pulse 0 vdd 10n 0.1n 0.1n 9.9n  20n
*Vcin cin 0 0 pulse 0 vdd 5n  0.1n 0.1n 4.9n  10n
*************************************
* s1u
*.param s1ut1 s1ut2
*cs1ut1 s1ut1 0 1f
ms1u1 s1ut1 Ain vcc vcc pmos l=16n w=32n
ms1u2 s1ut1 Bin vcc vcc pmos l=16n w=32n
ms1u3 s1ut2 Bin vcc vcc pmos l=16n w=32n
ms1u4 cout Cin s1ut1 s1ut1 pmos l=16n w=32n
ms1u5 cout Ain s1ut2 s1ut2 pmos l=16n w=32n
* s1d
*.param s1dt1 s1dt2
ms1d1 s1dt1 Ain 0 0 nmos l=16n w=32n
ms1d2 s1dt1 Bin 0 0 nmos l=16n w=32n
ms1d3 s1dt2 Bin 0 0 nmos l=16n w=32n
ms1d4 cout Cin s1dt1 s1dt1 nmos l=16n w=32n 
ms1d5 cout Ain s1dt2 s1dt2 nmos l=16n w=32n
 
* s2u
*.param s2ut1
ms2u1 s2ut1 Ain vcc vcc pmos l=16n w=32n
ms2u2 s2ut1 Bin vcc vcc pmos l=16n w=32n
ms2u3 s2ut1 Cin vcc vcc pmos l=16n w=32n
ms2u4 sum cout s2ut1 s2ut1 pmos l=16n w=32n
* s2d
*.param s2dt1 
ms2d1 s2dt1 Ain 0 0 nmos l=16n w=32n
ms2d2 s2dt1 Bin 0 0 nmos l=16n w=32n
ms2d3 s2dt1 Cin 0 0 nmos l=16n w=32n
ms2d4 sum cout s2dt1 s2dt1 nmos l=16n w=32n

* s3u
*.param s3ut1 s3ut2 s3ut3
ms3u1 s3ut1 Ain vcc vcc pmos l=16n w=32n
ms3u2 s3ut2 Bin s3ut1 s3ut1 pmos l=16n w=32n
ms3u3 sum Cin s3ut2 s3ut2 pmos l=16n w=32n
* s3d
*.param s3dt1 s3dt2 s3dt3
ms3d1 s3dt1 Ain 0 0 nmos l=16n w=32n
ms3d2 s3dt2 Bin s3dt1 s3dt1 nmos l=16n w=32n
ms3d3 sum Cin s3dt2 s3dt2 nmos l=16n w=32n


m1 ssum sum vcc vcc pmos w=32n l=16n
m2 ssum sum 0 0 nmos w=32n l=16n

.tran 10p 400n

.measure tran avgpower avg power from=150n to=250n
.end
