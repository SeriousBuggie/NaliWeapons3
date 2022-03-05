//////////////////////////////////////////////////////////////
//	Nali Weapons III Graviton weapon
//				Feralidragon (22-08-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class Graviton expands NaliWeapons config(NWeaponsCfg);

//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=Graviton ANIVFILE=MODELS\Graviton_a.3d DATAFILE=MODELS\Graviton_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=Graviton STRENGTH=0
#exec MESH ORIGIN MESH=Graviton X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=GravitonR ANIVFILE=MODELS\Graviton_a.3d DATAFILE=MODELS\Graviton_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=GravitonR STRENGTH=0
#exec MESH ORIGIN MESH=GravitonR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=GravitonPick ANIVFILE=MODELS\Graviton_a.3d DATAFILE=MODELS\Graviton_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=GravitonPick STRENGTH=0
#exec MESH ORIGIN MESH=GravitonPick X=0 Y=0 Z=0 Yaw=128

//3rd person
#exec MESH IMPORT MESH=GravitonM ANIVFILE=MODELS\Graviton_a.3d DATAFILE=MODELS\Graviton_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravitonM STRENGTH=0.45
#exec MESH ORIGIN MESH=GravitonM X=200 Y=0 Z=-20 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=Graviton SEQ=All STARTFRAME=0 NUMFRAMES=144
#exec MESH SEQUENCE MESH=Graviton SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=Graviton SEQ=BeamStart STARTFRAME=0 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=Graviton SEQ=BeamLoop STARTFRAME=8 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=Graviton SEQ=BeamEnd STARTFRAME=24 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=Graviton SEQ=AltFire STARTFRAME=33 NUMFRAMES=27 RATE=27.0
#exec MESH SEQUENCE MESH=Graviton SEQ=NoAmmoAltFire STARTFRAME=32 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=Graviton SEQ=Select STARTFRAME=64 NUMFRAMES=6 RATE=12.0 GROUP=Select
#exec MESH SEQUENCE MESH=Graviton SEQ=Down STARTFRAME=59 NUMFRAMES=6 RATE=25.0
#exec MESH SEQUENCE MESH=Graviton SEQ=BeamGradStart STARTFRAME=70 NUMFRAMES=37 RATE=37.0
#exec MESH SEQUENCE MESH=Graviton SEQ=BeamGradEnd STARTFRAME=107 NUMFRAMES=37 RATE=37.0

#exec MESH SEQUENCE MESH=GravitonR SEQ=All STARTFRAME=0 NUMFRAMES=144
#exec MESH SEQUENCE MESH=GravitonR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravitonR SEQ=BeamStart STARTFRAME=0 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravitonR SEQ=BeamLoop STARTFRAME=8 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=GravitonR SEQ=BeamEnd STARTFRAME=24 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravitonR SEQ=AltFire STARTFRAME=33 NUMFRAMES=27 RATE=27.0
#exec MESH SEQUENCE MESH=GravitonR SEQ=NoAmmoAltFire STARTFRAME=32 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=GravitonR SEQ=Select STARTFRAME=64 NUMFRAMES=6 RATE=12.0 GROUP=Select
#exec MESH SEQUENCE MESH=GravitonR SEQ=Down STARTFRAME=59 NUMFRAMES=6 RATE=25.0
#exec MESH SEQUENCE MESH=GravitonR SEQ=BeamGradStart STARTFRAME=70 NUMFRAMES=37 RATE=37.0
#exec MESH SEQUENCE MESH=GravitonR SEQ=BeamGradEnd STARTFRAME=107 NUMFRAMES=37 RATE=37.0

#exec MESH SEQUENCE MESH=GravitonPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH SEQUENCE MESH=GravitonM SEQ=All STARTFRAME=0 NUMFRAMES=144
#exec MESH SEQUENCE MESH=GravitonM SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravitonM SEQ=BeamStart STARTFRAME=0 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravitonM SEQ=BeamLoop STARTFRAME=8 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=GravitonM SEQ=BeamEnd STARTFRAME=24 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravitonM SEQ=AltFire STARTFRAME=33 NUMFRAMES=27 RATE=27.0
#exec MESH SEQUENCE MESH=GravitonM SEQ=NoAmmoAltFire STARTFRAME=32 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=GravitonM SEQ=BeamGradStart STARTFRAME=70 NUMFRAMES=37 RATE=37.0
#exec MESH SEQUENCE MESH=GravitonM SEQ=BeamGradEnd STARTFRAME=107 NUMFRAMES=37 RATE=37.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=Graviton MESH=Graviton
#exec MESHMAP SCALE MESHMAP=Graviton X=0.0446 Y=0.0446 Z=0.0892

#exec MESHMAP NEW MESHMAP=GravitonR MESH=GravitonR
#exec MESHMAP SCALE MESHMAP=GravitonR X=0.0446 Y=0.0446 Z=0.0892

#exec MESHMAP NEW MESHMAP=GravitonPick MESH=GravitonPick
#exec MESHMAP SCALE MESHMAP=GravitonPick X=0.18593 Y=0.18593 Z=0.37186

#exec MESHMAP NEW MESHMAP=GravitonM MESH=GravitonM
#exec MESHMAP SCALE MESHMAP=GravitonM X=0.14875 Y=0.14875 Z=0.2975

//-----------------------------------------------------------------------------------

#exec TEXTURE IMPORT NAME=Sk_Graviton_01 FILE=SKINS\Sk_Graviton_01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Graviton NUM=1 TEXTURE=Sk_Graviton_01
#exec MESHMAP SETTEXTURE MESHMAP=GravitonR NUM=1 TEXTURE=Sk_Graviton_01
#exec MESHMAP SETTEXTURE MESHMAP=GravitonPick NUM=1 TEXTURE=Sk_Graviton_01
#exec MESHMAP SETTEXTURE MESHMAP=GravitonM NUM=1 TEXTURE=Sk_Graviton_01

#exec TEXTURE IMPORT NAME=Sk_Graviton_02 FILE=SKINS\Sk_Graviton_02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Graviton NUM=2 TEXTURE=Sk_Graviton_02
#exec MESHMAP SETTEXTURE MESHMAP=GravitonR NUM=2 TEXTURE=Sk_Graviton_02
#exec MESHMAP SETTEXTURE MESHMAP=GravitonPick NUM=2 TEXTURE=Sk_Graviton_02
#exec MESHMAP SETTEXTURE MESHMAP=GravitonM NUM=2 TEXTURE=Sk_Graviton_02

#exec TEXTURE IMPORT NAME=Sk_Graviton_03 FILE=SKINS\Sk_Graviton_03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Graviton NUM=3 TEXTURE=Sk_Graviton_03
#exec MESHMAP SETTEXTURE MESHMAP=GravitonR NUM=3 TEXTURE=Sk_Graviton_03
#exec MESHMAP SETTEXTURE MESHMAP=GravitonPick NUM=3 TEXTURE=Sk_Graviton_03
#exec MESHMAP SETTEXTURE MESHMAP=GravitonM NUM=3 TEXTURE=Sk_Graviton_03

#exec TEXTURE IMPORT NAME=Sk_Graviton_04 FILE=SKINS\Sk_Graviton_04.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=Graviton NUM=4 TEXTURE=Sk_Graviton_04
#exec MESHMAP SETTEXTURE MESHMAP=GravitonR NUM=4 TEXTURE=Sk_Graviton_04
#exec MESHMAP SETTEXTURE MESHMAP=GravitonPick NUM=4 TEXTURE=Sk_Graviton_04
#exec MESHMAP SETTEXTURE MESHMAP=GravitonM NUM=4 TEXTURE=Sk_Graviton_04

#exec TEXTURE IMPORT NAME=GravitonMetal FILE=SKINS\GravitonMetal.bmp GROUP=Skins LODSET=2
#exec OBJ LOAD FILE=Textures\GravGFX.utx PACKAGE=NWGravitonVIII_SRC.FX

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=GravitonIcon FILE=ICONS\GravitonIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=GravCrossAlpha FILE=ICONS\GravCrossAlpha.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec OBJ LOAD FILE=Textures\GravIcons.utx PACKAGE=NWGravitonVIII_SRC.Icons

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="Grav_Select" FILE=SOUNDS\Grav_Select.wav GROUP="Graviton"
#exec AUDIO IMPORT NAME="Grav_Pickup" FILE=SOUNDS\Grav_Pickup.wav GROUP="Graviton"
#exec AUDIO IMPORT NAME="Grav_FireStart" FILE=SOUNDS\Grav_FireStart.wav GROUP="Graviton"
#exec AUDIO IMPORT NAME="Grav_FireStartMed" FILE=SOUNDS\Grav_FireStartMed.wav GROUP="Graviton"
#exec AUDIO IMPORT NAME="Grav_FireStartFast" FILE=SOUNDS\Grav_FireStartFast.wav GROUP="Graviton"
#exec AUDIO IMPORT NAME="Grav_FireLoop" FILE=SOUNDS\Grav_FireLoop.wav GROUP="Graviton"
#exec AUDIO IMPORT NAME="Grav_FireEnd" FILE=SOUNDS\Grav_FireEnd.wav GROUP="Graviton"
#exec AUDIO IMPORT NAME="Grav_FireEndMed" FILE=SOUNDS\Grav_FireEndMed.wav GROUP="Graviton"
#exec AUDIO IMPORT NAME="Grav_FireEndFast" FILE=SOUNDS\Grav_FireEndFast.wav GROUP="Graviton"
#exec AUDIO IMPORT NAME="Grav_AltFireCharge" FILE=SOUNDS\Grav_AltFireCharge.wav GROUP="Graviton"
#exec AUDIO IMPORT NAME="Grav_AltFire" FILE=SOUNDS\Grav_AltFire.wav GROUP="Graviton"
#exec AUDIO IMPORT NAME="Grav_AltNoAmmo" FILE=SOUNDS\Grav_AltNoAmmo.wav GROUP="Graviton"

//===========================================================================

//HAND
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=GravHandL ANIVFILE=MODELS\GravHand_a.3d DATAFILE=MODELS\GravHand_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravHandL STRENGTH=0
#exec MESH ORIGIN MESH=GravHandL X=25 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=GravHandR ANIVFILE=MODELS\GravHand_a.3d DATAFILE=MODELS\GravHand_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=GravHandR STRENGTH=0
#exec MESH ORIGIN MESH=GravHandR X=25 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=GravHandL SEQ=All STARTFRAME=0 NUMFRAMES=70
#exec MESH SEQUENCE MESH=GravHandL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravHandL SEQ=BeamStart STARTFRAME=0 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravHandL SEQ=BeamGradStart STARTFRAME=0 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravHandL SEQ=BeamLoop STARTFRAME=8 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=GravHandL SEQ=BeamEnd STARTFRAME=24 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravHandL SEQ=BeamGradEnd STARTFRAME=24 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravHandL SEQ=AltFire STARTFRAME=33 NUMFRAMES=27 RATE=27.0
#exec MESH SEQUENCE MESH=GravHandL SEQ=NoAmmoAltFire STARTFRAME=32 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=GravHandL SEQ=Select STARTFRAME=64 NUMFRAMES=6 RATE=12.0 GROUP=Select
#exec MESH SEQUENCE MESH=GravHandL SEQ=Down STARTFRAME=59 NUMFRAMES=6 RATE=25.0

#exec MESH SEQUENCE MESH=GravHandR SEQ=All STARTFRAME=0 NUMFRAMES=70
#exec MESH SEQUENCE MESH=GravHandR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravHandR SEQ=BeamStart STARTFRAME=0 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravHandR SEQ=BeamGradStart STARTFRAME=0 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravHandR SEQ=BeamLoop STARTFRAME=8 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=GravHandR SEQ=BeamEnd STARTFRAME=24 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravHandR SEQ=BeamGradEnd STARTFRAME=24 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravHandR SEQ=AltFire STARTFRAME=33 NUMFRAMES=27 RATE=27.0
#exec MESH SEQUENCE MESH=GravHandR SEQ=NoAmmoAltFire STARTFRAME=32 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=GravHandR SEQ=Select STARTFRAME=64 NUMFRAMES=6 RATE=12.0 GROUP=Select
#exec MESH SEQUENCE MESH=GravHandR SEQ=Down STARTFRAME=59 NUMFRAMES=6 RATE=25.0

//Scale
#exec MESHMAP NEW MESHMAP=GravHandL MESH=GravHandL
#exec MESHMAP SCALE MESHMAP=GravHandL X=0.0446 Y=0.0446 Z=0.0892

#exec MESHMAP NEW MESHMAP=GravHandR MESH=GravHandR
#exec MESHMAP SCALE MESHMAP=GravHandR X=0.0446 Y=0.0446 Z=0.0892

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=GravHandL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=GravHandR NUM=1 TEXTURE=HumanHand

//===========================================================================

//MAIN OVERLAYER
//*******************************************************

//1st person
#exec MESH IMPORT MESH=GravOv ANIVFILE=MODELS\GravOv_a.3d DATAFILE=MODELS\GravOv_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravOv STRENGTH=0
#exec MESH ORIGIN MESH=GravOv X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=GravOvR ANIVFILE=MODELS\GravOv_a.3d DATAFILE=MODELS\GravOv_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=GravOvR STRENGTH=0
#exec MESH ORIGIN MESH=GravOvR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=GravOvPick ANIVFILE=MODELS\GravOv_a.3d DATAFILE=MODELS\GravOv_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=GravOvPick STRENGTH=0
#exec MESH ORIGIN MESH=GravOvPick X=0 Y=0 Z=0 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=GravOv SEQ=All STARTFRAME=0 NUMFRAMES=144
#exec MESH SEQUENCE MESH=GravOv SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravOv SEQ=BeamStart STARTFRAME=0 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravOv SEQ=BeamLoop STARTFRAME=8 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=GravOv SEQ=BeamEnd STARTFRAME=24 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravOv SEQ=AltFire STARTFRAME=33 NUMFRAMES=27 RATE=27.0
#exec MESH SEQUENCE MESH=GravOv SEQ=NoAmmoAltFire STARTFRAME=32 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=GravOv SEQ=Select STARTFRAME=64 NUMFRAMES=6 RATE=12.0 GROUP=Select
#exec MESH SEQUENCE MESH=GravOv SEQ=Down STARTFRAME=59 NUMFRAMES=6 RATE=25.0
#exec MESH SEQUENCE MESH=GravOv SEQ=BeamGradStart STARTFRAME=70 NUMFRAMES=37 RATE=37.0
#exec MESH SEQUENCE MESH=GravOv SEQ=BeamGradEnd STARTFRAME=107 NUMFRAMES=37 RATE=37.0

#exec MESH SEQUENCE MESH=GravOvR SEQ=All STARTFRAME=0 NUMFRAMES=144
#exec MESH SEQUENCE MESH=GravOvR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravOvR SEQ=BeamStart STARTFRAME=0 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravOvR SEQ=BeamLoop STARTFRAME=8 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=GravOvR SEQ=BeamEnd STARTFRAME=24 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravOvR SEQ=AltFire STARTFRAME=33 NUMFRAMES=27 RATE=27.0
#exec MESH SEQUENCE MESH=GravOvR SEQ=NoAmmoAltFire STARTFRAME=32 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=GravOvR SEQ=Select STARTFRAME=64 NUMFRAMES=6 RATE=12.0 GROUP=Select
#exec MESH SEQUENCE MESH=GravOvR SEQ=Down STARTFRAME=59 NUMFRAMES=6 RATE=25.0
#exec MESH SEQUENCE MESH=GravOvR SEQ=BeamGradStart STARTFRAME=70 NUMFRAMES=37 RATE=37.0
#exec MESH SEQUENCE MESH=GravOvR SEQ=BeamGradEnd STARTFRAME=107 NUMFRAMES=37 RATE=37.0

#exec MESH SEQUENCE MESH=GravOvPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=GravOv MESH=GravOv
#exec MESHMAP SCALE MESHMAP=GravOv X=0.0446 Y=0.0446 Z=0.0892

#exec MESHMAP NEW MESHMAP=GravOvR MESH=GravOvR
#exec MESHMAP SCALE MESHMAP=GravOvR X=0.0446 Y=0.0446 Z=0.0892

#exec MESHMAP NEW MESHMAP=GravOvPick MESH=GravOvPick
#exec MESHMAP SCALE MESHMAP=GravOvPick X=0.18593 Y=0.18593 Z=0.37186

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=Sk_GravOv01 FILE=OVERLAYERS\Sk_GravOv01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=GravOv NUM=1 TEXTURE=Sk_GravOv01
#exec MESHMAP SETTEXTURE MESHMAP=GravOvR NUM=1 TEXTURE=Sk_GravOv01
#exec MESHMAP SETTEXTURE MESHMAP=GravOvPick NUM=1 TEXTURE=Sk_GravOv01

#exec TEXTURE IMPORT NAME=Sk_GravOv02 FILE=OVERLAYERS\Sk_GravOv02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=GravOv NUM=2 TEXTURE=Sk_GravOv02
#exec MESHMAP SETTEXTURE MESHMAP=GravOvR NUM=2 TEXTURE=Sk_GravOv02
#exec MESHMAP SETTEXTURE MESHMAP=GravOvPick NUM=2 TEXTURE=Sk_GravOv02

#exec TEXTURE IMPORT NAME=Sk_GravOv03 FILE=OVERLAYERS\Sk_GravOv03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=GravOv NUM=3 TEXTURE=Sk_GravOv03
#exec MESHMAP SETTEXTURE MESHMAP=GravOvR NUM=3 TEXTURE=Sk_GravOv03
#exec MESHMAP SETTEXTURE MESHMAP=GravOvPick NUM=3 TEXTURE=Sk_GravOv03

//===========================================================================

//PADDLE GlOW
//*******************************************************

//1st person
#exec MESH IMPORT MESH=GravRotLights ANIVFILE=MODELS\GravRotLights_a.3d DATAFILE=MODELS\GravRotLights_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravRotLights STRENGTH=0.0
#exec MESH ORIGIN MESH=GravRotLights X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=GravRotLightsR ANIVFILE=MODELS\GravRotLights_a.3d DATAFILE=MODELS\GravRotLights_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=GravRotLightsR STRENGTH=0.0
#exec MESH ORIGIN MESH=GravRotLightsR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=GravRotLightsPick ANIVFILE=MODELS\GravRotLights_a.3d DATAFILE=MODELS\GravRotLights_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=GravRotLightsPick STRENGTH=0.0
#exec MESH ORIGIN MESH=GravRotLightsPick X=0 Y=0 Z=0 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=GravRotLights SEQ=All STARTFRAME=0 NUMFRAMES=144
#exec MESH SEQUENCE MESH=GravRotLights SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravRotLights SEQ=BeamStart STARTFRAME=0 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravRotLights SEQ=BeamLoop STARTFRAME=8 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=GravRotLights SEQ=BeamEnd STARTFRAME=24 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravRotLights SEQ=AltFire STARTFRAME=33 NUMFRAMES=27 RATE=27.0
#exec MESH SEQUENCE MESH=GravRotLights SEQ=NoAmmoAltFire STARTFRAME=32 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=GravRotLights SEQ=Select STARTFRAME=64 NUMFRAMES=6 RATE=12.0 GROUP=Select
#exec MESH SEQUENCE MESH=GravRotLights SEQ=Down STARTFRAME=59 NUMFRAMES=6 RATE=25.0
#exec MESH SEQUENCE MESH=GravRotLights SEQ=BeamGradStart STARTFRAME=70 NUMFRAMES=37 RATE=37.0
#exec MESH SEQUENCE MESH=GravRotLights SEQ=BeamGradEnd STARTFRAME=107 NUMFRAMES=37 RATE=37.0

#exec MESH SEQUENCE MESH=GravRotLightsR SEQ=All STARTFRAME=0 NUMFRAMES=144
#exec MESH SEQUENCE MESH=GravRotLightsR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravRotLightsR SEQ=BeamStart STARTFRAME=0 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravRotLightsR SEQ=BeamLoop STARTFRAME=8 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=GravRotLightsR SEQ=BeamEnd STARTFRAME=24 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravRotLightsR SEQ=AltFire STARTFRAME=33 NUMFRAMES=27 RATE=27.0
#exec MESH SEQUENCE MESH=GravRotLightsR SEQ=NoAmmoAltFire STARTFRAME=32 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=GravRotLightsR SEQ=Select STARTFRAME=64 NUMFRAMES=6 RATE=12.0 GROUP=Select
#exec MESH SEQUENCE MESH=GravRotLightsR SEQ=Down STARTFRAME=59 NUMFRAMES=6 RATE=25.0
#exec MESH SEQUENCE MESH=GravRotLightsR SEQ=BeamGradStart STARTFRAME=70 NUMFRAMES=37 RATE=37.0
#exec MESH SEQUENCE MESH=GravRotLightsR SEQ=BeamGradEnd STARTFRAME=107 NUMFRAMES=37 RATE=37.0

#exec MESH SEQUENCE MESH=GravRotLightsPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=GravRotLights MESH=GravRotLights
#exec MESHMAP SCALE MESHMAP=GravRotLights X=0.0446 Y=0.0446 Z=0.0892

#exec MESHMAP NEW MESHMAP=GravRotLightsR MESH=GravRotLightsR
#exec MESHMAP SCALE MESHMAP=GravRotLightsR X=0.0446 Y=0.0446 Z=0.0892

#exec MESHMAP NEW MESHMAP=GravRotLightsPick MESH=GravRotLightsPick
#exec MESHMAP SCALE MESHMAP=GravRotLightsPick X=0.18593 Y=0.18593 Z=0.37186

//Coronas
#exec TEXTURE IMPORT NAME=GravGlow01 FILE=Coronas\GravGlow01.bmp GROUP=Coronas FLAGS=2

//===========================================================================

//GRAVITY POLES GLOW
//*******************************************************

//1st person
#exec MESH IMPORT MESH=GravPolesLights ANIVFILE=MODELS\GravPolesLights_a.3d DATAFILE=MODELS\GravPolesLights_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravPolesLights STRENGTH=0.0
#exec MESH ORIGIN MESH=GravPolesLights X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=GravPolesLightsR ANIVFILE=MODELS\GravPolesLights_a.3d DATAFILE=MODELS\GravPolesLights_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=GravPolesLightsR STRENGTH=0.0
#exec MESH ORIGIN MESH=GravPolesLightsR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=GravPolesLightsPick ANIVFILE=MODELS\GravPolesLights_a.3d DATAFILE=MODELS\GravPolesLights_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=GravPolesLightsPick STRENGTH=0.0
#exec MESH ORIGIN MESH=GravPolesLightsPick X=0 Y=0 Z=0 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=GravPolesLights SEQ=All STARTFRAME=0 NUMFRAMES=144
#exec MESH SEQUENCE MESH=GravPolesLights SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravPolesLights SEQ=BeamStart STARTFRAME=0 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravPolesLights SEQ=BeamLoop STARTFRAME=8 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=GravPolesLights SEQ=BeamEnd STARTFRAME=24 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravPolesLights SEQ=AltFire STARTFRAME=33 NUMFRAMES=27 RATE=27.0
#exec MESH SEQUENCE MESH=GravPolesLights SEQ=NoAmmoAltFire STARTFRAME=32 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=GravPolesLights SEQ=Select STARTFRAME=64 NUMFRAMES=6 RATE=12.0 GROUP=Select
#exec MESH SEQUENCE MESH=GravPolesLights SEQ=Down STARTFRAME=59 NUMFRAMES=6 RATE=25.0
#exec MESH SEQUENCE MESH=GravPolesLights SEQ=BeamGradStart STARTFRAME=70 NUMFRAMES=37 RATE=37.0
#exec MESH SEQUENCE MESH=GravPolesLights SEQ=BeamGradEnd STARTFRAME=107 NUMFRAMES=37 RATE=37.0

#exec MESH SEQUENCE MESH=GravPolesLightsR SEQ=All STARTFRAME=0 NUMFRAMES=144
#exec MESH SEQUENCE MESH=GravPolesLightsR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravPolesLightsR SEQ=BeamStart STARTFRAME=0 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravPolesLightsR SEQ=BeamLoop STARTFRAME=8 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=GravPolesLightsR SEQ=BeamEnd STARTFRAME=24 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravPolesLightsR SEQ=AltFire STARTFRAME=33 NUMFRAMES=27 RATE=27.0
#exec MESH SEQUENCE MESH=GravPolesLightsR SEQ=NoAmmoAltFire STARTFRAME=32 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=GravPolesLightsR SEQ=Select STARTFRAME=64 NUMFRAMES=6 RATE=12.0 GROUP=Select
#exec MESH SEQUENCE MESH=GravPolesLightsR SEQ=Down STARTFRAME=59 NUMFRAMES=6 RATE=25.0
#exec MESH SEQUENCE MESH=GravPolesLightsR SEQ=BeamGradStart STARTFRAME=70 NUMFRAMES=37 RATE=37.0
#exec MESH SEQUENCE MESH=GravPolesLightsR SEQ=BeamGradEnd STARTFRAME=107 NUMFRAMES=37 RATE=37.0

#exec MESH SEQUENCE MESH=GravPolesLightsPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=GravPolesLights MESH=GravPolesLights
#exec MESHMAP SCALE MESHMAP=GravPolesLights X=0.0446 Y=0.0446 Z=0.0892

#exec MESHMAP NEW MESHMAP=GravPolesLightsR MESH=GravPolesLightsR
#exec MESHMAP SCALE MESHMAP=GravPolesLightsR X=0.0446 Y=0.0446 Z=0.0892

#exec MESHMAP NEW MESHMAP=GravPolesLightsPick MESH=GravPolesLightsPick
#exec MESHMAP SCALE MESHMAP=GravPolesLightsPick X=0.18593 Y=0.18593 Z=0.37186

//===========================================================================

//FRONT GENERATOR GLOW
//*******************************************************

//1st person
#exec MESH IMPORT MESH=GravFrontLight ANIVFILE=MODELS\GravFrontLight_a.3d DATAFILE=MODELS\GravFrontLight_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=GravFrontLight X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=GravFrontLightR ANIVFILE=MODELS\GravFrontLight_a.3d DATAFILE=MODELS\GravFrontLight_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=GravFrontLightR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=GravFrontLightPick ANIVFILE=MODELS\GravFrontLight_a.3d DATAFILE=MODELS\GravFrontLight_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=GravFrontLightPick X=0 Y=0 Z=0 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=GravFrontLight SEQ=All STARTFRAME=0 NUMFRAMES=144
#exec MESH SEQUENCE MESH=GravFrontLight SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravFrontLight SEQ=BeamStart STARTFRAME=0 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravFrontLight SEQ=BeamLoop STARTFRAME=8 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=GravFrontLight SEQ=BeamEnd STARTFRAME=24 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravFrontLight SEQ=AltFire STARTFRAME=33 NUMFRAMES=27 RATE=27.0
#exec MESH SEQUENCE MESH=GravFrontLight SEQ=NoAmmoAltFire STARTFRAME=32 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=GravFrontLight SEQ=Select STARTFRAME=64 NUMFRAMES=6 RATE=12.0 GROUP=Select
#exec MESH SEQUENCE MESH=GravFrontLight SEQ=Down STARTFRAME=59 NUMFRAMES=6 RATE=25.0
#exec MESH SEQUENCE MESH=GravFrontLight SEQ=BeamGradStart STARTFRAME=70 NUMFRAMES=37 RATE=37.0
#exec MESH SEQUENCE MESH=GravFrontLight SEQ=BeamGradEnd STARTFRAME=107 NUMFRAMES=37 RATE=37.0

#exec MESH SEQUENCE MESH=GravFrontLightR SEQ=All STARTFRAME=0 NUMFRAMES=144
#exec MESH SEQUENCE MESH=GravFrontLightR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravFrontLightR SEQ=BeamStart STARTFRAME=0 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravFrontLightR SEQ=BeamLoop STARTFRAME=8 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=GravFrontLightR SEQ=BeamEnd STARTFRAME=24 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=GravFrontLightR SEQ=AltFire STARTFRAME=33 NUMFRAMES=27 RATE=27.0
#exec MESH SEQUENCE MESH=GravFrontLightR SEQ=NoAmmoAltFire STARTFRAME=32 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=GravFrontLightR SEQ=Select STARTFRAME=64 NUMFRAMES=6 RATE=12.0 GROUP=Select
#exec MESH SEQUENCE MESH=GravFrontLightR SEQ=Down STARTFRAME=59 NUMFRAMES=6 RATE=25.0
#exec MESH SEQUENCE MESH=GravFrontLightR SEQ=BeamGradStart STARTFRAME=70 NUMFRAMES=37 RATE=37.0
#exec MESH SEQUENCE MESH=GravFrontLightR SEQ=BeamGradEnd STARTFRAME=107 NUMFRAMES=37 RATE=37.0

#exec MESH SEQUENCE MESH=GravFrontLightPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=GravFrontLight MESH=GravFrontLight
#exec MESHMAP SCALE MESHMAP=GravFrontLight X=0.0446 Y=0.0446 Z=0.0892

#exec MESHMAP NEW MESHMAP=GravFrontLightR MESH=GravFrontLightR
#exec MESHMAP SCALE MESHMAP=GravFrontLightR X=0.0446 Y=0.0446 Z=0.0892

#exec MESHMAP NEW MESHMAP=GravFrontLightPick MESH=GravFrontLightPick
#exec MESHMAP SCALE MESHMAP=GravFrontLightPick X=0.18593 Y=0.18593 Z=0.37186

//Coronas
#exec TEXTURE IMPORT NAME=GravGlow02 FILE=Coronas\GravGlow02.bmp GROUP=Coronas FLAGS=2

//===========================================================================

var bool bLoopFiring;
var bool bStarting;

var GravBeam GravionBeam;
var float AltFireTimeOut;
var float globalDelta;

struct ChargGrav
{
	var GravChargeFXTrace gCharge;
	var float LifeTime;
	var rotator RollDif;
};

var ChargGrav GravCharginFX01[16];
var ChargGrav GravCharginFX02[16];
var ChargGrav GravCharginFX03[16];
var ChargGrav GravCharginFX04[16];
var ChargGrav GravCharginFX05[16];
var ChargGrav GravCharginFX06[16];
var GravChargeFXParticle GravPartChargFX01[16];
var GravChargeFXParticle GravPartChargFX02[16];
var GravChargeFXParticle GravPartChargFX03[16];
var GravChargeFXParticle GravPartChargFX04[16];
var GravChargeFXParticle GravPartChargFX05[16];
var GravChargeFXParticle GravPartChargFX06[16];

var float GravChargeTCount, GravChargeTimeOut;
var() vector GravChargeFXOffset;
var() class<Projectile> VortexProjClass;

var(ServerConfig) config name CanGrabList[32];
var(ServerConfig) config name CanNOTGrabList[32];
var int maxGrabClasses, maxNotGrabClasses;

var(ServerConfig) config bool bGravitonStraightBeam;
var(ServerConfig) config bool bGravitonFlyHack;
var(ServerConfig) config float GravitonFlyHackSpeedMult;
var(ServerConfig) config bool bCanGrabOwnedObjects;
var(ServerConfig) config float SmashDifficulty; 
var(ServerConfig) config byte GravityBallAmmoConsumption;
var(ServerConfig) config bool bUseVortexProjectile;
var(ServerConfig) config bool bUseGravityBeamOnly;
var(ServerConfig) config byte GravityBeamSize;
var(ServerConfig) config float GravityBeamBendFactor;
var(ServerConfig) config bool bUseGhostGrabStyle;
var(ServerConfig) config bool bBeamSmashDamage;
var(ServerConfig) config bool bUseVortexPhysics;
var(ServerConfig) config bool bUseSpringBeamPhysics;
var(ServerConfig) config bool bUseSpringMassPhysics;
var(ServerConfig) config float GravityBeamInertia;

var(ServerConfig) config bool bScoreGrabAndDropFrags;
var(ServerConfig) config bool bCanGrabTeam;
var(ServerConfig) config float ThrowDamageMaxTime;
var(ServerConfig) config bool enableSmashShake;
var(ServerConfig) config float SmashMinSpeed;

var(ServerConfig) config float VortexRadius;
var(ServerConfig) config int VortexDamage;


enum EGSpeed
{
	GSS_Slow,
	GSS_Medium,
	GSS_Fast,
	GSS_Instant
};

var(ServerConfig) config EGSpeed GravityBeamStartSpeed, GravityBeamEndSpeed;

var bool bBeamOnly;
var float gCount;
var EGSpeed gravSSpeed, gravESpeed;


//Oversurrection configs
var(Oversurrection) config float OversurrectionLifeTime, OversurrectivePullStrength;
var(Oversurrection) config float OversurrectivePullRadius, OversurrectivePullRate;
var(Oversurrection) config int OversurrectiveDamage;
var(Oversurrection) config bool bOversurrectiveVtxPhysics, bOversurrectivePullProj;


replication
{
	reliable if (Role == ROLE_Authority)
		bBeamOnly, gravSSpeed, gravESpeed;
	reliable if (Role == ROLE_Authority && bNetOwner)
		GravionBeam;
}

function PreBeginPlay()
{
	Super.PreBeginPlay();
	bBeamOnly = Default.bUseGravityBeamOnly;
	gravSSpeed = Default.GravityBeamStartSpeed;
	gravESpeed = Default.GravityBeamEndSpeed;
	if (bBeamOnly)
	{
		AltFireOffsetXAdjustHidden = FireOffsetXAdjustHidden;
		AltFireOffsetZAdjustHidden = FireOffsetZAdjustHidden;
	}
	
	LoadLists();
	if (default.bScoreGrabAndDropFrags)
		AddAuxMutator(Class'GravMut');
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	AltFiringAmbSound = None;
}

function LoadLists()
{
local int i;

	maxGrabClasses = ArrayCount(CanGrabList);
	maxNotGrabClasses = ArrayCount(CanNOTGrabList);

	if (default.bOptimizeLists)
	{
		for (i = 0; i < ArrayCount(CanGrabList); i++)
		{
			if (CanGrabList[i] == '')
			{
				maxGrabClasses = i;
				break;
			}
		}
		
		for (i = 0; i < ArrayCount(CanNOTGrabList); i++)
		{
			if (CanNOTGrabList[i] == '')
			{
				maxNotGrabClasses = i;
				break;
			}
		}
	}
}

simulated function Tick(float Delta)
{
local float newGlow;
local byte i;
local actor A;

	globalDelta = Delta;
	
	if (Role == ROLE_Authority && GravionBeam != None && (Pawn(Owner) == None || Pawn(Owner).Weapon != Self || 
	(Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.bFeigningDeath)))
		DestroyBeam();
	
	if (AltFireTimeOut > 0.0)
	{
		if (Pawn(Owner) != None && Pawn(Owner).Weapon == Self)
		{
			AltFireTimeOut -= Delta;
			if (AltFireTimeOut <= 0)
			{
				FireAltProjectile();
				PlayOwnedSound(Sound'Grav_AltFire', SLOT_None, Pawn(Owner).SoundDampening*1.5);
			}
		}
		else
			AltFireTimeOut = 0.0;
	}

	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer && PlayerPawn(Owner) != None)
	{
		newGlow = 1.25 + FRand()*0.75;
		for (i = 0; i < 2; i++)
		{
			if (FirstGlowFXActor[i] != None)
				FirstGlowFXActor[i].ScaleGlow = newGlow;
		}
		
		if (FirstOverFXActor[0] != None)
			FirstOverFXActor[0].ScaleGlow = newGlow;
	}
	
	if (GravionBeam != None && Pawn(Owner) != None)
	{
		gCount += Delta;
		if (gCount >= 0.1)
		{
			gCount = 0.0;
			A = GravionBeam.GetGrabbedGuy();
			
			if (A != None)
			{
				FiringSndPitch = 48;
				AltFiringSndPitch = 48;
			}
			else
			{
				FiringSndPitch = Default.FiringSndPitch;
				AltFiringSndPitch = Default.AltFiringSndPitch;
			}
		}
	}
}

function DestroyBeam()
{
	if (GravionBeam == None)
		return;
	GravionBeam.Destroy();
	GravionBeam = None;
}

function FireAltProjectile()
{
	if (bUseVortexProjectile)
		AltProjectileFire(VortexProjClass, AltProjectileSpeed, bAltWarnTarget);
	else
		AltProjectileFire(AltProjectileClass, AltProjectileSpeed, bAltWarnTarget);
}

function CheckPendentWeapon()
{
	if (bChangeWeapon)
        GotoState('DownWeapon');
}

function bool CanGrab(actor A)
{
local int i;

	if (A == None || (!default.bCanGrabOwnedObjects && (A.Instigator == Owner || A.Owner == Owner)))
		return False;
	
	if (default.bInvertListsProcessing)
	{
		for (i = maxNotGrabClasses-1; i >= 0; i--)
		{
			if (CanNOTGrabList[i] != '' && A.IsA(CanNOTGrabList[i]))
				return False;
		}
		
		for (i = maxGrabClasses-1; i >= 0; i--)
		{
			if (CanGrabList[i] != '' && A.IsA(CanGrabList[i]))
				return True;
		}
	}
	else
	{
		for (i = 0; i < maxNotGrabClasses; i++)
		{
			if (CanNOTGrabList[i] != '' && A.IsA(CanNOTGrabList[i]))
				return False;
		}
		
		for (i = 0; i < maxGrabClasses; i++)
		{
			if (CanGrabList[i] != '' && A.IsA(CanGrabList[i]))
				return True;
		}
	}
	
	return False;
}

function setHand(float Hand)
{
	Super.SetHand(Hand);
	if ( GravionBeam != None )
    {
		if ( Hand == 1 )
		{
			GravionBeam.bCenter = False;
            GravionBeam.bRight = False;
		}
		else if (Hand == 2)
		{
            GravionBeam.bCenter = True;
            GravionBeam.bRight = False;
        }
		else
		{
            GravionBeam.bCenter = False;
            GravionBeam.bRight = True;
        }
	}
}

simulated function Destroyed()
{
    if ( GravionBeam != None )
        GravionBeam.Destroy();
	GravionBeam = None;
	
    Super.Destroyed();
}

function Fire( float Value )
{
local Projectile pj;

    if (AmmoType == None && AmmoName != None)
        GiveAmmo(Pawn(Owner));

    if (!bStarting && (bInfinity || GravionBeam == None || AmmoType.UseAmmo(1)))
    {
		GotoState('NormalFire');
        bPointing = True;
        bCanClientFire = true;
        ClientFire(Value);
        if ( bRapidFire || FiringSpeed > 0)
            Pawn(Owner).PlayRecoil(FiringSpeed);
		
		if (GravionBeam == None && AnimSequence == 'BeamLoop')
		{
			pj = ProjectileFire(ProjectileClass, ProjectileSpeed, bWarnTarget);
			if (StartGravBeam(pj) != None)
			{
				if (FireOffset.Y == 0)
					StartGravBeam(pj).bCenter = true;
				else if (FireOffset.Y < 0)
					StartGravBeam(pj).bRight = false;
				else
					StartGravBeam(pj).bRight = true;

				GravionBeam = StartGravBeam(pj);
				pj.SetOwner(Owner);
			}
		}
    }
}

simulated function PrePostRenderOther( canvas Canvas, float Scale)
{
	if (GravionBeam != None && PlayerPawn(Owner) != None && GravionBeam.Trail1 != None && GravionBeam.Trail2 != None)
	{
		GravionBeam.Trail2.DrawScale = GravionBeam.Trail1.DrawScale;
		GravionBeam.Trail2.ScaleGlow = GravionBeam.Trail1.ScaleGlow / 7.5;
		Canvas.DrawActor(GravionBeam.Trail2, False, True);
	}
}

simulated function bool ClientAltFire( float Value )
{
	if ((!bStarting && bBeamOnly) || !bBeamOnly)
		return Super.ClientAltFire(Value);
	return false;
}

simulated function bool ClientFire( float Value )
{
	if (!bStarting)
		return Super.ClientFire(Value);
	return false;
}

simulated function PlayFiring()
{
	if (bLoopFiring)
	{
		PlayAnim('BeamLoop', 2.0, 0.0);
		FiringAmbSound = Default.FiringAmbSound;
		if (bBeamOnly)
			AltFiringAmbSound = Default.AltFiringAmbSound;
	}
	else
	{
		if (gravSSpeed == GSS_Instant)
			PlayAnim('BeamGradStart', 10.0, 0.0);
		else if (gravSSpeed == GSS_Fast)
			PlayAnim('BeamGradStart', 2.0 * GetFirerateMult(), 0.0);
		else if (gravSSpeed == GSS_Medium)
			PlayAnim('BeamGradStart', 1.0 * GetFirerateMult(), 0.0);
		else if (gravSSpeed == GSS_Slow)
			PlayAnim('BeamGradStart', 0.5 * GetFirerateMult(), 0.0);
			
		if (gravSSpeed != GSS_Instant)
		{
			if (gravSSpeed == GSS_Fast || GetFirerateMult() >= 3.25)
				PlayOwnedSound(Sound'Grav_FireStartFast', SLOT_None, Pawn(Owner).SoundDampening*3.0);
			else if (gravSSpeed == GSS_Medium || GetFirerateMult() >= 1.5)
				PlayOwnedSound(Sound'Grav_FireStartMed', SLOT_None, Pawn(Owner).SoundDampening*3.0);
			else if (gravSSpeed == GSS_Slow)
				PlayOwnedSound(Sound'Grav_FireStart', SLOT_None, Pawn(Owner).SoundDampening*3.0);
		}
		
		bLoopFiring = True;
		FiringAmbSound = None;
		AltFiringAmbSound = None;
		bStarting = True;
	}
}

function AltFire( float Value )
{
local Projectile pj;

    if ((AmmoType == None) && (AmmoName != None))
        GiveAmmo(Pawn(Owner));

	if (bBeamOnly)
	{
		if (!bStarting && (bInfinity || GravionBeam == None || AmmoType.UseAmmo(1)))
		{
			GotoState('AltFiring');
			bPointing=True;
			bCanClientFire = true;
			ClientAltFire(Value);
			if ( bRapidFire || (FiringSpeed > 0) )
				Pawn(Owner).PlayRecoil(FiringSpeed);
			
			if (GravionBeam == None && AnimSequence == 'BeamLoop')
			{
				pj = ProjectileFire(ProjectileClass, ProjectileSpeed, bWarnTarget);
				if (StartGravBeam(pj) != None)
				{
					if ( FireOffset.Y == 0 )
						StartGravBeam(pj).bCenter = true;
					else if ( FireOffset.Y < 0 )
						StartGravBeam(pj).bRight = false;
					else
						StartGravBeam(pj).bRight = true;

					GravionBeam = StartGravBeam(pj);
				}
			}
		}
	}
	else
	{
		if (bInfinity || AmmoType.AmmoAmount >= Default.GravityBallAmmoConsumption)
		{
			GotoState('AltFiring');
			bPointing = True;
			bCanClientFire = True;
			ClientAltFire(Value);
			if (!bInfinity)
				AmmoType.UseAmmo(Default.GravityBallAmmoConsumption);
			if (bRapidFire || FiringSpeed > 0)
				Pawn(Owner).PlayRecoil(FiringSpeed);
		}
		else
			PlayNoAmmoAltFiring();
	}
}

simulated function bool CheckAmmo( bool bAltFire)
{
	if (bAltFire)
		return (bInfinity || (AmmoType != None && AmmoType.AmmoAmount >= Default.GravityBallAmmoConsumption));
	return True;
}

simulated function PlayAltFiring()
{
	if (bBeamOnly)
		PlayFiring();
	else
	{
		PlayAnim('AltFire', GetFirerateMult(True) * 0.825, 0.0);
		PlayOwnedSound(Sound'Grav_AltFireCharge', SLOT_None, Pawn(Owner).SoundDampening*1.5);
		
		AltFireTimeOut = 0.9 / GetFirerateMult(True);
		GravChargeTimeOut = 0.8 / GetFirerateMult(True);
	}
}

simulated function PlayNoAmmoAltFiring()
{
	Super.PlayNoAmmoAltFiring();
	PlayOwnedSound(Sound'Grav_AltNoAmmo', SLOT_None, Pawn(Owner).SoundDampening*1.5);
	PlayAnim('NoAmmoAltFire', 5 * GetFirerateMult(True), 0.0);
}

simulated function PlaySelect()
{
	Super.PlaySelect();
	AltFireTimeOut = 0.0;
	GravChargeTimeOut = 0.0;
}

simulated function RenderOther( canvas Canvas, vector Loc, rotator Rot)
{
local byte i;
local bool bSpawnedFX;

	if (PlayerPawn(Owner) == None)
		return;
	
	//Gravity Charging - Phase 1
	if (GravChargeTimeOut > 0)
	{
		GravChargeTCount += globalDelta;
		GravChargeTimeOut -= globalDelta;
	}
		
	
	if (GravChargeTCount >= 0.085)
	{
		GravChargeTCount = 0;
		
		//Gravity FX - 01
		//-------------------------------------------
		i = 0;
		bSpawnedFX = False;
		while (i < ArrayCount(GravCharginFX01) && !bSpawnedFX)
		{
			if (GravCharginFX01[i].gCharge == None || GravCharginFX01[i].LifeTime <= 0)
			{
				GravCharginFX01[i].RollDif.Roll = (FRand()*2-1)*910;
				GravCharginFX01[i].gCharge = Spawn(Class'GravChargeFXTrace',,, Loc + (GravChargeFXOffset >> Rot), Rot + GravCharginFX01[i].RollDif);
				
				if (GravCharginFX01[i].gCharge != None)
				{
					GravPartChargFX01[i] = Spawn(Class'GravChargeFXParticle',,, GravCharginFX01[i].gCharge.Location, GravCharginFX01[i].gCharge.Rotation);
					GravPartChargFX01[i].SetAndPlay(GravCharginFX01[i].gCharge.RandomizeAndPlay( 5 * GetFirerateMult(True)), 5 * GetFirerateMult(True));
					GravCharginFX01[i].LifeTime = 0.2 / GetFirerateMult(True);
				}
				
				bSpawnedFX = True;
			}
			i++;
		}
		//-------------------------------------------
		
		//Gravity FX - 02
		//-------------------------------------------
		i = 0;
		bSpawnedFX = False;
		while (i < ArrayCount(GravCharginFX02) && !bSpawnedFX)
		{
			if (GravCharginFX02[i].gCharge == None || GravCharginFX02[i].LifeTime <= 0)
			{
				GravCharginFX02[i].RollDif.Roll = (65536 / 6) + (FRand()*2-1)*910;
				GravCharginFX02[i].gCharge = Spawn(Class'GravChargeFXTrace',,, Loc + (GravChargeFXOffset >> Rot), Rot + GravCharginFX02[i].RollDif);
				
				if (GravCharginFX02[i].gCharge != None)
				{
					GravPartChargFX02[i] = Spawn(Class'GravChargeFXParticle',,, GravCharginFX02[i].gCharge.Location, GravCharginFX02[i].gCharge.Rotation);
					GravPartChargFX02[i].SetAndPlay(GravCharginFX02[i].gCharge.RandomizeAndPlay( 5 * GetFirerateMult(True)), 5 * GetFirerateMult(True));
					GravCharginFX02[i].LifeTime = 0.2 / GetFirerateMult(True);
				}
				
				bSpawnedFX = True;
			}
			i++;
		}
		//-------------------------------------------
		
		//Gravity FX - 03
		//-------------------------------------------
		i = 0;
		bSpawnedFX = False;
		while (i < ArrayCount(GravCharginFX03) && !bSpawnedFX)
		{
			if (GravCharginFX03[i].gCharge == None || GravCharginFX03[i].LifeTime <= 0)
			{
				GravCharginFX03[i].RollDif.Roll = (65536 / 6 * 2) + (FRand()*2-1)*910;
				GravCharginFX03[i].gCharge = Spawn(Class'GravChargeFXTrace',,, Loc + (GravChargeFXOffset >> Rot), Rot + GravCharginFX03[i].RollDif);
				
				if (GravCharginFX03[i].gCharge != None)
				{
					GravPartChargFX03[i] = Spawn(Class'GravChargeFXParticle',,, GravCharginFX03[i].gCharge.Location, GravCharginFX03[i].gCharge.Rotation);
					GravPartChargFX03[i].SetAndPlay(GravCharginFX03[i].gCharge.RandomizeAndPlay( 5 * GetFirerateMult(True)), 5 * GetFirerateMult(True));
					GravCharginFX03[i].LifeTime = 0.2 / GetFirerateMult(True);
				}
				
				bSpawnedFX = True;
			}
			i++;
		}
		//-------------------------------------------
		
		//Gravity FX - 04
		//-------------------------------------------
		i = 0;
		bSpawnedFX = False;
		while (i < ArrayCount(GravCharginFX04) && !bSpawnedFX)
		{
			if (GravCharginFX04[i].gCharge == None || GravCharginFX04[i].LifeTime <= 0)
			{
				GravCharginFX04[i].RollDif.Roll = (65536 / 6 * 3) + (FRand()*2-1)*910;
				GravCharginFX04[i].gCharge = Spawn(Class'GravChargeFXTrace',,, Loc + (GravChargeFXOffset >> Rot), Rot + GravCharginFX04[i].RollDif);
				
				if (GravCharginFX04[i].gCharge != None)
				{
					GravPartChargFX04[i] = Spawn(Class'GravChargeFXParticle',,, GravCharginFX04[i].gCharge.Location, GravCharginFX04[i].gCharge.Rotation);
					GravPartChargFX04[i].SetAndPlay(GravCharginFX04[i].gCharge.RandomizeAndPlay( 5 * GetFirerateMult(True)), 5 * GetFirerateMult(True));
					GravCharginFX04[i].LifeTime = 0.2 / GetFirerateMult(True);
				}
				
				bSpawnedFX = True;
			}
			i++;
		}
		//-------------------------------------------
		
		//Gravity FX - 05
		//-------------------------------------------
		i = 0;
		bSpawnedFX = False;
		while (i < ArrayCount(GravCharginFX05) && !bSpawnedFX)
		{
			if (GravCharginFX05[i].gCharge == None || GravCharginFX05[i].LifeTime <= 0)
			{
				GravCharginFX05[i].RollDif.Roll = (65536 / 6 * 4) + (FRand()*2-1)*910;
				GravCharginFX05[i].gCharge = Spawn(Class'GravChargeFXTrace',,, Loc + (GravChargeFXOffset >> Rot), Rot + GravCharginFX05[i].RollDif);
				
				if (GravCharginFX05[i].gCharge != None)
				{
					GravPartChargFX05[i] = Spawn(Class'GravChargeFXParticle',,, GravCharginFX05[i].gCharge.Location, GravCharginFX05[i].gCharge.Rotation);
					GravPartChargFX05[i].SetAndPlay(GravCharginFX05[i].gCharge.RandomizeAndPlay( 5 * GetFirerateMult(True)), 5 * GetFirerateMult(True));
					GravCharginFX05[i].LifeTime = 0.2 / GetFirerateMult(True);
				}
				
				bSpawnedFX = True;
			}
			i++;
		}
		//-------------------------------------------
		
		//Gravity FX - 06
		//-------------------------------------------
		i = 0;
		bSpawnedFX = False;
		while (i < ArrayCount(GravCharginFX06) && !bSpawnedFX)
		{
			if (GravCharginFX06[i].gCharge == None || GravCharginFX06[i].LifeTime <= 0)
			{
				GravCharginFX06[i].RollDif.Roll = (65536 / 6 * 5) + (FRand()*2-1)*910;
				GravCharginFX06[i].gCharge = Spawn(Class'GravChargeFXTrace',,, Loc + (GravChargeFXOffset >> Rot), Rot + GravCharginFX06[i].RollDif);
				
				if (GravCharginFX06[i].gCharge != None)
				{
					GravPartChargFX06[i] = Spawn(Class'GravChargeFXParticle',,, GravCharginFX06[i].gCharge.Location, GravCharginFX06[i].gCharge.Rotation);
					GravPartChargFX06[i].SetAndPlay(GravCharginFX06[i].gCharge.RandomizeAndPlay( 5 * GetFirerateMult(True)), 5 * GetFirerateMult(True));
					GravCharginFX06[i].LifeTime = 0.2 / GetFirerateMult(True);
				}
				
				bSpawnedFX = True;
			}
			i++;
		}
		//-------------------------------------------
	}
	
	//Gravity Charging - Phase 2
	for (i = 0; i < ArrayCount(GravCharginFX01); i++)
	{
		//Gravity FX - 01
		if (GravCharginFX01[i].gCharge != None && GravCharginFX01[i].LifeTime > 0)
		{
			GravCharginFX01[i].gCharge.SetLocation(Loc + (GravChargeFXOffset >> Rot));
			GravCharginFX01[i].gCharge.SetRotation(Rot + GravCharginFX01[i].RollDif);
			GravCharginFX01[i].LifeTime -= globalDelta;
			Canvas.DrawActor(GravCharginFX01[i].gCharge, False, False);
			
			if (GravPartChargFX01[i] != None)
			{
				GravPartChargFX01[i].SetLocation(Loc + (GravChargeFXOffset >> Rot));
				GravPartChargFX01[i].SetRotation(Rot + GravCharginFX01[i].RollDif);
				Canvas.DrawActor(GravPartChargFX01[i], False, False);
			}
		}
		
		//Gravity FX - 02
		if (GravCharginFX02[i].gCharge != None && GravCharginFX02[i].LifeTime > 0)
		{
			GravCharginFX02[i].gCharge.SetLocation(Loc + (GravChargeFXOffset >> Rot));
			GravCharginFX02[i].gCharge.SetRotation(Rot + GravCharginFX02[i].RollDif);
			GravCharginFX02[i].LifeTime -= globalDelta;
			Canvas.DrawActor(GravCharginFX02[i].gCharge, False, False);
			
			if (GravPartChargFX02[i] != None)
			{
				GravPartChargFX02[i].SetLocation(Loc + (GravChargeFXOffset >> Rot));
				GravPartChargFX02[i].SetRotation(Rot + GravCharginFX02[i].RollDif);
				Canvas.DrawActor(GravPartChargFX02[i], False, False);
			}
		}
		
		//Gravity FX - 03
		if (GravCharginFX03[i].gCharge != None && GravCharginFX03[i].LifeTime > 0)
		{
			GravCharginFX03[i].gCharge.SetLocation(Loc + (GravChargeFXOffset >> Rot));
			GravCharginFX03[i].gCharge.SetRotation(Rot + GravCharginFX03[i].RollDif);
			GravCharginFX03[i].LifeTime -= globalDelta;
			Canvas.DrawActor(GravCharginFX03[i].gCharge, False, False);
			
			if (GravPartChargFX03[i] != None)
			{
				GravPartChargFX03[i].SetLocation(Loc + (GravChargeFXOffset >> Rot));
				GravPartChargFX03[i].SetRotation(Rot + GravCharginFX03[i].RollDif);
				Canvas.DrawActor(GravPartChargFX03[i], False, False);
			}
		}
		
		//Gravity FX - 04
		if (GravCharginFX04[i].gCharge != None && GravCharginFX04[i].LifeTime > 0)
		{
			GravCharginFX04[i].gCharge.SetLocation(Loc + (GravChargeFXOffset >> Rot));
			GravCharginFX04[i].gCharge.SetRotation(Rot + GravCharginFX04[i].RollDif);
			GravCharginFX04[i].LifeTime -= globalDelta;
			Canvas.DrawActor(GravCharginFX04[i].gCharge, False, False);
			
			if (GravPartChargFX04[i] != None)
			{
				GravPartChargFX04[i].SetLocation(Loc + (GravChargeFXOffset >> Rot));
				GravPartChargFX04[i].SetRotation(Rot + GravCharginFX04[i].RollDif);
				Canvas.DrawActor(GravPartChargFX04[i], False, False);
			}
		}
		
		//Gravity FX - 05
		if (GravCharginFX05[i].gCharge != None && GravCharginFX05[i].LifeTime > 0)
		{
			GravCharginFX05[i].gCharge.SetLocation(Loc + (GravChargeFXOffset >> Rot));
			GravCharginFX05[i].gCharge.SetRotation(Rot + GravCharginFX05[i].RollDif);
			GravCharginFX05[i].LifeTime -= globalDelta;
			Canvas.DrawActor(GravCharginFX05[i].gCharge, False, False);
			
			if (GravPartChargFX05[i] != None)
			{
				GravPartChargFX05[i].SetLocation(Loc + (GravChargeFXOffset >> Rot));
				GravPartChargFX05[i].SetRotation(Rot + GravCharginFX05[i].RollDif);
				Canvas.DrawActor(GravPartChargFX05[i], False, False);
			}
		}
		
		//Gravity FX - 06
		if (GravCharginFX06[i].gCharge != None && GravCharginFX06[i].LifeTime > 0)
		{
			GravCharginFX06[i].gCharge.SetLocation(Loc + (GravChargeFXOffset >> Rot));
			GravCharginFX06[i].gCharge.SetRotation(Rot + GravCharginFX06[i].RollDif);
			GravCharginFX06[i].LifeTime -= globalDelta;
			Canvas.DrawActor(GravCharginFX06[i].gCharge, False, False);
			
			if (GravPartChargFX06[i] != None)
			{
				GravPartChargFX06[i].SetLocation(Loc + (GravChargeFXOffset >> Rot));
				GravPartChargFX06[i].SetRotation(Rot + GravCharginFX06[i].RollDif);
				Canvas.DrawActor(GravPartChargFX06[i], False, False);
			}
		}
	}
}


simulated function AnimEnd()
{
	bStarting = False;
    Super.AnimEnd();
}

simulated function vector CalcNewDrawOffset()
{
    local vector DrawOffset, WeaponBob, CurrentPlayerView, ROffset;
    local Pawn PawnOwner;

    PawnOwner = Pawn(Owner);
	if (PlayerPawn(PawnOwner) != None && PlayerPawn(PawnOwner).DefaultFOV >= 100)
		CurrentPlayerView = WidePlayerViewOffset;
	else
		CurrentPlayerView = PlayerViewOffset;
	ROffset = RenderOffsetSelect * 100;
	
	if (VSize(ROffset) > 0 && AnimMaxFrame > 0 && (AnimSequence == 'Select' || AnimSequence == 'Down'))
	{
		if (PlayerViewOffset.Y < 0)
			ROffset.Y = -ROffset.Y;
		
		ROffset.X = 0;
		if (AnimFrame < AnimMaxFrame / 2)
			CurrentPlayerView = CurrentPlayerView + (AnimFrame * ROffset / (AnimMaxFrame / 2));
		else
			CurrentPlayerView = CurrentPlayerView + ((AnimMaxFrame - AnimFrame) * ROffset / (AnimMaxFrame/2));
		
		ROffset = RenderOffsetSelect * 100;
		ROffset.Y = 0;
		ROffset.Z = 0;
		if (AnimFrame < AnimMaxFrame)
		{
			if (AnimSequence == 'Down')
				CurrentPlayerView = CurrentPlayerView + (AnimFrame * ROffset / AnimMaxFrame);
			else
				CurrentPlayerView = CurrentPlayerView + ((AnimMaxFrame - AnimFrame) * ROffset / AnimMaxFrame);
		}
	}
	
    DrawOffset = ((0.9/PawnOwner.FOVAngle * CurrentPlayerView) >> PawnOwner.ViewRotation);

    if (Level.NetMode == NM_DedicatedServer || (Level.NetMode == NM_ListenServer && Owner.RemoteRole == ROLE_AutonomousProxy))
        DrawOffset += (PawnOwner.BaseEyeHeight * vect(0,0,1));
    else
    {   
        DrawOffset += (PawnOwner.EyeHeight * vect(0,0,1));
        WeaponBob = BobDamping * PawnOwner.WalkBob;
        WeaponBob.Z = (0.45 + 0.55 * BobDamping) * PawnOwner.WalkBob.Z;
        DrawOffset += WeaponBob;
    }
    return DrawOffset;
}

function float RateSelf( out int bUseAltMode )
{
	local float EnemyDist, Rating;
	local bool bRetreating;
	local vector EnemyDir;
	local Pawn P;

	P = Pawn(Owner);

	//No enemy, ready to fire
	if ( P.Enemy == None )
		return AIRating;
	
	//Don't recommend second mode if too close
	if (bInfinity || AmmoType.AmmoAmount >= Default.GravityBallAmmoConsumption)
	{
		if (VSize(P.Enemy.Location - P.Location) >= 250*FMax(1.0, Splasher) && VSize(P.Enemy.Location - P.Location) < (Class'GravBeam'.default.BeamSize*(Default.GravityBeamSize + 2)))
			bUseAltMode = int(FRand() + 0.075);
		else if (VSize(P.Enemy.Location - P.Location) < (Class'GravBeam'.default.BeamSize*(Default.GravityBeamSize + 2)))
			bUseAltMode = 0;
		else
			bUseAltMode = 1;
	}
	else
		bUseAltMode = 0;

	return (AIRating + FRand() * 0.05);
}

function Finish()
{
    local Pawn PawnOwner;
    local bool bForce, bForceAlt;

    bForce = bForceFire;
    bForceAlt = bForceAltFire;
    bForceFire = false;
    bForceAltFire = false;

    if (bChangeWeapon && !bLoopFiring)
    {
        GotoState('DownWeapon');
        return;
    }

    PawnOwner = Pawn(Owner);
    if (PawnOwner == None)
        return;
    if (PlayerPawn(Owner) == None)
    {
        if ( (AmmoType != None) && (AmmoType.AmmoAmount<=0) )
        {
            PawnOwner.StopFiring();
            PawnOwner.SwitchToBestWeapon();
            if ( bChangeWeapon )
                GotoState('DownWeapon');
        }
        else if (PawnOwner.bFire != 0 && FRand() < RefireRate)
            Global.Fire(0);
        else if (PawnOwner.bAltFire != 0 && FRand() < AltRefireRate)
            Global.AltFire(0);  
        else 
        {
            PawnOwner.StopFiring();
            GotoState('Idle');
        }
        return;
    }
	
	if (PawnOwner.PlayerReplicationInfo != None && !PawnOwner.PlayerReplicationInfo.bFeigningDeath)
	{
		if ((AmmoType != None && AmmoType.AmmoAmount<=0) || PawnOwner.Weapon != self)
			GotoState('Idle');
		else if (PawnOwner.bFire!=0 || bForce)
			Global.Fire(0);
		else if (PawnOwner.bAltFire!=0 || bForceAlt)
			Global.AltFire(0);
		else 
			GotoState('Idle');
	}
	else
		GotoState('Idle');
}


simulated function bool PlayEndBeam()
{
	if (Pawn(Owner) != None && ((Pawn(Owner).bFire == 0 && (!bBeamOnly || Pawn(Owner).bAltFire == 0)) 
	|| (AmmoType != None && AmmoType.AmmoAmount <= 0)) && (AnimSequence == 'BeamLoop' || AnimSequence == 'BeamGradStart'))
	{
		bLoopFiring = False;
		DestroyBeam();
		
		if (gravSSpeed == GSS_Instant)
			PlayAnim('BeamGradEnd', 10.0, 0.0);
		else if (gravSSpeed == GSS_Fast)
			PlayAnim('BeamGradEnd', 2.0 * GetFirerateMult(), 0.0);
		else if (gravSSpeed == GSS_Medium)
			PlayAnim('BeamGradEnd', 1.0 * GetFirerateMult(), 0.0);
		else if (gravSSpeed == GSS_Slow)
			PlayAnim('BeamGradEnd', 0.5 * GetFirerateMult(), 0.0);
			
		if (gravSSpeed != GSS_Instant)
		{
			if (gravSSpeed == GSS_Fast || GetFirerateMult() >= 3.25)
				PlayOwnedSound(Sound'Grav_FireEndFast', SLOT_None, Pawn(Owner).SoundDampening*3.0);
			else if (gravSSpeed == GSS_Medium || GetFirerateMult() >= 1.5)
				PlayOwnedSound(Sound'Grav_FireEndMed', SLOT_None, Pawn(Owner).SoundDampening*3.0);
			else if (gravSSpeed == GSS_Slow)
				PlayOwnedSound(Sound'Grav_FireEnd', SLOT_None, Pawn(Owner).SoundDampening*3.0);
		}
		
		FiringAmbSound = None;
		AltFiringAmbSound = None;
		CheckPendentWeapon();
		return True;
	}
	return False;
}


state ClientFiring
{
	simulated function Tick(float DeltaTime)
	{
		Global.Tick(DeltaTime);
		if (Pawn(Owner) != None && Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.bFeigningDeath)
		{
			bStarting = False;
			bLoopFiring = False;
			PlayIdleAnim();
            GotoState('');
		}
	}
	
    simulated function AnimEnd()
    {
        bStarting = False;
		if (!PlayEndBeam())
			Super.AnimEnd();
    }
}

state NormalFire
{
	function Tick(float DeltaTime)
	{
		Global.Tick(DeltaTime);
		if (Pawn(Owner) != None && Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.bFeigningDeath)
		{
			bLoopFiring = False;
			bStarting = False;
			Finish();
		}
	}
	
    function AnimEnd()
    {
		bStarting = False;
		if (!PlayEndBeam())
			Finish();
    }
}

state ClientAltFiring
{
	simulated function Tick(float DeltaTime)
	{
		Global.Tick(DeltaTime);
		if (Pawn(Owner) != None && Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.bFeigningDeath)
		{
			bStarting = False;
			bLoopFiring = False;
			PlayIdleAnim();
            GotoState('');
		}
	}
	
    simulated function AnimEnd()
    {
        bStarting = False;
		if (!PlayEndBeam())
			Super.AnimEnd();
    }
}

state AltFiring
{
	function Tick(float DeltaTime)
	{
		Global.Tick(DeltaTime);
		if (Pawn(Owner) != None && Pawn(Owner).PlayerReplicationInfo != None && Pawn(Owner).PlayerReplicationInfo.bFeigningDeath)
		{
			bLoopFiring = False;
			bStarting = False;
			Finish();
		}
	}
	
    function AnimEnd()
    {
		bStarting = False;
		if (!PlayEndBeam())
			Finish();
    }
}

static function EGSpeed GetEGSpeedFromByte(byte n)
{
	if (n == 0)		return EGSpeed.GSS_Slow;
	if (n == 1)		return EGSpeed.GSS_Medium;
	if (n == 2)		return EGSpeed.GSS_Fast;
	if (n == 3)		return EGSpeed.GSS_Instant;
	return EGSpeed.GSS_Slow;
}


//Oversurrection
static function OversurrectorExplodeServer(TheOversProj ref, vector HitLocation, vector HitNormal)
{
	if (ref == None)
		return;
	ref.Spawn(Class'GravVortex',,, HitLocation + HitNormal, rot(0,0,0));
}

static function bool hasOversurrectorFXFusion(byte i, optional out class<TheOversColoredFX> CFXClass)
{
	switch (i)
	{
		case 0:	CFXClass = Class'GravOversFXA';			break;
		case 1:	CFXClass = Class'GravOversFXB';			break;
		case 2:	CFXClass = Class'GravOversFXC';			break;
		case 3:	CFXClass = Class'GravOversFXCa';		break;
		case 4:	CFXClass = Class'GravOversFXCb';		break;
		case 5:	CFXClass = Class'GravOversFXCc';		break;
		case 6:	CFXClass = Class'GravOversFXCd';		break;
	}
	return (i <= 6);
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=GravitonPick
	CollisionHeight=20.000000
	CollisionRadius=30.000000
	AutoSwitchPriority=5
	Icon=GravitonIcon
	InventoryGroup=5
	ItemArticle="a"
	ItemName="Graviton"
	MaxDesireability=0.400000
	PickupMessage="You got the Graviton."
	PickupSound=Grav_Pickup
	PickupViewMesh=GravitonPick
	PickupViewScale=1.000000
	PlayerViewMesh=GravitonR
	PlayerViewOffset=(X=15.312500,Y=-7.875000,Z=-5.250000)
	WidePlayerViewOffset=(X=15.312500,Y=-7.875000,Z=-5.250000)
	PlayerViewScale=1.000000
	RespawnTime=30.000000
	StatusIcon=GravitonIcon
	ThirdPersonMesh=GravitonM
	ThirdPersonScale=0.750000
	AltDamageType=Quantumized
	AltFireSound=None
	AltProjectileClass=Class'GravProj'
	AmmoName=Class'GravitonAmmo'
	bInstantHit=False
	bRapidFire=True
	DeathMessage="%o was quantumized by %k's %w."
	FireSound=None
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=Smashed
	NameColor=(R=128,G=0,B=255)
	PickupAmmoCount=30
	ProjectileClass=Class'StartGravBeam'
	SelectSound=Grav_Select
	shakemag=0.000000
	shaketime=0.000000
	shakevert=0.000000
	AIRating=0.750000
	AltRefireRate=1.000000
	bAltWarnTarget=True
	bRecommendAltSplashDamage=True
	bRecommendSplashDamage=True
	bSplashDamage=True
	bWarnTarget=True
	RefireRate=2.000000
	Mass=50.000000
	bNoSmooth=False
	bOwnsCrossHair=True
	CustomCross=GravCross
	CustomCrossAlpha=GravCrossAlpha
	CrossHairScale=0.500000
	WeaponDescription="Classification: Gravity local manipulation device.\n\nPrimary Fire: Gravity beam which can used to lift and move objects and players.\n\nSecondary Fire: Generation of a small gravity vortex similar to a mini black hole which destabilizes on contact."
	
	LightBrightness=100
	LightHue=192
	LightSaturation=48
	LightRadius=5
	LightType=LT_Steady
	
	Texture=GravitonMetal
	MultiSkins(5)=GravFXInv
	
	PlayerViewMeshLeft=Graviton
	PlayerViewMeshRight=GravitonR
	HandPartMeshL(0)=GravHandL
	HandPartMeshR(0)=GravHandR
	BobDamping=1.100000
	
	RenderOffsetSelect=(X=-10.000000,Y=-7.500000,Z=-4.000000)
	AnimMaxFrame=0.833333
	
	CenterPlayerViewOffset=(X=12.000000,Y=1.575000,Z=-6.500000)
	WideCenterPlayerViewOffset=(X=11.000000,Y=1.575000,Z=-7.000000)
	FireOffsetXAdjustHidden=14.000000
	FireOffsetZAdjustHidden=-16.000000
	AltFireOffsetZAdjustHidden=-6.000000
	
	
	FirstPersonOverFX(0)=(bLit=True,OverTex1=Texture'Sk_GravOv01',OverTex2=Texture'Sk_GravOv02')
	FirstPersonOverFX(0)=(OverTex3=Texture'Sk_GravOv03',OverTex4=Texture'GravFXInv')
	FirstPersonOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000)
	FirstPersonOverFX(0)=(bCustomMesh=True,CustomMesh=Mesh'GravOvR',CustomMeshLeft=Mesh'GravOv')
	
	PickupOverFX(0)=(bLit=True,OverTex1=Texture'Sk_GravOv01',OverTex2=Texture'Sk_GravOv02')
	PickupOverFX(0)=(OverTex3=Texture'Sk_GravOv03',OverTex4=Texture'GravFXInv')
	PickupOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000)
	PickupOverFX(0)=(bCustomMesh=True,CustomMesh=Mesh'GravOvPick',OverlModelClass=Class'GravOverPickupFX')
	
	
	FirstPersonGlowFX(0)=(bLit=True,GlowModel=Mesh'GravRotLightsR',GlowModelLeft=Mesh'GravRotLights')
	FirstPersonGlowFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.017500)
	FirstPersonGlowFX(0)=(GlowTex1=Texture'GravGlow01')
	
	FirstPersonGlowFX(1)=(bLit=True,GlowModel=Mesh'GravPolesLightsR',GlowModelLeft=Mesh'GravPolesLights')
	FirstPersonGlowFX(1)=(GlowStyle=STY_Translucent,GlowAmount=1.000000,GlowTexScale=0.040000)
	FirstPersonGlowFX(1)=(GlowTex1=Texture'GravGlow01')
	
	FirstPersonGlowFX(2)=(bLit=True,bRandFrame=True,GlowModel=Mesh'GravFrontLightR',GlowModelLeft=Mesh'GravFrontLight')
	FirstPersonGlowFX(2)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.043750)
	FirstPersonGlowFX(2)=(GlowTex3=Texture'GravGlow02')
	
	PickupGlowFX(0)=(bLit=True,GlowModel=Mesh'GravRotLightsPick')
	PickupGlowFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.071750)
	PickupGlowFX(0)=(GlowTex1=Texture'GravGlow01',GlowSetClass=Class'GravOverPickupFX')
	
	PickupGlowFX(1)=(bLit=True,GlowModel=Mesh'GravPolesLightsPick')
	PickupGlowFX(1)=(GlowStyle=STY_Translucent,GlowAmount=1.000000,GlowTexScale=0.164000)
	PickupGlowFX(1)=(GlowTex1=Texture'GravGlow01',GlowSetClass=Class'GravOverPickupFX')
	
	PickupGlowFX(2)=(bLit=True,bRandFrame=True,GlowModel=Mesh'GravFrontLightPick')
	PickupGlowFX(2)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.179375)
	PickupGlowFX(2)=(GlowTex3=Texture'GravGlow02')
	
	FiringSndVol=128
	FiringSndPitch=64
	FiringSndRadius=64
	FiringAmbSound=Grav_FireLoop
	
	AltFiringSndVol=128
	AltFiringSndPitch=64
	AltFiringSndRadius=64
	AltFiringAmbSound=Grav_FireLoop
	
	bAnimFinished=True
	bHighFireRate=True
	FireOffset=(Y=0.010000)
	GravChargeFXOffset=(X=2.000000)
	VortexProjClass=Class'GravBall'
	NoAltAmmoMsgString="Insufficient Gravitational particles !"
	
	GravitonFlyHackSpeedMult=1.000000
	bCanGrabOwnedObjects=False
	bGravitonStraightBeam=False
	SmashDifficulty=2.000000
	GravityBallAmmoConsumption=15
	bBeamSmashDamage=True
	GravityBeamSize=9
	GravityBeamBendFactor=9.500000
	bUseSpringBeamPhysics=True
	bUseSpringMassPhysics=True
	GravityBeamInertia=0.900000
	GravityBeamStartSpeed=GSS_Fast
	GravityBeamEndSpeed=GSS_Fast
	bScoreGrabAndDropFrags=True
	bCanGrabTeam=True
	VortexRadius=256.000000
	VortexDamage=95
	ThrowDamageMaxTime=2.000000
	enableSmashShake=True
	SmashMinSpeed=1200.000000
	
	CanGrabList(0)=Pawn
	CanGrabList(1)=Projectile
	CanGrabList(2)=Decoration
	
	CanNOTGrabList(0)=NWMine
	CanNOTGrabList(1)=CybSentinel
	CanNOTGrabList(2)=CybDualSentinel
	CanNOTGrabList(3)=CybKamikaze
	CanNOTGrabList(4)=CybFField
	CanNOTGrabList(5)=CybVortex
	CanNOTGrabList(6)=MegatonDeploy
	CanNOTGrabList(7)=FortStandard
	CanNOTGrabList(8)=TeamCannon
	CanNOTGrabList(9)=sgBuilding
	CanNOTGrabList(10)=NWGoreSet
	CanNOTGrabList(11)=CyMaster
	CanNOTGrabList(12)=CyChild
	
	
	bOversurrective=True
	OversurrectorShellColor=(R=128,G=0,B=255)
	OversurrectorFXColors(0)=(R=128,G=0,B=255)
	OversurrectorFXColors(1)=(R=0,G=0,B=255)
	OversurrectorFXColors(2)=(R=32,G=32,B=128)
	OversurrectorFXColors(3)=(R=0,G=0,B=255)
	OversurrectorFXColors(4)=(R=16,G=8,B=255)
	OversurrectorFXColors(5)=(R=32,G=24,B=255)
	OversurrectorFXColors(6)=(R=48,G=48,B=255)
	OversurrectorFXColors(7)=(R=128,G=0,B=192)
	OversurrectorFXColors(8)=(R=128,G=0,B=192)
	OversurrectorFXColors(9)=(R=32,G=0,B=255)
	OversurrectorFXColors(10)=(R=32,G=0,B=255)
	OversurrectorFXColors(11)=(R=128,G=0,B=255)
	OversurrectorFXColors(12)=(R=64,G=0,B=128)
	OversurrectorFXColors(13)=(R=255,G=0,B=255)
	OversurrectorFXColors(14)=(R=128,G=0,B=255)
	OversurrectorFXColors(15)=(R=64,G=0,B=255)
	OversurrectorFXColors(16)=(R=32,G=0,B=255)
	OversurrectorFXColors(17)=(R=16,G=0,B=255)
	OversurrectorFXColors(18)=(R=0,G=0,B=0)
	OversurrectorFXColors(19)=(R=0,G=0,B=0)
	OversurrectorFXColors(20)=(R=0,G=0,B=0)
	OversurrectorFXColors(21)=(R=0,G=0,B=255)
	OversurrectorFXColors(22)=(R=16,G=0,B=255)
	OversurrectorFXColors(23)=(R=32,G=0,B=255)
	
	OversurrectorLightHue(0)=192
	OversurrectorLightSaturation(0)=0
	OversurrectorLightBrightness(0)=100
	OversurrectorLightHue(1)=192
	OversurrectorLightSaturation(1)=0
	OversurrectorLightBrightness(1)=100
	OversurrectorLightHue(2)=192
	OversurrectorLightSaturation(2)=0
	OversurrectorLightBrightness(2)=100
	
	OversurrectorProjClass=Class'GravOversProj'
	
	
	enableOversurrection=True
	OversurrectionLifeTime=25.000000
	OversurrectivePullStrength=1000.000000
	OversurrectivePullRadius=10000.000000
	OversurrectivePullRate=10.000000
	OversurrectiveDamage=1000
	bOversurrectiveVtxPhysics=False
	bOversurrectivePullProj=True
}
