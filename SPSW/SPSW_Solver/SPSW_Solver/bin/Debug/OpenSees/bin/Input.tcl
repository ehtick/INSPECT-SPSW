# SET UP -------------------
wipe;  # clear opensees model
model basic -ndm 2 -ndf 3;  # 2 dimensions, 3 dof per node
file mkdir Data; # create outPut directory
file mkdir Data/ModeShapes; # create ModeShapes directory
file mkdir Data/Nodes; # create ModeShapes directory
file mkdir Data/Trusses; # create ModeShapes directory
file mkdir Data/GravityColumns; # create ModeShapes directory
file mkdir Data/PanelZoneElements; # create ModeShapes directory
file mkdir Data/Elastic; # create ModeShapes directory
file mkdir Data/DP; # create ModeShapes directory
file mkdir Data/NonLinearBeamColumn; # create ModeShapes directory
file mkdir Data/BWH; # create ModeShapes directory
file mkdir Data/PlasticHinges; # create ModeShapes directory
# -------------------------
# Define Nodes -------------------
node 1 -90.05902 0;
node 2 30.01968 0;
node 3 90.05902 0;
node 4 -72.90492 0;
node 5 -55.75082 0;
node 6 -38.59672 0;
node 7 -21.44262 0;
node 8 -4.28852 0;
node 9 12.86558 0;
node 10 -90.05902 67.95276;
node 11 30.01968 67.95276;
node 12 90.05902 67.95276;
node 13 -90.05902 139.96063;
node 14 30.01968 139.96063;
node 15 90.05902 139.96063;
node 16 -90.05902 211.9685;
node 17 30.01968 211.9685;
node 18 90.05902 211.9685;
node 19 -90.05902 279.82283;
node 20 30.01968 279.82283;
node 21 90.05902 279.82283;
node 22 -72.90492 67.95276;
node 23 -55.75082 67.95276;
node 24 -38.59672 67.95276;
node 25 -21.44262 67.95276;
node 26 -4.28852 67.95276;
node 27 12.86558 67.95276;
node 28 30.01968 50.96457;
node 29 30.01968 33.97638;
node 30 30.01968 16.98819;
node 31 -90.05902 50.96457;
node 32 -90.05902 33.97638;
node 33 -90.05902 16.98819;
node 34 -72.90492 139.96063;
node 35 -55.75082 139.96063;
node 36 -38.59673 139.96063;
node 37 -21.44263 139.96063;
node 38 -4.28853 139.96063;
node 39 12.86557 139.96063;
node 40 30.01968 121.95866;
node 41 30.01968 103.9567;
node 42 30.01968 85.95473;
node 43 -90.05902 121.95866;
node 44 -90.05902 103.9567;
node 45 -90.05902 85.95473;
node 46 -72.90492 211.9685;
node 47 -55.75082 211.9685;
node 48 -38.59673 211.9685;
node 49 -21.44263 211.9685;
node 50 -4.28853 211.9685;
node 51 12.86557 211.9685;
node 52 30.01968 193.96653;
node 53 30.01968 175.96456;
node 54 30.01968 157.9626;
node 55 -90.05902 193.96653;
node 56 -90.05902 175.96456;
node 57 -90.05902 157.9626;
node 58 -72.90492 279.82283;
node 59 -55.75082 279.82283;
node 60 -38.59672 279.82283;
node 61 -21.44262 279.82283;
node 62 -4.28852 279.82283;
node 63 12.86558 279.82283;
node 64 30.01968 262.85925;
node 65 30.01968 245.89567;
node 66 30.01968 228.93208;
node 67 -90.05902 262.85925;
node 68 -90.05902 245.89567;
node 69 -90.05902 228.93208;
node 70 90.05902 0.06795;
node 71 90.05902 67.88481;
node 72 90.05902 68.02477;
node 73 90.05902 139.88862;
node 74 90.05902 140.03264;
node 75 90.05902 211.89649;
node 76 90.05902 212.03635;
node 77 90.05902 279.75498;
node 78 -30.01967 67.95276;
node 79 -30.01967 139.96063;
node 80 -30.01967 211.9685;
node 81 -30.01967 279.82283;
region 1 -nodeRange 1 81
# --------------------------------
# Define Nodes Constrains-------------------
fix 1 1 1 0;
fix 2 1 1 0;
fix 3 1 1 0;
fix 4 1 1 0;
fix 5 1 1 0;
fix 6 1 1 0;
fix 7 1 1 0;
fix 8 1 1 0;
fix 9 1 1 0;
region 2 -nodeRange 1 9
# -----------------------------------------
# Define Nodes Mass-------------------
mass 10 1.32093315819023 1.0e-9 1.0e-9;
mass 11 1.32093315819023 1.0e-9 1.0e-9;
mass 13 1.26393263019581 1.0e-9 1.0e-9;
mass 14 1.26393263019581 1.0e-9 1.0e-9;
mass 16 1.15034280547091 1.0e-9 1.0e-9;
mass 17 1.15034280547091 1.0e-9 1.0e-9;
mass 19 0.905523269595066 1.0e-9 1.0e-9;
mass 20 0.905523269595066 1.0e-9 1.0e-9;
# ------------------------------------
proc WSec { FlangematIDhard  WebmatIDhard SecTag d  tw  bf tf nfbf nftf nftw nfdw} {
   # nfdw 20	 number of fibers along web depth 
   # nftw 1	 number of fibers along web thickness
   # nfbf 25	 number of fibers along flange width (you want this many in a bi-directional loading)
   # nftf 2	#number of fibers along flange thickness
  
  set dw [expr $d - 2 * $tf]
  set y1 [expr -$d/2]
  set y2 [expr -$dw/2]
  set y3 [expr  $dw/2]
  set y4 [expr  $d/2]
  
  set z1 [expr -$bf/2]
  set z2 [expr -$tw/2]
  set z3 [expr  $tw/2]
  set z4 [expr  $bf/2]
  
  #                           
  section fiberSec  $SecTag {
     #                     nfIJ  nfJK    yI  zI    yJ  zJ    yK  zK    yL  zL
     patch quadr  $FlangematIDhard $nfbf $nftf   $y1 $z4   $y1 $z1   $y2 $z1   $y2 $z4
     patch quadr  $WebmatIDhard $nftw $nfdw   $y2 $z3   $y2 $z2   $y3 $z2   $y3 $z3
     patch quadr  $FlangematIDhard $nfbf $nftf   $y3 $z4   $y3 $z1   $y4 $z1   $y4 $z4
  }
}

geomTransf PDelta 1;
geomTransf Linear 2;
proc rotSpring2D { eleID nodeR nodeC matID } {
                        element zeroLength $eleID $nodeR $nodeC -mat $matID -dir 6;
                        equalDOF    $nodeR     $nodeC     1     2;
                        }
# Elastic Materials -------------------
uniaxialMaterial Elastic 1 29000
# -----------------------------------
# User Defined Materials -------------------
uniaxialMaterial Hysteretic 2 70 0.0025 97.61 0.05 58.57 0.066 -70 -0.0025 -97.61 -0.05 -58.57 -0.066 1 1 0 0; 
uniaxialMaterial MinMax 3 2 -min -0.09 -max 0.09
uniaxialMaterial Hysteretic 4 70 0.0024 97.61 0.05 97.61 0.09 -70 -0.0024 -97.61 -0.05 -97.61 -0.09 1 1 0 0; 
uniaxialMaterial MinMax 5 4 -min -0.09 -max 0.09
uniaxialMaterial Hysteretic 6 40 0.00138 62.4 0.04 62.4 0.07 -8 -0.000276 -8 -0.04 -8 -0.07 1 1 0 0; 
uniaxialMaterial MinMax 7 6 -min -0.07 -max 0.07
uniaxialMaterial Hysteretic 8 35 0.00121 57.5 0.04 57.5 0.07 -7 -0.00024 -7 -0.04 -7 -0.07 1 1 0 0; 
uniaxialMaterial MinMax 9 8 -min -0.07 -max 0.07
# ----------------------------------------
# Infill Panels -------------------
element Truss 2 4 26 2.28107162739544 7;
element Truss 3 5 27 2.28107162739544 7;
element Truss 4 6 11 2.28107162739544 7;
element Truss 5 7 28 2.28107162739544 7;
element Truss 6 8 29 2.28107162739544 7;
element Truss 7 9 30 2.28107162739544 7;
element Truss 8 31 22 2.28107162739544 7;
element Truss 9 32 23 2.28107162739544 7;
element Truss 10 33 24 2.28107162739544 7;
element Truss 11 1 25 2.28107162739544 7;
element Truss 12 4 33 2.28107162739544 7;
element Truss 13 5 32 2.28107162739544 7;
element Truss 14 6 31 2.28107162739544 7;
element Truss 15 7 10 2.28107162739544 7;
element Truss 16 8 22 2.28107162739544 7;
element Truss 17 9 23 2.28107162739544 7;
element Truss 18 28 27 2.28107162739544 7;
element Truss 19 29 26 2.28107162739544 7;
element Truss 20 30 25 2.28107162739544 7;
element Truss 21 2 24 2.28107162739544 7;
element Truss 22 22 38 2.34683742880912 7;
element Truss 23 23 39 2.34683742880912 7;
element Truss 24 24 14 2.34683742880912 7;
element Truss 25 25 40 2.34683742880912 7;
element Truss 26 26 41 2.34683742880912 7;
element Truss 27 27 42 2.34683742880912 7;
element Truss 28 43 34 2.34683742880912 7;
element Truss 29 44 35 2.34683742880912 7;
element Truss 30 45 36 2.34683742880912 7;
element Truss 31 10 37 2.34683742880912 7;
element Truss 32 22 45 2.34683742880912 7;
element Truss 33 23 44 2.34683742880912 7;
element Truss 34 24 43 2.34683742880912 7;
element Truss 35 25 13 2.34683742880912 7;
element Truss 36 26 34 2.34683742880912 7;
element Truss 37 27 35 2.34683742880912 7;
element Truss 38 40 39 2.34683742880912 7;
element Truss 39 41 38 2.34683742880912 7;
element Truss 40 42 37 2.34683742880912 7;
element Truss 41 11 36 2.34683742880912 7;
element Truss 42 34 50 1.6623431787398 9;
element Truss 43 35 51 1.6623431787398 9;
element Truss 44 36 17 1.6623431787398 9;
element Truss 45 37 52 1.6623431787398 9;
element Truss 46 38 53 1.6623431787398 9;
element Truss 47 39 54 1.6623431787398 9;
element Truss 48 55 46 1.6623431787398 9;
element Truss 49 56 47 1.6623431787398 9;
element Truss 50 57 48 1.6623431787398 9;
element Truss 51 13 49 1.6623431787398 9;
element Truss 52 34 57 1.6623431787398 9;
element Truss 53 35 56 1.6623431787398 9;
element Truss 54 36 55 1.6623431787398 9;
element Truss 55 37 16 1.6623431787398 9;
element Truss 56 38 46 1.6623431787398 9;
element Truss 57 39 47 1.6623431787398 9;
element Truss 58 52 51 1.6623431787398 9;
element Truss 59 53 50 1.6623431787398 9;
element Truss 60 54 49 1.6623431787398 9;
element Truss 61 14 48 1.6623431787398 9;
element Truss 62 46 62 1.61457621437414 9;
element Truss 63 47 63 1.61457621437414 9;
element Truss 64 48 20 1.61457621437414 9;
element Truss 65 49 64 1.61457621437414 9;
element Truss 66 50 65 1.61457621437414 9;
element Truss 67 51 66 1.61457621437414 9;
element Truss 68 67 58 1.61457621437414 9;
element Truss 69 68 59 1.61457621437414 9;
element Truss 70 69 60 1.61457621437414 9;
element Truss 71 16 61 1.61457621437414 9;
element Truss 72 46 69 1.61457621437414 9;
element Truss 73 47 68 1.61457621437414 9;
element Truss 74 48 67 1.61457621437414 9;
element Truss 75 49 19 1.61457621437414 9;
element Truss 76 50 58 1.61457621437414 9;
element Truss 77 51 59 1.61457621437414 9;
element Truss 78 64 63 1.61457621437414 9;
element Truss 79 65 62 1.61457621437414 9;
element Truss 80 66 61 1.61457621437414 9;
element Truss 81 17 60 1.61457621437414 9;
region 3 -eleRange 2 81
# ----------------------------------
# Rot Springs Gravity Columns -------------------
uniaxialMaterial Elastic 10 0.029;
rotSpring2D 103 3 70 10;
rotSpring2D 104 12 71 10;
rotSpring2D 105 12 72 10;
rotSpring2D 106 15 73 10;
rotSpring2D 107 15 74 10;
rotSpring2D 108 18 75 10;
rotSpring2D 109 18 76 10;
rotSpring2D 110 21 77 10;
# ---------------------------- -------------------
element elasticBeamColumn 111 70 71 2320 29000 662 1;
element elasticBeamColumn 112 72 73 2320 29000 662 1;
element elasticBeamColumn 113 74 75 2320 29000 662 1;
element elasticBeamColumn 114 76 77 2320 29000 662 1;
region 5 -eleRange 111 114
# Rigid Links -------------------
element truss 99 11 12 1170 1;
element truss 100 14 15 1170 1;
element truss 101 17 18 1170 1;
element truss 102 20 21 1620 1;
region 4 -eleRange 99 102
# ----------------------------------
element elasticBeamColumn 115 1 4 23.2 29000 662 1;
element elasticBeamColumn 116 4 5 23.2 29000 662 1;
element elasticBeamColumn 117 5 6 23.2 29000 662 1;
element elasticBeamColumn 118 6 7 23.2 29000 662 1;
element elasticBeamColumn 119 7 8 23.2 29000 662 1;
element elasticBeamColumn 120 8 9 23.2 29000 662 1;
element elasticBeamColumn 121 9 2 23.2 29000 662 1;
element elasticBeamColumn 122 22 23 11.7 29000 307 1;
element elasticBeamColumn 123 23 24 11.7 29000 307 1;
element elasticBeamColumn 124 24 78 11.7 29000 307 1;
element elasticBeamColumn 125 78 25 11.7 29000 307 1;
element elasticBeamColumn 126 25 26 11.7 29000 307 1;
element elasticBeamColumn 127 26 27 11.7 29000 307 1;
element elasticBeamColumn 128 34 35 11.7 29000 307 1;
element elasticBeamColumn 129 35 36 11.7 29000 307 1;
element elasticBeamColumn 130 36 79 11.7 29000 307 1;
element elasticBeamColumn 131 79 37 11.7 29000 307 1;
element elasticBeamColumn 132 37 38 11.7 29000 307 1;
element elasticBeamColumn 133 38 39 11.7 29000 307 1;
element elasticBeamColumn 134 46 47 11.7 29000 307 1;
element elasticBeamColumn 135 47 48 11.7 29000 307 1;
element elasticBeamColumn 136 48 80 11.7 29000 307 1;
element elasticBeamColumn 137 80 49 11.7 29000 307 1;
element elasticBeamColumn 138 49 50 11.7 29000 307 1;
element elasticBeamColumn 139 50 51 11.7 29000 307 1;
element elasticBeamColumn 140 58 59 16.2 29000 1140 1;
element elasticBeamColumn 141 59 60 16.2 29000 1140 1;
element elasticBeamColumn 142 60 81 16.2 29000 1140 1;
element elasticBeamColumn 143 81 61 16.2 29000 1140 1;
element elasticBeamColumn 144 61 62 16.2 29000 1140 1;
element elasticBeamColumn 145 62 63 16.2 29000 1140 1;
element elasticBeamColumn 146 33 32 23.2 29000 662 1;
element elasticBeamColumn 147 32 31 23.2 29000 662 1;
element elasticBeamColumn 148 31 10 23.2 29000 662 1;
element elasticBeamColumn 149 30 29 23.2 29000 662 1;
element elasticBeamColumn 150 29 28 23.2 29000 662 1;
element elasticBeamColumn 151 28 11 23.2 29000 662 1;
element elasticBeamColumn 152 10 45 23.2 29000 662 1;
element elasticBeamColumn 153 45 44 23.2 29000 662 1;
element elasticBeamColumn 154 44 43 23.2 29000 662 1;
element elasticBeamColumn 155 43 13 23.2 29000 662 1;
element elasticBeamColumn 156 11 42 23.2 29000 662 1;
element elasticBeamColumn 157 42 41 23.2 29000 662 1;
element elasticBeamColumn 158 41 40 23.2 29000 662 1;
element elasticBeamColumn 159 40 14 23.2 29000 662 1;
element elasticBeamColumn 160 13 57 23.2 29000 662 1;
element elasticBeamColumn 161 57 56 23.2 29000 662 1;
element elasticBeamColumn 162 56 55 23.2 29000 662 1;
element elasticBeamColumn 163 55 16 23.2 29000 662 1;
element elasticBeamColumn 164 14 54 23.2 29000 662 1;
element elasticBeamColumn 165 54 53 23.2 29000 662 1;
element elasticBeamColumn 166 53 52 23.2 29000 662 1;
element elasticBeamColumn 167 52 17 23.2 29000 662 1;
element elasticBeamColumn 168 16 69 23.2 29000 662 1;
element elasticBeamColumn 169 69 68 23.2 29000 662 1;
element elasticBeamColumn 170 68 67 23.2 29000 662 1;
element elasticBeamColumn 171 67 19 23.2 29000 662 1;
element elasticBeamColumn 172 17 66 23.2 29000 662 1;
element elasticBeamColumn 173 66 65 23.2 29000 662 1;
element elasticBeamColumn 174 65 64 23.2 29000 662 1;
element elasticBeamColumn 175 64 20 23.2 29000 662 1;
region 6 -eleRange 115 175
WSec 5 5 1 11.9 0.295 8.01 0.515 25 2 1 15;
element nonlinearBeamColumn 176 10 22 3 1 1
element nonlinearBeamColumn 177 27 11 3 1 1
element nonlinearBeamColumn 178 13 34 3 1 1
element nonlinearBeamColumn 179 39 14 3 1 1
element nonlinearBeamColumn 180 16 46 3 1 1
element nonlinearBeamColumn 181 51 17 3 1 1
WSec 5 5 2 20.8 0.375 8.22 0.522 25 2 1 15;
element nonlinearBeamColumn 182 19 58 3 2 1
element nonlinearBeamColumn 183 63 20 3 2 1
WSec 3 3 3 12.4 0.47 12.1 0.735 25 2 1 15;
element nonlinearBeamColumn 184 1 33 3 3 1
element nonlinearBeamColumn 185 2 30 3 3 1
region 8 -eleRange 176 185
equalDOF 10 11 1;
equalDOF 10 12 1;
equalDOF 13 14 1;
equalDOF 13 15 1;
equalDOF 16 17 1;
equalDOF 16 18 1;
equalDOF 19 20 1;
equalDOF 19 21 1;
pattern Plain 1 Linear {
load 10 0.0 -510.408571824704 0.0;
load 11 0.0 -510.408571824704 0.0;
load 12 0.0 -1E-06 0.0;
load 13 0.0 -488.383567807663 0.0;
load 14 0.0 -488.383567807663 0.0;
load 15 0.0 -1E-06 0.0;
load 16 0.0 -444.492459533961 0.0;
load 17 0.0 -444.492459533961 0.0;
load 18 0.0 -1E-06 0.0;
load 19 0.0 -349.894190871533 0.0;
load 20 0.0 -349.894190871533 0.0;
load 21 0.0 -1E-06 0.0;
}
wipeAnalysis;
constraints Plain ;
numberer Plain;
system SparseGEN;
test NormDispIncr 0.0001 100;
algorithm Newton;
integrator LoadControl 0.1;
analysis Static;
analyze 10;
loadConst -time 0.0;
# Define Supports Recordes-------------------
recorder Node -file Data/Nodes/Supports.out -time -region 2 -dof 1 2 3 reaction;
# Define MainNodes Recordes-------------------
recorder Node -file Data/Nodes/Nodes.out -time -region 1 -dof 1 2 3 disp;
recorder Element -file Data/Trusses/TrussesStrains.out -time -region 3 deformations;
recorder Element -file Data/Trusses/Trusses.out -time -region 3 basicForces;
recorder Element -file Data/GravityColumns/LocalForces.out -time -region 5 localForce;
recorder Element -file Data/Elastic/LocalForces.out -time -region 6 localForce;
recorder Element -file Data/NonLinearBeamColumn/LocalForces.out -time -region 8 localForce;
recorder Element -file Data/NonLinearBeamColumn/ElasticRotation.out -time -region 8 basicDeformation;
recorder Element -file Data/NonLinearBeamColumn/PlasticRotation.out -time -region 8 plasticDeformation;
# PUSH OVER analysis ------------------------------
pattern Plain 2 Linear {
load 19 0.1 0.0 0.0;
load 16 0.0757509669492454 0.0 0.0;
load 13 0.050017587789344 0.0 0.0;
load 10 0.0242842086294426 0.0 0.0;
}
# pushover: diplacement controlled static analysis
wipeAnalysis;
constraints Plain ;
numberer Plain;
system SparseGEN;
test NormDispIncr 0.0001 100;
set algorithmType Newton;
algorithm $algorithmType;
set IDctrlDOF 1;
set Dmax double(13.991141535);
set Dincr [ expr $Dmax/4000 ]
set IDctrlNode 19;
integrator DisplacementControl $IDctrlNode $IDctrlDOF $Dincr;
analysis Static	
set Nsteps [expr int($Dmax /$Dincr)];
set ok [analyze $Nsteps];
# ---------------------------------- in case of convergence problems
if {$ok != 0} {      
# change some analysis parameters to achieve convergence
# performance is slower inside this loop
	set ok 0;
	set controlDisp 0.0;		# start from zero
	set D0 0.0;		# start from zero
	set Dstep [expr ($controlDisp-$D0)/($Dmax-$D0)]
	set Tol 1.0e-9;
	set maxNumIter 100;
	set TestType EnergyIncr;
	set algorithmType Newton;
	while {$Dstep < 1.0 && $ok == 0} {	
		set controlDisp [nodeDisp $IDctrlNode $IDctrlDOF ]
		set Dstep [expr ($controlDisp-$D0)/($Dmax-$D0)]
		set ok [analyze 1 ]
		if {$ok != 0} {
			puts "Trying Newton with Initial Tangent .."
			test NormDispIncr   $Tol 2000  0
			algorithm Newton -initial
			set ok [analyze 1 ]
			test $TestType $Tol $maxNumIter  0
			algorithm $algorithmType
		}
		if {$ok != 0} {
			puts "Trying Broyden .."
			algorithm Broyden 8
			set ok [analyze 1 ]
			algorithm $algorithmType
		}
		if {$ok != 0} {
			puts "Trying NewtonWithLineSearch .."
			algorithm NewtonLineSearch .8
			set ok [analyze 1 ]
			algorithm $algorithmType
		}
	}
	};      # end if ok !0

