case input 000

.option post
.option runlvl=6
.hdl ../../rram_v_1_0_0.va
.include ../../16nm_HP.pm

**netlist ===============================================================
****** latch 1 - bin, cin ******
m1 vin1 vclk t1 t1 nmos w=32n l=16n

*Rp HRS
*x1 t1 vcc rram_v_1_0_0 gap_ini = 19e-10 model_switch = 1 deltaGap0 = 0.05
*Rp LRS
x1 t1 vcc rram_v_1_0_0 gap_ini = 2e-10 model_switch = 1 deltaGap0 = 0.05 
*Rn HRS
x2 t1 0 rram_v_1_0_0 gap_ini = 19e-10 model_switch = 1 deltaGap0 = 0.05
*Rn LRS
*x2 t1 0 rram_v_1_0_0 gap_ini = 2e-10 model_switch = 1 deltaGap0 = 0.05

** AND inv
m2 t2 t1 vcc vcc pmos w=32n l=16n
m3 t2 t1 0 0 nmos w=64n l=16n
m4 t2 ain cout cout pmos w=32n l=16n

** OR inv
m5 t3 t1 vcc vcc pmos w=64n l=16n
m6 t3 t1 0 0 nmos w=32n l=16n
m7 t3 ain cout cout nmos w=32n l=16n

************************************************

****** latch 2 - ~bin ~cin *********

m8 vin2 vclk t4 t4 pmos w=32n l=16n

*Rp HRS
x3 t4 vcc rram_v_1_0_0 gap_ini = 19e-10 model_switch = 1 deltaGap0 = 0.05
*Rp LRS
*x3 t4 vcc rram_v_1_0_0 gap_ini = 2e-10 model_switch = 1 deltaGap0 = 0.05 
*Rn HRS
*x4 t4 0 rram_v_1_0_0 gap_ini = 19e-10 model_switch = 1 deltaGap0 = 0.05
*Rn LRS
x4 t4 0 rram_v_1_0_0 gap_ini = 2e-10 model_switch = 1 deltaGap0 = 0.05


** AND inv **
m9 t5 t4 vcc vcc  pmos w=32n l=16n
m10 t5 t4 0 0 nmos w=64n l=16n

****** NOR gate - ~(bc + ~b~c) *******

m11 t6 t2 vcc vcc pmos w=32n l=16n
m12 t7 t5 t6 t6 pmos w=32n l=16n
m13 t7 t2 0 0 nmos w=32n l=16n
m14 t7 t5 0 0 nmos w=32n l=16n
***************************************

****** switch ***************************
m15 t8 t7 vcc vcc pmos w=32n l=16n
m16 t8 t7 0 0 nmos w=32n l=16n

m17 t7 ain sum sum pmos w=32n l=16n 
m18 t8 ain sum sum nmos w=32n l=16n
*****************************************
*=======================================================

**** source ============================================
.param vdd=2v
.param hvdd=1v

vvdd vdd 0 dc vdd
vcc vcc 0 pwl(0,vdd 200ns,vdd 200.01ns,hvdd 300ns,hvdd)

**** b, c ****
vvin1 vin1 0 pwl(0,0 100ns,0 100.01ns,0 200ns,0 200.01ns,0 300ns,0)
**** ~b, ~c ****
vvin2 vin2 0 pwl(0,vdd 100ns,vdd 100.01ns,vdd 200ns,vdd 200.01ns,0 300ns,0)

vain ain 0 dc 0

vcclk vclk 0 pwl(0,vdd 100ns,vdd 200ns,vdd 200.01ns,0 300ns,0)
========================================================
.tran 100ps 300ns

.measure tran avgpower avg power from=0n to=300n
.massure tran maxpower max power from=0n to=300n

.end
