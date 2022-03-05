//////////////////////////////////////////////////////////////
//	Nali Weapons III Megaton weapon
//				Feralidragon (01-08-2011)
//
// NW3 MEGATON BUILD 1.00
//////////////////////////////////////////////////////////////

class Megaton expands KeyedNaliWeapon config(NWeaponsCfg);

//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=Megaton ANIVFILE=MODELS\Megaton_a.3d DATAFILE=MODELS\Megaton_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=Megaton STRENGTH=0
#exec MESH ORIGIN MESH=Megaton X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=MegatonPick ANIVFILE=MODELS\Megaton_a.3d DATAFILE=MODELS\Megaton_d.3d X=0 Y=0 Z=0 UNMIRROR=1
//#exec MESH LODPARAMS MESH=MegatonPick STRENGTH=0
#exec MESH ORIGIN MESH=MegatonPick X=0 Y=0 Z=0 Yaw=128

//3rd person
#exec MESH IMPORT MESH=MegatonM ANIVFILE=MODELS\Megaton_a.3d DATAFILE=MODELS\Megaton_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MegatonM STRENGTH=0.45
#exec MESH ORIGIN MESH=MegatonM X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=Megaton SEQ=All STARTFRAME=0 NUMFRAMES=126
#exec MESH SEQUENCE MESH=Megaton SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=Megaton SEQ=EnterSetMode STARTFRAME=0 NUMFRAMES=20 RATE=20.0
#exec MESH SEQUENCE MESH=Megaton SEQ=LeaveSetMode STARTFRAME=53 NUMFRAMES=22 RATE=22.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyDown1 STARTFRAME=20 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyUp1 STARTFRAME=21 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyDown2 STARTFRAME=23 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyUp2 STARTFRAME=24 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyDown3 STARTFRAME=26 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyUp3 STARTFRAME=27 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyDown4 STARTFRAME=29 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyUp4 STARTFRAME=30 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyDown5 STARTFRAME=32 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyUp5 STARTFRAME=33 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyDown6 STARTFRAME=35 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyUp6 STARTFRAME=36 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyDown7 STARTFRAME=38 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyUp7 STARTFRAME=39 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyDown8 STARTFRAME=41 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyUp8 STARTFRAME=42 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyDown9 STARTFRAME=44 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyUp9 STARTFRAME=45 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyDown0 STARTFRAME=47 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyUp0 STARTFRAME=48 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyDownEnter STARTFRAME=50 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=KeyUpEnter STARTFRAME=51 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=Megaton SEQ=DeployStart STARTFRAME=74 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=Megaton SEQ=DeployEnd STARTFRAME=84 NUMFRAMES=20 RATE=20.0
#exec MESH SEQUENCE MESH=Megaton SEQ=Select STARTFRAME=115 NUMFRAMES=11 RATE=24.0 GROUP=Select
#exec MESH SEQUENCE MESH=Megaton SEQ=Down STARTFRAME=105 NUMFRAMES=11 RATE=47.0
#exec MESH SEQUENCE MESH=Megaton SEQ=DownHidden STARTFRAME=83 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=MegatonPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH SEQUENCE MESH=MegatonM SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonM SEQ=Still STARTFRAME=0 NUMFRAMES=1

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=Megaton MESH=Megaton
#exec MESHMAP SCALE MESHMAP=Megaton X=0.015 Y=0.015 Z=0.03

#exec MESHMAP NEW MESHMAP=MegatonPick MESH=MegatonPick
#exec MESHMAP SCALE MESHMAP=MegatonPick X=0.0712 Y=0.0712 Z=0.1424

#exec MESHMAP NEW MESHMAP=MegatonM MESH=MegatonM
#exec MESHMAP SCALE MESHMAP=MegatonM X=0.0562 Y=0.0562 Z=0.1124

//-----------------------------------------------------------------------------------

//Screens
#exec TEXTURE IMPORT NAME=Megaton_N0 FILE=DIGITAL\Megaton_N0.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_N1 FILE=DIGITAL\Megaton_N1.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_N2 FILE=DIGITAL\Megaton_N2.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_N3 FILE=DIGITAL\Megaton_N3.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_N4 FILE=DIGITAL\Megaton_N4.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_N5 FILE=DIGITAL\Megaton_N5.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_N6 FILE=DIGITAL\Megaton_N6.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_N7 FILE=DIGITAL\Megaton_N7.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_N8 FILE=DIGITAL\Megaton_N8.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_N9 FILE=DIGITAL\Megaton_N9.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_NEmpty FILE=DIGITAL\Megaton_NEmpty.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_NTrDown FILE=DIGITAL\Megaton_NTrDown.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_NTrDownLeft FILE=DIGITAL\Megaton_NTrDownLeft.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_NTrDownRight FILE=DIGITAL\Megaton_NTrDownRight.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_NTrMiddle FILE=DIGITAL\Megaton_NTrMiddle.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_NTrUp FILE=DIGITAL\Megaton_NTrUp.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_NTrUpLeft FILE=DIGITAL\Megaton_NTrUpLeft.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_NTrUpRight FILE=DIGITAL\Megaton_NTrUpRight.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=Megaton_NTrUpDown FILE=DIGITAL\Megaton_NTrUpDown.bmp GROUP=Digital LODSET=0 MIPS=OFF

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=Sk_Megaton01 FILE=SKINS\Sk_Megaton01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Megaton NUM=1 TEXTURE=Sk_Megaton01
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPick NUM=1 TEXTURE=Sk_Megaton01
#exec MESHMAP SETTEXTURE MESHMAP=MegatonM NUM=1 TEXTURE=Sk_Megaton01

#exec TEXTURE IMPORT NAME=Sk_Megaton02 FILE=SKINS\Sk_Megaton02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Megaton NUM=2 TEXTURE=Sk_Megaton02
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPick NUM=2 TEXTURE=Sk_Megaton02
#exec MESHMAP SETTEXTURE MESHMAP=MegatonM NUM=2 TEXTURE=Sk_Megaton02

#exec TEXTURE IMPORT NAME=Sk_Megaton03 FILE=SKINS\Sk_Megaton03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Megaton NUM=3 TEXTURE=Sk_Megaton03
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPick NUM=3 TEXTURE=Sk_Megaton03
#exec MESHMAP SETTEXTURE MESHMAP=MegatonM NUM=3 TEXTURE=Sk_Megaton03

#exec MESHMAP SETTEXTURE MESHMAP=Megaton NUM=4 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPick NUM=4 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonM NUM=4 TEXTURE=Megaton_N0

#exec MESHMAP SETTEXTURE MESHMAP=Megaton NUM=5 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPick NUM=5 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonM NUM=5 TEXTURE=Megaton_N0

#exec MESHMAP SETTEXTURE MESHMAP=Megaton NUM=6 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPick NUM=6 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonM NUM=6 TEXTURE=Megaton_N0

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=MegatonIcon FILE=ICONS\MegatonIcon.bmp GROUP=Icons MIPS=OFF LODSET=0

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="MegaTon_Pickup" FILE=SOUNDS\MegaTon_Pickup.wav GROUP="Megaton"
#exec AUDIO IMPORT NAME="MegaTon_Select" FILE=SOUNDS\MegaTon_Select.wav GROUP="Megaton"
#exec AUDIO IMPORT NAME="MegaTon_Set" FILE=SOUNDS\MegaTon_Set.wav GROUP="Megaton"
#exec AUDIO IMPORT NAME="MegaTon_SetDone" FILE=SOUNDS\MegaTon_SetDone.wav GROUP="Megaton"

//HAND
//*******************************************************

//Left Hands
#exec MESH IMPORT MESH=MegatonHandLL ANIVFILE=MODELS\MegatonHandLeft_a.3d DATAFILE=MODELS\MegatonHandLeft_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MegatonHandLL STRENGTH=0
#exec MESH ORIGIN MESH=MegatonHandLL X=0 Y=0 Z=0 Yaw=128

#exec MESH IMPORT MESH=MegatonHandRL ANIVFILE=MODELS\MegatonHandRightAlt_a.3d DATAFILE=MODELS\MegatonHandRightAlt_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MegatonHandRL STRENGTH=0
#exec MESH ORIGIN MESH=MegatonHandRL X=0 Y=0 Z=0 Yaw=128

//Right Hands
#exec MESH IMPORT MESH=MegatonHandLR ANIVFILE=MODELS\MegatonHandLeft_a.3d DATAFILE=MODELS\MegatonHandLeft_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MegatonHandLR STRENGTH=0
#exec MESH ORIGIN MESH=MegatonHandLR X=0 Y=0 Z=0

#exec MESH IMPORT MESH=MegatonHandRR ANIVFILE=MODELS\MegatonHandRight_a.3d DATAFILE=MODELS\MegatonHandRight_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MegatonHandRR STRENGTH=0
#exec MESH ORIGIN MESH=MegatonHandRR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=All STARTFRAME=0 NUMFRAMES=126
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=EnterSetMode STARTFRAME=0 NUMFRAMES=20 RATE=20.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=LeaveSetMode STARTFRAME=53 NUMFRAMES=22 RATE=22.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyDown3 STARTFRAME=20 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyUp3 STARTFRAME=21 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyDown2 STARTFRAME=23 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyUp2 STARTFRAME=24 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyDown1 STARTFRAME=26 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyUp1 STARTFRAME=27 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyDown6 STARTFRAME=29 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyUp6 STARTFRAME=30 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyDown5 STARTFRAME=32 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyUp5 STARTFRAME=33 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyDown4 STARTFRAME=35 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyUp4 STARTFRAME=36 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyDown9 STARTFRAME=38 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyUp9 STARTFRAME=39 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyDown8 STARTFRAME=41 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyUp8 STARTFRAME=42 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyDown7 STARTFRAME=44 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyUp7 STARTFRAME=45 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyDown0 STARTFRAME=47 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyUp0 STARTFRAME=48 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyDownEnter STARTFRAME=50 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=KeyUpEnter STARTFRAME=51 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=DeployStart STARTFRAME=74 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=DeployEnd STARTFRAME=84 NUMFRAMES=20 RATE=20.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=Select STARTFRAME=115 NUMFRAMES=11 RATE=24.0 GROUP=Select
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=Down STARTFRAME=105 NUMFRAMES=11 RATE=47.0
#exec MESH SEQUENCE MESH=MegatonHandLL SEQ=DownHidden STARTFRAME=83 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=All STARTFRAME=0 NUMFRAMES=126
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=EnterSetMode STARTFRAME=0 NUMFRAMES=20 RATE=20.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=LeaveSetMode STARTFRAME=53 NUMFRAMES=22 RATE=22.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyDown3 STARTFRAME=20 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyUp3 STARTFRAME=21 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyDown2 STARTFRAME=23 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyUp2 STARTFRAME=24 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyDown1 STARTFRAME=26 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyUp1 STARTFRAME=27 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyDown6 STARTFRAME=29 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyUp6 STARTFRAME=30 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyDown5 STARTFRAME=32 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyUp5 STARTFRAME=33 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyDown4 STARTFRAME=35 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyUp4 STARTFRAME=36 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyDown9 STARTFRAME=38 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyUp9 STARTFRAME=39 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyDown8 STARTFRAME=41 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyUp8 STARTFRAME=42 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyDown7 STARTFRAME=44 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyUp7 STARTFRAME=45 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyDown0 STARTFRAME=47 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyUp0 STARTFRAME=48 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyDownEnter STARTFRAME=50 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=KeyUpEnter STARTFRAME=51 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=DeployStart STARTFRAME=74 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=DeployEnd STARTFRAME=84 NUMFRAMES=20 RATE=20.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=Select STARTFRAME=115 NUMFRAMES=11 RATE=24.0 GROUP=Select
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=Down STARTFRAME=105 NUMFRAMES=11 RATE=47.0
#exec MESH SEQUENCE MESH=MegatonHandRL SEQ=DownHidden STARTFRAME=83 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=All STARTFRAME=0 NUMFRAMES=126
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=EnterSetMode STARTFRAME=0 NUMFRAMES=20 RATE=20.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=LeaveSetMode STARTFRAME=53 NUMFRAMES=22 RATE=22.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyDown1 STARTFRAME=20 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyUp1 STARTFRAME=21 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyDown2 STARTFRAME=23 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyUp2 STARTFRAME=24 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyDown3 STARTFRAME=26 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyUp3 STARTFRAME=27 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyDown4 STARTFRAME=29 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyUp4 STARTFRAME=30 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyDown5 STARTFRAME=32 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyUp5 STARTFRAME=33 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyDown6 STARTFRAME=35 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyUp6 STARTFRAME=36 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyDown7 STARTFRAME=38 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyUp7 STARTFRAME=39 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyDown8 STARTFRAME=41 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyUp8 STARTFRAME=42 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyDown9 STARTFRAME=44 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyUp9 STARTFRAME=45 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyDown0 STARTFRAME=47 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyUp0 STARTFRAME=48 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyDownEnter STARTFRAME=50 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=KeyUpEnter STARTFRAME=51 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=DeployStart STARTFRAME=74 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=DeployEnd STARTFRAME=84 NUMFRAMES=20 RATE=20.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=Select STARTFRAME=115 NUMFRAMES=11 RATE=24.0 GROUP=Select
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=Down STARTFRAME=105 NUMFRAMES=11 RATE=47.0
#exec MESH SEQUENCE MESH=MegatonHandLR SEQ=DownHidden STARTFRAME=83 NUMFRAMES=2 RATE=1.0

#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=All STARTFRAME=0 NUMFRAMES=126
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=EnterSetMode STARTFRAME=0 NUMFRAMES=20 RATE=20.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=LeaveSetMode STARTFRAME=53 NUMFRAMES=22 RATE=22.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyDown1 STARTFRAME=20 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyUp1 STARTFRAME=21 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyDown2 STARTFRAME=23 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyUp2 STARTFRAME=24 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyDown3 STARTFRAME=26 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyUp3 STARTFRAME=27 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyDown4 STARTFRAME=29 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyUp4 STARTFRAME=30 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyDown5 STARTFRAME=32 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyUp5 STARTFRAME=33 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyDown6 STARTFRAME=35 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyUp6 STARTFRAME=36 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyDown7 STARTFRAME=38 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyUp7 STARTFRAME=39 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyDown8 STARTFRAME=41 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyUp8 STARTFRAME=42 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyDown9 STARTFRAME=44 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyUp9 STARTFRAME=45 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyDown0 STARTFRAME=47 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyUp0 STARTFRAME=48 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyDownEnter STARTFRAME=50 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=KeyUpEnter STARTFRAME=51 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=DeployStart STARTFRAME=74 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=DeployEnd STARTFRAME=84 NUMFRAMES=20 RATE=20.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=Select STARTFRAME=115 NUMFRAMES=11 RATE=24.0 GROUP=Select
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=Down STARTFRAME=105 NUMFRAMES=11 RATE=47.0
#exec MESH SEQUENCE MESH=MegatonHandRR SEQ=DownHidden STARTFRAME=83 NUMFRAMES=2 RATE=1.0

//Scale
#exec MESHMAP NEW MESHMAP=MegatonHandLL MESH=MegatonHandLL
#exec MESHMAP SCALE MESHMAP=MegatonHandLL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=MegatonHandRL MESH=MegatonHandRL
#exec MESHMAP SCALE MESHMAP=MegatonHandRL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=MegatonHandLR MESH=MegatonHandLR
#exec MESHMAP SCALE MESHMAP=MegatonHandLR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=MegatonHandRR MESH=MegatonHandRR
#exec MESHMAP SCALE MESHMAP=MegatonHandRR X=0.03 Y=0.03 Z=0.06

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=MegatonHandLL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=MegatonHandLR NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=MegatonHandRL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=MegatonHandRR NUM=1 TEXTURE=HumanHand

//===========================================================================

//OVERLAYER
//*******************************************************

//1st person
#exec MESH IMPORT MESH=MegatonOV ANIVFILE=MODELS\MegatonOV_a.3d DATAFILE=MODELS\MegatonOV_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MegatonOV STRENGTH=0
#exec MESH ORIGIN MESH=MegatonOV X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=MegatonOV SEQ=All STARTFRAME=0 NUMFRAMES=126
#exec MESH SEQUENCE MESH=MegatonOV SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonOV SEQ=EnterSetMode STARTFRAME=0 NUMFRAMES=20 RATE=20.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=LeaveSetMode STARTFRAME=53 NUMFRAMES=22 RATE=22.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyDown1 STARTFRAME=20 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyUp1 STARTFRAME=21 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyDown2 STARTFRAME=23 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyUp2 STARTFRAME=24 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyDown3 STARTFRAME=26 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyUp3 STARTFRAME=27 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyDown4 STARTFRAME=29 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyUp4 STARTFRAME=30 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyDown5 STARTFRAME=32 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyUp5 STARTFRAME=33 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyDown6 STARTFRAME=35 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyUp6 STARTFRAME=36 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyDown7 STARTFRAME=38 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyUp7 STARTFRAME=39 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyDown8 STARTFRAME=41 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyUp8 STARTFRAME=42 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyDown9 STARTFRAME=44 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyUp9 STARTFRAME=45 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyDown0 STARTFRAME=47 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyUp0 STARTFRAME=48 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyDownEnter STARTFRAME=50 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=KeyUpEnter STARTFRAME=51 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=DeployStart STARTFRAME=74 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=DeployEnd STARTFRAME=84 NUMFRAMES=20 RATE=20.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=Select STARTFRAME=115 NUMFRAMES=11 RATE=24.0 GROUP=Select
#exec MESH SEQUENCE MESH=MegatonOV SEQ=Down STARTFRAME=105 NUMFRAMES=11 RATE=47.0
#exec MESH SEQUENCE MESH=MegatonOV SEQ=DownHidden STARTFRAME=83 NUMFRAMES=2 RATE=1.0

//Scale
#exec MESHMAP NEW MESHMAP=MegatonOV MESH=MegatonOV
#exec MESHMAP SCALE MESHMAP=MegatonOV X=0.015 Y=0.015 Z=0.03

//Skinning
#exec TEXTURE IMPORT NAME=Sk_Megaton03_OV FILE=SKINS\Sk_Megaton03_OV.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MegatonOV NUM=1 TEXTURE=Sk_Megaton03_OV
#exec MESHMAP SETTEXTURE MESHMAP=MegatonOV NUM=2 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonOV NUM=3 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonOV NUM=4 TEXTURE=Megaton_N0

//===========================================================================


var() texture NumbersTex[10];
var() localized string keyFireHelp, keyTimeHelp, keyPasswordHelp;
var() localized string keyTimeCanvas, keyPasswordCanvas, keyOutCanvas;
var() float blinkTime;
var() float deployStartTime;
var() localized string DisarmMsg;

var(ServerConfig) config string CountdownTime, DisarmPassword;
var(ServerConfig) config string MinCountdownTime, MaxCountdownTime;
var(ServerConfig) config bool bRealSeconds;
var(ServerConfig) config bool bEnablePasswordCard;
var(ServerConfig) config bool generateRandPasswordWhenNotSet;
var(ServerConfig) config bool BroadcastDisarmMsg;

var string curDisplay;
var float blinkCount;
var bool bDeploying;
var bool bClientDeployStart;
var bool hasPassword;
var float CountBot;
var texture NTex[3];


replication
{
	reliable if (Role == ROLE_Authority)
		NTex;
}


simulated function BeginPlay()
{
	Super.BeginPlay();
	if (Role == ROLE_Authority)
		processDigits(CountdownTime);
}

function GivePasswordCardToOwner(MegatonDeploy OwnerMega)
{
local MegatonPassCard MPC;
local Pawn POwner;

	POwner = Pawn(Owner);
	if (POwner != None)
	{
		MPC = Spawn(Class'MegatonPassCard');
		if (MPC != None)
		{
			MPC.GiveSelfToPawn(POwner);
			MPC.processDigits(DisarmPassword);
			MPC.OriginalOwner = POwner;
			if (OwnerMega != None)
			{
				OwnerMega.MPassCard = MPC;
				MPC.MDeploy = OwnerMega;
			}
		}
	}
}

simulated function RenderOther(canvas Canvas, vector Loc, rotator Rot)
{
local byte i;

	//Screen flickering and update
	if (FirstOverFXActor[0] != None)
	{
		FirstOverFXActor[0].ScaleGlow = 0.75 + FRand() * 0.75 ;
		for (i = 0; i < 3; i++)
			FirstOverFXActor[0].MultiSkins[i + 2] = NTex[i];
	}
}

simulated function KeyClientTick(float Delta)
{
local byte i;
	
	blinkCount += Delta;
	if (blinkCount >= blinkTime)
	{
		blinkCount = 0.0;
		for (i = 0; i < 3; i++)
		{
			if (NTex[i] == Texture'Megaton_NTrDown')
				NTex[i] = Texture'Megaton_NEmpty';
			else if (NTex[i] == Texture'Megaton_NEmpty')
				NTex[i] = Texture'Megaton_NTrDown';
		}
		UpdateDigits();
	}
}

simulated function SetDefaultDisplay()
{
local byte i;

	Super.SetDefaultDisplay();
	for (i = 0; i < 3; i++)
		MultiSkins[i + 4] = NTex[i];
}

simulated function bool isDigitTexture(texture Tex, optional bool bTrueIfDefault, optional byte DefSkinN)
{
local byte i;
local texture DefTex;

	if (bTrueIfDefault)
	{
		if (DefSkinN < 8)
			DefTex = default.MultiSkins[DefSkinN];
		else
			DefTex = default.Texture;
			
		if (Tex == DefTex)
			return True;
	}
	
	for (i = 0; i < ArrayCount(NumbersTex); i++)
	{
		if (Tex == NumbersTex[i])
			return True;
	}
	
	switch (Tex)
	{
		case Texture'Megaton_NEmpty':
		case Texture'Megaton_NTrDown':
		case Texture'Megaton_NTrDownLeft':
		case Texture'Megaton_NTrDownRight':
		case Texture'Megaton_NTrMiddle':
		case Texture'Megaton_NTrUp':
		case Texture'Megaton_NTrUpLeft':
		case Texture'Megaton_NTrUpRight':
		case Texture'Megaton_NTrUpDown':
			return True;
	}
	
	return False;
}

simulated function UpdateDigits()
{
local byte i;

	for (i = 0; i < 3; i++)
	{
		if (isDigitTexture(MultiSkins[i + 4], True, i + 4))
			MultiSkins[i + 4] = NTex[i];
	}
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	if (Role == ROLE_Authority && Pawn(Owner) != None)
	{
		if (Class'NWUtils'.static.isValidBot(Pawn(Owner)))
			BotMegatonDeployement(Delta);
		if (AmmoType != None && !bDeploying)
		{
			if (AmmoType.AmmoAmount > 0 && ThirdPersonScale != Default.ThirdPersonScale)
				ThirdPersonScale = Default.ThirdPersonScale;
			else if (AmmoType.AmmoAmount <= 0 && ThirdPersonScale == Default.ThirdPersonScale)
				ThirdPersonScale = 0.001;
		}
	}
}

function WeaponKeyPressed(byte k, byte bufferPos)
{
	if (k < 10 && bufferPos < 3)
	{
		NTex[bufferPos] = NumbersTex[k];
		curDisplay = curDisplay $ k;
		if (bufferPos == 2)
		{
			if (curKeyState == 0)
				CountdownTime = getCorrectedTimeData(curDisplay);
			else if (curKeyState == 1)
			{
				DisarmPassword = curDisplay;
				hasPassword = True;
			}
			curDisplay = "";
		}
		else
			NTex[bufferPos + 1] = Texture'Megaton_NTrDown';
	}
	UpdateDigits();
}

function KeyStateChange(byte newState)
{
	if (newState == 0)
	{
		processDigits(CountdownTime);
		NTex[0] = Texture'Megaton_NTrDown';
	}
	else if (newState == 1)
	{
		NTex[0] = Texture'Megaton_NTrDown';
		NTex[1] = Texture'Megaton_NTrMiddle';
		NTex[2] = Texture'Megaton_NTrMiddle';
	}
	UpdateDigits();
}

simulated function string GetKeysHelpText()
{
	if (curKeyState == 0 && curKeyBufferPos == 0)
		return keyTimeHelp$"%n%"$keyFireHelp;
	else if (curKeyState == 0)
		return keyTimeHelp;
	else
		return keyPasswordHelp;
}

simulated function string getRenderCustomCanvasText()
{
local string s;
local byte i, l;

	if (IsInState('KeyPressMode') || keepClientKeyMode)
	{
		s = "";
		if (curKeyState == 0)
		{
			s = getStringFromTex(0)$":"$getStringFromTex(1)$getStringFromTex(2);
			return keyTimeCanvas $ ": " $ s;
		}
		else
		{
			for (i = 0; i <= Min(2, curKeyBufferPos); i++)
				s = s $ getStringFromTex(i);
			l = 3-Len(s);
			for (i = 0; i < l; i++)
				s = s $ "*";
			return keyPasswordCanvas $ ": " $ s;
		}
	}
	
	return keyOutCanvas;
}

simulated function string getStringFromTex(byte n)
{
local byte i;

	if (n > 7)
		return "";

	for (i = 0; i < ArrayCount(NumbersTex); i++)
	{
		if (NTex[n] == NumbersTex[i])
			return string(i);
	}
	
	return "_";
}

function KeyModeToggled(bool isKeyMode)
{
	curDisplay = "";
	processDigits(CountdownTime);
	if (isKeyMode)
		NTex[0] = Texture'Megaton_NTrDown';
	else
		processDigits(CountdownTime);
	UpdateDigits();
}

function processDigits(string data)
{
local byte i;

	for (i = 0; i < 3; i++)
		NTex[i] = NumbersTex[int(Mid(data, i, 1))];
	UpdateDigits();
}

function string getCorrectedTimeData(coerce string data)
{
local string cData;
local byte i;

	if (int(Mid(data, 1, 1)) > 5)
		cData = Mid(data, 0, 1) $ "5" $ Mid(data, 2, 1);
	else
		cData = data;
		
	if (int(cData) < int(MinCountdownTime))
		cData = MinCountdownTime;
	else if (int(cData) > int(MaxCountdownTime))
		cData = MaxCountdownTime;
	return cData;
}

function Fire(float Value)
{
    if ( (AmmoType == None) && (AmmoName != None) )
        GiveAmmo(Pawn(Owner));
	
	if (AmmoType.UseAmmo(1))
	{
		bDeploying = True;
		GotoState('NormalFire');
        bCanClientFire = True;
        ClientFire(Value);
	}
}

simulated function PlayFiring()
{
	PlayAnim('DeployStart', 1/deployStartTime, 0.0);
}

function DeployMegaton()
{
local vector Start, X,Y,Z, HitLoc, HitNorm;
local rotator R;
local MegatonDeploy MegaD;
local Pawn PawnOwner;

	PawnOwner = Pawn(Owner);
    Owner.MakeNoise(PawnOwner.SoundDampening);
    GetAxes(PawnOwner.ViewRotation,X,Y,Z);
	R = rotator(vector(PawnOwner.ViewRotation)*vect(1,1,0)) + rot(0,32768,0);
	Start = Owner.Location + CalcNewDrawOffset() + 
		FireOffset.X * X + FireOffset.Y * Y + (FireOffset.Z+Class'MegatonDeploy'.default.ZSpawnOffset) * Z;
		
	if (Owner.Trace(HitLoc, HitNorm, Start, Owner.Location + CalcNewDrawOffset()) != None)
		Start = HitLoc + 10*HitNorm;
	
	MegaD = MegatonDeploy(Spawn(ProjectileClass,,, Start, R));
	if (MegaD != None)
	{
		if (Class'NWUtils'.static.isValidBot(PawnOwner))
			CountdownTime = getPawnSkillBasedCountdown(PawnOwner);
		MegaD.Countdown = CountdownTime;
		if (!hasPassword && generateRandPasswordWhenNotSet)
			DisarmPassword = generateRandSequence(3);
		MegaD.Password = DisarmPassword;
		if (bEnablePasswordCard)
			GivePasswordCardToOwner(MegaD);
	}
}

function string generateRandSequence(byte n)
{
local byte i;
local string s;

	for (i = 0; i < n; i++)
		s = s $ Rand(10);
	return s;
}

simulated function TweenDown()
{
	if (AnimSequence == 'DeployStart' || bClientDeployStart)
	{
		PlayAnim('DeployEnd', 0.5, 0.05);
		bClientDeployStart = False;
	}
	else
		Super.TweenDown();
}

simulated event RenderOverlays(canvas Canvas)
{
	bRenderHandsOnly = (AnimSequence == 'DeployEnd');
	Super.RenderOverlays(Canvas);
}

function Timer()
{
	if (bDeploying)
	{
		DeployMegaton();
		bDeploying = False;
	}
}


state NormalFire
{
	function AnimEnd()
	{
		if (AmmoType != None && AmmoType.AmmoAmount > 0)
		{
			if (AnimSequence == 'DeployStart')
				PlayAnim('DeployEnd', 0.5, 0.05);
			else if (AnimSequence == 'DeployEnd')
			{
				PlayAnim('Select',1.0,0.0);
				Owner.PlaySound(SelectSound, SLOT_Misc, Pawn(Owner).SoundDampening);
			}
			else
				Super.AnimEnd();
		}
		else
			Super.AnimEnd();
	}
	
Begin:
    SetTimer(deployStartTime, False);
}

state ClientFiring
{
	simulated function AnimEnd()
	{
		if (AmmoType != None && AmmoType.AmmoAmount > 0)
		{
			if (AnimSequence == 'DeployStart' || bClientDeployStart)
			{
				PlayAnim('DeployEnd', 0.5, 0.05);
				bClientDeployStart = False;
			}
			else if (AnimSequence == 'DeployEnd')
			{
				PlayAnim('Select',1.0,0.0);
				Owner.PlaySound(SelectSound, SLOT_Misc, Pawn(Owner).SoundDampening);
			}
			else
				Super.AnimEnd();
		}
		else
			Super.AnimEnd();
	}
	
	simulated function BeginState()
	{
		bClientDeployStart = True;
	}
}

function float RateSelf(out int bUseAltMode)
{
	if (AmmoType.AmmoAmount <=0)
		return -2;
	bUseAltMode = 0;
	return 10.0;
}

function BotMegatonDeployement(float Delta)
{
local Pawn P;

	P = Pawn(Owner);
	if (!Class'NWUtils'.static.isElegibleBotAI(P, True, FRand()*3.0) || !checkDeployPriority(P))
		return;
	
	CountBot += Delta;
	if (CountBot >= 1.0)
	{
		CountBot = 0;
		if ((P.Enemy != None && P.LineOfSightTo(P.Enemy)) || P.Physics == PHYS_Falling)
			return;
		
		if (P.Weapon != Self)
		{
			P.PendingWeapon = Self;
			P.ChangedWeapon();
			return;
		}
		
		if (IsInState('Active'))
		{
			bChangeWeapon = False;
			bWeaponUp = True;
			Finish();
		}

		CountdownTime = getPawnSkillBasedCountdown(P);
		P.bAltFire = 0;
		P.bFire = 1;
		P.Weapon.Fire(1.0);
	}
}

function string getPawnSkillBasedCountdown(Pawn P)
{
	if (P == None)
		return getCorrectedTimeData(int(MinCountdownTime));
	return getCorrectedTimeData(int(Rand(int(MaxCountdownTime)-int(MinCountdownTime)) / (FMax(0, P.Skill) + 1) + int(MinCountdownTime)));
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=MegatonPick
	CollisionHeight=28.500000
	CollisionRadius=24.000000
	AutoSwitchPriority=10
	Icon=MegatonIcon
	InventoryGroup=10
	ItemArticle="a"
	ItemName="MegaTon"
	MaxDesireability=10.000000
	PickupMessage="You got the MegaTon."
	PickupSound=MegaTon_Pickup
	PickupViewMesh=MegatonPick
	PickupViewScale=1.000000
	PlayerViewMesh=Megaton
	PlayerViewOffset=(X=13.00000,Y=0.000000,Z=-3.500000)
	WidePlayerViewOffset=(X=13.50000,Y=0.000000,Z=-2.800000)
	CenterPlayerViewOffset=(X=13.00000,Y=0.000000,Z=-3.500000)
	WideCenterPlayerViewOffset=(X=13.50000,Y=0.000000,Z=-2.800000)
	PlayerViewScale=1.000000
	RespawnTime=90.000000
	StatusIcon=MegatonIcon
	ThirdPersonMesh=MegatonM
	ThirdPersonScale=0.750000
	AltDamageType=None
	AltFireSound=None
	AltProjectileClass=None
	AmmoName=Class'MegatonAmmo'
	bInstantHit=False
    bAltInstantHit=False
	bRapidFire=False
	DeathMessage="%o was nuked to hell by %k's %w."
	FireOffset=(X=56.000000,Y=0.000000,Z=-48.000000)
	FireSound=None
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=Nuclear04
	NameColor=(R=255,G=128,B=0)
	PickupAmmoCount=1
	ProjectileClass=Class'MegatonDeploy'
	SelectSound=MegaTon_Select
	shakemag=0.000000
	shaketime=0.000000
	shakevert=0.000000
	AIRating=10.000000
	AltRefireRate=1.000000
	bAltWarnTarget=False
	bRecommendAltSplashDamage=False
	bRecommendSplashDamage=True
	bSplashDamage=True
	bWarnTarget=False
	RefireRate=0.500000
	Mass=200.000000
	bNoSmooth=False
	bOwnsCrossHair=True
	CustomCross=None
	WeaponDescription="Classification: Deployable timed nuclear device.\n\nPrimary and Secondary Fire: Setup and deploy the device."
	
	bMegaWeapon=True
	bForceHands=True
	bRotatingPickup=False
	
	PlayerViewMeshLeft=Megaton
	PlayerViewMeshRight=Megaton
	HandPartMeshL(0)=MegatonHandLL
	HandPartMeshL(1)=MegatonHandRL
	HandPartMeshR(0)=MegatonHandLR
	HandPartMeshR(1)=MegatonHandRR
	BobDamping=1.075000
	
	FirstPersonOverFX(0)=(bLit=True)
	FirstPersonOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.75000,bCustomMesh=True)
	FirstPersonOverFX(0)=(CustomMeshLeft=Mesh'MegatonOV',CustomMesh=Mesh'MegatonOV')
	
	NumbersTex(0)=Megaton_N0
	NumbersTex(1)=Megaton_N1
	NumbersTex(2)=Megaton_N2
	NumbersTex(3)=Megaton_N3
	NumbersTex(4)=Megaton_N4
	NumbersTex(5)=Megaton_N5
	NumbersTex(6)=Megaton_N6
	NumbersTex(7)=Megaton_N7
	NumbersTex(8)=Megaton_N8
	NumbersTex(9)=Megaton_N9
	
	NumberAnimIn(0)=KeyDown0
	NumberAnimIn(1)=KeyDown1
	NumberAnimIn(2)=KeyDown2
	NumberAnimIn(3)=KeyDown3
	NumberAnimIn(4)=KeyDown4
	NumberAnimIn(5)=KeyDown5
	NumberAnimIn(6)=KeyDown6
	NumberAnimIn(7)=KeyDown7
	NumberAnimIn(8)=KeyDown8
	NumberAnimIn(9)=KeyDown9
	NumberAnimOut(0)=KeyUp0
	NumberAnimOut(1)=KeyUp1
	NumberAnimOut(2)=KeyUp2
	NumberAnimOut(3)=KeyUp3
	NumberAnimOut(4)=KeyUp4
	NumberAnimOut(5)=KeyUp5
	NumberAnimOut(6)=KeyUp6
	NumberAnimOut(7)=KeyUp7
	NumberAnimOut(8)=KeyUp8
	NumberAnimOut(9)=KeyUp9
	
	EnterKeyModeAnim=EnterSetMode
	LeaveKeyModeAnim=LeaveSetMode
	NumberFinishAnimIn=KeyDownEnter
	NumberFinishAnimOut=KeyUpEnter
	
	bAltFireAsKeyStarter=True
	bFireAsKeyEnder=True
	bAltFireAsKeyEnder=True
	NumberPressRate=6.000000
	EnterKeyModeRate=1.000000
	LeaveKeyModeRate=1.000000
	KeysTweenTime=0.350000
	KeysBufferSize=3
	KeyStatesAmount=2
	KeyPressSnd=MegaTon_Set
	KeyPressFinishSnd=MegaTon_SetDone
	bLeaveKeyModeOnceSet=True
	
	keyFireHelp="Fire/Altfire: Leave key editing mode."
	keyTimeHelp="Use 0-9 keys to setup the time (countdown start)."
	keyPasswordHelp="Use 0-9 keys to setup the password."
	blinkTime=0.750000
	deployStartTime=0.500000
	
	bRenderCustomOnHiddenWeapon=True
	keyTimeCanvas="Time"
	keyPasswordCanvas="Password"
	keyOutCanvas="Deploy or Set time and password"
	DisarmMsg="MegaTon has been disarmed"
	
	CountdownTime="030"
	DisarmPassword="000"
	MinCountdownTime="030"
	MaxCountdownTime="959"
	bRealSeconds=False
	bEnablePasswordCard=True
	generateRandPasswordWhenNotSet=True
	BroadcastDisarmMsg=True
	
	DeployAIPriority=100
}
