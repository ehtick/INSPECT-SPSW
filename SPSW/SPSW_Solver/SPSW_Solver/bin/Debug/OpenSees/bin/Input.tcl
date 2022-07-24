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
node 1 -180 0;
node 2 60 0;
node 3 180 0;
node 4 -180 120;
node 5 60 120;
node 6 180 120;
node 7 -180 240;
node 8 60 240;
node 9 180 240;
node 10 -180 360;
node 11 60 360;
node 12 180 360;
node 13 -145.71429 120;
node 14 -111.42857 120;
node 15 -77.14286 120;
node 16 -42.85714 120;
node 17 -8.57143 120;
node 18 25.71429 120;
node 19 60 80;
node 20 60 40;
node 21 -145.71429 0;
node 22 -111.42857 0;
node 23 -77.14286 0;
node 24 -42.85714 0;
node 25 -8.57143 0;
node 26 25.71429 0;
node 27 -180 80;
node 28 -180 40;
node 29 -145.71429 240;
node 30 -111.42857 240;
node 31 -77.14286 240;
node 32 -42.85714 240;
node 33 -8.57143 240;
node 34 25.71429 240;
node 35 60 200;
node 36 60 160;
node 37 -180 200;
node 38 -180 160;
node 39 -145.71429 360;
node 40 -111.42857 360;
node 41 -77.14286 360;
node 42 -42.85714 360;
node 43 -8.57143 360;
node 44 25.71429 360;
node 45 60 320;
node 46 60 280;
node 47 -180 320;
node 48 -180 280;
node 49 180 0.12;
node 50 180 119.88;
node 51 180 120.12;
node 52 180 239.88;
node 53 180 240.12;
node 54 180 359.88;
region 1 -nodeRange 1 54
# --------------------------------
# Define Nodes Constrains-------------------
fix 1 1 1 0;
fix 2 1 1 0;
fix 3 1 1 0;
region 2 -nodeRange 1 3
# -----------------------------------------
# Define Nodes Mass-------------------
mass 4 0.454968944099379 1.0e-9 1.0e-9;
mass 5 0.454968944099379 1.0e-9 1.0e-9;
mass 7 0.454968944099379 1.0e-9 1.0e-9;
mass 8 0.454968944099379 1.0e-9 1.0e-9;
mass 10 0.492792443064182 1.0e-9 1.0e-9;
mass 11 0.492792443064182 1.0e-9 1.0e-9;
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
uniaxialMaterial Hysteretic 2 50 0.001724 61.67 0.022 37 0.036 -50 -0.001724 -61.67 -0.022 -37 -0.036 1 1 0 0; 
uniaxialMaterial MinMax 3 2 -min -0.036 -max 0.036
uniaxialMaterial Hysteretic 4 50 0.001724 61.67 0.022 61.67 0.036 -50 -0.001724 -61.67 -0.022 -61.67 -0.036 1 1 0 0; 
uniaxialMaterial MinMax 5 4 -min -0.036 -max 0.036
uniaxialMaterial Hysteretic 6 30 0.00105 38 0.015 0 0.018 -1E-20 -0.1 -1E-20 -0.2 -1E-20 -0.3 1 1E-09 0 0; 
uniaxialMaterial MinMax 7 6 -min -1.79769313486232E+308 -max 0.018
# ----------------------------------------
# Infill Panels -------------------
element Truss 2 21 16 1.87427915555319 7;
element Truss 3 22 17 1.87427915555319 7;
element Truss 4 23 18 1.87427915555319 7;
element Truss 5 24 5 1.87427915555319 7;
element Truss 6 25 19 1.87427915555319 7;
element Truss 7 26 20 1.87427915555319 7;
element Truss 8 27 13 1.87427915555319 7;
element Truss 9 28 14 1.87427915555319 7;
element Truss 10 1 15 1.87427915555319 7;
element Truss 11 21 28 1.87427915555319 7;
element Truss 12 22 27 1.87427915555319 7;
element Truss 13 23 4 1.87427915555319 7;
element Truss 14 24 13 1.87427915555319 7;
element Truss 15 25 14 1.87427915555319 7;
element Truss 16 26 15 1.87427915555319 7;
element Truss 17 19 18 1.87427915555319 7;
element Truss 18 20 17 1.87427915555319 7;
element Truss 19 2 16 1.87427915555319 7;
element Truss 20 13 32 1.53586764135609 7;
element Truss 21 14 33 1.53586764135609 7;
element Truss 22 15 34 1.53586764135609 7;
element Truss 23 16 8 1.53586764135609 7;
element Truss 24 17 35 1.53586764135609 7;
element Truss 25 18 36 1.53586764135609 7;
element Truss 26 37 29 1.53586764135609 7;
element Truss 27 38 30 1.53586764135609 7;
element Truss 28 4 31 1.53586764135609 7;
element Truss 29 13 38 1.53586764135609 7;
element Truss 30 14 37 1.53586764135609 7;
element Truss 31 15 7 1.53586764135609 7;
element Truss 32 16 29 1.53586764135609 7;
element Truss 33 17 30 1.53586764135609 7;
element Truss 34 18 31 1.53586764135609 7;
element Truss 35 35 34 1.53586764135609 7;
element Truss 36 36 33 1.53586764135609 7;
element Truss 37 5 32 1.53586764135609 7;
element Truss 38 29 42 0.937139577776595 7;
element Truss 39 30 43 0.937139577776595 7;
element Truss 40 31 44 0.937139577776595 7;
element Truss 41 32 11 0.937139577776595 7;
element Truss 42 33 45 0.937139577776595 7;
element Truss 43 34 46 0.937139577776595 7;
element Truss 44 47 39 0.937139577776595 7;
element Truss 45 48 40 0.937139577776595 7;
element Truss 46 7 41 0.937139577776595 7;
element Truss 47 29 48 0.937139577776595 7;
element Truss 48 30 47 0.937139577776595 7;
element Truss 49 31 10 0.937139577776595 7;
element Truss 50 32 39 0.937139577776595 7;
element Truss 51 33 40 0.937139577776595 7;
element Truss 52 34 41 0.937139577776595 7;
element Truss 53 45 44 0.937139577776595 7;
element Truss 54 46 43 0.937139577776595 7;
element Truss 55 8 42 0.937139577776595 7;
region 3 -eleRange 2 55
# ----------------------------------
# Rot Springs Gravity Columns -------------------
uniaxialMaterial Elastic 8 0.029;
rotSpring2D 72 3 49 8;
rotSpring2D 73 6 50 8;
rotSpring2D 74 6 51 8;
rotSpring2D 75 9 52 8;
rotSpring2D 76 9 53 8;
rotSpring2D 77 12 54 8;
# ---------------------------- -------------------
element elasticBeamColumn 78 49 50 4300 29000 4580 1;
element elasticBeamColumn 79 51 52 2230 29000 1330 1;
element elasticBeamColumn 80 53 54 2620 29000 1300 1;
region 5 -eleRange 78 80
# Rigid Links -------------------
element truss 69 5 6 1310 1;
element truss 70 8 9 1790 1;
element truss 71 11 12 2230 1;
region 4 -eleRange 69 71
# ----------------------------------
WSec 3 5 1 24.3 0.55 12.8 0.85 1 16 1 33;
element beamWithHinges 81 1 21 1 21.87 1 2.43 29000 34.4 3540 1;
element beamWithHinges 82 21 22 1 2.43 1 2.43 29000 34.4 3540 1;
element beamWithHinges 83 22 23 1 2.43 1 2.43 29000 34.4 3540 1;
element beamWithHinges 84 23 24 1 2.43 1 2.43 29000 34.4 3540 1;
element beamWithHinges 85 24 25 1 2.43 1 2.43 29000 34.4 3540 1;
element beamWithHinges 86 25 26 1 2.43 1 2.43 29000 34.4 3540 1;
element beamWithHinges 87 26 2 1 2.43 1 21.87 29000 34.4 3540 1;
WSec 3 5 2 12.1 0.335 8.05 0.575 1 16 1 33;
element beamWithHinges 88 4 13 2 10.89 2 1.21 29000 13.1 348 1;
element beamWithHinges 89 13 14 2 1.21 2 1.21 29000 13.1 348 1;
element beamWithHinges 90 14 15 2 1.21 2 1.21 29000 13.1 348 1;
element beamWithHinges 91 15 16 2 1.21 2 1.21 29000 13.1 348 1;
element beamWithHinges 92 16 17 2 1.21 2 1.21 29000 13.1 348 1;
element beamWithHinges 93 17 18 2 1.21 2 1.21 29000 13.1 348 1;
element beamWithHinges 94 18 5 2 1.21 2 10.89 29000 13.1 348 1;
WSec 3 5 3 13.9 0.375 10 0.645 1 16 1 33;
element beamWithHinges 95 7 29 3 12.51 3 1.39 29000 17.9 640 1;
element beamWithHinges 96 29 30 3 1.39 3 1.39 29000 17.9 640 1;
element beamWithHinges 97 30 31 3 1.39 3 1.39 29000 17.9 640 1;
element beamWithHinges 98 31 32 3 1.39 3 1.39 29000 17.9 640 1;
element beamWithHinges 99 32 33 3 1.39 3 1.39 29000 17.9 640 1;
element beamWithHinges 100 33 34 3 1.39 3 1.39 29000 17.9 640 1;
element beamWithHinges 101 34 8 3 1.39 3 12.51 29000 17.9 640 1;
WSec 3 5 4 18.2 0.425 11 0.68 1 16 1 33;
element beamWithHinges 102 10 39 4 16.38 4 1.82 29000 22.3 1330 1;
element beamWithHinges 103 39 40 4 1.82 4 1.82 29000 22.3 1330 1;
element beamWithHinges 104 40 41 4 1.82 4 1.82 29000 22.3 1330 1;
element beamWithHinges 105 41 42 4 1.82 4 1.82 29000 22.3 1330 1;
element beamWithHinges 106 42 43 4 1.82 4 1.82 29000 22.3 1330 1;
element beamWithHinges 107 43 44 4 1.82 4 1.82 29000 22.3 1330 1;
element beamWithHinges 108 44 11 4 1.82 4 16.38 29000 22.3 1330 1;
WSec 3 5 5 24.7 0.65 12.9 1.09 1 16 1 33;
element beamWithHinges 109 1 28 5 22.23 5 2.47 29000 43 4580 1;
element beamWithHinges 110 28 27 5 2.47 5 2.47 29000 43 4580 1;
element beamWithHinges 111 27 4 5 2.47 5 22.23 29000 43 4580 1;
element beamWithHinges 112 2 20 5 22.23 5 2.47 29000 43 4580 1;
element beamWithHinges 113 20 19 5 2.47 5 2.47 29000 43 4580 1;
element beamWithHinges 114 19 5 5 2.47 5 22.23 29000 43 4580 1;
WSec 3 5 6 18.2 0.425 11 0.68 1 16 1 33;
element beamWithHinges 115 4 38 6 16.38 6 1.82 29000 22.3 1330 1;
element beamWithHinges 116 38 37 6 1.82 6 1.82 29000 22.3 1330 1;
element beamWithHinges 117 37 7 6 1.82 6 16.38 29000 22.3 1330 1;
element beamWithHinges 118 5 36 6 16.38 6 1.82 29000 22.3 1330 1;
element beamWithHinges 119 36 35 6 1.82 6 1.82 29000 22.3 1330 1;
element beamWithHinges 120 35 8 6 1.82 6 16.38 29000 22.3 1330 1;
WSec 3 5 7 16.8 0.525 10.4 0.875 1 16 1 33;
element beamWithHinges 121 7 48 7 15.12 7 1.68 29000 26.2 1300 1;
element beamWithHinges 122 48 47 7 1.68 7 1.68 29000 26.2 1300 1;
element beamWithHinges 123 47 10 7 1.68 7 15.12 29000 26.2 1300 1;
element beamWithHinges 124 8 46 7 15.12 7 1.68 29000 26.2 1300 1;
element beamWithHinges 125 46 45 7 1.68 7 1.68 29000 26.2 1300 1;
element beamWithHinges 126 45 11 7 1.68 7 15.12 29000 26.2 1300 1;
region 9 -eleRange 81 126
equalDOF 4 5 1;
equalDOF 4 6 1;
equalDOF 7 8 1;
equalDOF 7 9 1;
equalDOF 10 11 1;
equalDOF 10 12 1;
pattern Plain 1 Linear {
load 4 0.0 -58.6 0.0;
load 5 0.0 -58.6 0.0;
load 6 0.0 -234.4 0.0;
load 7 0.0 -58.6 0.0;
load 8 0.0 -58.6 0.0;
load 9 0.0 -234.4 0.0;
load 10 0.0 -63.47 0.0;
load 11 0.0 -63.47 0.0;
load 12 0.0 -253.89 0.0;
}
wipeAnalysis;
constraints Plain ;
numberer Plain;
system BandGeneral;
test NormDispIncr 1E-09 100;
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
recorder Element -file Data/BWH/LocalForces.out -time -region 9 localForce;
recorder Element -file Data/BWH/ElasticRotation.out -time -region 9 basicDeformation;
recorder Element -file Data/BWH/PlasticRotation.out -time -region 9 plasticDeformation;
# PUSH OVER analysis ------------------------------
pattern Plain 2 Linear {
load 10 0.1 0.0 0.0;
load 7 0.0666666666666667 0.0 0.0;
load 4 0.0333333333333333 0.0 0.0;
}
# pushover: diplacement controlled static analysis
wipeAnalysis;
constraints Plain ;
numberer Plain;
system BandGeneral;
test NormDispIncr 1E-09 100;
set algorithmType Newton;
algorithm $algorithmType;
set IDctrlDOF 1;
set Dmax double(28.8);
set Dincr [ expr $Dmax/5500 ]
set IDctrlNode 10;
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

