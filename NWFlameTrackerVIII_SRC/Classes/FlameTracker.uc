//////////////////////////////////////////////////////////////
//	Nali Weapons III Flame Tracker weapon
//				Feralidragon (18-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTracker expands NaliWeapons config(NWeaponsCfg);

//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=FlameTracker ANIVFILE=MODELS\FlameTracker_a.3d DATAFILE=MODELS\FlameTracker_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FlameTracker STRENGTH=0
#exec MESH ORIGIN MESH=FlameTracker X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FlameTrackerR ANIVFILE=MODELS\FlameTracker_a.3d DATAFILE=MODELS\FlameTracker_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=FlameTrackerR STRENGTH=0
#exec MESH ORIGIN MESH=FlameTrackerR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=FlameTrackerPick ANIVFILE=MODELS\FlameTracker_a.3d DATAFILE=MODELS\FlameTracker_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=FlameTrackerPick STRENGTH=0
#exec MESH ORIGIN MESH=FlameTrackerPick X=0 Y=0 Z=0 Yaw=128

//3rd person
#exec MESH IMPORT MESH=FlameTrackerM ANIVFILE=MODELS\FlameTracker_a.3d DATAFILE=MODELS\FlameTracker_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FlameTrackerM STRENGTH=0.45
#exec MESH ORIGIN MESH=FlameTrackerM X=320 Y=0 Z=-20 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FlameTracker SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTracker SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTracker SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTracker SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTracker SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTracker SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTracker SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FlameTrackerR SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTrackerR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTrackerR SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTrackerR SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTrackerR SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTrackerR SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTrackerR SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FlameTrackerPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH SEQUENCE MESH=FlameTrackerM SEQ=All STARTFRAME=0 NUMFRAMES=22
#exec MESH SEQUENCE MESH=FlameTrackerM SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTrackerM SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTrackerM SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTrackerM SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FlameTracker MESH=FlameTracker
#exec MESHMAP SCALE MESHMAP=FlameTracker X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FlameTrackerR MESH=FlameTrackerR
#exec MESHMAP SCALE MESHMAP=FlameTrackerR X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FlameTrackerPick MESH=FlameTrackerPick
#exec MESHMAP SCALE MESHMAP=FlameTrackerPick X=0.10625 Y=0.10625 Z=0.2125

#exec MESHMAP NEW MESHMAP=FlameTrackerM MESH=FlameTrackerM
#exec MESHMAP SCALE MESHMAP=FlameTrackerM X=0.085 Y=0.085 Z=0.17

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=Sk_FlameTracker01 FILE=SKINS\Sk_FlameTracker01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=FlameTracker NUM=1 TEXTURE=Sk_FlameTracker01
#exec MESHMAP SETTEXTURE MESHMAP=FlameTrackerR NUM=1 TEXTURE=Sk_FlameTracker01
#exec MESHMAP SETTEXTURE MESHMAP=FlameTrackerPick NUM=1 TEXTURE=Sk_FlameTracker01
#exec MESHMAP SETTEXTURE MESHMAP=FlameTrackerM NUM=1 TEXTURE=Sk_FlameTracker01

#exec TEXTURE IMPORT NAME=Sk_FlameTracker02 FILE=SKINS\Sk_FlameTracker02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=FlameTracker NUM=2 TEXTURE=Sk_FlameTracker02
#exec MESHMAP SETTEXTURE MESHMAP=FlameTrackerR NUM=2 TEXTURE=Sk_FlameTracker02
#exec MESHMAP SETTEXTURE MESHMAP=FlameTrackerPick NUM=2 TEXTURE=Sk_FlameTracker02
#exec MESHMAP SETTEXTURE MESHMAP=FlameTrackerM NUM=2 TEXTURE=Sk_FlameTracker02

#exec TEXTURE IMPORT NAME=Sk_FlameTracker03 FILE=SKINS\Sk_FlameTracker03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=FlameTracker NUM=3 TEXTURE=Sk_FlameTracker03
#exec MESHMAP SETTEXTURE MESHMAP=FlameTrackerR NUM=3 TEXTURE=Sk_FlameTracker03
#exec MESHMAP SETTEXTURE MESHMAP=FlameTrackerPick NUM=3 TEXTURE=Sk_FlameTracker03
#exec MESHMAP SETTEXTURE MESHMAP=FlameTrackerM NUM=3 TEXTURE=Sk_FlameTracker03

#exec TEXTURE IMPORT NAME=Sk_FlameTracker04 FILE=SKINS\Sk_FlameTracker04.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=FlameTracker NUM=4 TEXTURE=Sk_FlameTracker04
#exec MESHMAP SETTEXTURE MESHMAP=FlameTrackerR NUM=4 TEXTURE=Sk_FlameTracker04
#exec MESHMAP SETTEXTURE MESHMAP=FlameTrackerPick NUM=4 TEXTURE=Sk_FlameTracker04
#exec MESHMAP SETTEXTURE MESHMAP=FlameTrackerM NUM=4 TEXTURE=Sk_FlameTracker04

#exec TEXTURE IMPORT NAME=HovenHeat FILE=SKINS\HovenHeat.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=FlameTracker NUM=5 TEXTURE=HovenHeat
#exec MESHMAP SETTEXTURE MESHMAP=FlameTrackerR NUM=5 TEXTURE=HovenHeat
#exec MESHMAP SETTEXTURE MESHMAP=FlameTrackerPick NUM=5 TEXTURE=HovenHeat
#exec MESHMAP SETTEXTURE MESHMAP=FlameTrackerM NUM=5 TEXTURE=HovenHeat

#exec TEXTURE IMPORT NAME=FlameTrackerMetal FILE=SKINS\FlameTrackerMetal.bmp GROUP=Skins LODSET=2


//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=FlameTIcon FILE=ICONS\FlameTIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=FlameTCrossAlpha FILE=ICONS\FlameTCrossAlpha.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\FlameTIcons.utx PACKAGE=NWFlameTrackerVIII_SRC.Icons

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="FlameTSelect" FILE=SOUNDS\FlameTSelect.wav GROUP="FlameTracker"
#exec AUDIO IMPORT NAME="FlameTPickup" FILE=SOUNDS\FlameTPickup.wav GROUP="FlameTracker"
#exec AUDIO IMPORT NAME="Flamming" FILE=SOUNDS\Flamming.wav GROUP="FlameTracker"
#exec AUDIO IMPORT NAME="FlameTSteaming" FILE=SOUNDS\FlameTSteaming.wav GROUP="FlameTracker"
#exec AUDIO IMPORT NAME="FlameTNoLavaAmmo" FILE=SOUNDS\FlameTNoLavaAmmo.wav GROUP="FlameTracker"
#exec AUDIO IMPORT NAME="FlameTAltFire" FILE=SOUNDS\FlameTAltFire.wav GROUP="FlameTracker"

//HAND
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=FlameHandL ANIVFILE=MODELS\FlameHand_a.3d DATAFILE=MODELS\FlameHand_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FlameHandL STRENGTH=0
#exec MESH ORIGIN MESH=FlameHandL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=FlameHandR ANIVFILE=MODELS\FlameHand_a.3d DATAFILE=MODELS\FlameHand_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=FlameHandR STRENGTH=0
#exec MESH ORIGIN MESH=FlameHandR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=FlameHandL SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameHandL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameHandL SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameHandL SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameHandL SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameHandL SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameHandL SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FlameHandR SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameHandR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameHandR SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameHandR SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameHandR SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameHandR SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameHandR SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

//Scale
#exec MESHMAP NEW MESHMAP=FlameHandL MESH=FlameHandL
#exec MESHMAP SCALE MESHMAP=FlameHandL X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FlameHandR MESH=FlameHandR
#exec MESHMAP SCALE MESHMAP=FlameHandR X=0.0255 Y=0.0255 Z=0.051

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=FlameHandL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=FlameHandR NUM=1 TEXTURE=HumanHand

//===========================================================================

//MAIN OVERLAYER
//*******************************************************

//1st person
#exec MESH IMPORT MESH=FlameTOver ANIVFILE=MODELS\FlameTOver_a.3d DATAFILE=MODELS\FlameTOver_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FlameTOver STRENGTH=0
#exec MESH ORIGIN MESH=FlameTOver X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FlameTOverR ANIVFILE=MODELS\FlameTOver_a.3d DATAFILE=MODELS\FlameTOver_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=FlameTOverR STRENGTH=0
#exec MESH ORIGIN MESH=FlameTOverR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=FlameTOverPick ANIVFILE=MODELS\FlameTOver_a.3d DATAFILE=MODELS\FlameTOver_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=FlameTOverPick STRENGTH=0
#exec MESH ORIGIN MESH=FlameTOverPick X=0 Y=0 Z=0 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FlameTOver SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTOver SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTOver SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTOver SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTOver SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTOver SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTOver SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FlameTOverR SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTOverR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTOverR SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTOverR SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTOverR SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTOverR SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTOverR SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FlameTOverPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FlameTOver MESH=FlameTOver
#exec MESHMAP SCALE MESHMAP=FlameTOver X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FlameTOverR MESH=FlameTOverR
#exec MESHMAP SCALE MESHMAP=FlameTOverR X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FlameTOverPick MESH=FlameTOverPick
#exec MESHMAP SCALE MESHMAP=FlameTOverPick X=0.10625 Y=0.10625 Z=0.2125

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=FlameTOver01 FILE=OVERLAYERS\FlameTOver01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=FlameTOver NUM=1 TEXTURE=FlameTOver01
#exec MESHMAP SETTEXTURE MESHMAP=FlameTOverR NUM=1 TEXTURE=FlameTOver01
#exec MESHMAP SETTEXTURE MESHMAP=FlameTOverPick NUM=1 TEXTURE=FlameTOver01

#exec TEXTURE IMPORT NAME=FlameTOver02 FILE=OVERLAYERS\FlameTOver02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=FlameTOver NUM=2 TEXTURE=FlameTOver02
#exec MESHMAP SETTEXTURE MESHMAP=FlameTOverR NUM=2 TEXTURE=FlameTOver02
#exec MESHMAP SETTEXTURE MESHMAP=FlameTOverPick NUM=2 TEXTURE=FlameTOver02

#exec TEXTURE IMPORT NAME=HovenHeat FILE=SKINS\HovenHeat.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=FlameTOver NUM=3 TEXTURE=HovenHeat
#exec MESHMAP SETTEXTURE MESHMAP=FlameTOverR NUM=3 TEXTURE=HovenHeat
#exec MESHMAP SETTEXTURE MESHMAP=FlameTOverPick NUM=3 TEXTURE=HovenHeat

//===========================================================================

//MAIN GLOW
//*******************************************************

//1st person
#exec MESH IMPORT MESH=FlameTGlow ANIVFILE=MODELS\FlameTGlow_a.3d DATAFILE=MODELS\FlameTGlow_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FlameTGlow X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FlameTGlowR ANIVFILE=MODELS\FlameTGlow_a.3d DATAFILE=MODELS\FlameTGlow_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=FlameTGlowR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=FlameTGlowPick ANIVFILE=MODELS\FlameTGlow_a.3d DATAFILE=MODELS\FlameTGlow_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FlameTGlowPick X=0 Y=0 Z=0 Yaw=128

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FlameTGlow SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTGlow SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTGlow SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTGlow SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTGlow SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTGlow SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTGlow SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FlameTGlowR SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTGlowR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTGlowR SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTGlowR SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTGlowR SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTGlowR SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTGlowR SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FlameTGlowPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FlameTGlow MESH=FlameTGlow
#exec MESHMAP SCALE MESHMAP=FlameTGlow X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FlameTGlowR MESH=FlameTGlowR
#exec MESHMAP SCALE MESHMAP=FlameTGlowR X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FlameTGlowPick MESH=FlameTGlowPick
#exec MESHMAP SCALE MESHMAP=FlameTGlowPick X=0.10625 Y=0.10625 Z=0.2125

//Coronas
#exec TEXTURE IMPORT NAME=FlameTGlowLight FILE=Coronas\FlameTGlowLight.bmp GROUP=Coronas FLAGS=2

//===========================================================================

//FIRST PERSON SMOKE
//*******************************************************

//1st person
#exec MESH IMPORT MESH=FlameTHovenSmoke ANIVFILE=MODELS\FlameTHovenSmoke_a.3d DATAFILE=MODELS\FlameTHovenSmoke_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FlameTHovenSmoke X=0 Y=0 Z=0 Yaw=128

#exec MESH IMPORT MESH=FlameTHovenSmokeM ANIVFILE=MODELS\FlameTHovenSmokeM_a.3d DATAFILE=MODELS\FlameTHovenSmokeM_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FlameTHovenSmokeM X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FlameTHovenSmokeR ANIVFILE=MODELS\FlameTHovenSmoke_a.3d DATAFILE=MODELS\FlameTHovenSmoke_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=FlameTHovenSmokeR X=0 Y=0 Z=0

#exec MESH IMPORT MESH=FlameTHovenSmokeMR ANIVFILE=MODELS\FlameTHovenSmokeM_a.3d DATAFILE=MODELS\FlameTHovenSmokeM_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=FlameTHovenSmokeMR X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FlameTHovenSmoke SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTHovenSmoke SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTHovenSmoke SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTHovenSmoke SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTHovenSmoke SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTHovenSmoke SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTHovenSmoke SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FlameTHovenSmokeM SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTHovenSmokeM SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTHovenSmokeM SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTHovenSmokeM SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTHovenSmokeM SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTHovenSmokeM SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTHovenSmokeM SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FlameTHovenSmokeR SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTHovenSmokeR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTHovenSmokeR SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTHovenSmokeR SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTHovenSmokeR SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTHovenSmokeR SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTHovenSmokeR SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FlameTHovenSmokeMR SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTHovenSmokeMR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTHovenSmokeMR SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTHovenSmokeMR SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTHovenSmokeMR SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTHovenSmokeMR SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTHovenSmokeMR SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FlameTHovenSmoke MESH=FlameTHovenSmoke
#exec MESHMAP SCALE MESHMAP=FlameTHovenSmoke X=0.0255 Y=0.0324 Z=0.051

#exec MESHMAP NEW MESHMAP=FlameTHovenSmokeM MESH=FlameTHovenSmokeM
#exec MESHMAP SCALE MESHMAP=FlameTHovenSmokeM X=0.0255 Y=0.0324 Z=0.051

#exec MESHMAP NEW MESHMAP=FlameTHovenSmokeR MESH=FlameTHovenSmokeR
#exec MESHMAP SCALE MESHMAP=FlameTHovenSmokeR X=0.0255 Y=0.0324 Z=0.051

#exec MESHMAP NEW MESHMAP=FlameTHovenSmokeMR MESH=FlameTHovenSmokeMR
#exec MESHMAP SCALE MESHMAP=FlameTHovenSmokeMR X=0.0255 Y=0.0324 Z=0.051

//===========================================================================


var float SmkCount, SmkCCanvas, FlameCCanvas;
var float globalDelta;
var vector OldRenderLoc;
var rotator OldRenderRot;
var() float SmkCanvasUpdateFactor, FlameCanvasUpdateFactor;
var FlameTFireOver FireTOver;
var FlameTFireGlow FireTGlow;
var FlameTAltFireOver AltFireTOver;
var FlameTAltFireGlow AltFireTGlow;

struct HovenSmoke
{
	var Effects hSmk;
	var float LifeTime;
};

var HovenSmoke HovenSmk[24];
var HovenSmoke SuperFlames01[32];
var HovenSmoke SuperFlames02[32];
var HovenSmoke SuperFlames03[32];
var HovenSmoke SuperFlames04[32];
var HovenSmoke SuperFlames05[32];
var HovenSmoke SuperFlames06[32];
var() float SuperFlamesSpeed;

var float FlamesTime;


var(ServerConfig) config bool bAffectedByTemperature;
var(ServerConfig) config bool bBurnInstigator;
var(ServerConfig) config byte LavaAmmoConsumption;
var(ServerConfig) config bool BurnStaticObjects;
var(ServerConfig) config name NotInflamableObject[32];
var(ServerConfig) config byte LavaBlobsAmount;
var(ServerConfig) config float FlamesDamageRate, FlamesOutSpeed;
var(ServerConfig) config byte BodyFlamesDamage;
var bool bTooHot;
var float tempCount;

var(ClientConfig) config bool enableOverheatMsg;
var() localized string OverheatMsg;

var bool bAffTemp;

//Oversurrection configs
var(Oversurrection) config float OversurrectionLifeTime, OversurrectiveBlobsRate;
var(Oversurrection) config int OversurrectiveBlobsPerUpdate, OversurrectiveBlobsDamage;


replication
{
	reliable if (Role == ROLE_Authority && bNetOwner)
		bAffTemp;
}

function PreBeginPlay()
{
	Super.PreBeginPlay();
	bAffTemp = default.bAffectedByTemperature;
}

simulated function Tick(float Delta)
{
local float newFlameGlow;
local byte i;
local Effects efx;
local ZoneInfo HeadZone;

	Super.Tick(Delta);
	
	globalDelta = Delta;
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		SmkCount += Delta;
		if (SmkCount >= 0.1)
		{
			SmkCount = 0;
			
			if (Pawn(Owner) == None && !Region.Zone.bWaterZone && !bHidden)
			{
				efx = Spawn(Class'FlameTHovenSmoke',,, Location, Rotation);
				if (FRand() > 0.5)
					efx.Mesh = Mesh'FlameTHovenSmokePickM';
			}
		}
	}
	
	if (Pawn(Owner) == None || Pawn(Owner).Weapon != Self)
	{
		if (FireTOver != None)
			FireTOver.DesiredGlow = 0.0;
		if (FireTGlow != None)
			FireTGlow.DesiredGlow = 0.0;
		if (AltFireTOver != None)
			AltFireTOver.DesiredGlow = 0.0;
		if (AltFireTGlow != None)
			AltFireTGlow.DesiredGlow = 0.0;
			
		return;
	}
	
	if (Pawn(Owner).bFire != 0 && !Pawn(Owner).Region.Zone.bWaterZone && !bTooHot && !IsInState('DownWeapon') && 
	!IsInState('ClientAltFiring') && !IsInState('AltFiring'))
	{
		tempCount += Delta;
		if (tempCount >= 4.0 && !bTooHot)
			bTooHot = True;
	}
	else
	{
		tempCount -= Delta;
		
		if (tempCount < 0.75 && bTooHot)
			bTooHot = False;
		else if (tempCount < 0)
			tempCount = 0;
	}
	
	if (Level.NetMode != NM_DedicatedServer && PlayerPawn(Owner) != None)
	{
		HeadZone = PlayerPawn(Owner).HeadRegion.Zone;
		if (HeadZone != None && HeadZone.bWaterZone && !HeadZone.IsA('LavaZone') && HeadZone.DamageType != 'Burned')
			newFlameGlow = 0.15 + FRand()*0.35;
		else
			newFlameGlow = 0.75 + FRand()*0.95;
		
		if (FirstOverFXActor[0] != None)
			FirstOverFXActor[0].ScaleGlow = newFlameGlow;
			
		if (FirstGlowFXActor[0] != None)
			FirstGlowFXActor[0].ScaleGlow = newFlameGlow;
	}
}

simulated function RenderOther( canvas Canvas, vector Loc, rotator Rot)
{
local byte i;
local bool bSpawnedSmk, bSpawnedFlame;
local FlameTOutput ftout;
local vector LocDelta;
local rotator RotDelta;
local ZoneInfo HeadZone;

	if (PlayerPawn(Owner) == None)
		return;
	
	HeadZone = PlayerPawn(Owner).HeadRegion.Zone;
	if (HeadZone.bWaterZone && !HeadZone.IsA('LavaZone') && HeadZone.DamageType != 'Burned')
	{
		if (FireTOver != None)
		{
			FireTOver.DesiredGlow = 0.0;
			FireTOver.ScaleGlow = 0.0;
		}
		if (FireTGlow != None)
		{
			FireTGlow.DesiredGlow = 0.0;
			FireTGlow.ScaleGlow = 0.0;
		}
		if (AltFireTOver != None)
		{
			AltFireTOver.DesiredGlow = 0.0;
			AltFireTOver.ScaleGlow = 0.0;
		}
		if (AltFireTGlow != None)
		{
			AltFireTGlow.DesiredGlow = 0.0;
			AltFireTGlow.ScaleGlow = 0.0;
		}
	}
	else
	{
		if (FireTOver == None)
			FireTOver = Spawn(Class'FlameTFireOver',,, Loc, Rot);
		else
		{
			FireTOver.HandleMesh(PlayerPawn(Owner).Handedness != 1);
			if (PlayerPawn(Owner).bFire != 0 && !(bAffTemp && bTooHot) && !IsInState('DownWeapon') && 
			!IsInState('ClientAltFiring') && !IsInState('AltFiring'))
				FireTOver.DesiredGlow = 2.0;
			else
				FireTOver.DesiredGlow = 0.0;
			
			FireTOver.SetLocation(Loc);
			FireTOver.SetRotation(Rot);
			FireTOver.AnimSequence = AnimSequence;
			FireTOver.AnimFrame = AnimFrame;
			Canvas.DrawActor(FireTOver, False, False);
		}
		
		if (AltFireTOver == None)
			AltFireTOver = Spawn(Class'FlameTAltFireOver',,, Loc, Rot);
		else
		{
			AltFireTOver.HandleMesh(PlayerPawn(Owner).Handedness != 1);
			AltFireTOver.SetLocation(Loc);
			AltFireTOver.SetRotation(Rot);
			AltFireTOver.AnimSequence = AnimSequence;
			AltFireTOver.AnimFrame = AnimFrame;
			Canvas.DrawActor(AltFireTOver, False, False);
		}
		
		if (FireTGlow == None)
			FireTGlow = Spawn(Class'FlameTFireGlow',,, Loc, Rot);
		else
		{
			FireTGlow.HandleMesh(PlayerPawn(Owner).Handedness != 1);
			if (PlayerPawn(Owner).bFire != 0 && !(bAffTemp && bTooHot) && !IsInState('DownWeapon') && 
			!IsInState('ClientAltFiring') && !IsInState('AltFiring'))
				FireTGlow.DesiredGlow = 1.5;
			else
				FireTGlow.DesiredGlow = 0.0;
			
			FireTGlow.SetLocation(Loc);
			FireTGlow.SetRotation(Rot);
			FireTGlow.AnimSequence = AnimSequence;
			FireTGlow.AnimFrame = AnimFrame;
			Canvas.DrawActor(FireTGlow, False, False);
		}
		
		if (AltFireTGlow == None)
			AltFireTGlow = Spawn(Class'FlameTAltFireGlow',,, Loc, Rot);
		else
		{
			AltFireTGlow.HandleMesh(PlayerPawn(Owner).Handedness != 1);
			AltFireTGlow.SetLocation(Loc);
			AltFireTGlow.SetRotation(Rot);
			AltFireTGlow.AnimSequence = AnimSequence;
			AltFireTGlow.AnimFrame = AnimFrame;
			Canvas.DrawActor(AltFireTGlow, False, False);
		}
	}
	
	//Hoven smoke - Phase 1
	if (!HeadZone.bWaterZone || HeadZone.IsA('LavaZone') || HeadZone.DamageType == 'Burned')
		SmkCCanvas += globalDelta;
	
	if (SmkCCanvas >= 0.1)
	{
		i = 0;
		while (i < ArrayCount(HovenSmk) && !bSpawnedSmk)
		{
			if (HovenSmk[i].hSmk == None || HovenSmk[i].LifeTime <= 0)
			{
				HovenSmk[i].hSmk = Spawn(Class'FlameTHSmokeFirst',,, Loc, Rot);
				
				if (PlayerPawn(Owner).Handedness == 1)
				{
					if (FRand() > 0.5)
						HovenSmk[i].hSmk.Mesh = Mesh'FlameTHovenSmokeM';
					else
						HovenSmk[i].hSmk.Mesh = Mesh'FlameTHovenSmoke';
				}
				else if (FRand() > 0.5)
					HovenSmk[i].hSmk.Mesh = Mesh'FlameTHovenSmokeMR';
				
				HovenSmk[i].hSmk.AnimFrame = AnimFrame;
				HovenSmk[i].hSmk.AnimSequence = AnimSequence;
				
				HovenSmk[i].LifeTime = Class'FlameTHSmokeFirst'.default.LifeSpan;
				bSpawnedSmk = True;
			}
				
			i++;
		}
		
		SmkCCanvas = 0;
	}
	
	
	//SUPER FLAMES - Phase 1
	if (FlamesTime > 0)
	{
		if (HeadZone.bWaterZone && !HeadZone.IsA('LavaZone') && HeadZone.DamageType != 'Burned' && FlamesTime > 0.85)
			FlamesTime = 0.85;
		
		FlameCCanvas += globalDelta;
		FlamesTime -= globalDelta;
	}
		
	
	if (FlameCCanvas >= 0.065)
	{
		//SuperFlames - 01
		//-------------------------------------------
		i = 0;
		bSpawnedFlame = False;
		while (i < ArrayCount(SuperFlames01) && !bSpawnedFlame)
		{
			if (SuperFlames01[i].hSmk == None || SuperFlames01[i].LifeTime <= 0)
			{
				SuperFlames01[i].hSmk = Spawn(Class'FlameTOutput',,, Loc, Rot);
				
				ftout = FlameTOutput(SuperFlames01[i].hSmk);
				if (ftout != None)
				{
					ftout.RandomizeTexture(FlamesTime < 0.85);
					ftout.HandleMesh(PlayerPawn(Owner).Handedness != 1, True, True, True);
					
					if (PlayerPawn(Owner).Handedness == 1)
						ftout.SetSpeed( SuperFlamesSpeed, Normal((vect(0,1,1) >> Rot)));
					else
						ftout.SetSpeed( SuperFlamesSpeed, Normal((vect(0,-1,1) >> Rot)));
				}
				
				SuperFlames01[i].hSmk.AnimFrame = AnimFrame;
				SuperFlames01[i].hSmk.AnimSequence = AnimSequence;
				SuperFlames01[i].LifeTime = Class'FlameTOutput'.default.LifeSpan;
				bSpawnedFlame = True;
			}
			i++;
		}
		//-------------------------------------------
		
		//SuperFlames - 02
		//-------------------------------------------
		i = 0;
		bSpawnedFlame = False;
		while (i < ArrayCount(SuperFlames02) && !bSpawnedFlame)
		{
			if (SuperFlames02[i].hSmk == None || SuperFlames02[i].LifeTime <= 0)
			{
				SuperFlames02[i].hSmk = Spawn(Class'FlameTOutput',,, Loc, Rot);
				
				ftout = FlameTOutput(SuperFlames02[i].hSmk);
				if (ftout != None)
				{
					ftout.RandomizeTexture(FlamesTime < 0.85);
					ftout.HandleMesh(PlayerPawn(Owner).Handedness != 1, True, True, False);
					
					if (PlayerPawn(Owner).Handedness == 1)
						ftout.SetSpeed( SuperFlamesSpeed, Normal((vect(0,1,1) >> Rot)));
					else
						ftout.SetSpeed( SuperFlamesSpeed, Normal((vect(0,-1,1) >> Rot)));
				}
				
				SuperFlames02[i].hSmk.AnimFrame = AnimFrame;
				SuperFlames02[i].hSmk.AnimSequence = AnimSequence;
				SuperFlames02[i].LifeTime = Class'FlameTOutput'.default.LifeSpan;
				bSpawnedFlame = True;
			}
			i++;
		}
		//-------------------------------------------
		
		//SuperFlames - 03
		//-------------------------------------------
		i = 0;
		bSpawnedFlame = False;
		while (i < ArrayCount(SuperFlames03) && !bSpawnedFlame)
		{
			if (SuperFlames03[i].hSmk == None || SuperFlames03[i].LifeTime <= 0)
			{
				SuperFlames03[i].hSmk = Spawn(Class'FlameTOutput',,, Loc, Rot);
				
				ftout = FlameTOutput(SuperFlames03[i].hSmk);
				if (ftout != None)
				{
					ftout.RandomizeTexture(FlamesTime < 0.85);
					ftout.HandleMesh(PlayerPawn(Owner).Handedness != 1, True, False, True);
					
					if (PlayerPawn(Owner).Handedness == 1)
						ftout.SetSpeed( SuperFlamesSpeed, Normal((vect(0,-1,1) >> Rot)));
					else
						ftout.SetSpeed( SuperFlamesSpeed, Normal((vect(0,1,1) >> Rot)));
				}
				
				SuperFlames03[i].hSmk.AnimFrame = AnimFrame;
				SuperFlames03[i].hSmk.AnimSequence = AnimSequence;
				SuperFlames03[i].LifeTime = Class'FlameTOutput'.default.LifeSpan;
				bSpawnedFlame = True;
			}
			i++;
		}
		//-------------------------------------------
		
		//SuperFlames - 04
		//-------------------------------------------
		i = 0;
		bSpawnedFlame = False;
		while (i < ArrayCount(SuperFlames04) && !bSpawnedFlame)
		{
			if (SuperFlames04[i].hSmk == None || SuperFlames04[i].LifeTime <= 0)
			{
				SuperFlames04[i].hSmk = Spawn(Class'FlameTOutput',,, Loc, Rot);
				
				ftout = FlameTOutput(SuperFlames04[i].hSmk);
				if (ftout != None)
				{
					ftout.RandomizeTexture(FlamesTime < 0.85);
					ftout.HandleMesh(PlayerPawn(Owner).Handedness != 1, True, False, False);
					
					if (PlayerPawn(Owner).Handedness == 1)
						ftout.SetSpeed( SuperFlamesSpeed, Normal((vect(0,-1,1) >> Rot)));
					else
						ftout.SetSpeed( SuperFlamesSpeed, Normal((vect(0,1,1) >> Rot)));
				}
				
				SuperFlames04[i].hSmk.AnimFrame = AnimFrame;
				SuperFlames04[i].hSmk.AnimSequence = AnimSequence;
				SuperFlames04[i].LifeTime = Class'FlameTOutput'.default.LifeSpan;
				bSpawnedFlame = True;
			}
			i++;
		}
		//-------------------------------------------
		
		//SuperFlames - 05
		//-------------------------------------------
		i = 0;
		bSpawnedFlame = False;
		while (i < ArrayCount(SuperFlames05) && !bSpawnedFlame)
		{
			if (SuperFlames05[i].hSmk == None || SuperFlames05[i].LifeTime <= 0)
			{
				SuperFlames05[i].hSmk = Spawn(Class'FlameTOutput',,, Loc, Rot);
				
				ftout = FlameTOutput(SuperFlames05[i].hSmk);
				if (ftout != None)
				{
					ftout.RandomizeTexture(FlamesTime < 0.85);
					ftout.HandleMesh(PlayerPawn(Owner).Handedness != 1, False, True);
					
					if (PlayerPawn(Owner).Handedness == 1)
						ftout.SetSpeed( SuperFlamesSpeed, Normal((vect(0,1,-1) >> Rot)));
					else
						ftout.SetSpeed( SuperFlamesSpeed, Normal((vect(0,-1,-1) >> Rot)));
				}
				
				SuperFlames05[i].hSmk.AnimFrame = AnimFrame;
				SuperFlames05[i].hSmk.AnimSequence = AnimSequence;
				SuperFlames05[i].LifeTime = Class'FlameTOutput'.default.LifeSpan;
				bSpawnedFlame = True;
			}
			i++;
		}
		//-------------------------------------------
		
		//SuperFlames - 06
		//-------------------------------------------
		i = 0;
		bSpawnedFlame = False;
		while (i < ArrayCount(SuperFlames06) && !bSpawnedFlame)
		{
			if (SuperFlames06[i].hSmk == None || SuperFlames06[i].LifeTime <= 0)
			{
				SuperFlames06[i].hSmk = Spawn(Class'FlameTOutput',,, Loc, Rot);
				
				ftout = FlameTOutput(SuperFlames06[i].hSmk);
				if (ftout != None)
				{
					ftout.RandomizeTexture(FlamesTime < 0.85);
					ftout.HandleMesh(PlayerPawn(Owner).Handedness != 1, False, False);
					
					if (PlayerPawn(Owner).Handedness == 1)
						ftout.SetSpeed( SuperFlamesSpeed, Normal((vect(0,-1,-1) >> Rot)));
					else
						ftout.SetSpeed( SuperFlamesSpeed, Normal((vect(0,1,-1) >> Rot)));
				}
				
				SuperFlames06[i].hSmk.AnimFrame = AnimFrame;
				SuperFlames06[i].hSmk.AnimSequence = AnimSequence;
				SuperFlames06[i].LifeTime = Class'FlameTOutput'.default.LifeSpan;
				bSpawnedFlame = True;
			}
			i++;
		}
		//-------------------------------------------
		
		FlameCCanvas = 0;
	}
	
	//General update
	LocDelta = Loc - OldRenderLoc;
	RotDelta = Rot - OldRenderRot;
	
	//Hoven smoke - Phase 2
	for (i = 0; i < ArrayCount(HovenSmk); i++)
	{
		if (HovenSmk[i].hSmk != None && HovenSmk[i].LifeTime > 0)
		{
			if (HovenSmk[i].LifeTime < Class'FlameTHSmokeFirst'.default.LifeSpan)
			{
				HovenSmk[i].hSmk.Move(LocDelta*SmkCanvasUpdateFactor);
				HovenSmk[i].hSmk.SetRotation(HovenSmk[i].hSmk.Rotation + (RotDelta*SmkCanvasUpdateFactor));
			}
			
			HovenSmk[i].LifeTime -= globalDelta;
			Canvas.DrawActor(HovenSmk[i].hSmk, False, False);
		}
	}
	
	//SUPER FLAMES - Phase 2
	for (i = 0; i < ArrayCount(SuperFlames01); i++)
	{
		//SuperFlames - 01
		if (SuperFlames01[i].hSmk != None && SuperFlames01[i].LifeTime > 0)
		{
			if (SuperFlames01[i].LifeTime < Class'FlameTOutput'.default.LifeSpan)
			{
				SuperFlames01[i].hSmk.Move(LocDelta*FlameCanvasUpdateFactor);
				SuperFlames01[i].hSmk.SetRotation(SuperFlames01[i].hSmk.Rotation + (RotDelta*FlameCanvasUpdateFactor));
			}
			
			SuperFlames01[i].LifeTime -= globalDelta;
			Canvas.DrawActor(SuperFlames01[i].hSmk, False, False);
		}
		
		//SuperFlames - 02
		if (SuperFlames02[i].hSmk != None && SuperFlames02[i].LifeTime > 0)
		{
			if (SuperFlames02[i].LifeTime < Class'FlameTOutput'.default.LifeSpan)
			{
				SuperFlames02[i].hSmk.Move(LocDelta*FlameCanvasUpdateFactor);
				SuperFlames02[i].hSmk.SetRotation(SuperFlames02[i].hSmk.Rotation + (RotDelta*FlameCanvasUpdateFactor));
			}
			
			SuperFlames02[i].LifeTime -= globalDelta;
			Canvas.DrawActor(SuperFlames02[i].hSmk, False, False);
		}
		
		//SuperFlames - 03
		if (SuperFlames03[i].hSmk != None && SuperFlames03[i].LifeTime > 0)
		{
			if (SuperFlames03[i].LifeTime < Class'FlameTOutput'.default.LifeSpan)
			{
				SuperFlames03[i].hSmk.Move(LocDelta*FlameCanvasUpdateFactor);
				SuperFlames03[i].hSmk.SetRotation(SuperFlames03[i].hSmk.Rotation + (RotDelta*FlameCanvasUpdateFactor));
			}
			
			SuperFlames03[i].LifeTime -= globalDelta;
			Canvas.DrawActor(SuperFlames03[i].hSmk, False, False);
		}
		
		//SuperFlames - 04
		if (SuperFlames04[i].hSmk != None && SuperFlames04[i].LifeTime > 0)
		{
			if (SuperFlames04[i].LifeTime < Class'FlameTOutput'.default.LifeSpan)
			{
				SuperFlames04[i].hSmk.Move(LocDelta*FlameCanvasUpdateFactor);
				SuperFlames04[i].hSmk.SetRotation(SuperFlames04[i].hSmk.Rotation + (RotDelta*FlameCanvasUpdateFactor));
			}
			
			SuperFlames04[i].LifeTime -= globalDelta;
			Canvas.DrawActor(SuperFlames04[i].hSmk, False, False);
		}
		
		//SuperFlames - 05
		if (SuperFlames05[i].hSmk != None && SuperFlames05[i].LifeTime > 0)
		{
			if (SuperFlames05[i].LifeTime < Class'FlameTOutput'.default.LifeSpan)
			{
				SuperFlames05[i].hSmk.Move(LocDelta*FlameCanvasUpdateFactor);
				SuperFlames05[i].hSmk.SetRotation(SuperFlames05[i].hSmk.Rotation + (RotDelta*FlameCanvasUpdateFactor));
			}
			
			SuperFlames05[i].LifeTime -= globalDelta;
			Canvas.DrawActor(SuperFlames05[i].hSmk, False, False);
		}
		
		//SuperFlames - 06
		if (SuperFlames06[i].hSmk != None && SuperFlames06[i].LifeTime > 0)
		{
			if (SuperFlames06[i].LifeTime < Class'FlameTOutput'.default.LifeSpan)
			{
				SuperFlames06[i].hSmk.Move(LocDelta*FlameCanvasUpdateFactor);
				SuperFlames06[i].hSmk.SetRotation(SuperFlames06[i].hSmk.Rotation + (RotDelta*FlameCanvasUpdateFactor));
			}
			
			SuperFlames06[i].LifeTime -= globalDelta;
			Canvas.DrawActor(SuperFlames06[i].hSmk, False, False);
		}
	}
	
	//Final update
	OldRenderLoc = Loc;
	OldRenderRot = Rot;
}

function Fire( float Value )
{
local bool bHot;
local ZoneInfo ZInfo;

    if ( (AmmoType == None) && (AmmoName != None) )
        GiveAmmo(Pawn(Owner));
	
	bHot = (bAffTemp && bTooHot);
	if (bInfinity || (!bHot && AmmoType.UseAmmo(1)))
	{
		GotoState('NormalFire');
        bPointing=True;
        bCanClientFire = true;
        ClientFire(Value);

		ZInfo = Pawn(Owner).HeadRegion.Zone;
		if (!ZInfo.bWaterZone && !ZInfo.IsA('LavaZone') && ZInfo.DamageType != 'Burned')
			ProjectileFire(ProjectileClass, ProjectileSpeed, bWarnTarget);
	}
	else
		PlayNoAmmoFiring();
}

simulated function PlayFiring()
{
	FiringAmbSound = Default.FiringAmbSound;
	PlayAnim('NoAmmoAltFire', 10.0, 0.0);
}

simulated function PlayNoAmmoFiring()
{
	FiringAmbSound = Sound'FlameTSteaming';
	PlayAnim('NoAmmoAltFire', 10.0, 0.0);
	CheckClientOverheat();
}

simulated function bool ClientFire(float Value)
{
	CheckClientOverheat();
	Super.ClientFire(Value);
}

simulated function CheckClientOverheat()
{
	if (default.enableOverheatMsg && !bInfinity && bAffTemp && bTooHot && 
	Level.NetMode != NM_DedicatedServer && PlayerPawn(Owner) != None && PlayerPawn(Owner).myHUD != None)
		PlayerPawn(Owner).myHUD.LocalizedMessage(Class'NoAmmoStringPlus', 0, None, None, None, OverheatMsg);
}

function AltFire( float Value )
{
    if ((AmmoType == None) && (AmmoName != None))
        GiveAmmo(Pawn(Owner));

    if (bInfinity || AmmoType.AmmoAmount >= Default.LavaAmmoConsumption)
    {
		GotoState('AltFiring');
        bPointing=True;
        bCanClientFire = true;
        ClientAltFire(Value);
		if (!bInfinity)
			AmmoType.UseAmmo(Default.LavaAmmoConsumption);

        if ( bRapidFire || (FiringSpeed > 0) )
            Pawn(Owner).PlayRecoil(FiringSpeed);

        AltProjectileFire(AltProjectileClass, AltProjectileSpeed, bAltWarnTarget);
	}
	else
		PlayNoAmmoAltFiring();
}

simulated function bool CheckAmmo( bool bAltFire)
{
local ZoneInfo ZInfo;

	if (bAltFire)
		return (bInfinity || (AmmoType != None && AmmoType.AmmoAmount >= Default.LavaAmmoConsumption));
	else if (Pawn(Owner) != None)
	{
		ZInfo = Pawn(Owner).HeadRegion.Zone;
		return (!ZInfo.bWaterZone || ZInfo.IsA('LavaZone') || ZInfo.DamageType == 'Burned');
	}
	
	return False;
}

simulated function PlayAltFiring()
{
local ZoneInfo ZInfo;

	PlayAnim('AltFire', GetFirerateMult(True) * 0.5, 0.0);
	
	if (AltFireTOver != None)
		AltFireTOver.ScaleGLow = 2.0;
	if (AltFireTGlow != None)
		AltFireTGlow.ScaleGLow = 2.0;
	
	if (Pawn(Owner) != None)
	{
		ZInfo = Pawn(Owner).HeadRegion.Zone;
		if (!ZInfo.bWaterZone && !ZInfo.IsA('LavaZone') && ZInfo.DamageType != 'Burned')
		{
			FlamesTime = 2.0;
			PlayOwnedSound(AltFireSound, SLOT_None, Pawn(Owner).SoundDampening*1.5);
		}
		else
		{
			FlamesTime = 0.75;
			PlayOwnedSound(Sound'FlameTNoLavaAmmo', SLOT_None, Pawn(Owner).SoundDampening*1.5);
		}
	}
}

simulated function PlayNoAmmoAltFiring()
{
	Super.PlayNoAmmoAltFiring();
	PlayOwnedSound(Sound'FlameTNoLavaAmmo', SLOT_None, Pawn(Owner).SoundDampening*1.5);
	PlayAnim('NoAmmoAltFire', 5 * GetFirerateMult(True), 0.0);
	
	FlamesTime = 0.75;
}

simulated function PlaySelect()
{
	Super.PlaySelect();
	FlamesTime = 0.0;
}

simulated function Destroyed()
{
	if (FireTOver != None)
		FireTOver.Destroy();
	if (FireTGlow != None)
		FireTGlow.Destroy();
		
	FireTOver = None;
	FireTGlow = None;
	
	Super.Destroyed();
}

function float RateSelf( out int bUseAltMode )
{
	local float EnemyDist, Rating;
	local bool bRetreating;
	local vector EnemyDir;
	local Pawn P;

	P = Pawn(Owner);

	//No enemy, no need to fire
	if ( P.Enemy == None )
        return AIRating;

	//Don't recommend self if out of ammo or if owner is inside water
	if ( AmmoType.AmmoAmount <=0 || P.Region.Zone.bWaterZone)
        return -2;
	
	EnemyDir = P.Enemy.Location - Owner.Location; 
	EnemyDist = VSize(EnemyDir);

	//Don't recommend second mode if too close
	if (EnemyDist < 360*FMax(1.0, Splasher) || (!bInfinity && AmmoType.AmmoAmount < default.LavaAmmoConsumption))
		bUseAltMode = 0;
	else if (EnemyDist >= 800 * (default.FlamesOutSpeed/Class'FlamesT'.default.speed))
		bUseAltMode = 1;
	else
		bUseAltMode = int(FRand() + 0.175);

	//If enemy is on water, don't use this weapon, as it's useless underwater
	if (P.Enemy.Region.Zone.bWaterZone)
	{
		bUseAltMode = 0;
		return -2;
	}

	return (AIRating + FRand() * 0.05);
}


//Oversurrection
static function OversurrectorExplodeServer(TheOversProj ref, vector HitLocation, vector HitNormal)
{
local rotator R;

	if (ref == None)
		return;
	R = rotator(HitNormal);
	R.Roll = Rand(16384)*4;
	ref.Spawn(Class'FlameTGndEruption',,, HitLocation + HitNormal/4, R);
}

static simulated function OversurrectorExplodeClient(TheOversProj ref, vector HitLocation, vector HitNormal)
{
local FlameTBaseCloudMaster master;
local rotator R;
local vector Loc;

	Loc = HitLocation + HitNormal;
	if (ref == None)
		return;
	ref.Spawn(Class'FlameTInitShake',,, Loc);
	
	R.Yaw = Rand(16384);
	master = ref.Spawn(Class'FlameTBaseCloudMaster',,, Loc, R);
	ref.Spawn(Class'FlameTBaseCloud', master,, Loc, R);
	ref.Spawn(Class'FlameTBaseCloudB', master,, Loc, R);
	
}

static function bool hasOversurrectorFXFusion(byte i, optional out class<TheOversColoredFX> CFXClass)
{
	switch (i)
	{
		case 0:	CFXClass = Class'FlameTOversFXA';		break;
		case 1:	CFXClass = Class'FlameTOversFXB';		break;
		case 2:	CFXClass = Class'FlameTOversFXC';		break;
		case 3:	CFXClass = Class'FlameTOversFXD';		break;
	}
	return (i <= 3);
}


defaultproperties
{
    DrawType=DT_Mesh
    Mesh=FlameTrackerPick
	CollisionHeight=18.000000
	CollisionRadius=30.000000
	AutoSwitchPriority=3
	Icon=FlameTIcon
	InventoryGroup=3
	ItemArticle="a"
	ItemName="Flame Tracker"
	MaxDesireability=0.400000
	PickupMessage="You got the Flame Tracker."
	PickupSound=FlameTPickup
	PickupViewMesh=FlameTrackerPick
	PickupViewScale=1.000000
	PlayerViewMesh=FlameTrackerR
	PlayerViewOffset=(X=11.50000,Y=-6.000000,Z=-5.000000)
	WidePlayerViewOffset=(X=11.50000,Y=-6.000000,Z=-5.000000)
	PlayerViewScale=1.000000
	RespawnTime=30.000000
	StatusIcon=FlameTIcon
	ThirdPersonMesh=FlameTrackerM
	ThirdPersonScale=0.750000
	AltDamageType=Burned
	AltFireSound=FlameTAltFire
	AltProjectileClass=Class'FlamesTLavaProjBlob'
	AmmoName=Class'FlameTAmmo'
	bInstantHit=False
	bRapidFire=True
	DeathMessage="%o was burnt to death by %k's %w."
	FireSound=None
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=Burned
	NameColor=(R=255,G=0,B=0)
	PickupAmmoCount=40
	ProjectileClass=Class'FlamesT'
	SelectSound=FlameTSelect
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
	CustomCross=FlameTCross
	CustomCrossAlpha=FlameTCrossAlpha
	CrossHairScale=0.500000
	WeaponDescription="Classification: Portable melted rock container and flame thrower.\n\nPrimary Fire: Bathing the enemy in flames.\n\nSecondary Fire: Launch of heavy liquefied and extremely hot mix of nitrogen and rock (lava)."
	
	LightBrightness=100
	LightHue=0
	LightSaturation=0
	LightRadius=5
	LightType=LT_Steady
	
	Texture=FlameTrackerMetal
	
	PlayerViewMeshLeft=FlameTracker
	PlayerViewMeshRight=FlameTrackerR
	HandPartMeshL(0)=FlameHandL
	HandPartMeshR(0)=FlameHandR
	BobDamping=1.075000
	FireOffset=(X=0.000000,Y=0.000000,Z=3.25000)
	
	RenderOffsetSelect=(Y=-2.500000,Z=-2.000000)
	AnimMaxFrame=0.857129
	RenderOffsetFire=(X=-0.150000,Y=-0.150000)
	AnimMaxFrameFire=0.750000
	RenderOffsetAltFire=(X=-1.500000)
	AnimMaxFrameAltFire=0.941176
	
	FirstPersonOverFX(0)=(bLit=True,OverTex1=Texture'FlameTOver01')
	FirstPersonOverFX(0)=(OverTex2=Texture'FlameTOver02',OverTex3=Texture'HovenHeat')
	FirstPersonOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000)
	FirstPersonOverFX(0)=(bCustomMesh=True,CustomMesh=Mesh'FlameTOverR',CustomMeshLeft=Mesh'FlameTOver')
	
	PickupOverFX(0)=(bLit=True,OverTex1=Texture'FlameTOver01')
	PickupOverFX(0)=(OverTex2=Texture'FlameTOver02',OverTex3=Texture'HovenHeat')
	PickupOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000)
	PickupOverFX(0)=(bCustomMesh=True,CustomMesh=Mesh'FlameTOverPick',OverlModelClass=Class'FlameTOverPickupFX')
	
	
	FirstPersonGlowFX(0)=(bRenderOnTop=True,bLit=True,GlowModel=Mesh'FlameTGlowR',GlowModelLeft=Mesh'FlameTGlow')
	FirstPersonGlowFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.045000)
	FirstPersonGlowFX(0)=(GlowTex1=Texture'FlameTGlowLight')
	
	PickupGlowFX(0)=(bLit=True,GlowModel=Mesh'FlameTGlowPick')
	PickupGlowFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.500000,GlowTexScale=0.187500)
	PickupGlowFX(0)=(GlowTex1=Texture'FlameTGlowLight',GlowSetClass=Class'FlameTOverPickupFX')
	
	SmkCanvasUpdateFactor=0.995000
	FiringAmbSound=Sound'Flamming'
	FiringSndVol=255
	FiringSndRadius=96
	
	bHighFireRate=True
	SuperFlamesSpeed=10.000000
	FlameCanvasUpdateFactor=0.995000
	
	LavaAmmoConsumption=10
	NoAltAmmoMsgString="Insufficient X-Fuel !"
	
	NotInflamableObject(0)=FortStandard
	NotInflamableObject(1)=Cybot
	
	bBurnInstigator=False
	LavaBlobsAmount=3
	FlamesDamageRate=5.000000
	FlamesOutSpeed=850.000000
	BurnStaticObjects=True
	BodyFlamesDamage=2
	
	OverheatMsg="OVERHEAT!"
	enableOverheatMsg=True
	
	
	bOversurrective=True
	OversurrectorShellColor=(R=255,G=0,B=0)
	OversurrectorFXColors(0)=(R=255,G=0,B=0)
	OversurrectorFXColors(1)=(R=255,G=32,B=0)
	OversurrectorFXColors(2)=(R=196,G=32,B=0)
	OversurrectorFXColors(3)=(R=255,G=0,B=0)
	OversurrectorFXColors(4)=(R=255,G=8,B=0)
	OversurrectorFXColors(5)=(R=255,G=24,B=0)
	OversurrectorFXColors(6)=(R=255,G=48,B=0)
	OversurrectorFXColors(7)=(R=255,G=48,B=0)
	OversurrectorFXColors(8)=(R=255,G=48,B=0)
	OversurrectorFXColors(9)=(R=255,G=96,B=0)
	OversurrectorFXColors(10)=(R=255,G=96,B=0)
	OversurrectorFXColors(11)=(R=255,G=0,B=0)
	OversurrectorFXColors(12)=(R=128,G=0,B=0)
	OversurrectorFXColors(13)=(R=255,G=0,B=0)
	OversurrectorFXColors(14)=(R=255,G=24,B=0)
	OversurrectorFXColors(15)=(R=255,G=40,B=0)
	OversurrectorFXColors(16)=(R=255,G=64,B=0)
	OversurrectorFXColors(17)=(R=255,G=64,B=0)
	OversurrectorFXColors(18)=(R=255,G=16,B=0)
	OversurrectorFXColors(19)=(R=128,G=32,B=0)
	OversurrectorFXColors(20)=(R=255,G=0,B=0)
	OversurrectorFXColors(21)=(R=255,G=20,B=0)
	OversurrectorFXColors(22)=(R=255,G=8,B=0)
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
	
	OversurrectorProjClass=Class'FlameTOversProj'
	
	
	enableOversurrection=True
	OversurrectionLifeTime=10.000000
	OversurrectiveBlobsRate=15.000000
	OversurrectiveBlobsPerUpdate=3
	OversurrectiveBlobsDamage=500
}
