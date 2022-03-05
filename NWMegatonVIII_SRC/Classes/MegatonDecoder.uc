//////////////////////////////////////////////////////////////
//	Nali Weapons III Megaton decoder utility
//				Feralidragon (25-08-2011)
//
// NW3 MEGATON BUILD 1.00
//////////////////////////////////////////////////////////////

class MegatonDecoder expands KeyedNaliWeapon config(NWeaponsCfg);

//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=MegatonDecoder ANIVFILE=MODELS\MegatonDecoder_a.3d DATAFILE=MODELS\MegatonDecoder_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MegatonDecoder STRENGTH=0
#exec MESH ORIGIN MESH=MegatonDecoder X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=MegatonDecoderPick ANIVFILE=MODELS\MegatonDecoder_a.3d DATAFILE=MODELS\MegatonDecoder_d.3d X=0 Y=0 Z=0 UNMIRROR=1
//#exec MESH LODPARAMS MESH=MegatonDecoderPick STRENGTH=0
#exec MESH ORIGIN MESH=MegatonDecoderPick X=0 Y=0 Z=0 Yaw=128

//3rd person
#exec MESH IMPORT MESH=MegatonDecoderM ANIVFILE=MODELS\MegatonDecoder_a.3d DATAFILE=MODELS\MegatonDecoder_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MegatonDecoderM STRENGTH=0.45
#exec MESH ORIGIN MESH=MegatonDecoderM X=0 Y=90 Z=-36

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=All STARTFRAME=0 NUMFRAMES=50
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyDown1 STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyUp1 STARTFRAME=2 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyDown2 STARTFRAME=4 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyUp2 STARTFRAME=5 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyDown3 STARTFRAME=7 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyUp3 STARTFRAME=8 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyDown4 STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyUp4 STARTFRAME=11 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyDown5 STARTFRAME=13 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyUp5 STARTFRAME=14 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyDown6 STARTFRAME=16 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyUp6 STARTFRAME=17 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyDown7 STARTFRAME=19 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyUp7 STARTFRAME=20 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyDown8 STARTFRAME=22 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyUp8 STARTFRAME=23 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyDown9 STARTFRAME=25 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyUp9 STARTFRAME=26 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyDownDecode STARTFRAME=28 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyUpDecode STARTFRAME=29 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyDown0 STARTFRAME=31 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyUp0 STARTFRAME=32 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyDownEnter STARTFRAME=34 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=KeyUpEnter STARTFRAME=35 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=Select STARTFRAME=43 NUMFRAMES=7 RATE=14.0 GROUP=Select
#exec MESH SEQUENCE MESH=MegatonDecoder SEQ=Down STARTFRAME=37 NUMFRAMES=7 RATE=27.0

#exec MESH SEQUENCE MESH=MegatonDecoderPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH SEQUENCE MESH=MegatonDecoderM SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonDecoderM SEQ=Still STARTFRAME=0 NUMFRAMES=1

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=MegatonDecoder MESH=MegatonDecoder
#exec MESHMAP SCALE MESHMAP=MegatonDecoder X=0.015 Y=0.015 Z=0.03

#exec MESHMAP NEW MESHMAP=MegatonDecoderPick MESH=MegatonDecoderPick
#exec MESHMAP SCALE MESHMAP=MegatonDecoderPick X=0.0712 Y=0.0712 Z=0.1424

#exec MESHMAP NEW MESHMAP=MegatonDecoderM MESH=MegatonDecoderM
#exec MESHMAP SCALE MESHMAP=MegatonDecoderM X=0.0562 Y=0.0562 Z=0.1124

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=MegatonDecoder_Sk01 FILE=SKINS\MegatonDecoder_Sk01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoder NUM=1 TEXTURE=MegatonDecoder_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderPick NUM=1 TEXTURE=MegatonDecoder_Sk01
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderM NUM=1 TEXTURE=MegatonDecoder_Sk01

#exec TEXTURE IMPORT NAME=MegatonDecoder_Sk02 FILE=SKINS\MegatonDecoder_Sk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoder NUM=2 TEXTURE=MegatonDecoder_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderPick NUM=2 TEXTURE=MegatonDecoder_Sk02
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderM NUM=2 TEXTURE=MegatonDecoder_Sk02

#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoder NUM=3 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderPick NUM=3 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderM NUM=3 TEXTURE=Megaton_N0

#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoder NUM=4 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderPick NUM=4 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderM NUM=4 TEXTURE=Megaton_N0

#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoder NUM=5 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderPick NUM=5 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderM NUM=5 TEXTURE=Megaton_N0

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=MegatonDecoderIcon FILE=ICONS\MegatonDecoderIcon.bmp GROUP=Icons MIPS=OFF LODSET=0

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="MegatonDecoder_Pickup" FILE=SOUNDS\MegatonDecoder_Pickup.wav GROUP="MegatonDecoder"
#exec AUDIO IMPORT NAME="MegatonDecoder_Select" FILE=SOUNDS\MegatonDecoder_Select.wav GROUP="MegatonDecoder"
#exec AUDIO IMPORT NAME="MegatonDecoder_Set" FILE=SOUNDS\MegatonDecoder_Set.wav GROUP="MegatonDecoder"
#exec AUDIO IMPORT NAME="MegatonDecoder_SetDone" FILE=SOUNDS\MegatonDecoder_SetDone.wav GROUP="MegatonDecoder"
#exec AUDIO IMPORT NAME="MegatonDecoder_Error" FILE=SOUNDS\MegatonDecoder_Error.wav GROUP="MegatonDecoder"
#exec AUDIO IMPORT NAME="MegatonDecoder_OK" FILE=SOUNDS\MegatonDecoder_OK.wav GROUP="MegatonDecoder"
#exec AUDIO IMPORT NAME="MegatonDecoder_Transmission" FILE=SOUNDS\MegatonDecoder_Transmission.wav GROUP="Loop"

//HAND
//*******************************************************

//Left Hands
#exec MESH IMPORT MESH=MegatonDecoderHandLL ANIVFILE=MODELS\MegatonDecoderHandLeft_a.3d DATAFILE=MODELS\MegatonDecoderHandLeft_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MegatonDecoderHandLL STRENGTH=0
#exec MESH ORIGIN MESH=MegatonDecoderHandLL X=0 Y=0 Z=0 Yaw=128

#exec MESH IMPORT MESH=MegatonDecoderHandRL ANIVFILE=MODELS\MegatonDecoderHandRight_a.3d DATAFILE=MODELS\MegatonDecoderHandRight_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MegatonDecoderHandRL STRENGTH=0
#exec MESH ORIGIN MESH=MegatonDecoderHandRL X=0 Y=0 Z=0 Yaw=128

//Right Hands
#exec MESH IMPORT MESH=MegatonDecoderHandLR ANIVFILE=MODELS\MegatonDecoderHandLeft_a.3d DATAFILE=MODELS\MegatonDecoderHandLeft_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MegatonDecoderHandLR STRENGTH=0
#exec MESH ORIGIN MESH=MegatonDecoderHandLR X=0 Y=0 Z=0

#exec MESH IMPORT MESH=MegatonDecoderHandRR ANIVFILE=MODELS\MegatonDecoderHandRight_a.3d DATAFILE=MODELS\MegatonDecoderHandRight_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MegatonDecoderHandRR STRENGTH=0
#exec MESH ORIGIN MESH=MegatonDecoderHandRR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=All STARTFRAME=0 NUMFRAMES=50
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyDown3 STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyUp3 STARTFRAME=2 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyDown2 STARTFRAME=4 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyUp2 STARTFRAME=5 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyDown1 STARTFRAME=7 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyUp1 STARTFRAME=8 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyDown6 STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyUp6 STARTFRAME=11 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyDown5 STARTFRAME=13 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyUp5 STARTFRAME=14 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyDown4 STARTFRAME=16 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyUp4 STARTFRAME=17 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyDown9 STARTFRAME=19 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyUp9 STARTFRAME=20 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyDown8 STARTFRAME=22 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyUp8 STARTFRAME=23 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyDown7 STARTFRAME=25 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyUp7 STARTFRAME=26 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyDownEnter STARTFRAME=28 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyUpEnter STARTFRAME=29 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyDown0 STARTFRAME=31 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyUp0 STARTFRAME=32 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyDownDecode STARTFRAME=34 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=KeyUpDecode STARTFRAME=35 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=Select STARTFRAME=43 NUMFRAMES=7 RATE=14.0 GROUP=Select
#exec MESH SEQUENCE MESH=MegatonDecoderHandLL SEQ=Down STARTFRAME=37 NUMFRAMES=7 RATE=27.0

#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=All STARTFRAME=0 NUMFRAMES=50
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyDown3 STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyUp3 STARTFRAME=2 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyDown2 STARTFRAME=4 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyUp2 STARTFRAME=5 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyDown1 STARTFRAME=7 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyUp1 STARTFRAME=8 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyDown6 STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyUp6 STARTFRAME=11 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyDown5 STARTFRAME=13 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyUp5 STARTFRAME=14 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyDown4 STARTFRAME=16 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyUp4 STARTFRAME=17 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyDown9 STARTFRAME=19 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyUp9 STARTFRAME=20 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyDown8 STARTFRAME=22 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyUp8 STARTFRAME=23 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyDown7 STARTFRAME=25 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyUp7 STARTFRAME=26 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyDownEnter STARTFRAME=28 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyUpEnter STARTFRAME=29 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyDown0 STARTFRAME=31 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyUp0 STARTFRAME=32 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyDownDecode STARTFRAME=34 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=KeyUpDecode STARTFRAME=35 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=Select STARTFRAME=43 NUMFRAMES=7 RATE=14.0 GROUP=Select
#exec MESH SEQUENCE MESH=MegatonDecoderHandRL SEQ=Down STARTFRAME=37 NUMFRAMES=7 RATE=27.0

#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=All STARTFRAME=0 NUMFRAMES=50
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyDown1 STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyUp1 STARTFRAME=2 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyDown2 STARTFRAME=4 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyUp2 STARTFRAME=5 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyDown3 STARTFRAME=7 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyUp3 STARTFRAME=8 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyDown4 STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyUp4 STARTFRAME=11 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyDown5 STARTFRAME=13 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyUp5 STARTFRAME=14 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyDown6 STARTFRAME=16 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyUp6 STARTFRAME=17 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyDown7 STARTFRAME=19 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyUp7 STARTFRAME=20 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyDown8 STARTFRAME=22 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyUp8 STARTFRAME=23 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyDown9 STARTFRAME=25 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyUp9 STARTFRAME=26 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyDownDecode STARTFRAME=28 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyUpDecode STARTFRAME=29 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyDown0 STARTFRAME=31 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyUp0 STARTFRAME=32 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyDownEnter STARTFRAME=34 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=KeyUpEnter STARTFRAME=35 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=Select STARTFRAME=43 NUMFRAMES=7 RATE=14.0 GROUP=Select
#exec MESH SEQUENCE MESH=MegatonDecoderHandLR SEQ=Down STARTFRAME=37 NUMFRAMES=7 RATE=27.0

#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=All STARTFRAME=0 NUMFRAMES=50
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyDown1 STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyUp1 STARTFRAME=2 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyDown2 STARTFRAME=4 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyUp2 STARTFRAME=5 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyDown3 STARTFRAME=7 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyUp3 STARTFRAME=8 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyDown4 STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyUp4 STARTFRAME=11 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyDown5 STARTFRAME=13 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyUp5 STARTFRAME=14 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyDown6 STARTFRAME=16 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyUp6 STARTFRAME=17 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyDown7 STARTFRAME=19 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyUp7 STARTFRAME=20 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyDown8 STARTFRAME=22 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyUp8 STARTFRAME=23 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyDown9 STARTFRAME=25 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyUp9 STARTFRAME=26 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyDownDecode STARTFRAME=28 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyUpDecode STARTFRAME=29 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyDown0 STARTFRAME=31 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyUp0 STARTFRAME=32 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyDownEnter STARTFRAME=34 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=KeyUpEnter STARTFRAME=35 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=Select STARTFRAME=43 NUMFRAMES=7 RATE=14.0 GROUP=Select
#exec MESH SEQUENCE MESH=MegatonDecoderHandRR SEQ=Down STARTFRAME=37 NUMFRAMES=7 RATE=27.0

//Scale
#exec MESHMAP NEW MESHMAP=MegatonDecoderHandLL MESH=MegatonDecoderHandLL
#exec MESHMAP SCALE MESHMAP=MegatonDecoderHandLL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=MegatonDecoderHandRL MESH=MegatonDecoderHandRL
#exec MESHMAP SCALE MESHMAP=MegatonDecoderHandRL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=MegatonDecoderHandLR MESH=MegatonDecoderHandLR
#exec MESHMAP SCALE MESHMAP=MegatonDecoderHandLR X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=MegatonDecoderHandRR MESH=MegatonDecoderHandRR
#exec MESHMAP SCALE MESHMAP=MegatonDecoderHandRR X=0.03 Y=0.03 Z=0.06

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderHandLL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderHandLR NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderHandRL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderHandRR NUM=1 TEXTURE=HumanHand

//===========================================================================

//OVERLAYER
//*******************************************************

//1st person
#exec MESH IMPORT MESH=MegatonDecoderOV ANIVFILE=MODELS\MegatonDecoderOV_a.3d DATAFILE=MODELS\MegatonDecoderOV_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MegatonDecoderOV STRENGTH=0
#exec MESH ORIGIN MESH=MegatonDecoderOV X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=All STARTFRAME=0 NUMFRAMES=50
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyDown1 STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyUp1 STARTFRAME=2 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyDown2 STARTFRAME=4 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyUp2 STARTFRAME=5 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyDown3 STARTFRAME=7 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyUp3 STARTFRAME=8 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyDown4 STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyUp4 STARTFRAME=11 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyDown5 STARTFRAME=13 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyUp5 STARTFRAME=14 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyDown6 STARTFRAME=16 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyUp6 STARTFRAME=17 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyDown7 STARTFRAME=19 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyUp7 STARTFRAME=20 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyDown8 STARTFRAME=22 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyUp8 STARTFRAME=23 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyDown9 STARTFRAME=25 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyUp9 STARTFRAME=26 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyDownDecode STARTFRAME=28 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyUpDecode STARTFRAME=29 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyDown0 STARTFRAME=31 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyUp0 STARTFRAME=32 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyDownEnter STARTFRAME=34 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=KeyUpEnter STARTFRAME=35 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=Select STARTFRAME=43 NUMFRAMES=7 RATE=14.0 GROUP=Select
#exec MESH SEQUENCE MESH=MegatonDecoderOV SEQ=Down STARTFRAME=37 NUMFRAMES=7 RATE=27.0

//Scale
#exec MESHMAP NEW MESHMAP=MegatonDecoderOV MESH=MegatonDecoderOV
#exec MESHMAP SCALE MESHMAP=MegatonDecoderOV X=0.015 Y=0.015 Z=0.03

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderOV NUM=1 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderOV NUM=2 TEXTURE=Megaton_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDecoderOV NUM=3 TEXTURE=Megaton_N0

//===========================================================================

// GLOW LIGHTS
//*******************************************************

//1st person
#exec MESH IMPORT MESH=MegatonDecoderLights ANIVFILE=MODELS\MegatonDecoderLights_a.3d DATAFILE=MODELS\MegatonDecoderLights_d.3d X=0 Y=0 Z=0 UNMIRROR=1
//#exec MESH LODPARAMS MESH=MegatonDecoderLights STRENGTH=0
#exec MESH ORIGIN MESH=MegatonDecoderLights X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=All STARTFRAME=0 NUMFRAMES=50
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyDown1 STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyUp1 STARTFRAME=2 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyDown2 STARTFRAME=4 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyUp2 STARTFRAME=5 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyDown3 STARTFRAME=7 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyUp3 STARTFRAME=8 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyDown4 STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyUp4 STARTFRAME=11 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyDown5 STARTFRAME=13 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyUp5 STARTFRAME=14 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyDown6 STARTFRAME=16 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyUp6 STARTFRAME=17 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyDown7 STARTFRAME=19 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyUp7 STARTFRAME=20 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyDown8 STARTFRAME=22 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyUp8 STARTFRAME=23 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyDown9 STARTFRAME=25 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyUp9 STARTFRAME=26 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyDownDecode STARTFRAME=28 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyUpDecode STARTFRAME=29 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyDown0 STARTFRAME=31 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyUp0 STARTFRAME=32 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyDownEnter STARTFRAME=34 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=KeyUpEnter STARTFRAME=35 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=Select STARTFRAME=43 NUMFRAMES=7 RATE=14.0 GROUP=Select
#exec MESH SEQUENCE MESH=MegatonDecoderLights SEQ=Down STARTFRAME=37 NUMFRAMES=7 RATE=27.0

//Scale
#exec MESHMAP NEW MESHMAP=MegatonDecoderLights MESH=MegatonDecoderLights
#exec MESHMAP SCALE MESHMAP=MegatonDecoderLights X=0.015 Y=0.015 Z=0.03

//Light textures
#exec TEXTURE IMPORT NAME=MDecoderLightRed FILE=Coronas\MDecoderLightRed.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=MDecoderLightYellow FILE=Coronas\MDecoderLightYellow.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=MDecoderLightGreen FILE=Coronas\MDecoderLightGreen.bmp GROUP=Coronas FLAGS=2

//-----------------------------------------------------------------------------------

//Screens
#exec TEXTURE IMPORT NAME=MegatonDec_NC FILE=DIGITAL\MegatonDec_NC.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=MegatonDec_NE FILE=DIGITAL\MegatonDec_NE.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=MegatonDec_NR FILE=DIGITAL\MegatonDec_NR.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=MegatonDec_NU FILE=DIGITAL\MegatonDec_NU.bmp GROUP=Digital LODSET=0 MIPS=OFF

//===========================================================================


var() texture NumbersTex[10];
var() float blinkTime;
var() localized string keyFireHelp, keyPasswordHelp;
var() localized string keyPasswordCanvas, keyOutCanvas, canvasTransmitting, canvasOK, canvasError;
var() color canvasErrorColor, canvasOKColor, canvasTransColor;

var(ServerConfig) config float TransmissionTime;
var(ServerConfig) config float TransmissionMaxDistance;
var(ServerConfig) config bool bDroppable;
var(ServerConfig) config bool canDisarmFriendNuke;

var float blinkCount;
var string curDisplay, SavedPassword;
var byte transmissionDisplayCount;
var MegatonDeploy foundMega;

var byte clientStatus;
var float clientTransmissionTime;

var byte transmissionStatus, oldTransmissionStatus;
var bool transmissionLightOn;
var float transmissionLightCount;
var texture NTex[3];

//AI
var MegatonDeploy EnemyMDeploy;
var bool knowsCode;
var float CountBot;
var vector DecodingLoc;

replication
{
	reliable if (Role == ROLE_Authority)
		NTex;
	reliable if (Role == ROLE_Authority && bNetOwner)
		clientTransmissionTime, transmissionStatus;
}

function PreBeginPlay()
{
	Super.PreBeginPlay();
	clientTransmissionTime = TransmissionTime;
	bCanThrow = bDroppable;
}

function bool HandlePickupQuery(inventory Item)
{
	if (Item.Class == Class)
		return True;
	if (Inventory == None)
		return False;

	return Inventory.HandlePickupQuery(Item);
}

simulated function SetDefaultDisplay()
{
local byte i;

	Super.SetDefaultDisplay();
	for (i = 0; i < 3; i++)
		MultiSkins[i + 3] = NTex[i];
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
		case Texture'MegatonDec_NC':
		case Texture'MegatonDec_NE':
		case Texture'MegatonDec_NR':
		case Texture'MegatonDec_NU':
			return True;
	}
	
	return False;
}

simulated function UpdateDigits()
{
local byte i;

	for (i = 0; i < 3; i++)
	{
		if (isDigitTexture(MultiSkins[i + 3], True, i + 3))
			MultiSkins[i + 3] = NTex[i];
	}
}

simulated function string getRenderCustomCanvasText()
{
local string s;
local byte i, l;

	if (IsInState('KeyPressMode') || keepClientKeyMode)
	{
		s = "";
		for (i = 0; i <= Min(2, curKeyBufferPos); i++)
			s = s $ getStringFromTex(i);
		l = 3-Len(s);
		for (i = 0; i < l; i++)
			s = s $ "*";
		return keyPasswordCanvas $ ": " $ s;
	}
	else if (transmissionStatus == 1)
		return canvasTransmitting;
	else if (transmissionStatus == 2)
		return canvasOK;
	else if (transmissionStatus == 3)
		return canvasError;
	
	return keyOutCanvas;
}

simulated function color getRenderCustomCanvasColor()
{
	if (IsInState('KeyPressMode') || keepClientKeyMode)
		return Super.getRenderCustomCanvasColor();
	else if (transmissionStatus == 1)
		return canvasTransColor;
	else if (transmissionStatus == 2)
		return canvasOKColor;
	else if (transmissionStatus == 3)
		return canvasErrorColor;
	
	return Super.getRenderCustomCanvasColor();
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

simulated function RenderOther( canvas Canvas, vector Loc, rotator Rot)
{
local byte i;

	//Screen flickering and update
	if (FirstOverFXActor[0] != None)
	{
		FirstOverFXActor[0].ScaleGlow = 0.75 + FRand() * 0.75 ;
		for (i = 0; i < 3; i++)
			FirstOverFXActor[0].MultiSkins[i + 1] = NTex[i];
	}
}

simulated function Tick(float Delta)
{
local byte i;

	Super.Tick(Delta);

	if (Level.NetMode != NM_DedicatedServer && FirstGlowFXActor[0] != None 
	&& (transmissionStatus != oldTransmissionStatus || transmissionStatus == 1))
	{
		oldTransmissionStatus = transmissionStatus;
		for (i = 1; i <= 3; i++)
			FirstGlowFXActor[0].ChangeTex(i);
		
		if (transmissionStatus == 0)
			transmissionLightCount = 0.35;
		else if (transmissionStatus == 1)
		{
			transmissionLightCount += Delta;
			if (transmissionLightCount >= 0.35)
			{
				transmissionLightCount = 0;
				transmissionLightOn = !transmissionLightOn;
			}
			
			if (transmissionLightOn)
				FirstGlowFXActor[0].ChangeTex(2, FirstPersonGlowFX[0].GlowTex2);
		}
		else if (transmissionStatus == 2)
			FirstGlowFXActor[0].ChangeTex(3, FirstPersonGlowFX[0].GlowTex3);
		else if (transmissionStatus == 3)
			FirstGlowFXActor[0].ChangeTex(1, FirstPersonGlowFX[0].GlowTex1);
	}
	
	if (Role == ROLE_Authority && Class'NWUtils'.static.isValidBot(Pawn(Owner)))
		BotMegatonDisarm(Delta);
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

function WeaponKeyPressed(byte k, byte bufferPos)
{
	if (k < 10 && bufferPos < 3)
	{
		NTex[bufferPos] = NumbersTex[k];
		curDisplay = curDisplay $ k;
		if (bufferPos == 2)
		{
			SavedPassword = curDisplay;
			curDisplay = "";
		}
		else
			NTex[bufferPos + 1] = Texture'Megaton_NTrDown';
	}
	UpdateDigits();
}

function KeyStateChange(byte newState)
{
	NTex[0] = Texture'Megaton_NTrDown';
	NTex[1] = Texture'Megaton_NTrMiddle';
	NTex[2] = Texture'Megaton_NTrMiddle';
	UpdateDigits();
}

function KeyModeToggled(bool isKeyMode)
{
	curDisplay = "";
	if (isKeyMode)
	{
		NTex[0] = Texture'Megaton_NTrDown';
		NTex[1] = Texture'Megaton_NTrMiddle';
		NTex[2] = Texture'Megaton_NTrMiddle';
		UpdateDigits();
	}
	else
		processDigits(SavedPassword);
}

function processDigits(string data)
{
local byte i;

	for (i = 0; i < 3; i++)
		NTex[i] = NumbersTex[int(Mid(data, i, 1))];
	UpdateDigits();
}

simulated function string GetKeysHelpText()
{
	if (curKeyBufferPos == 0)
		return keyPasswordHelp$"%n%"$keyFireHelp;
	else
		return keyPasswordHelp;
}

function Fire(float Value)
{
	GotoState('NormalFire');
	bCanClientFire = True;
	ClientFire(Value);
}

simulated function PlayFiring()
{
	TweenAnim('KeyDownDecode', KeysTweenTime);
}

function MegatonDeploy getMegatonDevice()
{
local vector HitLocation, HitNormal, TraceEnd, TraceStart, X, Y, Z;
local MegatonDeploy M;

	if (Pawn(Owner) == None)
		return None;
	
	GetAxes(Pawn(Owner).ViewRotation, X, Y, Z);
    TraceStart = Owner.Location + Pawn(Owner).Eyeheight*vect(0,0,1);
	TraceEnd = TraceStart + TransmissionMaxDistance*X;
	M = MegatonDeploy(Pawn(Owner).Trace(HitLocation, HitNormal, TraceEnd, TraceStart, True));
	return M;
}

function setFeedback(bool bSuccess)
{
	if (bSuccess)
	{
		NTex[0] = Texture'Megaton_N5';
		NTex[1] = Texture'MegatonDec_NU';
		NTex[2] = Texture'MegatonDec_NC';
		transmissionStatus = 2;
		EnemyMDeploy = None;
	}
	else
	{
		NTex[0] = Texture'MegatonDec_NE';
		NTex[1] = Texture'MegatonDec_NR';
		NTex[2] = Texture'MegatonDec_NR';
		transmissionStatus = 3;
	}
	
	UpdateDigits();
	playFeedbackSound(bSuccess);
}

function playFeedbackSound(bool bSuccess)
{
	if (Pawn(Owner) != None)
	{
		if (bSuccess)
			PlaySound(Sound'MegatonDecoder_OK', SLOT_None, Pawn(Owner).SoundDampening*3.0);
		else
			PlaySound(Sound'MegatonDecoder_Error', SLOT_None, Pawn(Owner).SoundDampening*3.0);
	}
}

state NormalFire
{
	function AnimEnd();
	
	function Timer()
	{
		if (transmissionDisplayCount == 0 || transmissionDisplayCount == 5)
		{
			NTex[0] = Texture'Megaton_NTrUp';
			NTex[1] = Texture'Megaton_NEmpty';
			NTex[2] = Texture'Megaton_NTrDown';
		}
		else if (transmissionDisplayCount == 1 || transmissionDisplayCount == 4)
		{
			NTex[0] = Texture'Megaton_NEmpty';
			NTex[1] = Texture'Megaton_NTrUpDown';
			NTex[2] = Texture'Megaton_NEmpty';
		}
		else if (transmissionDisplayCount == 2 || transmissionDisplayCount == 3)
		{
			NTex[0] = Texture'Megaton_NTrDown';
			NTex[1] = Texture'Megaton_NEmpty';
			NTex[2] = Texture'Megaton_NTrUp';
		}
		
		UpdateDigits();
		transmissionDisplayCount++;
		if (transmissionDisplayCount > 5)
			transmissionDisplayCount = 0;
	}
	
Begin:
    FinishAnim();
	PlayAnim('KeyDownDecode', NumberPressRate, 0.0);
	FinishAnim();
	if (Level.NetMode == NM_StandAlone)
	{
		transmissionDisplayCount = 0;
		SetTimer(0.1, True);
	}
	PlayAnim('KeyUpDecode', NumberPressRate, 0.0);
	PlayOwnedSound(KeyPressFinishSnd, SLOT_None, Pawn(Owner).SoundDampening*3.0);
	FinishAnim();
	TweenAnim('Still', KeysTweenTime);
	
	transmissionStatus = 1;
	AmbientSound = Sound'MegatonDecoder_Transmission';
	foundMega = getMegatonDevice();
	if (TransmissionTime - 1/NumberPressRate > 0)
		Sleep(TransmissionTime - 1/NumberPressRate);
	else
		FinishAnim();

	setFeedback(foundMega != None && !foundMega.bDeleteMe && getMegatonDevice()==foundMega 
		&& (canDisarmFriendNuke || !foundMega.noHurtThisPawn(Pawn(Owner))) && foundMega.acceptsTransmissionData(SavedPassword));
	
	AmbientSound = None;
	if (Level.NetMode == NM_StandAlone)
		SetTimer(0.0, False);
	Sleep(2.0);
	processDigits(SavedPassword);
	transmissionStatus = 0;
	Super.AnimEnd();
}

state ClientFiring
{

	simulated function AnimEnd()
	{
		if (clientStatus == 0)
			PlayAnim('KeyDownDecode', NumberPressRate, 0.0);
		else if (clientStatus == 1)
		{
			transmissionDisplayCount = 0;
			SetTimer(0.1, True);
			PlayAnim('KeyUpDecode', NumberPressRate, 0.0);
			PlayOwnedSound(KeyPressFinishSnd, SLOT_None, Pawn(Owner).SoundDampening*3.0);
		}
		else if (clientStatus == 2)
		{
			TweenAnim('Still', KeysTweenTime);
			AmbientSound = Sound'MegatonDecoder_Transmission';
		}
		else if (clientStatus == 3)
		{
			if (clientTransmissionTime - 1/NumberPressRate > 0)
				TweenAnim('Still', clientTransmissionTime - 1/NumberPressRate);
			else
			{
				AmbientSound = None;
				SetTimer(0.0, False);
				TweenAnim('Still', 2.0);
				clientStatus++;
			}
		}
		else if (clientStatus == 4)
		{
			AmbientSound = None;
			SetTimer(0.0, False);
			TweenAnim('Still', 2.0);
		}
		else
		{
			clientStatus = 0;
			Super.AnimEnd();
			return;
		}
		
		clientStatus++;
	}
	
	simulated function Timer()
	{
		if (NTex[1] == Texture'MegatonDec_NR' || NTex[1] == Texture'MegatonDec_NU')
			return;
		
		if (transmissionDisplayCount == 0 || transmissionDisplayCount == 5)
		{
			NTex[0] = Texture'Megaton_NTrUp';
			NTex[1] = Texture'Megaton_NEmpty';
			NTex[2] = Texture'Megaton_NTrDown';
		}
		else if (transmissionDisplayCount == 1 || transmissionDisplayCount == 4)
		{
			NTex[0] = Texture'Megaton_NEmpty';
			NTex[1] = Texture'Megaton_NTrUpDown';
			NTex[2] = Texture'Megaton_NEmpty';
		}
		else if (transmissionDisplayCount == 2 || transmissionDisplayCount == 3)
		{
			NTex[0] = Texture'Megaton_NTrDown';
			NTex[1] = Texture'Megaton_NEmpty';
			NTex[2] = Texture'Megaton_NTrUp';
		}
		
		UpdateDigits();
		transmissionDisplayCount++;
		if (transmissionDisplayCount > 5)
			transmissionDisplayCount = 0;
	}
	
	simulated function EndState()
	{
		clientStatus = 0;
	}
}

function float RateSelf(out int bUseAltMode)
{
	return -2;
}

function float BotDesireability(Pawn B)
{
	if (B.FindInventoryType(Class) != None)
		return 0;
	else
		return 10;
}

function BotMegatonDisarm(float Delta)
{
local Pawn P;
local MegatonDeploy MD;
local rotator R;

	P = Pawn(Owner);
	if (!Class'NWUtils'.static.isElegibleBotAI(P, True, FRand()*3.0))
		return;
	
	CountBot += Delta;
	if (CountBot >= 1.0)
	{
		CountBot = 0;
		
		if (EnemyMDeploy != None && knowsCode && VSize(EnemyMDeploy.Location-P.Location)<=TransmissionMaxDistance && P.LineOfSightTo(EnemyMDeploy) && P.Weapon != Self)
		{
			DecodingLoc = P.Location;
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
		
		if (EnemyMDeploy == None)
		{
			ForEach RadiusActors(Class'MegatonDeploy', MD, 5000)
			{
				if (MD.Instigator != P && !MD.noHurtThisPawn(P))
				{
					EnemyMDeploy = MD;
					return;
				}
			}
		}
	}
	
	if (EnemyMDeploy != None && knowsCode)
	{
		if (P.Enemy != None)
		{
			if (Bot(P) != None)
				Bot(P).SetEnemy(None);
			else
				P.Enemy = None;
		}
		
		P.MoveTarget = P.FindPathToward(EnemyMDeploy);
		if (Bot(P) != None)
		{
			Bot(P).AlternatePath = None;
			if (P.MoveTarget != None)
				SetAttractionStateFor(Bot(P));
		}
	}
	
	if (EnemyMDeploy != None && !EnemyMDeploy.IsInState('Disarm') && knowsCode && P.Weapon == Self 
	&& VSize(EnemyMDeploy.Location-P.Location)<=TransmissionMaxDistance && P.LineOfSightTo(EnemyMDeploy))
	{
		SavedPassword = EnemyMDeploy.Password;
		R = rotator(EnemyMDeploy.Location - P.Location);
		R.Pitch = 0;
		R.Roll = 0;
		P.SetRotation(R);
		P.ViewRotation = rotator(EnemyMDeploy.Location - (P.Location + P.EyeHeight*vect(0,0,1)));
		if (DecodingLoc != vect(0,0,0) && Physics != PHYS_Falling)
			P.SetLocation(DecodingLoc);
		else if (Physics == PHYS_Falling)
			DecodingLoc = P.Location;
		P.bAltFire = 0;
		P.bFire = 1;
		P.Weapon.Fire(1.0);
	}
}

function SetAttractionStateFor(Bot aBot)
{
    if ( aBot.Enemy != None )
    {
        if ( !aBot.IsInState('FallBack') )
        {
            aBot.bNoClearSpecial = true;
            aBot.TweenToRunning(0.1);
            aBot.GotoState('FallBack','SpecialNavig');
        }
    }
    else if ( !aBot.IsInState('Roaming') )
    {
        aBot.bNoClearSpecial = true;
        aBot.TweenToRunning(0.1);
        aBot.GotoState('Roaming', 'SpecialNavig');
    }
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=MegatonDecoderPick
	CollisionHeight=24.000000
	CollisionRadius=16.000000
	AutoSwitchPriority=0
	Icon=MegatonDecoderIcon
	InventoryGroup=1
	ItemArticle="a"
	ItemName="MegaTon Decoder"
	MaxDesireability=1.000000
	PickupMessage="You got the MegaTon Decoder."
	PickupSound=MegatonDecoder_Pickup
	PickupViewMesh=MegatonDecoderPick
	PickupViewScale=1.000000
	PlayerViewMesh=MegatonDecoder
	PlayerViewOffset=(X=10.00000,Y=0.000000,Z=-3.500000)
	WidePlayerViewOffset=(X=11.00000,Y=0.000000,Z=-3.000000)
	CenterPlayerViewOffset=(X=10.00000,Y=0.000000,Z=-3.500000)
	WideCenterPlayerViewOffset=(X=11.00000,Y=0.000000,Z=-3.000000)
	PlayerViewScale=1.000000
	RespawnTime=30.000000
	StatusIcon=MegatonDecoderIcon
	ThirdPersonMesh=MegatonDecoderM
	ThirdPersonScale=0.750000
	AltDamageType=None
	AltFireSound=None
	AltProjectileClass=None
	AmmoName=None
	bInstantHit=False
    bAltInstantHit=False
	bRapidFire=False
	DeathMessage=""
	FireOffset=(X=0.000000,Y=0.000000,Z=0.000000)
	FireSound=None
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=""
	NameColor=(R=255,G=64,B=0)
	PickupAmmoCount=1
	ProjectileClass=None
	SelectSound=MegatonDecoder_Select
	shakemag=0.000000
	shaketime=0.000000
	shakevert=0.000000
	AIRating=1.000000
	AltRefireRate=1.000000
	bAltWarnTarget=False
	bRecommendAltSplashDamage=False
	bRecommendSplashDamage=False
	bSplashDamage=False
	bWarnTarget=False
	RefireRate=0.500000
	Mass=100.000000
	bNoSmooth=False
	bOwnsCrossHair=True
	CustomCross=None
	
	bMegaWeapon=True
	bForceHands=True
	
	PlayerViewMeshLeft=MegatonDecoder
	PlayerViewMeshRight=MegatonDecoder
	HandPartMeshL(0)=MegatonDecoderHandLL
	HandPartMeshL(1)=MegatonDecoderHandRL
	HandPartMeshR(0)=MegatonDecoderHandLR
	HandPartMeshR(1)=MegatonDecoderHandRR
	BobDamping=1.075000
	
	FirstPersonOverFX(0)=(bLit=True)
	FirstPersonOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.75000,bCustomMesh=True)
	FirstPersonOverFX(0)=(CustomMeshLeft=Mesh'MegatonDecoderOV',CustomMesh=Mesh'MegatonDecoderOV')
	
	FirstPersonGlowFX(0)=(bRenderOnTop=True,bLit=True,bRandFrame=True,GlowModel=Mesh'MegatonDecoderLights',GlowModelLeft=Mesh'MegatonDecoderLights')
	FirstPersonGlowFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.035000)
	FirstPersonGlowFX(0)=(GlowTex1=Texture'MDecoderLightRed',GlowTex2=Texture'MDecoderLightYellow',GlowTex3=Texture'MDecoderLightGreen')
	
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
	
	EnterKeyModeAnim=Still
	LeaveKeyModeAnim=Still
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
	KeyStatesAmount=1
	KeyPressSnd=MegatonDecoder_Set
	KeyPressFinishSnd=MegatonDecoder_SetDone
	bLeaveKeyModeOnceSet=True
	
	SoundVolume=255
	SoundRadius=48
	
	blinkTime=0.750000
	keyFireHelp="Fire/Altfire: Leave key editing mode."
	keyPasswordHelp="Use 0-9 keys to enter the password."
	SavedPassword="000"
	oldTransmissionStatus=4
	
	bRenderCustomOnHiddenWeapon=True
	keyPasswordCanvas="Password"
	keyOutCanvas="Transmit or Set password"
	canvasTransmitting="Transmitting..."
	canvasOK="Success"
	canvasError="Error"
	canvasErrorColor=(R=255,G=0,B=0)
	canvasOKColor=(R=0,G=255,B=0)
	canvasTransColor=(R=255,G=192,B=0)
	
	TransmissionTime=3.000000
	TransmissionMaxDistance=128.000000
	bDroppable=False
	canDisarmFriendNuke=False
}
