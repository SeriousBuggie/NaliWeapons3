//////////////////////////////////////////////////////////////
//	Nali Weapons III Ultima Protos weapon
//				Feralidragon (27-09-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProtos expands NaliWeapons config(NWeaponsCfg);

//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=UltimaProtos ANIVFILE=MODELS\UltimaProtos_a.3d DATAFILE=MODELS\UltimaProtos_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=UltimaProtos STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProtos X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=UltimaProtosR ANIVFILE=MODELS\UltimaProtos_a.3d DATAFILE=MODELS\UltimaProtos_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=UltimaProtosR STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProtosR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=UltimaProtosPick ANIVFILE=MODELS\UltimaProtos_a.3d DATAFILE=MODELS\UltimaProtos_d.3d X=0 Y=0 Z=0 UNMIRROR=1
//#exec MESH LODPARAMS MESH=UltimaProtosPick STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProtosPick X=0 Y=0 Z=0

//3rd person
#exec MESH IMPORT MESH=UltimaProtosM ANIVFILE=MODELS\UltimaProtos_a.3d DATAFILE=MODELS\UltimaProtos_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=UltimaProtosM STRENGTH=0.45
#exec MESH ORIGIN MESH=UltimaProtosM X=-245 Y=0 Z=-80

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=UltimaProtos SEQ=All STARTFRAME=0 NUMFRAMES=132
#exec MESH SEQUENCE MESH=UltimaProtos SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaProtos SEQ=FireOpen STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=UltimaProtos SEQ=FireStartSeq STARTFRAME=5 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtos SEQ=Openned STARTFRAME=46 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtos SEQ=FireSeq1 STARTFRAME=47 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtos SEQ=FireSeq2 STARTFRAME=57 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtos SEQ=FireSeq3 STARTFRAME=67 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtos SEQ=FiringSeq STARTFRAME=47 NUMFRAMES=31 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtos SEQ=FiringSeqLoop STARTFRAME=47 NUMFRAMES=30 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtos SEQ=Fire STARTFRAME=77 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtos SEQ=Paused STARTFRAME=118 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtos SEQ=Select STARTFRAME=125 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=UltimaProtos SEQ=Down STARTFRAME=119 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=UltimaProtosR SEQ=All STARTFRAME=0 NUMFRAMES=132
#exec MESH SEQUENCE MESH=UltimaProtosR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaProtosR SEQ=FireOpen STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=UltimaProtosR SEQ=FireStartSeq STARTFRAME=5 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosR SEQ=Openned STARTFRAME=46 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosR SEQ=FireSeq1 STARTFRAME=47 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosR SEQ=FireSeq2 STARTFRAME=57 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosR SEQ=FireSeq3 STARTFRAME=67 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosR SEQ=FiringSeq STARTFRAME=47 NUMFRAMES=31 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosR SEQ=FiringSeqLoop STARTFRAME=47 NUMFRAMES=30 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosR SEQ=Fire STARTFRAME=77 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosR SEQ=Paused STARTFRAME=118 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosR SEQ=Select STARTFRAME=125 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=UltimaProtosR SEQ=Down STARTFRAME=119 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=UltimaProtosPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH SEQUENCE MESH=UltimaProtosM SEQ=All STARTFRAME=0 NUMFRAMES=120
#exec MESH SEQUENCE MESH=UltimaProtosM SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaProtosM SEQ=FireOpen STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=UltimaProtosM SEQ=FireStartSeq STARTFRAME=5 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosM SEQ=Openned STARTFRAME=46 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosM SEQ=FireSeq1 STARTFRAME=47 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosM SEQ=FireSeq2 STARTFRAME=57 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosM SEQ=FireSeq3 STARTFRAME=67 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosM SEQ=FiringSeq STARTFRAME=47 NUMFRAMES=31 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosM SEQ=FiringSeqLoop STARTFRAME=47 NUMFRAMES=30 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosM SEQ=Fire STARTFRAME=77 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosM SEQ=Paused STARTFRAME=118 NUMFRAMES=2 RATE=1.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=UltimaProtos MESH=UltimaProtos
#exec MESHMAP SCALE MESHMAP=UltimaProtos X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=UltimaProtosR MESH=UltimaProtosR
#exec MESHMAP SCALE MESHMAP=UltimaProtosR X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=UltimaProtosPick MESH=UltimaProtosPick
#exec MESHMAP SCALE MESHMAP=UltimaProtosPick X=0.1425 Y=0.1425 Z=0.285

#exec MESHMAP NEW MESHMAP=UltimaProtosM MESH=UltimaProtosM
#exec MESHMAP SCALE MESHMAP=UltimaProtosM X=0.1125 Y=0.1125 Z=0.225

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=Sk_UltimaProtos01 FILE=SKINS\Sk_UltimaProtos01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtos NUM=1 TEXTURE=Sk_UltimaProtos01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosR NUM=1 TEXTURE=Sk_UltimaProtos01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosPick NUM=1 TEXTURE=Sk_UltimaProtos01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosM NUM=1 TEXTURE=Sk_UltimaProtos01

#exec TEXTURE IMPORT NAME=Sk_UltimaProtos02 FILE=SKINS\Sk_UltimaProtos02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtos NUM=2 TEXTURE=Sk_UltimaProtos02
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosR NUM=2 TEXTURE=Sk_UltimaProtos02
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosPick NUM=2 TEXTURE=Sk_UltimaProtos02
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosM NUM=2 TEXTURE=Sk_UltimaProtos02

#exec TEXTURE IMPORT NAME=Sk_UltimaProtos03 FILE=SKINS\Sk_UltimaProtos03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtos NUM=3 TEXTURE=Sk_UltimaProtos03
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosR NUM=3 TEXTURE=Sk_UltimaProtos03
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosPick NUM=3 TEXTURE=Sk_UltimaProtos03
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosM NUM=3 TEXTURE=Sk_UltimaProtos03

#exec TEXTURE IMPORT NAME=Sk_UltimaProtos04 FILE=SKINS\Sk_UltimaProtos04.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtos NUM=4 TEXTURE=Sk_UltimaProtos04
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosR NUM=4 TEXTURE=Sk_UltimaProtos04
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosPick NUM=4 TEXTURE=Sk_UltimaProtos04
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosM NUM=4 TEXTURE=Sk_UltimaProtos04

#exec TEXTURE IMPORT NAME=Sk_UltimaProtos05 FILE=SKINS\Sk_UltimaProtos05.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtos NUM=5 TEXTURE=Sk_UltimaProtos05
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosR NUM=5 TEXTURE=Sk_UltimaProtos05
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosPick NUM=5 TEXTURE=Sk_UltimaProtos05
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosM NUM=5 TEXTURE=Sk_UltimaProtos05

#exec TEXTURE IMPORT NAME=UltimaGlass FILE=SKINS\UltimaGlass.bmp GROUP=Skins LODSET=2

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=UltimaProtosIcon FILE=ICONS\UltimaProtosIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=UltimaCrossAlpha FILE=ICONS\UltimaCrossAlpha.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\UltimaProtosIcons.utx PACKAGE=NWUltimaProtosVIII_SRC.Icons

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="UltimaProtos_Pickup" FILE=SOUNDS\UltimaProtos_Pickup.wav GROUP="UltimaProtos"
#exec AUDIO IMPORT NAME="UltimaProtos_Select" FILE=SOUNDS\UltimaProtos_Select.wav GROUP="UltimaProtos"
#exec AUDIO IMPORT NAME="UP_FireSeqStart" FILE=SOUNDS\UP_FireSeqStart.wav GROUP="UltimaProtos"
#exec AUDIO IMPORT NAME="UP_FireSeqEnd" FILE=SOUNDS\UP_FireSeqEnd.wav GROUP="UltimaProtos"
#exec AUDIO IMPORT NAME="UP_FireSeqLoop" FILE=SOUNDS\UP_FireSeqLoop.wav GROUP="UltimaProtos"
#exec AUDIO IMPORT NAME="UltimaCalcOn" FILE=SOUNDS\UltimaCalcOn.wav GROUP="UltimaProtos"
#exec AUDIO IMPORT NAME="UltimaCalcOff" FILE=SOUNDS\UltimaCalcOff.wav GROUP="UltimaProtos"

//HAND
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=UltimaProtosHandL ANIVFILE=MODELS\UltimaProtosHand_a.3d DATAFILE=MODELS\UltimaProtosHand_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=UltimaProtosHandL STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProtosHandL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=UltimaProtosHandR ANIVFILE=MODELS\UltimaProtosHand_a.3d DATAFILE=MODELS\UltimaProtosHand_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=UltimaProtosHandR STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProtosHandR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=UltimaProtosHandL SEQ=All STARTFRAME=0 NUMFRAMES=132
#exec MESH SEQUENCE MESH=UltimaProtosHandL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaProtosHandL SEQ=FireOpen STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=UltimaProtosHandL SEQ=FireStartSeq STARTFRAME=5 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosHandL SEQ=Openned STARTFRAME=46 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosHandL SEQ=FireSeq1 STARTFRAME=47 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosHandL SEQ=FireSeq2 STARTFRAME=57 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosHandL SEQ=FireSeq3 STARTFRAME=67 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosHandL SEQ=FiringSeq STARTFRAME=47 NUMFRAMES=31 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosHandL SEQ=FiringSeqLoop STARTFRAME=47 NUMFRAMES=30 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosHandL SEQ=Fire STARTFRAME=77 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosHandL SEQ=Paused STARTFRAME=118 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosHandL SEQ=Select STARTFRAME=125 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=UltimaProtosHandL SEQ=Down STARTFRAME=119 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=UltimaProtosHandR SEQ=All STARTFRAME=0 NUMFRAMES=132
#exec MESH SEQUENCE MESH=UltimaProtosHandR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaProtosHandR SEQ=FireOpen STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=UltimaProtosHandR SEQ=FireStartSeq STARTFRAME=5 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosHandR SEQ=Openned STARTFRAME=46 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosHandR SEQ=FireSeq1 STARTFRAME=47 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosHandR SEQ=FireSeq2 STARTFRAME=57 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosHandR SEQ=FireSeq3 STARTFRAME=67 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosHandR SEQ=FiringSeq STARTFRAME=47 NUMFRAMES=31 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosHandR SEQ=FiringSeqLoop STARTFRAME=47 NUMFRAMES=30 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosHandR SEQ=Fire STARTFRAME=77 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosHandR SEQ=Paused STARTFRAME=118 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosHandR SEQ=Select STARTFRAME=125 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=UltimaProtosHandR SEQ=Down STARTFRAME=119 NUMFRAMES=7 RATE=30.0

//Scale
#exec MESHMAP NEW MESHMAP=UltimaProtosHandL MESH=UltimaProtosHandL
#exec MESHMAP SCALE MESHMAP=UltimaProtosHandL X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=UltimaProtosHandR MESH=UltimaProtosHandR
#exec MESHMAP SCALE MESHMAP=UltimaProtosHandR X=0.045 Y=0.045 Z=0.09

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosHandL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosHandR NUM=1 TEXTURE=HumanHand

//===========================================================================

// OVERLAY RED
//*******************************************************

//1st person
#exec MESH IMPORT MESH=UltimaProtosOVRed ANIVFILE=MODELS\UltimaProtosOVRed_a.3d DATAFILE=MODELS\UltimaProtosOVRed_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=UltimaProtosOVRed STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProtosOVRed X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=UltimaProtosOVRedR ANIVFILE=MODELS\UltimaProtosOVRed_a.3d DATAFILE=MODELS\UltimaProtosOVRed_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=UltimaProtosOVRedR STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProtosOVRedR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=UltimaProtosOVRedPick ANIVFILE=MODELS\UltimaProtosOVRed_a.3d DATAFILE=MODELS\UltimaProtosOVRed_d.3d X=0 Y=0 Z=0 UNMIRROR=1
//#exec MESH LODPARAMS MESH=UltimaProtosOVRedPick STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProtosOVRedPick X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=UltimaProtosOVRed SEQ=All STARTFRAME=0 NUMFRAMES=132
#exec MESH SEQUENCE MESH=UltimaProtosOVRed SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaProtosOVRed SEQ=FireOpen STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRed SEQ=FireStartSeq STARTFRAME=5 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRed SEQ=Openned STARTFRAME=46 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRed SEQ=FireSeq1 STARTFRAME=47 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRed SEQ=FireSeq2 STARTFRAME=57 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRed SEQ=FireSeq3 STARTFRAME=67 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRed SEQ=FiringSeq STARTFRAME=47 NUMFRAMES=31 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRed SEQ=FiringSeqLoop STARTFRAME=47 NUMFRAMES=30 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRed SEQ=Fire STARTFRAME=77 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRed SEQ=Paused STARTFRAME=118 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRed SEQ=Select STARTFRAME=125 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=UltimaProtosOVRed SEQ=Down STARTFRAME=119 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=UltimaProtosOVRedR SEQ=All STARTFRAME=0 NUMFRAMES=132
#exec MESH SEQUENCE MESH=UltimaProtosOVRedR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaProtosOVRedR SEQ=FireOpen STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRedR SEQ=FireStartSeq STARTFRAME=5 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRedR SEQ=Openned STARTFRAME=46 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRedR SEQ=FireSeq1 STARTFRAME=47 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRedR SEQ=FireSeq2 STARTFRAME=57 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRedR SEQ=FireSeq3 STARTFRAME=67 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRedR SEQ=FiringSeq STARTFRAME=47 NUMFRAMES=31 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRedR SEQ=FiringSeqLoop STARTFRAME=47 NUMFRAMES=30 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRedR SEQ=Fire STARTFRAME=77 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRedR SEQ=Paused STARTFRAME=118 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosOVRedR SEQ=Select STARTFRAME=125 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=UltimaProtosOVRedR SEQ=Down STARTFRAME=119 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=UltimaProtosOVRedPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=UltimaProtosOVRed MESH=UltimaProtosOVRed
#exec MESHMAP SCALE MESHMAP=UltimaProtosOVRed X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=UltimaProtosOVRedR MESH=UltimaProtosOVRedR
#exec MESHMAP SCALE MESHMAP=UltimaProtosOVRedR X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=UltimaProtosOVRedPick MESH=UltimaProtosOVRedPick
#exec MESHMAP SCALE MESHMAP=UltimaProtosOVRedPick X=0.1425 Y=0.1425 Z=0.285

//FX Skins
#exec TEXTURE IMPORT NAME=UltimaProtosOVRed01 FILE=SKINS\UltimaProtosOVRed01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVRed NUM=1 TEXTURE=UltimaProtosOVRed01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVRedR NUM=1 TEXTURE=UltimaProtosOVRed01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVRedPick NUM=1 TEXTURE=UltimaProtosOVRed01

#exec TEXTURE IMPORT NAME=UltimaProtosOVRed02 FILE=SKINS\UltimaProtosOVRed02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVRed NUM=2 TEXTURE=UltimaProtosOVRed02
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVRedR NUM=2 TEXTURE=UltimaProtosOVRed02
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVRedPick NUM=2 TEXTURE=UltimaProtosOVRed02

#exec TEXTURE IMPORT NAME=UltimaProtosOVRed03 FILE=SKINS\UltimaProtosOVRed03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVRed NUM=3 TEXTURE=UltimaProtosOVRed03
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVRedR NUM=3 TEXTURE=UltimaProtosOVRed03
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVRedPick NUM=3 TEXTURE=UltimaProtosOVRed03

//===========================================================================

// OVERLAY CHARGE
//*******************************************************

//1st person
#exec MESH IMPORT MESH=UltimaProtosOVCharge ANIVFILE=MODELS\UltimaProtosOVCharge_a.3d DATAFILE=MODELS\UltimaProtosOVCharge_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=UltimaProtosOVCharge STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProtosOVCharge X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=UltimaProtosOVChargeR ANIVFILE=MODELS\UltimaProtosOVCharge_a.3d DATAFILE=MODELS\UltimaProtosOVCharge_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=UltimaProtosOVChargeR STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProtosOVChargeR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=UltimaProtosOVChargePick ANIVFILE=MODELS\UltimaProtosOVCharge_a.3d DATAFILE=MODELS\UltimaProtosOVCharge_d.3d X=0 Y=0 Z=0 UNMIRROR=1
//#exec MESH LODPARAMS MESH=UltimaProtosOVChargePick STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProtosOVChargePick X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=UltimaProtosOVCharge SEQ=All STARTFRAME=0 NUMFRAMES=132
#exec MESH SEQUENCE MESH=UltimaProtosOVCharge SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaProtosOVCharge SEQ=FireOpen STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=UltimaProtosOVCharge SEQ=FireStartSeq STARTFRAME=5 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVCharge SEQ=Openned STARTFRAME=46 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosOVCharge SEQ=FireSeq1 STARTFRAME=47 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVCharge SEQ=FireSeq2 STARTFRAME=57 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVCharge SEQ=FireSeq3 STARTFRAME=67 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVCharge SEQ=FiringSeq STARTFRAME=47 NUMFRAMES=31 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVCharge SEQ=FiringSeqLoop STARTFRAME=47 NUMFRAMES=30 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVCharge SEQ=Fire STARTFRAME=77 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVCharge SEQ=Paused STARTFRAME=118 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosOVCharge SEQ=Select STARTFRAME=125 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=UltimaProtosOVCharge SEQ=Down STARTFRAME=119 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=UltimaProtosOVChargeR SEQ=All STARTFRAME=0 NUMFRAMES=132
#exec MESH SEQUENCE MESH=UltimaProtosOVChargeR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaProtosOVChargeR SEQ=FireOpen STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=UltimaProtosOVChargeR SEQ=FireStartSeq STARTFRAME=5 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVChargeR SEQ=Openned STARTFRAME=46 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosOVChargeR SEQ=FireSeq1 STARTFRAME=47 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVChargeR SEQ=FireSeq2 STARTFRAME=57 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVChargeR SEQ=FireSeq3 STARTFRAME=67 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVChargeR SEQ=FiringSeq STARTFRAME=47 NUMFRAMES=31 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVChargeR SEQ=FiringSeqLoop STARTFRAME=47 NUMFRAMES=30 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVChargeR SEQ=Fire STARTFRAME=77 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVChargeR SEQ=Paused STARTFRAME=118 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosOVChargeR SEQ=Select STARTFRAME=125 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=UltimaProtosOVChargeR SEQ=Down STARTFRAME=119 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=UltimaProtosOVChargePick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=UltimaProtosOVCharge MESH=UltimaProtosOVCharge
#exec MESHMAP SCALE MESHMAP=UltimaProtosOVCharge X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=UltimaProtosOVChargeR MESH=UltimaProtosOVChargeR
#exec MESHMAP SCALE MESHMAP=UltimaProtosOVChargeR X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=UltimaProtosOVChargePick MESH=UltimaProtosOVChargePick
#exec MESHMAP SCALE MESHMAP=UltimaProtosOVChargePick X=0.1425 Y=0.1425 Z=0.285

//FX Skins
#exec TEXTURE IMPORT NAME=UltimaProtosOVCharge01 FILE=SKINS\UltimaProtosOVCharge01.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=UltimaProtosOVCharge02 FILE=SKINS\UltimaProtosOVCharge02.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=UltimaProtosOVCharge03 FILE=SKINS\UltimaProtosOVCharge03.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=UltimaProtosOVCharge04 FILE=SKINS\UltimaProtosOVCharge04.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=UltimaProtosOVCharge05 FILE=SKINS\UltimaProtosOVCharge05.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=UltimaProtosOVChargeRed FILE=SKINS\UltimaProtosOVChargeRed.bmp GROUP=Skins LODSET=2

#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVCharge NUM=1 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVChargeR NUM=1 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVChargePick NUM=1 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVCharge NUM=2 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVChargeR NUM=2 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVChargePick NUM=2 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVCharge NUM=3 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVChargeR NUM=3 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVChargePick NUM=3 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVCharge NUM=4 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVChargeR NUM=4 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVChargePick NUM=4 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVCharge NUM=5 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVChargeR NUM=5 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVChargePick NUM=5 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVCharge NUM=6 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVChargeR NUM=6 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVChargePick NUM=6 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVCharge NUM=7 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVChargeR NUM=7 TEXTURE=UltimaProtosOVCharge01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVChargePick NUM=7 TEXTURE=UltimaProtosOVCharge01

//===========================================================================


var() sound StartSeqSnd, EndSeqSnd;
var() float ChargeUpTime;
var() class<UltimaProjFXSphere> ChargeProjFXClass;
var() sound CalcOnSnd, CalcOffSnd;

var(ServerConfig) config int LightningsDamage;
var(ServerConfig) config int PassthroughDamage;

var float globalDelta;

var bool isChargingUp;
var byte curSeq;
var float loopPitch;

var UltimaProtosOVIncandes IncadesReaction;
var UltimaProjFXSphere ChargingSphere;
var vector ChargingStartLoc;
var UltimaCalc UltimaCalcRender[4];
var bool isCalcRender;

//Overlay stuff
var float cCount;
var byte lPos[5];
var() texture lTex[5], ChargeTex;

//Oversurrection configs
var(Oversurrection) config bool OversurrectionGameFinisher;
var(Oversurrection) config int OversurrectionSolarBirthCoreDmg, OversurrectionSolarMatureCoreDmg, OversurrectionSolarSystemCoreDmg;
var(Oversurrection) config int OversurrectionSolarRedGiantCoreDmg, OversurrectionSolarWhiteDwarfCoreDmg;
var(Oversurrection) config int OversurrectionSolarMatureRadialMaxDmg, OversurrectionSolarSystemRadialMaxDmg;
var(Oversurrection) config int OversurrectionSolarRedGiantRadialMaxDmg, OversurrectionSolarSuperNovaDmg;
var(Oversurrection) config float OversurrectionSolarMatureRadialDmgRadius, OversurrectionSolarSystemRadialDmgRadius, OversurrectionSolarRedGiantRadialDmgRadius;
var(Oversurrection) config float OversurrectionSolarCoreDmgRate, OversurrectionSolarRadialDmgRate, OversurrectionSolarSuperNovaDmgRate;


replication
{
	reliable if (Role == ROLE_Authority)
		isChargingUp, ChargingSphere;
	reliable if (Role == ROLE_Authority && bNetOwner)
		isCalcRender;
}

function setServerHand(float Hand)
{
	if (Hand == 0)
		Super.SetServerHand(-1);
	else
		Super.SetServerHand(Hand);
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	globalDelta = Delta;
	UpdateOverlayers(Delta);
}

simulated function UpdateOverlayers(float Delta)
{
local byte i;

	if (Level.NetMode != NM_DedicatedServer && PlayerPawn(Owner) != None)
	{
		if (FirstOverFXActor[0] != None)
			FirstOverFXActor[0].ScaleGlow = 1.25 + FRand();
			
		if (!isChargingUp)
		{
			if (FirstOverFXActor[1] != None)
			{
				cCount += Delta;
				if (cCount >= 0.05)
				{
					cCount = 0.0;
					for (i = 1; i < 8; i++)
						FirstOverFXActor[1].MultiSkins[i] = Texture'TranslucInvis';
					
					for (i = 0; i < ArrayCount(lPos); i++)
					{
						if (lPos[i] == 0)
							lPos[i] = 7;
						else
							lPos[i]--;
						FirstOverFXActor[1].MultiSkins[lPos[i]] = lTex[i];
					}
				}
			}
		}
		else
		{
			if (FirstOverFXActor[1] != None)
			{
				for (i = 1; i < 8; i++)
				{
					if ((8-i) < loopPitch)
						FirstOverFXActor[1].MultiSkins[i] = ChargeTex;
					else
						FirstOverFXActor[1].MultiSkins[i] = Texture'TranslucInvis';
				}
			}
		}
	}
}

simulated function RenderOther(canvas Canvas, vector Loc, rotator Rot)
{
	if (PlayerPawn(Owner) == None)
		return;
		
	if (IncadesReaction == None)
		IncadesReaction = Spawn(Class'UltimaProtosOVIncandes',,, Loc, Rot);
	else
	{
		IncadesReaction.HandleMesh(PlayerPawn(Owner).Handedness != 1);
		if (!isChargingUp || loopPitch < (ChargeUpTime/2.65))
			IncadesReaction.DesiredGlow = 0.0;
		else
			IncadesReaction.DesiredGlow = ((loopPitch-(ChargeUpTime/2.65))/(ChargeUpTime-(ChargeUpTime/2.65)))*2.5;
		
		IncadesReaction.SetLocation(Loc);
		IncadesReaction.SetRotation(Rot);
		IncadesReaction.AnimSequence = AnimSequence;
		IncadesReaction.AnimFrame = AnimFrame;
		Canvas.DrawActor(IncadesReaction, False, False);
	}
}

simulated event RenderOverlays(canvas Canvas)
{
	RenderCalcField(Canvas);
	Super.RenderOverlays(Canvas);
}

simulated function RenderCalcField(canvas Canvas)
{
local byte i;
local vector endLoc, HitL, HitN, Loc;
local rotator R, Rot;
local actor A;
local bool b_calc;

	Rot = Pawn(Owner).ViewRotation;
	Loc = Owner.Location + CalcNewDrawOffset();

	if (isCalcRender && (UltimaCalcRender[0] == None || UltimaCalcRender[0].bDeleteMe))
	{
		UltimaCalcRender[0] = Spawn(Class'UltimaCalc');
		UltimaCalcRender[1] = Spawn(Class'UltimaCalcB');
		UltimaCalcRender[2] = Spawn(Class'UltimaCalcC');
		UltimaCalcRender[3] = Spawn(Class'UltimaCalcD');
		for (i = 0; i < ArrayCount(UltimaCalcRender); i++)
			UltimaCalcRender[i].ChangeNotify(True);
		bNoRenderCross = True;
	}
	else if (!isCalcRender && UltimaCalcRender[0] != None && !UltimaCalcRender[0].bDeleteMe && UltimaCalcRender[0].endingC <= 0)
	{
		for (i = 0; i < ArrayCount(UltimaCalcRender); i++)
			UltimaCalcRender[i].ChangeNotify(False);
		bNoRenderCross = False;
	}

	for (i = 0; i < ArrayCount(UltimaCalcRender); i++)
	{
		if (UltimaCalcRender[i] != None && !UltimaCalcRender[i].bDeleteMe)
		{
			b_calc = True;
			break;
		}
	}
	
	if (b_calc)
	{
		endLoc = Loc + 60000*vector(Rot);
		A = Trace(HitL, HitN, endLoc, Loc, False);
		if (A == None)
		{
			HitL = endLoc;
			HitN = -vector(Rot);
		}

		for (i = 0; i < ArrayCount(UltimaCalcRender); i++)
		{
			if (UltimaCalcRender[i] != None && !UltimaCalcRender[i].bDeleteMe)
			{
				UltimaCalcRender[i].SetLocation(HitL + HitN + HitN*UltimaCalcRender[i].ZDrawOffset);
				R = rotator(HitN);
				R.Roll = UltimaCalcRender[i].Rotation.Roll;
				UltimaCalcRender[i].SetRotation(R);
				Canvas.DrawActor(UltimaCalcRender[i], False, False);
			}
		}
	}
}

simulated function PostPostRenderOther(canvas Canvas, float Scale)
{
	if (ChargingSphere != None)
	{
		if (ChargingSphere.lightFXStartFP != None && !ChargingSphere.lightFXStartFP.bDeleteMe)
			Canvas.DrawActor(ChargingSphere.lightFXStartFP, False, True);
		if (ChargingSphere.lightFXMainFP != None && !ChargingSphere.lightFXMainFP.bDeleteMe)
			Canvas.DrawActor(ChargingSphere.lightFXMainFP, False, True);
		if (ChargingSphere.lightFXLensFP != None && !ChargingSphere.lightFXLensFP.bDeleteMe)
			Canvas.DrawActor(ChargingSphere.lightFXLensFP, False, True);
		if (ChargingSphere.lightFXLensMFP != None && !ChargingSphere.lightFXLensMFP.bDeleteMe)
			Canvas.DrawActor(ChargingSphere.lightFXLensMFP, False, True);
	}
}

function AltFire( float Value )
{	
	GotoState('AltFiring');
	bPointing=True;
	bCanClientFire = true;
	ClientAltFire(Value);
	
	isCalcRender = !isCalcRender;
}

simulated function PlayAltFiring()
{
	if (!isCalcRender)
		PlayOwnedSound(CalcOnSnd, SLOT_None, Pawn(Owner).SoundDampening*2.5);
	else
		PlayOwnedSound(CalcOffSnd, SLOT_None, Pawn(Owner).SoundDampening*2.5);

	PlayAnim('Paused', 2.0, 0.0);
}

function Fire(float Value)
{
    if ( (AmmoType == None) && (AmmoName != None) )
        GiveAmmo(Pawn(Owner));

    if (AmmoType.UseAmmo(1))
    {
		GotoState('NormalFire');
        bPointing=True;
        bCanClientFire = True;
		isChargingUp = True;
        ClientFire(Value);
		SpawnProjFX();
    }
}

function SpawnProjFX()
{
	ChargingSphere = Spawn(ChargeProjFXClass);
	ChargingSphere.setWeaponOwner(Self);
}

simulated function PlayFiring()
{
	PlaySeq(0);
}

simulated function PlaySeq(byte seq)
{
	if (seq == 0)
	{
		PlayOwnedSound(StartSeqSnd, SLOT_None, Pawn(Owner).SoundDampening*6.5);
		PlayAnim('FireOpen', 2.5, 0.0);
	}
	else if (seq == 1)
		PlayAnim('FireStartSeq', 4.0, 0.0);
	else if (seq == 2)
		PlayAnim('FiringSeqLoop', 6.5, 0.0);
	else if (seq == 3)
		LoopAnim('FiringSeqLoop', 6.5);
	else if (seq == 4)
	{
		PlayOwnedSound(EndSeqSnd, SLOT_None, Pawn(Owner).SoundDampening*15.0);
		PlayAnim('Fire', 4.0, 0.0);
	}
	
	curSeq++;
}

simulated function UpdateAmbFireSound()
{
	
	if (NAmbWeapSnd != None)
	{
		if (Pawn(Owner) == None && NAmbWeapSnd.AmbientSound != None)
			NAmbWeapSnd.AmbientSound = None;
		else if (Pawn(Owner) != None)
		{
			if (NAmbWeapSnd.Owner != Pawn(Owner))
				NAmbWeapSnd.SetOwner(Pawn(Owner));
			
			if (Pawn(Owner).Weapon == Self && isChargingUp)
			{
				if (NAmbWeapSnd.AmbientSound != FiringAmbSound)
					NAmbWeapSnd.AmbientSound = FiringAmbSound;
				if (NAmbWeapSnd.SoundVolume != FiringSndVol)
					NAmbWeapSnd.SoundVolume = FiringSndVol;
				if (NAmbWeapSnd.SoundPitch != FiringSndPitch)
					NAmbWeapSnd.SoundPitch = FiringSndPitch;
				if (NAmbWeapSnd.SoundRadius != FiringSndRadius)
					NAmbWeapSnd.SoundRadius = FiringSndRadius;
			}
			else if (NAmbWeapSnd.AmbientSound != None)
				NAmbWeapSnd.AmbientSound = None;
		}
	}
}

simulated function Destroyed()
{
local byte i;

	if (IncadesReaction != None)
		IncadesReaction.Destroy();
	IncadesReaction = None;
	
	for (i = 0; i < ArrayCount(UltimaCalcRender); i++)
	{
		if (UltimaCalcRender[i] != None)
			UltimaCalcRender[i].Destroy();
		UltimaCalcRender[i] = None;
	}
	
	Super.Destroyed();
}

function float RateSelf(out int bUseAltMode)
{
	if (Pawn(Owner) == None || AmmoType.AmmoAmount<=0 || Pawn(Owner).Enemy == None)
		return -2;
	bUseAltMode = 0;
	return 3.0;
}

function SpawnReleaseImpact(vector VLoc, vector Dir)
{
	Spawn(Class'UltimaProjectSmkRelease',,, VLoc, rotator(Dir));
	Spawn(Class'UltimaProjectSmkReleaseB',,, VLoc, rotator(Dir));
	Spawn(Class'UltimaProjectSmkReleaseC',,, VLoc, rotator(Dir));
}

state NormalFire
{
	function AnimEnd()
	{
		if (curSeq < 4)
			PlaySeq(curSeq);
		else if (curSeq >= 5)
		{
			curSeq = 0;
			loopPitch = 1.0;
			isChargingUp = False;
			FiringSndVol = 255;
			Super.AnimEnd();
		}
	}
	
	function Tick(float Delta)
	{
	local Projectile proj;
	
		if (curSeq < 5 && loopPitch < ChargeUpTime)
		{
			loopPitch += Delta;
			if (ChargingSphere != None && !ChargingSphere.bDeleteMe)
				ChargingStartLoc = ChargingSphere.Location;

			if (loopPitch >= ChargeUpTime)
			{
				loopPitch = ChargeUpTime;
				PlaySeq(curSeq);
				proj = ProjectileFire(ProjectileClass, ProjectileSpeed, bWarnTarget);
				if (proj != None && VSize(ChargingStartLoc) > 0)
					proj.Move(ChargingStartLoc - proj.Location);
				if (Pawn(Owner) != None)
					SpawnReleaseImpact(ChargingStartLoc, vector(Pawn(Owner).ViewRotation));
			}
		}
		else if (curSeq == 5 && loopPitch > 1.0)
		{
			loopPitch -= Delta*9;
			if (loopPitch <= 1.0)
				loopPitch = 1.0;
			
			FiringSndVol = Byte((loopPitch-1)*255/(ChargeUpTime-1));
		}
		
		FiringSndPitch = Byte(FMin(loopPitch * (256/ChargeUpTime), 255));
		UpdateAmbFireSound();
		UpdateOverlayers(Delta);
	}
	
	function EndState()
	{
		curSeq = 0;
		loopPitch = 1.0;
		isChargingUp = False;
		FiringSndVol = 255;
		Super.EndState();
	}
}

state ClientFiring
{
	simulated function AnimEnd()
	{
		if (curSeq < 4)
			PlaySeq(curSeq);
		else if (curSeq >= 5)
		{
			curSeq = 0;
			loopPitch = 1.0;
			FiringSndVol = 255;
			Super.AnimEnd();
		}
	}
	
	simulated function Tick(float Delta)
	{
		if (curSeq < 5 && loopPitch < ChargeUpTime)
		{
			loopPitch += Delta;
			if (loopPitch >= ChargeUpTime)
			{
				loopPitch = ChargeUpTime;
				PlaySeq(curSeq);
			}
		}
		else if (curSeq == 5 && loopPitch > 1.0)
		{
			loopPitch -= Delta*9;
			if (loopPitch <= 1.0)
				loopPitch = 1.0;
			
			FiringSndVol = Byte((loopPitch-1)*255/(ChargeUpTime-1));
		}
		
		FiringSndPitch = Byte(FMin(loopPitch * (256/ChargeUpTime), 255));
		UpdateAmbFireSound();
		UpdateOverlayers(Delta);
	}
	
	simulated function EndState()
	{
		curSeq = 0;
		loopPitch = 1.0;
		FiringSndVol = 255;
		Super.EndState();
	}
}


//Oversurrection
static function OversurrectorExplodeServer(TheOversProj ref, vector HitLocation, vector HitNormal)
{
	if (ref == None)
		return;
	ref.Spawn(Class'UltimaSolar',,, HitLocation);
}

static function bool hasOversurrectorFXFusion(byte i, optional out class<TheOversColoredFX> CFXClass)
{
	if (i == 0)
		CFXClass = Class'UltimaSolOversFXA';
	else if (i == 1)
		CFXClass = Class'UltimaSolOversFXB';
	else if (i == 2)
		CFXClass = Class'UltimaSolOversFXD';
	return (i <= 2);
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=UltimaProtosPick
	CollisionHeight=30.000000
	CollisionRadius=32.000000
	AutoSwitchPriority=10
	Icon=UltimaProtosIcon
	InventoryGroup=10
	ItemArticle="an"
	ItemName="Ultima Protos"
	MaxDesireability=50.000000
	PickupMessage="You got the Ultima Protos."
	PickupSound=UltimaProtos_Pickup
	PickupViewMesh=UltimaProtosPick
	PickupViewScale=1.000000
	PlayerViewMesh=UltimaProtosR
	PlayerViewOffset=(X=22.00000,Y=-10.500000,Z=-4.500000)
	WidePlayerViewOffset=(X=23.50000,Y=-12.500000,Z=-4.2500000)
	PlayerViewScale=1.000000
	RespawnTime=120.000000
	StatusIcon=UltimaProtosIcon
	ThirdPersonMesh=UltimaProtosM
	ThirdPersonScale=0.700000
	AltDamageType=None
	AltFireSound=None
	AltProjectileClass=None
	AmmoName=Class'UltimaProtosAmmo'
	bInstantHit=False
    bAltInstantHit=False
	bRapidFire=False
	DeathMessage="%o was erased from existence by %k's %w blast."
	FireOffset=(X=48.000000,Y=0.000000,Z=0.000000)
	FireSound=None
	FiringSpeed=1.000000
	MaxTargetRange=8000.000000
	MyDamageType=Nuclear05
	NameColor=(R=255,G=0,B=0)
	PickupAmmoCount=1
	ProjectileClass=Class'UltimaProjectile'
	SelectSound=UltimaProtos_Select
	shakemag=0.000000
	shaketime=0.000000
	shaketime=0.000000
	shakevert=0.000000
	AIRating=10.000000
	AltRefireRate=1.000000
	bAltWarnTarget=False
	bRecommendAltSplashDamage=False
	bRecommendSplashDamage=True
	bSplashDamage=True
	bWarnTarget=True
	RefireRate=0.500000
	Mass=500.000000
	bNoSmooth=False
	bOwnsCrossHair=True
	CustomCross=UltimaCross
	CustomCrossAlpha=UltimaCrossAlpha
	CrossHairScale=0.500000
	WeaponDescription="Classification: Cyclic hyper-energetic cannon of massive destruction.\n\nPrimary Fire: Charge up and release of an extremely pressurized and dense energetic projectile\n\nSecondary Fire: Holographic view of the hit point of the projectile and its destruction range and direction."
	
	Texture=UltimaGlass
	bMegaWeapon=True
	bForceHands=True
	
	PlayerViewMeshLeft=UltimaProtos
	PlayerViewMeshRight=UltimaProtosR
	HandPartMeshL(0)=UltimaProtosHandL
	HandPartMeshR(0)=UltimaProtosHandR
	HandsBaseFatness=132
	BobDamping=1.150000
	
	RenderOffsetSelect=(Y=-2.500000,Z=2.000000)
	AnimMaxFrame=0.875000
	RenderOffsetFire=(X=-2.500000)
	AnimMaxFrameFire=0.976190
	
	
	FirstPersonOverFX(0)=(bLit=True,OverTex1=Texture'UltimaProtosOVRed01',OverTex2=Texture'UltimaProtosOVRed02',OverTex3=Texture'UltimaProtosOVRed03')
	FirstPersonOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000)
	FirstPersonOverFX(0)=(bCustomMesh=True,CustomMesh=Mesh'UltimaProtosOVRedR',CustomMeshLeft=Mesh'UltimaProtosOVRed')
	
	PickupOverFX(0)=(bLit=True,OverTex1=Texture'UltimaProtosOVRed01',OverTex2=Texture'UltimaProtosOVRed02',OverTex3=Texture'UltimaProtosOVRed03')
	PickupOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000)
	PickupOverFX(0)=(bCustomMesh=True,CustomMesh=Mesh'UltimaProtosOVRedPick',OverlModelClass=Class'UltimaProtosOVRed')
	
	FirstPersonOverFX(1)=(bLit=True)
	FirstPersonOverFX(1)=(GlowStyle=STY_Translucent,GlowAmount=1.750000)
	FirstPersonOverFX(1)=(bCustomMesh=True,CustomMesh=Mesh'UltimaProtosOVChargeR',CustomMeshLeft=Mesh'UltimaProtosOVChargeR')
	
	PickupOverFX(1)=(bLit=True)
	PickupOverFX(1)=(GlowStyle=STY_Translucent,GlowAmount=1.750000)
	PickupOverFX(1)=(bCustomMesh=True,CustomMesh=Mesh'UltimaProtosOVChargePick',OverlModelClass=Class'UltimaProtosOVCharge')
	
	
	loopPitch=1.000000
	lPos(0)=3
	lPos(1)=4
	lPos(2)=5
	lPos(3)=6
	lPos(4)=7
	cCount=10.000000
	
	lTex(0)=Texture'UltimaProtosOVCharge01'
	lTex(1)=Texture'UltimaProtosOVCharge02'
	lTex(2)=Texture'UltimaProtosOVCharge03'
	lTex(3)=Texture'UltimaProtosOVCharge04'
	lTex(4)=Texture'UltimaProtosOVCharge05'
	ChargeTex=Texture'UltimaProtosOVChargeRed'
	
	StartSeqSnd=UP_FireSeqStart
	EndSeqSnd=UP_FireSeqEnd
	ChargeUpTime=9.000000
	ChargeProjFXClass=Class'UltimaProjFXSphere'
	CalcOnSnd=UltimaCalcOn
	CalcOffSnd=UltimaCalcOff
	
	FiringAmbSound=UP_FireSeqLoop
	FiringSndVol=255
	FiringSndPitch=32
	FiringSndRadius=55
	
	LightningsDamage=1000
	PassthroughDamage=1000
	
	
	bOversurrective=True
	OversurrectorShellColor=(R=255,G=32,B=0)
	OversurrectorFXColors(0)=(R=0,G=0,B=192)
	OversurrectorFXColors(1)=(R=0,G=0,B=255)
	OversurrectorFXColors(2)=(R=8,G=0,B=96)
	OversurrectorFXColors(3)=(R=255,G=0,B=0)
	OversurrectorFXColors(4)=(R=255,G=0,B=0)
	OversurrectorFXColors(5)=(R=255,G=16,B=0)
	OversurrectorFXColors(6)=(R=255,G=16,B=0)
	OversurrectorFXColors(7)=(R=255,G=0,B=0)
	OversurrectorFXColors(8)=(R=255,G=0,B=0)
	OversurrectorFXColors(9)=(R=255,G=64,B=0)
	OversurrectorFXColors(10)=(R=255,G=64,B=0)
	OversurrectorFXColors(11)=(R=128,G=32,B=0)
	OversurrectorFXColors(12)=(R=96,G=48,B=0)
	OversurrectorFXColors(13)=(R=128,G=0,B=0)
	OversurrectorFXColors(14)=(R=64,G=0,B=32)
	OversurrectorFXColors(15)=(R=48,G=0,B=48)
	OversurrectorFXColors(16)=(R=32,G=0,B=64)
	OversurrectorFXColors(17)=(R=0,G=0,B=128)
	OversurrectorFXColors(18)=(R=192,G=64,B=0)
	OversurrectorFXColors(19)=(R=100,G=32,B=0)
	OversurrectorFXColors(20)=(R=0,G=0,B=255)
	OversurrectorFXColors(21)=(R=128,G=64,B=0)
	OversurrectorFXColors(22)=(R=192,G=32,B=0)
	OversurrectorFXColors(23)=(R=255,G=0,B=0)
	
	OversurrectorLightHue(0)=0
	OversurrectorLightSaturation(0)=0
	OversurrectorLightBrightness(0)=100
	OversurrectorLightHue(1)=0
	OversurrectorLightSaturation(1)=0
	OversurrectorLightBrightness(1)=100
	OversurrectorLightHue(2)=0
	OversurrectorLightSaturation(2)=0
	OversurrectorLightBrightness(2)=100
	
	OversurrectorProjClass=Class'UltimaOversProj'
	

	enableOversurrection=True
	OversurrectionGameFinisher=True
	OversurrectionSolarBirthCoreDmg=30000
	OversurrectionSolarMatureCoreDmg=100000
	OversurrectionSolarSystemCoreDmg=500000
	OversurrectionSolarRedGiantCoreDmg=1000000
	OversurrectionSolarWhiteDwarfCoreDmg=750000
	OversurrectionSolarMatureRadialMaxDmg=400
	OversurrectionSolarSystemRadialMaxDmg=1000
	OversurrectionSolarRedGiantRadialMaxDmg=2000
	OversurrectionSolarSuperNovaDmg=9000000
	OversurrectionSolarMatureRadialDmgRadius=8000.000000
	OversurrectionSolarSystemRadialDmgRadius=16000.000000
	OversurrectionSolarRedGiantRadialDmgRadius=35000.000000
	OversurrectionSolarCoreDmgRate=5.000000
	OversurrectionSolarRadialDmgRate=5.000000
	OversurrectionSolarSuperNovaDmgRate=10.000000
}
