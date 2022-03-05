//////////////////////////////////////////////////////////////
//	Nali Weapons III The Executioner weapon
//				Feralidragon (26-01-2012)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecutioner expands NaliWeapons config(NWeaponsCfg);

//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=TheExecutioner ANIVFILE=MODELS\TheExecutionerFirstP_a.3d DATAFILE=MODELS\TheExecutionerFirstP_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheExecutioner STRENGTH=0
#exec MESH ORIGIN MESH=TheExecutioner X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=TheExecutionerR ANIVFILE=MODELS\TheExecutionerFirstP_a.3d DATAFILE=MODELS\TheExecutionerFirstP_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=TheExecutionerR STRENGTH=0
#exec MESH ORIGIN MESH=TheExecutionerR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=TheExecutionerPick ANIVFILE=MODELS\TheExecutionerPickup_a.3d DATAFILE=MODELS\TheExecutionerPickup_d.3d X=0 Y=0 Z=0 UNMIRROR=1
//#exec MESH LODPARAMS MESH=TheExecutionerPick STRENGTH=0
#exec MESH ORIGIN MESH=TheExecutionerPick X=0 Y=0 Z=0

//3rd person
#exec MESH IMPORT MESH=TheExecutionerM ANIVFILE=MODELS\TheExecutionerThirdP_a.3d DATAFILE=MODELS\TheExecutionerThirdP_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=TheExecutionerM STRENGTH=0.45
#exec MESH ORIGIN MESH=TheExecutionerM X=-85 Y=0 Z=-15

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=All STARTFRAME=0 NUMFRAMES=190
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=SingleAttack1 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=SingleRecoil1 STARTFRAME=9 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=SingleAttack2 STARTFRAME=18 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=SingleRecoil2 STARTFRAME=27 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=SingleAttack3 STARTFRAME=36 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=SingleRecoil3 STARTFRAME=45 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=SingleAttack4 STARTFRAME=54 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=SingleRecoil4 STARTFRAME=63 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=DoubleAttack1 STARTFRAME=72 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=DoubleRecoil1 STARTFRAME=81 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=DoubleAttack2 STARTFRAME=90 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=DoubleRecoil2 STARTFRAME=99 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=DoubleAttack3 STARTFRAME=108 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=DoubleRecoil3 STARTFRAME=117 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=DoubleAttack4 STARTFRAME=126 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=DoubleRecoil4 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=SuperCharge1 STARTFRAME=126 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=SuperAttack1 STARTFRAME=132 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=SuperAttackTween1 STARTFRAME=132 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=SuperRecoil1 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=SuperCharge2 STARTFRAME=144 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=SuperAttack2 STARTFRAME=153 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=SuperAttackTween2 STARTFRAME=153 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=SuperRecoil2 STARTFRAME=162 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=Select STARTFRAME=180 NUMFRAMES=10 RATE=20.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheExecutioner SEQ=Down STARTFRAME=171 NUMFRAMES=10 RATE=40.0

#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=All STARTFRAME=0 NUMFRAMES=190
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=SingleAttack1 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=SingleRecoil1 STARTFRAME=9 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=SingleAttack2 STARTFRAME=18 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=SingleRecoil2 STARTFRAME=27 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=SingleAttack3 STARTFRAME=36 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=SingleRecoil3 STARTFRAME=45 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=SingleAttack4 STARTFRAME=54 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=SingleRecoil4 STARTFRAME=63 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=DoubleAttack1 STARTFRAME=72 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=DoubleRecoil1 STARTFRAME=81 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=DoubleAttack2 STARTFRAME=90 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=DoubleRecoil2 STARTFRAME=99 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=DoubleAttack3 STARTFRAME=108 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=DoubleRecoil3 STARTFRAME=117 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=DoubleAttack4 STARTFRAME=126 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=DoubleRecoil4 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=SuperCharge1 STARTFRAME=126 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=SuperAttack1 STARTFRAME=132 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=SuperAttackTween1 STARTFRAME=132 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=SuperRecoil1 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=SuperCharge2 STARTFRAME=144 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=SuperAttack2 STARTFRAME=153 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=SuperAttackTween2 STARTFRAME=153 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=SuperRecoil2 STARTFRAME=162 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=Select STARTFRAME=180 NUMFRAMES=10 RATE=20.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheExecutionerR SEQ=Down STARTFRAME=171 NUMFRAMES=10 RATE=40.0

#exec MESH SEQUENCE MESH=TheExecutionerPick SEQ=All STARTFRAME=0 NUMFRAMES=6
#exec MESH SEQUENCE MESH=TheExecutionerPick SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerPick SEQ=Pos1 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerPick SEQ=Pos2 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerPick SEQ=Pos3 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerPick SEQ=Pos4 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerPick SEQ=Pos5 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerPick SEQ=Pos6 STARTFRAME=5 NUMFRAMES=1

#exec MESH SEQUENCE MESH=TheExecutionerM SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=TheExecutionerM SEQ=Still STARTFRAME=0 NUMFRAMES=1

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=TheExecutioner MESH=TheExecutioner
#exec MESHMAP SCALE MESHMAP=TheExecutioner X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=TheExecutionerR MESH=TheExecutionerR
#exec MESHMAP SCALE MESHMAP=TheExecutionerR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=TheExecutionerPick MESH=TheExecutionerPick
#exec MESHMAP SCALE MESHMAP=TheExecutionerPick X=0.075 Y=0.075 Z=0.15

#exec MESHMAP NEW MESHMAP=TheExecutionerM MESH=TheExecutionerM
#exec MESHMAP SCALE MESHMAP=TheExecutionerM X=0.0375 Y=0.0375 Z=0.075

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=TheExecutioner_Sk FILE=SKINS\TheExecutioner_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=TheExecutioner NUM=1 TEXTURE=TheExecutioner_Sk
#exec MESHMAP SETTEXTURE MESHMAP=TheExecutionerR NUM=1 TEXTURE=TheExecutioner_Sk
#exec MESHMAP SETTEXTURE MESHMAP=TheExecutionerPick NUM=1 TEXTURE=TheExecutioner_Sk
#exec MESHMAP SETTEXTURE MESHMAP=TheExecutionerM NUM=1 TEXTURE=TheExecutioner_Sk

#exec TEXTURE IMPORT NAME=TheExecutionerMetal FILE=SKINS\TheExecutionerMetal.bmp GROUP=Skins LODSET=2

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=TheExecutionerIcon FILE=ICONS\TheExecutionerIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=TheExecutionerCrossAlpha FILE=ICONS\TheExecutionerCrossAlpha.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\TheExecutionerIcons.utx PACKAGE=NWTheExecutionerVIII_SRC.Icons

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="TheExecutionerPick" FILE=SOUNDS\TheExecutionerPick.wav GROUP="TheExecutioner"
#exec AUDIO IMPORT NAME="TheExecutionerSelect" FILE=SOUNDS\TheExecutionerSelect.wav GROUP="TheExecutioner"
#exec AUDIO IMPORT NAME="TheExecutionerAtk1" FILE=SOUNDS\TheExecutionerAtk1.wav GROUP="TheExecutioner"
#exec AUDIO IMPORT NAME="TheExecutionerAtk2" FILE=SOUNDS\TheExecutionerAtk2.wav GROUP="TheExecutioner"
#exec AUDIO IMPORT NAME="TheExecutionerAtk3" FILE=SOUNDS\TheExecutionerAtk3.wav GROUP="TheExecutioner"
#exec AUDIO IMPORT NAME="TheExecutionerAtk4" FILE=SOUNDS\TheExecutionerAtk4.wav GROUP="TheExecutioner"
#exec AUDIO IMPORT NAME="TheExecutionerDoubleAtk1" FILE=SOUNDS\TheExecutionerDoubleAtk1.wav GROUP="TheExecutioner"
#exec AUDIO IMPORT NAME="TheExecutionerDoubleAtk2" FILE=SOUNDS\TheExecutionerDoubleAtk2.wav GROUP="TheExecutioner"
#exec AUDIO IMPORT NAME="TheExecutionerDoubleAtk3" FILE=SOUNDS\TheExecutionerDoubleAtk3.wav GROUP="TheExecutioner"
#exec AUDIO IMPORT NAME="TheExecutionerDoubleAtk4" FILE=SOUNDS\TheExecutionerDoubleAtk4.wav GROUP="TheExecutioner"
#exec AUDIO IMPORT NAME="TheExecutionerChargedAtk" FILE=SOUNDS\TheExecutionerChargedAtk.wav GROUP="TheExecutioner"
#exec AUDIO IMPORT NAME="CutGib1" FILE=SOUNDS\CutGib1.wav GROUP="Gibs"
#exec AUDIO IMPORT NAME="CutGib2" FILE=SOUNDS\CutGib2.wav GROUP="Gibs"
#exec AUDIO IMPORT NAME="CutGib3" FILE=SOUNDS\CutGib3.wav GROUP="Gibs"
#exec AUDIO IMPORT NAME="CutGib4" FILE=SOUNDS\CutGib4.wav GROUP="Gibs"
#exec AUDIO IMPORT NAME="HeadShotCutGib1" FILE=SOUNDS\HeadShotCutGib1.wav GROUP="Gibs"
#exec AUDIO IMPORT NAME="HeadShotCutGib2" FILE=SOUNDS\HeadShotCutGib2.wav GROUP="Gibs"
#exec AUDIO IMPORT NAME="HeadShotCutGib3" FILE=SOUNDS\HeadShotCutGib3.wav GROUP="Gibs"
#exec AUDIO IMPORT NAME="HeadShotCutGib4" FILE=SOUNDS\HeadShotCutGib4.wav GROUP="Gibs"
#exec AUDIO IMPORT NAME="ChargedGib" FILE=SOUNDS\ChargedGib.wav GROUP="Gibs"
#exec AUDIO IMPORT NAME="ExecutionerBladeWallHit1" FILE=SOUNDS\ExecutionerBladeWallHit1.wav GROUP="Hits"
#exec AUDIO IMPORT NAME="ExecutionerBladeWallHit2" FILE=SOUNDS\ExecutionerBladeWallHit2.wav GROUP="Hits"
#exec AUDIO IMPORT NAME="ChargedWallHit" FILE=SOUNDS\ChargedWallHit.wav GROUP="Hits"
#exec AUDIO IMPORT NAME="TheExecutionerChargeAmb" FILE=SOUNDS\TheExecutionerChargeAmb.wav GROUP="Loop"


//LEFT HAND
//*******************************************************

//Left Hand version
#exec MESH IMPORT MESH=TheExecutionerHandLL ANIVFILE=MODELS\TheExecutionerHandL_a.3d DATAFILE=MODELS\TheExecutionerHandL_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheExecutionerHandLL STRENGTH=0
#exec MESH ORIGIN MESH=TheExecutionerHandLL X=0 Y=0 Z=0 Yaw=128

//Right Hand version
#exec MESH IMPORT MESH=TheExecutionerHandLR ANIVFILE=MODELS\TheExecutionerHandL_a.3d DATAFILE=MODELS\TheExecutionerHandL_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=TheExecutionerHandLR STRENGTH=0
#exec MESH ORIGIN MESH=TheExecutionerHandLR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=All STARTFRAME=0 NUMFRAMES=190
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=SingleAttack1 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=SingleRecoil1 STARTFRAME=9 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=SingleAttack2 STARTFRAME=18 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=SingleRecoil2 STARTFRAME=27 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=SingleAttack3 STARTFRAME=36 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=SingleRecoil3 STARTFRAME=45 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=SingleAttack4 STARTFRAME=54 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=SingleRecoil4 STARTFRAME=63 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=DoubleAttack1 STARTFRAME=72 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=DoubleRecoil1 STARTFRAME=81 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=DoubleAttack2 STARTFRAME=90 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=DoubleRecoil2 STARTFRAME=99 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=DoubleAttack3 STARTFRAME=108 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=DoubleRecoil3 STARTFRAME=117 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=DoubleAttack4 STARTFRAME=126 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=DoubleRecoil4 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=SuperCharge1 STARTFRAME=126 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=SuperAttack1 STARTFRAME=132 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=SuperAttackTween1 STARTFRAME=132 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=SuperRecoil1 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=SuperCharge2 STARTFRAME=144 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=SuperAttack2 STARTFRAME=153 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=SuperAttackTween2 STARTFRAME=153 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=SuperRecoil2 STARTFRAME=162 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=Select STARTFRAME=180 NUMFRAMES=10 RATE=20.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheExecutionerHandLL SEQ=Down STARTFRAME=171 NUMFRAMES=10 RATE=40.0

#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=All STARTFRAME=0 NUMFRAMES=190
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=SingleAttack1 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=SingleRecoil1 STARTFRAME=9 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=SingleAttack2 STARTFRAME=18 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=SingleRecoil2 STARTFRAME=27 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=SingleAttack3 STARTFRAME=36 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=SingleRecoil3 STARTFRAME=45 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=SingleAttack4 STARTFRAME=54 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=SingleRecoil4 STARTFRAME=63 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=DoubleAttack1 STARTFRAME=72 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=DoubleRecoil1 STARTFRAME=81 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=DoubleAttack2 STARTFRAME=90 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=DoubleRecoil2 STARTFRAME=99 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=DoubleAttack3 STARTFRAME=108 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=DoubleRecoil3 STARTFRAME=117 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=DoubleAttack4 STARTFRAME=126 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=DoubleRecoil4 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=SuperCharge1 STARTFRAME=126 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=SuperAttack1 STARTFRAME=132 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=SuperAttackTween1 STARTFRAME=132 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=SuperRecoil1 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=SuperCharge2 STARTFRAME=144 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=SuperAttack2 STARTFRAME=153 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=SuperAttackTween2 STARTFRAME=153 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=SuperRecoil2 STARTFRAME=162 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=Select STARTFRAME=180 NUMFRAMES=10 RATE=20.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheExecutionerHandLR SEQ=Down STARTFRAME=171 NUMFRAMES=10 RATE=40.0

//Scale
#exec MESHMAP NEW MESHMAP=TheExecutionerHandLL MESH=TheExecutionerHandLL
#exec MESHMAP SCALE MESHMAP=TheExecutionerHandLL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=TheExecutionerHandLR MESH=TheExecutionerHandLR
#exec MESHMAP SCALE MESHMAP=TheExecutionerHandLR X=0.03 Y=0.03 Z=0.06

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=TheExecutionerHandLL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=TheExecutionerHandLR NUM=1 TEXTURE=HumanHand


//RIGHT HAND
//*******************************************************

//Left Hand version
#exec MESH IMPORT MESH=TheExecutionerHandRL ANIVFILE=MODELS\TheExecutionerHandR_a.3d DATAFILE=MODELS\TheExecutionerHandR_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheExecutionerHandRL STRENGTH=0
#exec MESH ORIGIN MESH=TheExecutionerHandRL X=0 Y=0 Z=0 Yaw=128

//Right Hand version
#exec MESH IMPORT MESH=TheExecutionerHandRR ANIVFILE=MODELS\TheExecutionerHandR_a.3d DATAFILE=MODELS\TheExecutionerHandR_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=TheExecutionerHandRR STRENGTH=0
#exec MESH ORIGIN MESH=TheExecutionerHandRR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=All STARTFRAME=0 NUMFRAMES=190
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=SingleAttack1 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=SingleRecoil1 STARTFRAME=9 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=SingleAttack2 STARTFRAME=18 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=SingleRecoil2 STARTFRAME=27 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=SingleAttack3 STARTFRAME=36 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=SingleRecoil3 STARTFRAME=45 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=SingleAttack4 STARTFRAME=54 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=SingleRecoil4 STARTFRAME=63 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=DoubleAttack1 STARTFRAME=72 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=DoubleRecoil1 STARTFRAME=81 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=DoubleAttack2 STARTFRAME=90 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=DoubleRecoil2 STARTFRAME=99 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=DoubleAttack3 STARTFRAME=108 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=DoubleRecoil3 STARTFRAME=117 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=DoubleAttack4 STARTFRAME=126 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=DoubleRecoil4 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=SuperCharge1 STARTFRAME=126 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=SuperAttack1 STARTFRAME=132 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=SuperAttackTween1 STARTFRAME=132 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=SuperRecoil1 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=SuperCharge2 STARTFRAME=144 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=SuperAttack2 STARTFRAME=153 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=SuperAttackTween2 STARTFRAME=153 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=SuperRecoil2 STARTFRAME=162 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=Select STARTFRAME=180 NUMFRAMES=10 RATE=20.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheExecutionerHandRL SEQ=Down STARTFRAME=171 NUMFRAMES=10 RATE=40.0

#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=All STARTFRAME=0 NUMFRAMES=190
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=SingleAttack1 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=SingleRecoil1 STARTFRAME=9 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=SingleAttack2 STARTFRAME=18 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=SingleRecoil2 STARTFRAME=27 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=SingleAttack3 STARTFRAME=36 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=SingleRecoil3 STARTFRAME=45 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=SingleAttack4 STARTFRAME=54 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=SingleRecoil4 STARTFRAME=63 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=DoubleAttack1 STARTFRAME=72 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=DoubleRecoil1 STARTFRAME=81 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=DoubleAttack2 STARTFRAME=90 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=DoubleRecoil2 STARTFRAME=99 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=DoubleAttack3 STARTFRAME=108 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=DoubleRecoil3 STARTFRAME=117 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=DoubleAttack4 STARTFRAME=126 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=DoubleRecoil4 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=SuperCharge1 STARTFRAME=126 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=SuperAttack1 STARTFRAME=132 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=SuperAttackTween1 STARTFRAME=132 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=SuperRecoil1 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=SuperCharge2 STARTFRAME=144 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=SuperAttack2 STARTFRAME=153 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=SuperAttackTween2 STARTFRAME=153 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=SuperRecoil2 STARTFRAME=162 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=Select STARTFRAME=180 NUMFRAMES=10 RATE=20.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheExecutionerHandRR SEQ=Down STARTFRAME=171 NUMFRAMES=10 RATE=40.0

//Scale
#exec MESHMAP NEW MESHMAP=TheExecutionerHandRL MESH=TheExecutionerHandRL
#exec MESHMAP SCALE MESHMAP=TheExecutionerHandRL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=TheExecutionerHandRR MESH=TheExecutionerHandRR
#exec MESHMAP SCALE MESHMAP=TheExecutionerHandRR X=0.03 Y=0.03 Z=0.06

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=TheExecutionerHandRL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=TheExecutionerHandRR NUM=1 TEXTURE=HumanHand


var(ServerConfig) config bool bEnableHeadShot;
var(ServerConfig) config bool bFireMixedMoves;
var(ServerConfig) config int HeadShotDamage;
var(ServerConfig) config bool bChargingAltFire;
var(ServerConfig) config bool bChargingKillMultiple, bChargeTriggerOnTouch;
var(ServerConfig) config int ChargeAttackDamage, ChargeOwnDamage;
var(ServerConfig) config int ChargeOwnMaxMomentum;
var(ServerConfig) config float ChargeTotalTime, ChargeAttackMaxRange, ChargeOwnDamageMaxDist;

struct SingleConfSlicingData
{
	var() int AttackDamage;
	var() float AttackOdds;
};

struct DoubleConfSlicingData
{
	var() int AttackDamage;
	var() float AttackOdds;
	var() int AttackOtherDamage;
};

var(ServerConfig) config SingleConfSlicingData SingleSlices[4];
var(ServerConfig) config DoubleConfSlicingData DoubleSlices[4];

struct SingleSlicingData
{
	var() name AttackAnim;
	var() name RecoilAnim;
	var() float AttackRate;
	var() float RecoilRate;
	var() sound AttackSnd;
	var() vector AttackOffset;
	var() float AttackDelay;
};

struct DoubleSlicingData
{
	var() name AttackAnim;
	var() name RecoilAnim;
	var() float AttackRate;
	var() float RecoilRate;
	var() sound AttackSnd;
	var() vector AttackOffset;
	var() float AttackDelay;
	var() vector AttackOtherOffset;
};

var() SingleSlicingData SingleAttacks[4];
var() DoubleSlicingData DoubleAttacks[4];
var() float SlicingRange;
var() name SlicingDamageType;

var() sound CutGibSnd[4];
var() sound HeadShotGibSnd[4];
var() sound WallHitSnd[2];

var() name ChargeUpAnim, ChargeRecoilAnim, ChargeAttackAnim, ChargeAttackTweenAnim;
var() float ChargeRecoilRate, ChargeAttackRate;
var() sound ChargeAttackSnd, ChargeAmbSnd, ChargeGibSnd, ChargedWallHitSnd;
var() byte ChargeAmbSndPitchMin, ChargeAmbSndPitchMax;
var() byte ChargeAmbSndVol;
var() name ChargeDmgType;

var byte curAttackAnim, curAtkSelector;
var byte nextSingleAttackAnims[32], nextDoubleAttackAnims[32], nextMixAttackAnims[48];
var bool isRecoiling, isDouble, bMixedFire;
var float dmgTimeout;
var bool enableChargingAltFire, bCharging, bChargeAttacking, bRenderOldCharging, bChargeReleased, bTriggerChargeOnTouch;
var float chargeTTime, chargeCount;

enum E_BloodType
{
	BLDT_None,
	BLDT_Red,
	BLDT_Blue,
	BLDT_Green,
	BLDT_Yellow,
	BLDT_Black
};

struct BloodyObjects
{
	var() name ObjectType;
	var() E_BloodType BloodType;
};

var(ServerConfig) config BloodyObjects ObjectsBlood[32];
var int maxBloodItems;

var TheExecOV ovR, ovL;
var texture HighBloodR[3], LowBloodR[3];
var texture HighBloodL[3], LowBloodL[3];
var TheExecChargeOV ovCharge;

//Oversurrection configs
var(Oversurrection) config float OversurrectionLifeTime;
var(Oversurrection) config int OversurrectiveAttackDmgA, OversurrectiveAttackDmgB, OversurrectiveAttackDmgC;


replication
{
	reliable if (Role == ROLE_Authority && bNetOwner)
		nextSingleAttackAnims, nextDoubleAttackAnims, nextMixAttackAnims, enableChargingAltFire, chargeTTime, bMixedFire;
	unreliable if (Role == ROLE_Authority && bNetOwner)
		HighBloodR, LowBloodR, HighBloodL, LowBloodL;
	reliable if (Role < ROLE_Authority)
		CleanBlades;
	reliable if (Role == ROLE_Authority)
		TriggerClientRelease;
}

function PreBeginPlay()
{
	Super.PreBeginPlay();
	bMixedFire = default.bFireMixedMoves;
	enableChargingAltFire = default.bChargingAltFire;
	chargeTTime = default.ChargeTotalTime;
	
	processNextAttackLists(bMixedFire, enableChargingAltFire);
	LoadLists();
}

function LoadLists()
{
local int i;

	maxBloodItems = ArrayCount(ObjectsBlood);
	if (default.bOptimizeLists)
	{
		for (i = 0; i < ArrayCount(ObjectsBlood); i++)
		{
			if (ObjectsBlood[i].ObjectType == '')
			{
				maxBloodItems = i;
				break;
			}
		}
	}
}

exec function CleanBlades()
{
local TheExecutioner the_ex;
local byte i;

	if (Pawn(Owner) == None)	return;

	the_ex = TheExecutioner(Pawn(Owner).Weapon);
	if (the_ex != None)
	{
		for (i = 0; i < ArrayCount(HighBloodR); i++)
			HighBloodR[i] = None;
		for (i = 0; i < ArrayCount(LowBloodR); i++)
			LowBloodR[i] = None;
		for (i = 0; i < ArrayCount(HighBloodL); i++)
			HighBloodL[i] = None;
		for (i = 0; i < ArrayCount(LowBloodL); i++)
			LowBloodL[i] = None;
	}
}

function byte processNextAttackLists(optional bool bMixed, optional bool notProcessDouble)
{
local float oddsTotal, oddsSingle, oddsCur, probCalc;
local byte i, j, maxIndex, oldAttackAnim;
local int maxTries;

	if (!notProcessDouble)
	{
		//Process double list
		oddsTotal = 0.0;
		for (i = 0; i < ArrayCount(DoubleSlices); i++)
			oddsTotal += DoubleSlices[i].AttackOdds;
		if (oddsTotal > 0.0)
		{
			oldAttackAnim = 0;
			maxIndex = ArrayCount(nextDoubleAttackAnims) - 1;
			for (j = 0; j < ArrayCount(nextDoubleAttackAnims); j++)
			{
				if (j > 0)
					oldAttackAnim = nextDoubleAttackAnims[j-1];
				maxTries = 25;
				do
				{
					probCalc = FRand()*oddsTotal;
					oddsCur = 0.0;
					for (i = 0; i < ArrayCount(DoubleSlices); i++)
					{
						oddsCur += DoubleSlices[i].AttackOdds;
						if (DoubleSlices[i].AttackOdds > 0 && probCalc < oddsCur)
						{
							nextDoubleAttackAnims[j] = i;
							break;
						}
					}
					maxTries--;
				} until (maxTries < 0 || nextDoubleAttackAnims[j] != oldAttackAnim || 
						DoubleSlices[nextDoubleAttackAnims[j]].AttackOdds >= oddsTotal || 
						(j == maxIndex && nextDoubleAttackAnims[maxIndex] != nextDoubleAttackAnims[0]));
			}
		}
	}

	if (!bMixed)
	{
		//Process single list
		oddsTotal = 0.0;
		for (i = 0; i < ArrayCount(SingleSlices); i++)
			oddsTotal += SingleSlices[i].AttackOdds;
		if (oddsTotal > 0.0)
		{
			oldAttackAnim = 0;
			maxIndex = ArrayCount(nextSingleAttackAnims) - 1;
			for (j = 0; j < ArrayCount(nextSingleAttackAnims); j++)
			{
				if (j > 0)
					oldAttackAnim = nextSingleAttackAnims[j-1];
				maxTries = 25;
				do
				{
					probCalc = FRand()*oddsTotal;
					oddsCur = 0.0;
					for (i = 0; i < ArrayCount(SingleSlices); i++)
					{
						oddsCur += SingleSlices[i].AttackOdds;
						if (SingleSlices[i].AttackOdds > 0 && probCalc < oddsCur)
						{
							nextSingleAttackAnims[j] = i;
							break;
						}
					}
					maxTries--;
				} until (maxTries <= 0 || nextSingleAttackAnims[j] != oldAttackAnim || 
						SingleSlices[nextSingleAttackAnims[j]].AttackOdds >= oddsTotal || 
						(j == maxIndex && nextSingleAttackAnims[maxIndex] != nextSingleAttackAnims[0]));
			}
		}
	}
	else
	{
		//Process mixed list
		oddsTotal = 0.0;
		oddsSingle = 0.0;
		for (i = 0; i < ArrayCount(SingleSlices); i++)
			oddsTotal += SingleSlices[i].AttackOdds;
		oddsSingle = oddsTotal;
		for (i = 0; i < ArrayCount(DoubleSlices); i++)
			oddsTotal += DoubleSlices[i].AttackOdds;
		if (oddsTotal > 0.0)
		{
			oldAttackAnim = 0;
			maxIndex = ArrayCount(nextMixAttackAnims) - 1;
			for (j = 0; j < ArrayCount(nextMixAttackAnims); j++)
			{
				if (j > 0)
					oldAttackAnim = nextMixAttackAnims[j-1];
				maxTries = 25;
				do
				{
					probCalc = FRand()*oddsTotal;
					oddsCur = 0.0;
					if (probCalc < oddsSingle)
					{
						for (i = 0; i < ArrayCount(SingleSlices); i++)
						{
							oddsCur += SingleSlices[i].AttackOdds;
							if (SingleSlices[i].AttackOdds > 0 && probCalc < oddsCur)
							{
								nextMixAttackAnims[j] = i;
								break;
							}
						}
					}
					else
					{
						probCalc -= oddsSingle;
						for (i = 0; i < ArrayCount(DoubleSlices); i++)
						{
							oddsCur += DoubleSlices[i].AttackOdds;
							if (DoubleSlices[i].AttackOdds > 0 && probCalc < oddsCur)
							{
								nextMixAttackAnims[j] = i + ArrayCount(SingleSlices);
								break;
							}
						}
					}
					maxTries--;
				} until (maxTries <= 0 || nextMixAttackAnims[j] != oldAttackAnim || 
						(nextMixAttackAnims[j]<ArrayCount(SingleSlices) && SingleSlices[nextMixAttackAnims[j]].AttackOdds >= oddsSingle) || 
						(nextMixAttackAnims[j]>=ArrayCount(SingleSlices) && DoubleSlices[nextMixAttackAnims[j]-ArrayCount(SingleSlices)].AttackOdds >= (oddsTotal-oddsSingle)) || 
						(j == maxIndex && nextMixAttackAnims[maxIndex] != nextMixAttackAnims[0]));
			}
		}
	}
}

function ServerProcessNextAtk(optional bool isDoubleAtk)
{
	if (Role == Role_Authority)
	{
		curAtkSelector++;
		if (isDoubleAtk)
		{
			if (curAtkSelector >= ArrayCount(nextDoubleAttackAnims))
				curAtkSelector = 0;
		}
		else if (bMixedFire)
		{
			if (curAtkSelector >= ArrayCount(nextMixAttackAnims))
				curAtkSelector = 0;
		}
		else
		{
			if (curAtkSelector >= ArrayCount(nextSingleAttackAnims))
				curAtkSelector = 0;
		}
	}
}

simulated function ClientProcessNextAtk(optional bool isDoubleAtk)
{
	if (Role < Role_Authority)
	{
		curAtkSelector++;
		if (isDoubleAtk)
		{
			if (curAtkSelector >= ArrayCount(nextDoubleAttackAnims))
				curAtkSelector = 0;
		}
		else if (bMixedFire)
		{
			if (curAtkSelector >= ArrayCount(nextMixAttackAnims))
				curAtkSelector = 0;
		}
		else
		{
			if (curAtkSelector >= ArrayCount(nextSingleAttackAnims))
				curAtkSelector = 0;
		}
	}
}


function SetDamageTimeout(float tmOut)
{
	dmgTimeout = tmOut;
	if (tmOut <= 0)
		GiveSliceDamage();
}

function GiveSliceDamage()
{
local vector HitLocation, HitNormal;
local actor Other;
local float PawnHandY;
local vector CutOffset;

	if (PlayerPawn(Owner) != None && PlayerPawn(Owner).Handedness <= 0)
		PawnHandY = -1;
	else
		PawnHandY = 1;

	if (isDouble)
	{
		CutOffset = DoubleAttacks[curAttackAnim].AttackOffset;
		CutOffset.Y *= PawnHandY;
		Other = TraceCut(CutOffset, HitLocation, HitNormal);
		if (Other != None)
			HandleAttack(Other, HitLocation, HitNormal, DoubleSlices[curAttackAnim].AttackDamage, True);
		
		CutOffset = DoubleAttacks[curAttackAnim].AttackOtherOffset;
		CutOffset.Y *= PawnHandY;
		Other = TraceCut(CutOffset, HitLocation, HitNormal);
		if (Other != None)
			HandleAttack(Other, HitLocation, HitNormal, DoubleSlices[curAttackAnim].AttackOtherDamage, False);
	}
	else
	{
		CutOffset = SingleAttacks[curAttackAnim].AttackOffset;
		CutOffset.Y *= PawnHandY;
		Other = TraceCut(CutOffset, HitLocation, HitNormal);
		if (Other != None)
			HandleAttack(Other, HitLocation, HitNormal, SingleSlices[curAttackAnim].AttackDamage, (curAttackAnim%2)==0);
	}
}

function Actor TraceCut(vector cutOffset, out vector HitLocation, out vector HitNormal, optional float cutRange)
{
local vector StartTrace, EndTrace;
local Actor A;

	if (Pawn(Owner) == None)
		return None;
	if (cutRange == 0.0)
		cutRange = SlicingRange;
	StartTrace = Owner.Location + CalcNewDrawOffset() + (CutOffset >> Pawn(Owner).ViewRotation);
	EndTrace = StartTrace + vector(Pawn(Owner).ViewRotation)*(cutRange + Pawn(Owner).CollisionRadius);
	A = Pawn(Owner).Trace(HitLocation, HitNormal, EndTrace, StartTrace, True);
	if (A == None)
	{
		HitLocation = EndTrace;
		HitNormal = Normal(StartTrace - EndTrace);
	}
	return A;
}

function HandleAttack(Actor A, vector HitLocation, vector HitNormal, int AtkDmg, bool bRightBlade)
{
local int cuttingDmg, reducedDmg, healthToTake;
local byte sparks, i;

	if (A == Level)
	{
		if (Owner != None)
			Owner.PlaySound(WallHitSnd[Rand(ArrayCount(WallHitSnd))],, 16.0,, 600);
		Spawn(Class'TheExecWallParts',,, HitLocation + HitNormal, rotator(HitNormal));
		Spawn(Class'TheExecDecalFX',,, HitLocation + HitNormal, rotator(HitNormal));
		sparks = 3 + Rand(5);
		for (i = 0; i <= sparks; i++)
			Spawn(class'TheExecSpark',,, HitLocation + HitNormal, rotator(HitNormal));
	}
	else if (A != Self && A != Owner && A != None)
	{
		if (default.bEnableHeadshot && isHeadShotDmg(A, HitLocation))
		{
			if (giveFiredHealth(A, default.HeadShotDamage))
			{
				if (Pawn(A) != None)
					A.PlaySound(CutGibSnd[Rand(ArrayCount(CutGibSnd))],, 16.0,, 600);
				return;
			}
			
			if (Pawn(A) != None)
				A.PlaySound(HeadShotGibSnd[Rand(ArrayCount(HeadShotGibSnd))],, 16.0,, 600);
			UpdateBlood(A, True, bRightBlade);
			A.TakeDamage(default.HeadShotDamage * GetDamageMult(), Pawn(Owner), HitLocation, vect(0,0,0), 'Decapitated');
		}
		else
		{
			if (A.bIsPawn || A.IsA('Carcass'))
				A.PlaySound(CutGibSnd[Rand(ArrayCount(CutGibSnd))],, 16.0,, 600);
			else
				Spawn(class'UT_SpriteSmokePuff',,, HitLocation+HitNormal*9);
				
			if (giveFiredHealth(A, AtkDmg))
				return;
				
			UpdateBlood(A, False, bRightBlade);	
			if (Pawn(A) != None)
			{
				//Cutting patiently to not gib
				cuttingDmg = AtkDmg * GetDamageMult();
				while (Pawn(A).Health <= cuttingDmg && cuttingDmg > 1 && Pawn(A).Health > 1)
				{
					if (cuttingDmg > (Pawn(A).Health - 1))
					{
						reducedDmg = Level.Game.ReduceDamage(Pawn(A).Health-1, SlicingDamageType, Pawn(A), Pawn(Owner));
						if (reducedDmg <= 0)
							break;
						healthToTake = Int(((Pawn(A).Health - 1.f)**2) / reducedDmg) - 1;
						if (healthToTake <= 0)
							break;
					}
					else
						healthToTake = Pawn(A).Health - 1;
					
					cuttingDmg -= healthToTake;
					A.TakeDamage(healthToTake,  Pawn(Owner), HitLocation, vect(0,0,0), SlicingDamageType);
				}
				
				if (Pawn(A).Health > 0)
				{
					if (Pawn(A).Health < 10 && cuttingDmg > 15)
						A.TakeDamage(15,  Pawn(Owner), HitLocation, vect(0,0,0), SlicingDamageType);
					if (Pawn(A).Health > 0)
						A.TakeDamage(cuttingDmg,  Pawn(Owner), HitLocation, vect(0,0,0), SlicingDamageType);
				}
			}
			else
				A.TakeDamage(AtkDmg * GetDamageMult(),  Pawn(Owner), HitLocation, vect(0,0,0), SlicingDamageType);	
		}
	}
}

function UpdateBlood(Actor A, bool bHighBlood, bool bRightBlade)
{
local E_BloodType ABType;
local byte texSlot;

	if (!isFriend(A))
	{
		ABType = GetBloodTypeFromActor(A);
		if (ABType > BLDT_None)
		{
			if (bHighBlood && bRightBlade)
			{
				texSlot = GetFreeBloodSlot(HighBloodR);
				HighBloodR[texSlot] = Class'TheExecOv'.static.GetBloodTexture(True, ABType-1, texSlot);
			}
			else if (bHighBlood && !bRightBlade)
			{
				texSlot = GetFreeBloodSlot(HighBloodL);
				HighBloodL[texSlot] = Class'TheExecOv'.static.GetBloodTexture(True, ABType-1, texSlot);
			}
			else if (!bHighBlood && bRightBlade)
			{
				texSlot = GetFreeBloodSlot(LowBloodR);
				LowBloodR[texSlot] = Class'TheExecOv'.static.GetBloodTexture(False, ABType-1, texSlot);
			}
			else
			{
				texSlot = GetFreeBloodSlot(LowBloodL);
				LowBloodL[texSlot] = Class'TheExecOv'.static.GetBloodTexture(False, ABType-1, texSlot);
			}
		}
	}
}

function byte GetFreeBloodSlot(texture BloodList[3])
{
local byte i, j, freeSlots;
local byte BloodSlots[3];

	freeSlots = ArrayCount(BloodList);
	for (i = 0; i < ArrayCount(BloodList); i++)
	{
		if (BloodList[i] != None)
			freeSlots--;
	}
	
	if (freeSlots > 0)
	{
		for (i = 0; i < ArrayCount(BloodList); i++)
		{
			if (BloodList[i] == None)
			{
				BloodSlots[j] = i;
				j++;
			}
		}
		return BloodSlots[Rand(freeSlots)];
	}
	
	return Rand(ArrayCount(BloodList));
}


function E_BloodType GetBloodTypeFromActor(Actor A)
{
local int i;

	if (default.bInvertListsProcessing)
	{
		for (i = maxBloodItems-1; i >= 0; i--)
		{
			if (ObjectsBlood[i].ObjectType != '' && A.IsA(ObjectsBlood[i].ObjectType))
				return ObjectsBlood[i].BloodType;
		}
	}
	else
	{
		for (i = 0; i < maxBloodItems; i++)
		{
			if (ObjectsBlood[i].ObjectType != '' && A.IsA(ObjectsBlood[i].ObjectType))
				return ObjectsBlood[i].BloodType;
		}
	}
	
	if (CreatureChunks(A) != None && CreatureChunks(A).bGreenBlood)
		return BLDT_Green;
	else if (Carcass(A) != None)
		return BLDT_Red;
	return BLDT_None;
}

function bool isFriend(Actor Other)
{
	return Class'NWUtils'.static.isFriend(Pawn(Other), Level, Pawn(Owner));
}

simulated function RenderOther(canvas Canvas, vector Loc, rotator Rot)
{
	if (PlayerPawn(Owner) == None)
		return;
	
	if (hasBlood(True))
	{
		if (ovR == None)
			ovR = Spawn(Class'TheExecOV',,, Loc, Rot);
		RenderBlood(Canvas, Loc, Rot, True, ovR, HighBloodR, LowBloodR);
	}
	
	if (hasBlood(False))
	{
		if (ovL == None)
			ovL = Spawn(Class'TheExecOV',,, Loc, Rot);
		RenderBlood(Canvas, Loc, Rot, False, ovL, HighBloodL, LowBloodL);
	}
	
	if (enableChargingAltFire && (bCharging || bChargeAttacking))
	{
		if (ovCharge == None)
			ovCharge = Spawn(Class'TheExecChargeOV',,, Loc, Rot);
		RenderCharge(Canvas, Loc, Rot);
	}
}

simulated function RenderCharge(canvas Canvas, vector Loc, rotator Rot)
{
	if (ovCharge == None)
		return;
	
	ovCharge.SetHandedness(PlayerPawn(Owner).Handedness);
	ovCharge.SetLocation(Loc);
	ovCharge.SetRotation(Rot);
	ovCharge.AnimSequence = AnimSequence;
	ovCharge.AnimFrame = AnimFrame;
	
	if (bCharging)
		ovCharge.SetCharge(chargeCount/(chargeTTime/GetFirerateMult(True)));
	else if (bRenderOldCharging)
		ovCharge.SetFadeOut(GetFirerateMult(True)/ChargeAttackRate);
		
	bRenderOldCharging = bCharging;
	Canvas.DrawActor(ovCharge, False, False);
}

simulated function RenderBlood(canvas Canvas, vector Loc, rotator Rot, bool bRightSide, TheExecOV OV, texture HighBld[3], texture LowBld[3])
{
local byte i;

	if (OV == None)
		return;

	OV.SetHandedness(PlayerPawn(Owner).Handedness, bRightSide);
	OV.SetLocation(Loc);
	OV.SetRotation(Rot);
	OV.AnimSequence = AnimSequence;
	OV.AnimFrame = AnimFrame;
	
	for (i = 0; i < ArrayCount(HighBld); i++)
	{
		if (HighBld[i] != None)
		{
			OV.MultiSkins[1] = HighBld[i];
			Canvas.DrawActor(OV, False, False);
		}
	}
	
	for (i = 0; i < ArrayCount(LowBld); i++)
	{
		if (LowBld[i] != None)
		{
			OV.MultiSkins[1] = LowBld[i];
			Canvas.DrawActor(OV, False, False);
		}
	}
}

simulated function bool hasBlood(bool bRightSide)
{
local byte i;

	if (bRightSide)
	{
		for (i = 0; i < ArrayCount(HighBloodR); i++)
		{
			if (HighBloodR[i] != None)
				return True;
		}
		
		for (i = 0; i < ArrayCount(LowBloodR); i++)
		{
			if (LowBloodR[i] != None)
				return True;
		}
	}
	else
	{
		for (i = 0; i < ArrayCount(HighBloodL); i++)
		{
			if (HighBloodL[i] != None)
				return True;
		}
		
		for (i = 0; i < ArrayCount(LowBloodL); i++)
		{
			if (LowBloodL[i] != None)
				return True;
		}
	}
	
	return False;
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	if (Role == ROLE_Authority)
	{
		if (dmgTimeout > 0.0)
		{
			dmgTimeout -= Delta;
			if (dmgTimeout <= 0.0 && Pawn(Owner) != None)
				GiveSliceDamage();
		}
	}
}

simulated function Destroyed()
{
	if (ovR != None)
		ovR.Destroy();
	if (ovL != None)
		ovL.Destroy();
	if (ovCharge != None)
		ovCharge.Destroy();
		
	ovR = None;
	ovL = None;
	ovCharge = None;
	
	Super.Destroyed();
}


function Fire(float Value)
{
	ServerProcessNextAtk();
	if (bMixedFire)
	{
		if (nextMixAttackAnims[curAtkSelector] >= ArrayCount(SingleAttacks))
		{
			isDouble = True;
			curAttackAnim = nextMixAttackAnims[curAtkSelector] - ArrayCount(SingleAttacks);
			SetDamageTimeout(DoubleAttacks[curAttackAnim].AttackDelay/GetFirerateMult());
		}
		else
		{
			isDouble = False;
			curAttackAnim = nextMixAttackAnims[curAtkSelector];
			SetDamageTimeout(SingleAttacks[curAttackAnim].AttackDelay/GetFirerateMult());
		}
	}
	else
	{
		isDouble = False;
		curAttackAnim = nextSingleAttackAnims[curAtkSelector];
		SetDamageTimeout(SingleAttacks[curAttackAnim].AttackDelay/GetFirerateMult());
	}
	isRecoiling = False;
	
	GotoState('NormalFire');
	bPointing = True;
	bCanClientFire = True;
	ClientFire(Value);
	if (bRapidFire || FiringSpeed > 0)
		Pawn(Owner).PlayRecoil(FiringSpeed);
}

simulated function PlayFiring()
{		
	isRecoiling = False;
	ClientProcessNextAtk();
	if (bMixedFire)
	{
		if (nextMixAttackAnims[curAtkSelector] >= ArrayCount(SingleAttacks))
		{
			curAttackAnim = nextMixAttackAnims[curAtkSelector] - ArrayCount(SingleAttacks);
			PlayAnim(DoubleAttacks[curAttackAnim].AttackAnim, DoubleAttacks[curAttackAnim].AttackRate*GetFirerateMult(), 0.0);
			PlayOwnedSound(DoubleAttacks[curAttackAnim].AttackSnd, SLOT_None, Pawn(Owner).SoundDampening*4.0);
		}
		else
		{
			curAttackAnim = nextMixAttackAnims[curAtkSelector];
			PlayAnim(SingleAttacks[curAttackAnim].AttackAnim, SingleAttacks[curAttackAnim].AttackRate*GetFirerateMult(), 0.0);
			PlayOwnedSound(SingleAttacks[curAttackAnim].AttackSnd, SLOT_None, Pawn(Owner).SoundDampening*4.0);
		}
	}
	else
	{
		curAttackAnim = nextSingleAttackAnims[curAtkSelector];
		PlayAnim(SingleAttacks[curAttackAnim].AttackAnim, SingleAttacks[curAttackAnim].AttackRate*GetFirerateMult(), 0.0);
		PlayOwnedSound(SingleAttacks[curAttackAnim].AttackSnd, SLOT_None, Pawn(Owner).SoundDampening*4.0);
	}
}

function AltFire(float Value)
{
	isRecoiling = False;
	if (enableChargingAltFire)
	{
		chargeCount = 0.0;
		bCharging = True;
		bChargeAttacking = False;
		bChargeReleased = False;
	}
	else
	{
		isDouble = True;
		ServerProcessNextAtk(True);
		curAttackAnim = nextDoubleAttackAnims[curAtkSelector];
		SetDamageTimeout(DoubleAttacks[curAttackAnim].AttackDelay/GetFirerateMult(True));
	}
	
	GotoState('AltFiring');
	bPointing = True;
	bCanClientFire = True;
	ClientAltFire(Value);
	if (enableChargingAltFire && (bRapidFire || FiringSpeed > 0))
		Pawn(Owner).PlayRecoil(FiringSpeed);
}

simulated function PlayAltFiring()
{
	isRecoiling = False;
	if (enableChargingAltFire)
	{
		PlayAnim(ChargeUpAnim, (1/chargeTTime)*GetFirerateMult(True), 0.0);
		chargeCount = 0.0;
		bCharging = True;
		bChargeAttacking = False;
		bChargeReleased = False;
	}
	else
	{
		ClientProcessNextAtk(True);
		curAttackAnim = nextDoubleAttackAnims[curAtkSelector];
		PlayAnim(DoubleAttacks[curAttackAnim].AttackAnim, DoubleAttacks[curAttackAnim].AttackRate*GetFirerateMult(True), 0.0);
		PlayOwnedSound(DoubleAttacks[curAttackAnim].AttackSnd, SLOT_None, Pawn(Owner).SoundDampening*4.0);
	}
}

function GiveChargedDamage()
{
local vector HitLocation, HitNormal;
local vector StartTrace, EndTrace;
local actor Other;

	if (default.bChargingKillMultiple && Pawn(Owner) != None)
	{
		StartTrace = Owner.Location + CalcNewDrawOffset();
		EndTrace = StartTrace + vector(Pawn(Owner).ViewRotation)*(ChargeAttackMaxRange*FMax(1.0, Splasher) + Owner.CollisionRadius);
		ForEach TraceActors(Class'Actor', Other, HitLocation, HitNormal, EndTrace, StartTrace)
			HandleChargedAttack(Other, HitLocation, HitNormal);
		Other = Pawn(Owner).Trace(HitLocation, HitNormal, EndTrace, StartTrace, False);
		if (Other == None)
		{
			HitLocation = EndTrace;
			HitNormal = -vector(Pawn(Owner).ViewRotation);
		}
		HandleChargedHit(Other, HitLocation, HitNormal);
	}
	else
	{
		Other = TraceCut(vect(0,0,0), HitLocation, HitNormal, ChargeAttackMaxRange*FMax(1.0, Splasher));
		HandleChargedAttack(Other, HitLocation, HitNormal);
		HandleChargedHit(Other, HitLocation, HitNormal);
	}
}

function HandleChargedAttack(Actor A, vector HitLocation, vector HitNormal)
{
local float chargeRatio;

	if (A != Level && A != Self && A != Owner && A != None)
	{
		chargeRatio = chargeCount/(chargeTTime/GetFirerateMult(True));
		if (Pawn(A) != None)
			A.PlaySound(ChargeGibSnd,, 18.0,, 1000);
		if (giveFiredHealth(A, default.ChargeAttackDamage*chargeRatio))
			return;
		UpdateBlood(A, True, False);
		UpdateBlood(A, True, True);
		A.TakeDamage(default.ChargeAttackDamage*GetDamageMult()*chargeRatio, Pawn(Owner), HitLocation, vect(0,0,0), ChargeDmgType);
	}
}

function HandleChargedHit(Actor A, vector HitLocation, vector HitNormal)
{
local bool isChargedEnough;
local float chargeRatio;
	
	chargeRatio = chargeCount/(chargeTTime/GetFirerateMult(True));
	isChargedEnough = (chargeRatio > 0.7);
	if (isChargedEnough)
		Spawn(Class'TheExecChargeShake',,, HitLocation + HitNormal);
		
	if (A == Level)
	{
		if (Owner != None)
		{
			Owner.PlaySound(ChargedWallHitSnd,, 32.0,, 1000);
			Spawn(Class'TheExecSmokeGen',,, HitLocation + HitNormal);
			if (Pawn(Owner) != None && VSize(Owner.Location-HitLocation)<=(ChargeOwnDamageMaxDist*FMax(1.0, Splasher) + Owner.CollisionRadius) && 
			ChargeOwnDamage > 0 && !giveFiredHealth(Pawn(Owner), ChargeOwnDamage*chargeRatio))
				Owner.TakeDamage(ChargeOwnDamage*GetDamageMult(True)*chargeRatio, Pawn(Owner), HitLocation, 
				-vector(Pawn(Owner).ViewRotation)*(ChargeOwnMaxMomentum*chargeRatio * (Kickback+1)), ChargeDmgType);
		}
		
		if (isChargedEnough)
		{
			Spawn(Class'TheExecChargedWallParts',,, HitLocation + HitNormal, rotator(HitNormal));
			Spawn(Class'TheExecChargedDecalFX',,, HitLocation + HitNormal, rotator(HitNormal));
		}		
	}
}


function ReleaseCharge()
{
	if (bChargeAttacking || Level.NetMode != NM_StandAlone)
		GiveChargedDamage();
	if (PlayerPawn(Owner)==None || Level.NetMode == NM_StandAlone)
		PlayReleaseCharge();
	else
	{
		bCharging = False;
		bChargeReleased = True;
		AmbientSound = None;
	}
}

simulated function PlayReleaseCharge()
{
	bChargeReleased = True;
	if (!bChargeAttacking)
	{
		TweenAnim(ChargeAttackAnim, 0.05/GetFirerateMult(True));
		bChargeAttacking = True;
	}
	else
	{
		bCharging = False;
		PlayAnim(ChargeAttackAnim, ChargeAttackRate*GetFirerateMult(True), 0.0);
		PlayOwnedSound(ChargeAttackSnd, SLOT_None, Pawn(Owner).SoundDampening*4.0);
		bChargeAttacking = False;
		AmbientSound = None;
	}
}

simulated function TriggerClientRelease()
{
	PlayReleaseCharge();
}

simulated function PlaySelect()
{
	curAtkSelector = 0;
	Super.PlaySelect();
}


state NormalFire
{
	function AnimEnd()
	{
		if (!isRecoiling)
		{
			if (bMixedFire && nextMixAttackAnims[curAtkSelector] >= ArrayCount(SingleAttacks))
				PlayAnim(DoubleAttacks[curAttackAnim].RecoilAnim, DoubleAttacks[curAttackAnim].RecoilRate*GetFirerateMult(), 0.0);
			else
				PlayAnim(SingleAttacks[curAttackAnim].RecoilAnim, SingleAttacks[curAttackAnim].RecoilRate*GetFirerateMult(), 0.0);
			isRecoiling = True;
		}
		else
			Super.AnimEnd();
	}
}

state ClientFiring
{
	simulated function AnimEnd()
	{
		if (!isRecoiling)
		{
			if (bMixedFire && nextMixAttackAnims[curAtkSelector] >= ArrayCount(SingleAttacks))
				PlayAnim(DoubleAttacks[curAttackAnim].RecoilAnim, DoubleAttacks[curAttackAnim].RecoilRate*GetFirerateMult(), 0.0);
			else
				PlayAnim(SingleAttacks[curAttackAnim].RecoilAnim, SingleAttacks[curAttackAnim].RecoilRate*GetFirerateMult(), 0.0);
			isRecoiling = True;
		}
		else
			Super.AnimEnd();
	}
}

state AltFiring
{
	function Tick(float Delta)
	{
	local rotator AttackRot;
	local vector StartTrace, EndTrace, HitLoc, HitNorm;
	local Pawn P;
	local Actor A;
	
		if (enableChargingAltFire)
		{
			if (chargeCount < chargeTTime/GetFirerateMult(True))
			{
				chargeCount += Delta;
				if (chargeCount >= chargeTTime/GetFirerateMult(True))
					chargeCount = chargeTTime/GetFirerateMult(True);
			}
			
			if (bCharging || bChargeAttacking)
			{
				if (AmbientSound == None)
					AmbientSound = ChargeAmbSnd;
				SoundVolume = Byte((chargeCount/(chargeTTime/GetFirerateMult(True)))*ChargeAmbSndVol);
				SoundPitch = Byte((chargeCount/(chargeTTime/GetFirerateMult(True)))*(ChargeAmbSndPitchMax-ChargeAmbSndPitchMin) + ChargeAmbSndPitchMin);
			}
			
			if (Class'NWUtils'.static.isValidBot(Pawn(Owner)))
			{
				if (Pawn(Owner).Enemy == None)
					Pawn(Owner).bAltFire = 0;
				else
					Pawn(Owner).bAltFire = 1;
			}
			
			P = Pawn(Owner);
			if (!bChargeReleased)
			{
				if (Pawn(Owner) == None || Pawn(Owner).bAltFire == 0)
					ReleaseCharge();
				else if (P != None && (default.bChargeTriggerOnTouch || PlayerPawn(P)==None))
				{
					if (PlayerPawn(P) == None && P.Enemy != None)
					{
						AttackRot = rotator(P.Enemy.Location - P.Location);
						AttackRot.Yaw = AttackRot.Yaw & 65535;
						if (Abs(AttackRot.Yaw - (P.Rotation.Yaw & 65535))>8000 && Abs(AttackRot.Yaw - (P.Rotation.Yaw & 65535))<57535)
							return;
					}
					else
						AttackRot = P.ViewRotation;
						
					StartTrace = P.Location + CalcDrawOffset();
					if (Level.NetMode == NM_Standalone && PlayerPawn(P)!=None)
						EndTrace = StartTrace + (P.CollisionRadius+8)*vector(P.ViewRotation); 
					else
						EndTrace = StartTrace + (P.CollisionRadius+43)*vector(P.ViewRotation); 
					A = Trace(HitLoc, HitNorm, EndTrace, StartTrace, True);
					if (A != None && A.DrawType == DT_Mesh && !isFriend(A))
					{
						ReleaseCharge();
						if (Level.NetMode != NM_StandAlone)
							TriggerClientRelease();
					}
				}
			}
		}

		Global.Tick(Delta);
	}
	
	function AnimEnd()
	{
		if (!isRecoiling)
		{
			if (enableChargingAltFire)
			{
				if (!bCharging)
				{
					PlayAnim(ChargeRecoilAnim, ChargeRecoilRate*GetFirerateMult(True), 0.0);
					isRecoiling = True;
				}
				else if (bChargeAttacking)
					ReleaseCharge();
				else
					TweenAnim(ChargeAttackTweenAnim, 0.25);
			}
			else
			{
				PlayAnim(DoubleAttacks[curAttackAnim].RecoilAnim, DoubleAttacks[curAttackAnim].RecoilRate*GetFirerateMult(True), 0.0);
				isRecoiling = True;
			}
		}
		else
			Super.AnimEnd();
	}
}

state ClientAltFiring
{
	simulated function Tick(float Delta)
	{
		if (enableChargingAltFire)
		{
			if (chargeCount < chargeTTime/GetFirerateMult(True))
			{
				chargeCount += Delta;
				if (chargeCount >= chargeTTime/GetFirerateMult(True))
					chargeCount = chargeTTime/GetFirerateMult(True);
			}
			
			if (bCharging || bChargeAttacking)
			{
				if (AmbientSound == None)
					AmbientSound = ChargeAmbSnd;
				SoundVolume = Byte((chargeCount/(chargeTTime/GetFirerateMult(True)))*ChargeAmbSndVol);
				SoundPitch = Byte((chargeCount/(chargeTTime/GetFirerateMult(True)))*(ChargeAmbSndPitchMax-ChargeAmbSndPitchMin) + ChargeAmbSndPitchMin);
			}
			
			if (Pawn(Owner) == None)
			{
				AmbientSound = None;
				GotoState('');
			}
			else if (!bChargeReleased && Pawn(Owner).bAltFire == 0)
				PlayReleaseCharge();
		}
		
		Super.Tick(Delta);
	}
	
	simulated function AnimEnd()
	{
		if (!isRecoiling)
		{
			if (enableChargingAltFire)
			{
				if (!bCharging)
				{
					PlayAnim(ChargeRecoilAnim, ChargeRecoilRate*GetFirerateMult(True), 0.0);
					isRecoiling = True;
				}
				else if (bChargeAttacking)
					PlayReleaseCharge();
				else
					TweenAnim(ChargeAttackTweenAnim, 0.25);
			}
			else
			{
				PlayAnim(DoubleAttacks[curAttackAnim].RecoilAnim, DoubleAttacks[curAttackAnim].RecoilRate*GetFirerateMult(True), 0.0);
				isRecoiling = True;
			}
		}
		else
			Super.AnimEnd();
	}
}

function float RateSelf( out int bUseAltMode )
{
local Pawn P;

	P = Pawn(Owner);
	if (P.Enemy == None)
		return AIRating;
	
	if (!Class'NWUtils'.static.isElegibleBotAI(P, True))
		bUseAltMode = 0;
	else if (VSize(P.Enemy.Location - P.Location) > 200)
		bUseAltMode = 1;
	return (AIRating + FRand() * 0.05);
}


//Oversurrection
static function OversurrectorExplodeServer(TheOversProj ref, vector HitLocation, vector HitNormal)
{
local rotator R;

	if (ref == None)
		return;
	
	if (ref.Instigator != None)
		R = rotator(ref.Instigator.Location - ref.Location);
	R.Pitch = 0;
	R.Roll = 0;
	ref.Spawn(Class'TheExecOversSkel',,, HitLocation + HitNormal + Class'TheExecOversSkel'.default.CollisionHeight*vect(0,0,1), R);
}

static function bool hasOversurrectorFXFusion(byte i, optional out class<TheOversColoredFX> CFXClass)
{
	switch (i)
	{
		case 0:	CFXClass = Class'TheExecOversSkullFX';		break;
		case 1:	CFXClass = Class'TheExecOversFXCor';		break;
		case 2:	CFXClass = Class'TheExecOversFXCorLine';	break;
		case 3:	CFXClass = Class'TheExecOversFXCorL';		break;
		case 4:	CFXClass = Class'TheExecOversFXCorLineL';	break;
	}
	return (i <= 4);
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=TheExecutionerPick
	CollisionHeight=24.000000
	CollisionRadius=12.000000
	AnimSequence=Pos3
	AutoSwitchPriority=1
	Icon=TheExecutionerIcon
	InventoryGroup=1
	ItemArticle=""
	ItemName="The Executioner"
	MaxDesireability=0.500000
	PickupMessage="You got The Executioner."
	PickupSound=TheExecutionerPick
	PickupViewMesh=TheExecutionerPick
	PickupViewScale=1.000000
	PlayerViewMesh=TheExecutionerR
	PlayerViewOffset=(X=9.00000,Y=0.000000,Z=-3.000000)
	WidePlayerViewOffset=(X=9.00000,Y=0.000000,Z=-3.000000)
	PlayerViewScale=1.000000
	RespawnTime=30.000000
	StatusIcon=TheExecutionerIcon
	ThirdPersonMesh=TheExecutionerM
	ThirdPersonScale=0.750000
	AltDamageType=None
	AltFireSound=None
	AltProjectileClass=None
	AmmoName=None
	bInstantHit=False
    bAltInstantHit=False
	bRapidFire=True
	bMeleeWeapon=True
	DeathMessage="%o was sliced in small pieces with %k's %w and fed to the dogs."
	FireOffset=(X=0.000000,Y=0.000000,Z=0.000000)
	FireSound=None
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=Sliced
	NameColor=(R=0,G=255,B=0)
	PickupAmmoCount=1
	ProjectileClass=None
	SelectSound=TheExecutionerSelect
	shakemag=0.000000
	shaketime=0.000000
	shakevert=0.000000
	AIRating=0.100000
	AltRefireRate=1.000000
	bAltWarnTarget=False
	bRecommendAltSplashDamage=False
	bRecommendSplashDamage=False
	bSplashDamage=False
	bWarnTarget=False
	RefireRate=0.500000
	Mass=15.000000
	bNoSmooth=False
	bOwnsCrossHair=True
	CustomCross=TheExecutionerCross
	CustomCrossAlpha=TheExecutionerCrossAlpha
	CrossHairScale=0.500000
	WeaponDescription="Classification: Melee weapon, which consists in two hand-held extremely sharp blades.\n\nPrimary Fire: Single blade attacks or randomly mixed single and double blade attacks.\n\nSecondary Fire: Double blade attacks or charged ones."
	
	Texture=TheExecutionerMetal
	bCanThrow=False
	bForceHands=True
	
	PlayerViewMeshLeft=TheExecutioner
	PlayerViewMeshRight=TheExecutionerR
	HandPartMeshL(0)=TheExecutionerHandLL
	HandPartMeshL(1)=TheExecutionerHandRL
	HandPartMeshR(0)=TheExecutionerHandLR
	HandPartMeshR(1)=TheExecutionerHandRR
	BobDamping=1.100000
	
	RenderOffsetSelect=(Z=2.000000)
	AnimMaxFrame=0.900000
	
	ChargeUpAnim=SuperCharge1
	ChargeAttackAnim=SuperAttack1
	ChargeAttackTweenAnim=SuperAttackTween1
	ChargeAttackRate=20.000000
	ChargeAttackSnd=TheExecutionerChargedAtk
	ChargeRecoilAnim=SuperRecoil1
	ChargeRecoilRate=1.750000
	ChargeAmbSndPitchMin=32
	ChargeAmbSndPitchMax=80
	ChargeAmbSndVol=192
	ChargeAmbSnd=TheExecutionerChargeAmb
	ChargeDmgType=ChargeSliced
	ChargeGibSnd=ChargedGib
	ChargedWallHitSnd=ChargedWallHit
	SoundRadius=64

	SlicingRange=75.000000
	SlicingDamageType=Sliced
	CutGibSnd(0)=CutGib1
	CutGibSnd(1)=CutGib2
	CutGibSnd(2)=CutGib3
	CutGibSnd(3)=CutGib4
	HeadShotGibSnd(0)=HeadShotCutGib1
	HeadShotGibSnd(1)=HeadShotCutGib2
	HeadShotGibSnd(2)=HeadShotCutGib3
	HeadShotGibSnd(3)=HeadShotCutGib4
	WallHitSnd(0)=ExecutionerBladeWallHit1
	WallHitSnd(1)=ExecutionerBladeWallHit2
	
	SingleAttacks(0)=(AttackAnim="SingleAttack1",RecoilAnim="SingleRecoil1",AttackRate=9.000000,RecoilRate=2.500000)
	SingleAttacks(0)=(AttackSnd=Sound'TheExecutionerAtk1',AttackOffset=(Y=3.000000,Z=2.000000),AttackDelay=0.111111)
	SingleAttacks(1)=(AttackAnim="SingleAttack2",RecoilAnim="SingleRecoil2",AttackRate=8.000000,RecoilRate=2.500000)
	SingleAttacks(1)=(AttackSnd=Sound'TheExecutionerAtk2',AttackOffset=(Z=3.000000),AttackDelay=0.125000)
	SingleAttacks(2)=(AttackAnim="SingleAttack3",RecoilAnim="SingleRecoil3",AttackRate=5.000000,RecoilRate=3.000000)
	SingleAttacks(2)=(AttackSnd=Sound'TheExecutionerAtk3',AttackOffset=(Y=2.000000,Z=1.000000),AttackDelay=0.140000)
	SingleAttacks(3)=(AttackAnim="SingleAttack4",RecoilAnim="SingleRecoil4",AttackRate=5.000000,RecoilRate=3.000000)
	SingleAttacks(3)=(AttackSnd=Sound'TheExecutionerAtk4',AttackOffset=(Y=0.000000),AttackDelay=0.120000)

	DoubleAttacks(0)=(AttackAnim="DoubleAttack1",RecoilAnim="DoubleRecoil1",AttackRate=4.000000,RecoilRate=1.750000)
	DoubleAttacks(0)=(AttackSnd=Sound'TheExecutionerDoubleAtk1',AttackOffset=(Y=2.000000))
	DoubleAttacks(0)=(AttackOtherOffset=(Y=-2.000000),AttackDelay=0.250000)
	DoubleAttacks(1)=(AttackAnim="DoubleAttack2",RecoilAnim="DoubleRecoil2",AttackRate=4.000000,RecoilRate=1.750000)
	DoubleAttacks(1)=(AttackSnd=Sound'TheExecutionerDoubleAtk2',AttackOffset=(Y=3.000000,Z=-1.000000))
	DoubleAttacks(1)=(AttackOtherOffset=(Y=-2.000000,Z=1.000000),AttackDelay=0.125000)
	DoubleAttacks(2)=(AttackAnim="DoubleAttack3",RecoilAnim="DoubleRecoil3",AttackRate=4.000000,RecoilRate=1.750000)
	DoubleAttacks(2)=(AttackSnd=Sound'TheExecutionerDoubleAtk3',AttackOffset=(Y=4.000000))
	DoubleAttacks(2)=(AttackOtherOffset=(Y=-4.000000),AttackDelay=0.175000)
	DoubleAttacks(3)=(AttackAnim="DoubleAttack4",RecoilAnim="DoubleRecoil4",AttackRate=4.000000,RecoilRate=1.750000)
	DoubleAttacks(3)=(AttackSnd=Sound'TheExecutionerDoubleAtk4',AttackOffset=(Y=1.500000,Z=-3.000000))
	DoubleAttacks(3)=(AttackOtherOffset=(Y=-1.500000,Z=-3.000000),AttackDelay=0.250000)


	bChargingAltFire=True
	bFireMixedMoves=True
	bChargingKillMultiple=True
	bChargeTriggerOnTouch=True
	ChargeAttackDamage=300
	ChargeOwnDamage=35
	ChargeOwnDamageMaxDist=63.000000
	ChargeOwnMaxMomentum=69000
	ChargeTotalTime=2.000000
	ChargeAttackMaxRange=165.000000
	bEnableHeadshot=True
	HeadShotDamage=200
	
	SingleSlices(0)=(AttackDamage=15,AttackOdds=0.850000)
	SingleSlices(1)=(AttackDamage=20,AttackOdds=0.850000)
	SingleSlices(2)=(AttackDamage=20,AttackOdds=0.850000)
	SingleSlices(3)=(AttackDamage=25,AttackOdds=0.850000)
	
	DoubleSlices(0)=(AttackDamage=35,AttackOtherDamage=35,AttackOdds=0.100000)
	DoubleSlices(1)=(AttackDamage=17,AttackOtherDamage=18,AttackOdds=0.350000)
	DoubleSlices(2)=(AttackDamage=20,AttackOtherDamage=20,AttackOdds=0.300000)
	DoubleSlices(3)=(AttackDamage=25,AttackOtherDamage=25,AttackOdds=0.250000)

	ObjectsBlood(0)=(ObjectType="NaliWPawn",BloodType=BLDT_None)
	ObjectsBlood(1)=(ObjectType="FortStandard",BloodType=BLDT_None)
	ObjectsBlood(2)=(ObjectType="StationaryPawn",BloodType=BLDT_Black)
	ObjectsBlood(3)=(ObjectType="Mercenary",BloodType=BLDT_Green)
	ObjectsBlood(4)=(ObjectType="MercCarcass",BloodType=BLDT_Green)
	ObjectsBlood(5)=(ObjectType="Pawn",BloodType=BLDT_Red)
	
	
	bOversurrective=True
	OversurrectorShellColor=(R=255,G=0,B=0)
	OversurrectorFXColors(0)=(R=255,G=0,B=0)
	OversurrectorFXColors(1)=(R=255,G=0,B=0)
	OversurrectorFXColors(2)=(R=96,G=0,B=8)
	OversurrectorFXColors(3)=(R=255,G=0,B=8)
	OversurrectorFXColors(4)=(R=192,G=0,B=4)
	OversurrectorFXColors(5)=(R=255,G=0,B=8)
	OversurrectorFXColors(6)=(R=192,G=0,B=4)
	OversurrectorFXColors(7)=(R=255,G=0,B=0)
	OversurrectorFXColors(8)=(R=255,G=0,B=0)
	OversurrectorFXColors(9)=(R=255,G=0,B=0)
	OversurrectorFXColors(10)=(R=255,G=0,B=0)
	OversurrectorFXColors(11)=(R=255,G=0,B=0)
	OversurrectorFXColors(12)=(R=128,G=0,B=0)
	OversurrectorFXColors(13)=(R=255,G=0,B=0)
	OversurrectorFXColors(14)=(R=255,G=0,B=0)
	OversurrectorFXColors(15)=(R=192,G=0,B=0)
	OversurrectorFXColors(16)=(R=128,G=0,B=0)
	OversurrectorFXColors(17)=(R=128,G=0,B=0)
	OversurrectorFXColors(18)=(R=0,G=0,B=0)
	OversurrectorFXColors(19)=(R=128,G=0,B=0)
	OversurrectorFXColors(20)=(R=0,G=0,B=0)
	OversurrectorFXColors(21)=(R=192,G=0,B=4)
	OversurrectorFXColors(22)=(R=192,G=0,B=4)
	OversurrectorFXColors(23)=(R=192,G=0,B=4)
	
	OversurrectorLightHue(0)=0
	OversurrectorLightSaturation(0)=0
	OversurrectorLightBrightness(0)=100
	OversurrectorLightHue(1)=0
	OversurrectorLightSaturation(1)=0
	OversurrectorLightBrightness(1)=100
	OversurrectorLightHue(2)=0
	OversurrectorLightSaturation(2)=0
	OversurrectorLightBrightness(2)=100
	
	OversurrectorProjClass=Class'TheExecOversProj'
	
	
	enableOversurrection=True
	OversurrectionLifeTime=22.000000
	OversurrectiveAttackDmgA=2000
	OversurrectiveAttackDmgB=1000
	OversurrectiveAttackDmgC=10000
}
