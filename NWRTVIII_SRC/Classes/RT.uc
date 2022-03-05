//////////////////////////////////////////////////////////////
//	Nali Weapons III Razored Translocator weapon
//				Feralidragon (10-03-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RT expands NaliWeapons config(NWeaponsCfg);

//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=RT ANIVFILE=MODELS\RT_a.3d DATAFILE=MODELS\RT_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=RT STRENGTH=0
#exec MESH ORIGIN MESH=RT X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=RTR ANIVFILE=MODELS\RT_a.3d DATAFILE=MODELS\RT_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTR STRENGTH=0
#exec MESH ORIGIN MESH=RTR X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=RTPick ANIVFILE=MODELS\RT_a.3d DATAFILE=MODELS\RT_d.3d X=0 Y=0 Z=0 UNMIRROR=1
//#exec MESH LODPARAMS MESH=RTPick STRENGTH=0
#exec MESH ORIGIN MESH=RTPick X=0 Y=0 Z=0

//3rd person
#exec MESH IMPORT MESH=RTM ANIVFILE=MODELS\RT_a.3d DATAFILE=MODELS\RT_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTM STRENGTH=0.45
#exec MESH ORIGIN MESH=RTM X=-165 Y=0 Z=-25

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=RT SEQ=All STARTFRAME=0 NUMFRAMES=81
#exec MESH SEQUENCE MESH=RT SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RT SEQ=ChangeToRazor STARTFRAME=0 NUMFRAMES=9 RATE=8.0
#exec MESH SEQUENCE MESH=RT SEQ=ChangeToNormal STARTFRAME=8 NUMFRAMES=9 RATE=8.0
#exec MESH SEQUENCE MESH=RT SEQ=Fire STARTFRAME=17 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=RT SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RT SEQ=StillNormal STARTFRAME=38 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RT SEQ=StillRazor STARTFRAME=40 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RT SEQ=SelectNormal STARTFRAME=48 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RT SEQ=DownNormal STARTFRAME=42 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=RT SEQ=SelectRazor STARTFRAME=61 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RT SEQ=DownRazor STARTFRAME=55 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=RT SEQ=SelectEmpty STARTFRAME=74 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RT SEQ=DownEmpty STARTFRAME=68 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=RTR SEQ=All STARTFRAME=0 NUMFRAMES=81
#exec MESH SEQUENCE MESH=RTR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTR SEQ=ChangeToRazor STARTFRAME=0 NUMFRAMES=9 RATE=8.0
#exec MESH SEQUENCE MESH=RTR SEQ=ChangeToNormal STARTFRAME=8 NUMFRAMES=9 RATE=8.0
#exec MESH SEQUENCE MESH=RTR SEQ=Fire STARTFRAME=17 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=RTR SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTR SEQ=StillNormal STARTFRAME=38 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTR SEQ=StillRazor STARTFRAME=40 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTR SEQ=SelectNormal STARTFRAME=48 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTR SEQ=DownNormal STARTFRAME=42 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=RTR SEQ=SelectRazor STARTFRAME=61 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTR SEQ=DownRazor STARTFRAME=55 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=RTR SEQ=SelectEmpty STARTFRAME=74 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTR SEQ=DownEmpty STARTFRAME=68 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=RTPick SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTPick SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTPick SEQ=ChangeToRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTPick SEQ=ChangeToNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTPick SEQ=Fire STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTPick SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTPick SEQ=StillNormal STARTFRAME=38 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTPick SEQ=StillRazor STARTFRAME=40 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTPick SEQ=SelectNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTPick SEQ=DownNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTPick SEQ=SelectRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTPick SEQ=DownRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTPick SEQ=SelectEmpty STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTPick SEQ=DownEmpty STARTFRAME=17 NUMFRAMES=1

#exec MESH SEQUENCE MESH=RTM SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTM SEQ=ChangeToRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTM SEQ=ChangeToNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTM SEQ=Fire STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTM SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTM SEQ=StillNormal STARTFRAME=38 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTM SEQ=StillRazor STARTFRAME=40 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTM SEQ=SelectNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTM SEQ=DownNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTM SEQ=SelectRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTM SEQ=DownRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTM SEQ=SelectEmpty STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTM SEQ=DownEmpty STARTFRAME=17 NUMFRAMES=1

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=RT MESH=RT
#exec MESHMAP SCALE MESHMAP=RT X=0.025 Y=0.025 Z=0.05

#exec MESHMAP NEW MESHMAP=RTR MESH=RTR
#exec MESHMAP SCALE MESHMAP=RTR X=0.025 Y=0.025 Z=0.05

#exec MESHMAP NEW MESHMAP=RTPick MESH=RTPick
#exec MESHMAP SCALE MESHMAP=RTPick X=0.1 Y=0.1 Z=0.2

#exec MESHMAP NEW MESHMAP=RTM MESH=RTM
#exec MESHMAP SCALE MESHMAP=RTM X=0.05 Y=0.05 Z=0.1

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=Sk_RT_01 FILE=SKINS\Sk_RT_01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=RT NUM=1 TEXTURE=Sk_RT_01
#exec MESHMAP SETTEXTURE MESHMAP=RTR NUM=1 TEXTURE=Sk_RT_01
#exec MESHMAP SETTEXTURE MESHMAP=RTPick NUM=1 TEXTURE=Sk_RT_01
#exec MESHMAP SETTEXTURE MESHMAP=RTM NUM=1 TEXTURE=Sk_RT_01

#exec TEXTURE IMPORT NAME=Sk_RT_02 FILE=SKINS\Sk_RT_02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=RT NUM=2 TEXTURE=Sk_RT_02
#exec MESHMAP SETTEXTURE MESHMAP=RTR NUM=2 TEXTURE=Sk_RT_02
#exec MESHMAP SETTEXTURE MESHMAP=RTPick NUM=2 TEXTURE=Sk_RT_02
#exec MESHMAP SETTEXTURE MESHMAP=RTM NUM=2 TEXTURE=Sk_RT_02

#exec TEXTURE IMPORT NAME=Sk_RT_03 FILE=SKINS\Sk_RT_03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=RT NUM=3 TEXTURE=Sk_RT_03
#exec MESHMAP SETTEXTURE MESHMAP=RTR NUM=3 TEXTURE=Sk_RT_03
#exec MESHMAP SETTEXTURE MESHMAP=RTPick NUM=3 TEXTURE=Sk_RT_03
#exec MESHMAP SETTEXTURE MESHMAP=RTM NUM=3 TEXTURE=Sk_RT_03

#exec TEXTURE IMPORT NAME=Sk_RT_04 FILE=SKINS\Sk_RT_04.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=RT NUM=4 TEXTURE=Sk_RT_04
#exec MESHMAP SETTEXTURE MESHMAP=RTR NUM=4 TEXTURE=Sk_RT_04
#exec MESHMAP SETTEXTURE MESHMAP=RTPick NUM=4 TEXTURE=Sk_RT_04
#exec MESHMAP SETTEXTURE MESHMAP=RTM NUM=4 TEXTURE=Sk_RT_04

#exec TEXTURE IMPORT NAME=RT_Metal FILE=SKINS\RT_Metal.bmp GROUP=Skins LODSET=2

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=RTIcon FILE=ICONS\RTIcon.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=RTCrossAlpha FILE=ICONS\RTCrossAlpha.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec OBJ LOAD FILE=Textures\RTIcons.utx PACKAGE=NWRTVIII_SRC.Icons

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="RTSelect" FILE=SOUNDS\RTSelect.wav GROUP="RT"
#exec AUDIO IMPORT NAME="RTPick" FILE=SOUNDS\RTPick.wav GROUP="RT"
#exec AUDIO IMPORT NAME="RTComeback" FILE=SOUNDS\RTComeback.wav GROUP="RT"
#exec AUDIO IMPORT NAME="RTFireNormal" FILE=SOUNDS\RTFireNormal.wav GROUP="RT"
#exec AUDIO IMPORT NAME="RTFireRazor" FILE=SOUNDS\RTFireRazor.wav GROUP="RT"
#exec AUDIO IMPORT NAME="RTRazorOff" FILE=SOUNDS\RTRazorOff.wav GROUP="RT"
#exec AUDIO IMPORT NAME="RTRazorOn" FILE=SOUNDS\RTRazorOn.wav GROUP="RT"
#exec AUDIO IMPORT NAME="RTTeleportNormal" FILE=SOUNDS\RTTeleportNormal.wav GROUP="RT"
#exec AUDIO IMPORT NAME="RTTeleportUT2k4" FILE=SOUNDS\RTTeleportUT2k4.wav GROUP="RT"
#exec AUDIO IMPORT NAME="RTTeleportUT3" FILE=SOUNDS\RTTeleportUT3.wav GROUP="RT"
#exec AUDIO IMPORT NAME="RTTeleportElectric" FILE=SOUNDS\RTTeleportElectric.wav GROUP="RT"
#exec AUDIO IMPORT NAME="RTTeleportDiscrete" FILE=SOUNDS\RTTeleportDiscrete.wav GROUP="RT"
#exec AUDIO IMPORT NAME="RTTeleportOverload" FILE=SOUNDS\RTTeleportOverload.wav GROUP="RT"


//HAND
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=RTHandL ANIVFILE=MODELS\RTHand_a.3d DATAFILE=MODELS\RTHand_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=RTHandL STRENGTH=0
#exec MESH ORIGIN MESH=RTHandL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=RTHandR ANIVFILE=MODELS\RTHand_a.3d DATAFILE=MODELS\RTHand_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTHandR STRENGTH=0
#exec MESH ORIGIN MESH=RTHandR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTHandL SEQ=All STARTFRAME=0 NUMFRAMES=81
#exec MESH SEQUENCE MESH=RTHandL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTHandL SEQ=ChangeToRazor STARTFRAME=0 NUMFRAMES=9 RATE=8.0
#exec MESH SEQUENCE MESH=RTHandL SEQ=ChangeToNormal STARTFRAME=8 NUMFRAMES=9 RATE=8.0
#exec MESH SEQUENCE MESH=RTHandL SEQ=Fire STARTFRAME=17 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=RTHandL SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTHandL SEQ=StillNormal STARTFRAME=38 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTHandL SEQ=StillRazor STARTFRAME=40 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTHandL SEQ=SelectNormal STARTFRAME=48 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTHandL SEQ=DownNormal STARTFRAME=42 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=RTHandL SEQ=SelectRazor STARTFRAME=61 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTHandL SEQ=DownRazor STARTFRAME=55 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=RTHandL SEQ=SelectEmpty STARTFRAME=74 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTHandL SEQ=DownEmpty STARTFRAME=68 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=RTHandR SEQ=All STARTFRAME=0 NUMFRAMES=81
#exec MESH SEQUENCE MESH=RTHandR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTHandR SEQ=ChangeToRazor STARTFRAME=0 NUMFRAMES=9 RATE=8.0
#exec MESH SEQUENCE MESH=RTHandR SEQ=ChangeToNormal STARTFRAME=8 NUMFRAMES=9 RATE=8.0
#exec MESH SEQUENCE MESH=RTHandR SEQ=Fire STARTFRAME=17 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=RTHandR SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTHandR SEQ=StillNormal STARTFRAME=38 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTHandR SEQ=StillRazor STARTFRAME=40 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTHandR SEQ=SelectNormal STARTFRAME=48 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTHandR SEQ=DownNormal STARTFRAME=42 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=RTHandR SEQ=SelectRazor STARTFRAME=61 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTHandR SEQ=DownRazor STARTFRAME=55 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=RTHandR SEQ=SelectEmpty STARTFRAME=74 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTHandR SEQ=DownEmpty STARTFRAME=68 NUMFRAMES=7 RATE=30.0

//Scale
#exec MESHMAP NEW MESHMAP=RTHandL MESH=RTHandL
#exec MESHMAP SCALE MESHMAP=RTHandL X=0.025 Y=0.025 Z=0.05

#exec MESHMAP NEW MESHMAP=RTHandR MESH=RTHandR
#exec MESHMAP SCALE MESHMAP=RTHandR X=0.025 Y=0.025 Z=0.05

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=RTHandL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=RTHandR NUM=1 TEXTURE=HumanHand

//===========================================================================

//OV RAZOR
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=RTOVFirstRazorL ANIVFILE=MODELS\RTOVFirstRazor_a.3d DATAFILE=MODELS\RTOVFirstRazor_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=RTOVFirstRazorL STRENGTH=0
#exec MESH ORIGIN MESH=RTOVFirstRazorL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=RTOVFirstRazorR ANIVFILE=MODELS\RTOVFirstRazor_a.3d DATAFILE=MODELS\RTOVFirstRazor_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTOVFirstRazorR STRENGTH=0
#exec MESH ORIGIN MESH=RTOVFirstRazorR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTOVFirstRazorL SEQ=All STARTFRAME=0 NUMFRAMES=81
#exec MESH SEQUENCE MESH=RTOVFirstRazorL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVFirstRazorL SEQ=ChangeToRazor STARTFRAME=0 NUMFRAMES=9 RATE=8.0
#exec MESH SEQUENCE MESH=RTOVFirstRazorL SEQ=ChangeToNormal STARTFRAME=8 NUMFRAMES=9 RATE=8.0
#exec MESH SEQUENCE MESH=RTOVFirstRazorL SEQ=Fire STARTFRAME=17 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=RTOVFirstRazorL SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVFirstRazorL SEQ=StillNormal STARTFRAME=38 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTOVFirstRazorL SEQ=StillRazor STARTFRAME=40 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTOVFirstRazorL SEQ=SelectNormal STARTFRAME=48 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTOVFirstRazorL SEQ=DownNormal STARTFRAME=42 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=RTOVFirstRazorL SEQ=SelectRazor STARTFRAME=61 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTOVFirstRazorL SEQ=DownRazor STARTFRAME=55 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=RTOVFirstRazorL SEQ=SelectEmpty STARTFRAME=74 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTOVFirstRazorL SEQ=DownEmpty STARTFRAME=68 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=RTOVFirstRazorR SEQ=All STARTFRAME=0 NUMFRAMES=81
#exec MESH SEQUENCE MESH=RTOVFirstRazorR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVFirstRazorR SEQ=ChangeToRazor STARTFRAME=0 NUMFRAMES=9 RATE=8.0
#exec MESH SEQUENCE MESH=RTOVFirstRazorR SEQ=ChangeToNormal STARTFRAME=8 NUMFRAMES=9 RATE=8.0
#exec MESH SEQUENCE MESH=RTOVFirstRazorR SEQ=Fire STARTFRAME=17 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=RTOVFirstRazorR SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVFirstRazorR SEQ=StillNormal STARTFRAME=38 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTOVFirstRazorR SEQ=StillRazor STARTFRAME=40 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTOVFirstRazorR SEQ=SelectNormal STARTFRAME=48 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTOVFirstRazorR SEQ=DownNormal STARTFRAME=42 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=RTOVFirstRazorR SEQ=SelectRazor STARTFRAME=61 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTOVFirstRazorR SEQ=DownRazor STARTFRAME=55 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=RTOVFirstRazorR SEQ=SelectEmpty STARTFRAME=74 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTOVFirstRazorR SEQ=DownEmpty STARTFRAME=68 NUMFRAMES=7 RATE=30.0

//Scale
#exec MESHMAP NEW MESHMAP=RTOVFirstRazorL MESH=RTOVFirstRazorL
#exec MESHMAP SCALE MESHMAP=RTOVFirstRazorL X=0.025 Y=0.025 Z=0.05

#exec MESHMAP NEW MESHMAP=RTOVFirstRazorR MESH=RTOVFirstRazorR
#exec MESHMAP SCALE MESHMAP=RTOVFirstRazorR X=0.025 Y=0.025 Z=0.05

//===========================================================================

// NO TRANS STILL
//*******************************************************

//Pickup
#exec MESH IMPORT MESH=RTNoTransStillPick ANIVFILE=MODELS\RTNoTransStill_a.3d DATAFILE=MODELS\RTNoTransStill_d.3d X=0 Y=0 Z=0 UNMIRROR=1
//#exec MESH LODPARAMS MESH=RTNoTransStillPick STRENGTH=0
#exec MESH ORIGIN MESH=RTNoTransStillPick X=0 Y=0 Z=0

//3rd person
#exec MESH IMPORT MESH=RTNoTransStillM ANIVFILE=MODELS\RTNoTransStill_a.3d DATAFILE=MODELS\RTNoTransStill_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTNoTransStillM STRENGTH=0.45
#exec MESH ORIGIN MESH=RTNoTransStillM X=-165 Y=0 Z=-25

//Animations
#exec MESH SEQUENCE MESH=RTNoTransStillPick SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTNoTransStillM SEQ=Still STARTFRAME=0 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=RTNoTransStillPick MESH=RTNoTransStillPick
#exec MESHMAP SCALE MESHMAP=RTNoTransStillPick X=0.1 Y=0.1 Z=0.2

#exec MESHMAP NEW MESHMAP=RTNoTransStillM MESH=RTNoTransStillM
#exec MESHMAP SCALE MESHMAP=RTNoTransStillM X=0.05 Y=0.05 Z=0.1

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=RTNoTransStillPick NUM=1 TEXTURE=Sk_RT_01
#exec MESHMAP SETTEXTURE MESHMAP=RTNoTransStillM NUM=1 TEXTURE=Sk_RT_01

#exec MESHMAP SETTEXTURE MESHMAP=RTNoTransStillPick NUM=2 TEXTURE=Sk_RT_02
#exec MESHMAP SETTEXTURE MESHMAP=RTNoTransStillM NUM=2 TEXTURE=Sk_RT_02

#exec MESHMAP SETTEXTURE MESHMAP=RTNoTransStillPick NUM=3 TEXTURE=Sk_RT_03
#exec MESHMAP SETTEXTURE MESHMAP=RTNoTransStillM NUM=3 TEXTURE=Sk_RT_03

//===========================================================================

var(ServerConfig) config bool canDropTranslocator;
var(ServerConfig) config bool canDisruptNormalTrans, canDisruptRazorTrans;
var(ServerConfig) config bool canDisruptNormalByInstigator, canDisruptRazorByInstigator;
var(ServerConfig) config int TransNormalDisruptDmg, TransRazorDisruptDmg;
var(ServerConfig) config int TransRazorDamage, TransRazorHeadshotDamage;
var(ServerConfig) config bool enableTransRazorHeadshot;
var(ServerConfig) config bool enableRazorTeleport;
var(ServerConfig) config float TranslocatorNormalSpeed, TranslocatorRazorSpeed;
var(ServerConfig) config float RelaunchDelayNormal, RelaunchDelayRazor;
var(ServerConfig) config bool enableNormalHitSound, enableRazorHitSound;
var(ServerConfig) config bool enableNormalAmbSound, enableRazorAmbSound;
var(ServerConfig) config bool enableNormalTelefrag, enableRazorTelefrag;
var(ServerConfig) config bool enableNormalTeleportShake, enableRazorTeleportShake;
var(ServerConfig) config bool enableNormalAffectFOV, enableRazorAffectFOV;
var(ServerConfig) config byte TeleFOVNormal, TeleFOVRazor;

var(ServerConfig) config name NoTelefragList[16];
var int maxTelefragListClasses;

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

enum E_TType
{
	TTP_NormalOnly,
	TTP_RazorOnly,
	TTP_Both,
};

var(ServerConfig) config E_TType TranslocatorType;

enum E_TSndEffect
{
	TSND_Discrete,
	TSND_Electric,
	TSND_Normal,
	TSND_UT2k4,
	TSND_UT3,
	TSND_Overload,
	TSND_Silent
};

var(ServerConfig) config E_TSndEffect TeleportSoundNormal, TeleportSoundRazor;

enum E_TFXEffect
{
	TFX_None,
	TFX_Standard,
	TFX_FX1,
	TFX_FX2
};

var(ServerConfig) config E_TFXEffect TeleportFXNormal, TeleportFXRazor;
var(ClientConfig) config bool enableTeleportFXSmartPerformance;


var() name SelectRTAnim[3], DownRTAnim[3];
var() name ChangeTransTypeAnim[2];
var() name TransStillAnim[3];
var() sound ChangeTransTypeSnd[2];
var() sound FireSnd[2], ComebackSnd, TeleportSnd[6];
var(RTOV) float FxSectionsUpNormalTime, FxSectionsUpRazorTime, FxSectionsDownNormalTime, FxSectionsDownRazorTime;
var(RTOV) float FxMainNormalTime, FxMainRazorTime;
var() mesh NoTransPickupViewMesh, NoTransThirdPersonMesh;
var() class<RTTransAI> TransAIClass;

var() class<RTTrans> TranslocatorClass[2];

enum E_TStatus
{
	TS_Normal,
	TS_Razor,
	TS_Empty
};

var E_TStatus TransStatus, CanvasCurTransStatus, PreFireTransStatus;

var RTOVFirst OVFirstMainTop, OVFirstMainBottom, OVFirstTop[6], OVFirstBottom[6];
var RTOVPick OVPickMainTop, OVPickMainBottom, OVPickTop[6], OVPickBottom[6];
var RTComebackFX rtCmbk;

var RTTransAI TransAI;
var RTTrans RTTarget;
var Actor DesiredTarget;
var E_TType TType;
var Pawn OldPawnOwner;
var float RelaunchDelays[2];
var E_TFXEffect ClientTeleFXNormal, ClientTeleFXRazor;
var bool isComingBack;
var RTBloodFirstOV BloodFirstOV;
var texture HighBlood[3], LowBlood[3];
var bool bRazorTeleport;

//Oversurrection configs
var(Oversurrection) config float OversurrectionLifeTime;
var(Oversurrection) config int OversurrectionHeadshotDmg, OversurrectionNormalDmg;


replication
{
	reliable if (Role == ROLE_Authority && bNetOwner)
		RelaunchDelays, ClientTeleFXNormal, ClientTeleFXRazor;
	unreliable if (Role == ROLE_Authority && bNetOwner)
		HighBlood, LowBlood;
	reliable if (Role == ROLE_Authority)
		TransStatus, PreFireTransStatus, TType, bRazorTeleport, RTTarget;
	reliable if (Role < ROLE_Authority)
		CleanRazor;
	reliable if (Role == ROLE_Authority)
		ClientPlayTransPickupAnim, PlayClientTeleportSound;
}


exec function CleanRazor()
{
local RT rtweap;
local byte i;

	if (Pawn(Owner) == None)	return;

	rtweap = RT(Pawn(Owner).Weapon);
	if (rtweap != None)
	{
		for (i = 0; i < ArrayCount(HighBlood); i++)
			HighBlood[i] = None;
		for (i = 0; i < ArrayCount(LowBlood); i++)
			LowBlood[i] = None;
	}
	
	if (RTTarget != None)
	{
		for (i = 0; i < ArrayCount(RTTarget.BloodOV); i++)
		{
			if (RTTarget.BloodOV[i] != None)
			{
				RTTarget.BloodOV[i].Destroy();
				RTTarget.BloodOV[i] = None;
			}
		}
	}
}

function PreBeginPlay()
{
	TType = default.TranslocatorType;
	if (TType < TTP_Both)
	{
		TransStatus = EnumTypeToStatus(TType);
		PreFireTransStatus = TransStatus;
	}
	
	RelaunchDelays[0] = FMax(0.1, default.RelaunchDelayNormal);
	RelaunchDelays[1] = FMax(0.1, default.RelaunchDelayRazor);
	ClientTeleFXNormal = default.TeleportFXNormal;
	ClientTeleFXRazor = default.TeleportFXRazor;
	bCanThrow = default.canDropTranslocator;
	bRazorTeleport = default.enableRazorTeleport;
	LoadLists();
	
	Super.PreBeginPlay();
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	SpawnOverlayers();
	if (TType == TTP_RazorOnly)
		PlayAnim(TransStillAnim[1], 5.0, 0.0);
}

simulated function PostNetBeginPlay()
{
	Super.PostNetBeginPlay();
	if (TType == TTP_RazorOnly)
		PlayAnim(TransStillAnim[1], 5.0, 0.0);
}

function LoadLists()
{
local int i;

	maxTelefragListClasses = ArrayCount(NoTelefragList);
	maxBloodItems = ArrayCount(ObjectsBlood);
	
	if (default.bOptimizeLists)
	{
		for (i = 0; i < ArrayCount(NoTelefragList); i++)
		{
			if (NoTelefragList[i] == '')
			{
				maxTelefragListClasses = i;
				break;
			}
		}
		
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

function ToggleTStatus(out E_TStatus setVar)
{
	if (TType < TTP_Both)
	{
		setVar = EnumTypeToStatus(TType);
		return;
	}
		
	if (setVar == TS_Normal)
		setVar = TS_Razor;
	else if (setVar == TS_Razor)
		setVar = TS_Normal;
}

function SetTStatus(E_TStatus newStatus, out E_TStatus setVar)
{
	if ((TType==TTP_NormalOnly && newStatus==TS_Razor) || (TType==TTP_RazorOnly && newStatus==TS_Normal))
		return;
	setVar = newStatus;
}

simulated function ClientToggleTStatus(out E_TStatus setVar)
{
	if (TType < TTP_Both)
	{
		setVar = EnumTypeToStatus(TType);
		return;
	}
		
	if (setVar == TS_Normal)
		setVar = TS_Razor;
	else if (setVar == TS_Razor)
		setVar = TS_Normal;
}

simulated function ClientSetTStatus(E_TStatus newStatus, out E_TStatus setVar)
{
	if ((TType==TTP_NormalOnly && newStatus==TS_Razor) || (TType==TTP_RazorOnly && newStatus==TS_Normal))
		return;
	setVar = newStatus;
}

simulated function E_TStatus EnumTypeToStatus(E_TType t)
{
	switch (t)
	{
		case TTP_NormalOnly:	return TS_Normal;
		case TTP_RazorOnly: 	return TS_Razor;
	}
	return TS_Normal;
}

function GiveTo(Pawn Other)
{
	Super.GiveTo(Other);
	if (RTTarget != None)
		RTTarget.SetTransInstigator(Other);
	if (Class'NWUtils'.static.isValidBot(Other))
		GiveTransAI(Other);
	OldPawnOwner = Other;
}

function GiveTransAI(Pawn P)
{
local Inventory Inv;

	if (P == None)
		return;
	
	if (TransAI != None)
	{
		for (Inv = P.Inventory; Inv != None; Inv = Inv.Inventory)
		{
			if (Inv == TransAI)
				return;
		}

		if (Pawn(TransAI.Owner) != None)
			Pawn(TransAI.Owner).DeleteInventory(TransAI);
		TransAI.Destroy();
		TransAI = None;
	}
	
	TransAI = Spawn(TransAIClass);
	TransAI.GiveTo(P);
	TransAI.TransToNotify = Self;
}

function InitializeBlood(RTTrans RTT)
{
local byte i;

	if (RTT == None || !RTT.bRazor)
		return;

	for (i = 0; i < ArrayCount(HighBlood); i++)
	{
		if (HighBlood[i] != None)
			RTT.GiveBlood(True, i, HighBlood[i]);
	}
	
	for (i = 0; i < ArrayCount(LowBlood); i++)
	{
		if (LowBlood[i] != None)
			RTT.GiveBlood(False, i, LowBlood[i]);
	}
}

function UpdateBlood(texture BldTex, bool bHighBlood, byte slot)
{
	if (bHighBlood)
		HighBlood[slot] = BldTex;
	else
		LowBlood[slot] = BldTex;
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

function SpawnOverlayers()
{
local byte i;

	//Upper main section
	OVPickMainTop = Spawn(Class'RTOVPick', Self);
	OVPickMainTop.setOV(0, True, True);
	OVPickMainTop.setOVTimeCycle(FxMainNormalTime);
	OVPickMainTop.setGlowType(1);
	OVPickMainTop.setTeam(PTeam);
	
	//Lower main section
	OVPickMainBottom = Spawn(Class'RTOVPick', Self);
	OVPickMainBottom.setOV(0, False, True);
	OVPickMainBottom.setOVTimeCycle(FxMainNormalTime);
	OVPickMainBottom.setGlowType(1);
	OVPickMainBottom.setTeam(PTeam);
	
	//Upper 6 sections
	for (i = 0; i < ArrayCount(OVPickTop); i++)
	{
		OVPickTop[i] = Spawn(Class'RTOVPick', Self);
		OVPickTop[i].setOV(i, True);
		OVPickTop[i].setOVTimeCycle(FxSectionsUpNormalTime);
		OVPickTop[i].setOVAngleOffset((6.f - i/6.f) * 2.f*PI);
		OVPickTop[i].setTeam(PTeam);
	}
	
	//Lower 6 sections
	for (i = 0; i < ArrayCount(OVPickBottom); i++)
	{
		OVPickBottom[i] = Spawn(Class'RTOVPick', Self);
		OVPickBottom[i].setOV(i, False);
		OVPickBottom[i].setOVTimeCycle(FxSectionsDownNormalTime);
		OVPickBottom[i].setOVAngleOffset(i/6.f * 2.f*PI);
		OVPickBottom[i].setTeam(PTeam);
	}
}

function UpdatePickupOVStatus(byte ovID, bool bTop, bool bMain)
{
local bool getHidden;
local byte team;
local Pawn P;

	if (Pawn(Owner) != None)
		P = Pawn(Owner);
	else
		P = OldPawnOwner;

	if (P != None && P.PlayerReplicationInfo != None && P.PlayerReplicationInfo.Team < 4)
		team = P.PlayerReplicationInfo.Team;

	getHidden = (TransStatus == TS_Empty);
	if (bMain)
	{
		if (TransStatus == TS_Normal)
		{
			if (bTop && OVPickMainTop != None)
			{
				OVPickMainTop.setOVTimeCycle(FxMainNormalTime);
				OVPickMainTop.setGlowType(1);
				OVPickMainTop.setTeam(team);
			}
			else if (OVPickMainBottom != None)
			{
				OVPickMainBottom.setOVTimeCycle(FxMainNormalTime);
				OVPickMainBottom.setGlowType(1);
				OVPickMainBottom.setTeam(team);
			}
		}
		else if (TransStatus == TS_Razor)
		{
			if (bTop && OVPickMainTop != None)
			{
				OVPickMainTop.setOVTimeCycle(FxMainRazorTime);
				OVPickMainTop.setGlowType(2);
				OVPickMainTop.setTeam(team);
			}
			else if (OVPickMainBottom != None)
			{
				OVPickMainBottom.setOVTimeCycle(FxMainRazorTime);
				OVPickMainBottom.setGlowType(2);
				OVPickMainBottom.setTeam(team);
			}
		}
		
		if (OVPickMainTop != None)
			OVPickMainTop.forceBHidden = getHidden;
		if (OVPickMainBottom != None)
			OVPickMainBottom.forceBHidden = getHidden;
		
		return;
	}
	
	if (ovID >= ArrayCount(OVPickTop))
		return;
	
	if (bTop)
	{
		if (TransStatus == TS_Normal)
		{
			OVPickTop[ovID].setOVTimeCycle(FxSectionsUpNormalTime);
			OVPickTop[ovID].setOVAngleOffset((6.f - ovID/6.f) * 2.f*PI);
			OVPickTop[ovID].setTeam(team);
		}
		else if (TransStatus == TS_Razor)
		{
			OVPickTop[ovID].setOVTimeCycle(FxSectionsUpRazorTime);
			OVPickTop[ovID].setOVAngleOffset(ovID/6.f * 2.f*PI);
			OVPickTop[ovID].setTeam(team);
		}
		
		if (OVPickTop[ovID] != None)
			OVPickTop[ovID].forceBHidden = getHidden;
	}
	else
	{
		if (TransStatus == TS_Normal)
		{
			OVPickBottom[ovID].setOVTimeCycle(FxSectionsDownNormalTime);
			OVPickBottom[ovID].setOVAngleOffset(ovID/6.f * 2.f*PI);
			OVPickBottom[ovID].setTeam(team);
		}
		else if (TransStatus == TS_Razor)
		{
			OVPickBottom[ovID].setOVTimeCycle(FxSectionsDownRazorTime);
			OVPickBottom[ovID].setOVAngleOffset(ovID/6.f * 2.f*PI);
			OVPickBottom[ovID].setTeam(team);
		}
		
		if (OVPickBottom[ovID] != None)
			OVPickBottom[ovID].forceBHidden = getHidden;
	}
}

simulated function RenderOther(canvas Canvas, vector Loc, rotator Rot)
{
local byte i;
local bool isTeam;

	if (PlayerPawn(Owner) == None || PlayerPawn(Owner).PlayerReplicationInfo == None)
		return;
	
	if (CanvasCurTransStatus < TS_Empty)
	{
		//Blood render
		if (hasBlood())
			RenderBlood(Canvas, Loc, Rot);
		
		//Device comeback fx
		if (isComingBack)
		{
			isComingBack = False;
			if ((CanvasCurTransStatus == TS_Normal && ClientTeleFXNormal >= TFX_FX1) || 
			(CanvasCurTransStatus == TS_Razor && ClientTeleFXRazor >= TFX_FX1))
			{
				if (rtCmbk == None || rtCmbk.bDeleteMe)
					rtCmbk = Spawn(Class'RTComebackFX',,, Loc, Rot);
					
				isTeam = ((CanvasCurTransStatus == TS_Normal && ClientTeleFXNormal == TFX_FX2) || 
					(CanvasCurTransStatus == TS_Razor && ClientTeleFXRazor == TFX_FX2));
				
				rtCmbk.initFX(RelaunchDelays[CanvasCurTransStatus]/GetFirerateMult(), isTeam);
				if (isTeam)
					rtCmbk.setTeam(PlayerPawn(Owner).PlayerReplicationInfo.Team);
			}
		}
		
		if (rtCmbk != None)
		{
			if (!rtCmbk.bDeleteMe)
			{
				rtCmbk.HandleMesh(PlayerPawn(Owner).Handedness != 1);
				rtCmbk.SetLocation(Loc);
				rtCmbk.SetRotation(Rot);
				rtCmbk.AnimSequence = AnimSequence;
				rtCmbk.AnimFrame = AnimFrame;
				Canvas.DrawActor(rtCmbk, False, False);
			}
			else
				rtCmbk = None;
		}
		
		//Upper main section
		if (OVFirstMainTop == None)
		{
			OVFirstMainTop = Spawn(Class'RTOVFirst',,, Loc, Rot);
			OVFirstMainTop.setOV(0, True, True);
			OVFirstMainTop.setOVTimeCycle(FxMainNormalTime);
			OVFirstMainTop.setGlowType(1);
		}
		
		if (CanvasCurTransStatus != TransStatus)
		{
			if (TransStatus == TS_Normal)
			{
				OVFirstMainTop.setOVTimeCycle(FxMainNormalTime);
				OVFirstMainTop.setGlowType(1);
			}
			else if (TransStatus == TS_Razor)
			{
				OVFirstMainTop.setOVTimeCycle(FxMainRazorTime);
				OVFirstMainTop.setGlowType(2);
			}
		}
		
		OVFirstMainTop.setTeam(PlayerPawn(Owner).PlayerReplicationInfo.Team);
		OVFirstMainTop.HandleMesh(PlayerPawn(Owner).Handedness != 1);
		OVFirstMainTop.SetLocation(Loc);
		OVFirstMainTop.SetRotation(Rot);
		OVFirstMainTop.AnimSequence = AnimSequence;
		OVFirstMainTop.AnimFrame = AnimFrame;
		Canvas.DrawActor(OVFirstMainTop, False, False);
		
		
		//Lower main section
		if (OVFirstMainBottom == None)
		{
			OVFirstMainBottom = Spawn(Class'RTOVFirst',,, Loc, Rot);
			OVFirstMainBottom.setOV(0, False, True);
			OVFirstMainBottom.setOVTimeCycle(FxMainNormalTime);
			OVFirstMainBottom.setGlowType(1);
		}
		
		if (CanvasCurTransStatus != TransStatus)
		{
			if (TransStatus == TS_Normal)
			{
				OVFirstMainBottom.setOVTimeCycle(FxMainNormalTime);
				OVFirstMainBottom.setGlowType(1);
			}
			else if (TransStatus == TS_Razor)
			{
				OVFirstMainBottom.setOVTimeCycle(FxMainRazorTime);
				OVFirstMainBottom.setGlowType(2);
			}
		}
		
		OVFirstMainBottom.setTeam(PlayerPawn(Owner).PlayerReplicationInfo.Team);
		OVFirstMainBottom.HandleMesh(PlayerPawn(Owner).Handedness != 1);
		OVFirstMainBottom.SetLocation(Loc);
		OVFirstMainBottom.SetRotation(Rot);
		OVFirstMainBottom.AnimSequence = AnimSequence;
		OVFirstMainBottom.AnimFrame = AnimFrame;
		Canvas.DrawActor(OVFirstMainBottom, False, False);
		
		
		//Upper 6 sections
		for (i = 0; i < ArrayCount(OVFirstTop); i++)
		{
			if (OVFirstTop[i] == None)
			{
				OVFirstTop[i] = Spawn(Class'RTOVFirst',,, Loc, Rot);
				OVFirstTop[i].setOV(i, True);
				OVFirstTop[i].setOVTimeCycle(FxSectionsUpNormalTime);
				OVFirstTop[i].setOVAngleOffset((6.f - i/6.f) * 2.f*PI);
			}
			
			if (CanvasCurTransStatus != TransStatus)
			{
				if (TransStatus == TS_Normal)
				{
					OVFirstTop[i].setOVTimeCycle(FxSectionsUpNormalTime);
					OVFirstTop[i].setOVAngleOffset((6.f - i/6.f) * 2.f*PI);
				}
				else if (TransStatus == TS_Razor)
				{
					OVFirstTop[i].setOVTimeCycle(FxSectionsUpRazorTime);
					OVFirstTop[i].setOVAngleOffset(i/6.f * 2.f*PI);
				}
			}
			OVFirstTop[i].setTeam(PlayerPawn(Owner).PlayerReplicationInfo.Team);
			OVFirstTop[i].HandleMesh(PlayerPawn(Owner).Handedness != 1);
			OVFirstTop[i].SetLocation(Loc);
			OVFirstTop[i].SetRotation(Rot);
			OVFirstTop[i].AnimSequence = AnimSequence;
			OVFirstTop[i].AnimFrame = AnimFrame;
			Canvas.DrawActor(OVFirstTop[i], False, False);
		}
		
		//Lower 6 sections
		for (i = 0; i < ArrayCount(OVFirstBottom); i++)
		{
			if (OVFirstBottom[i] == None)
			{
				OVFirstBottom[i] = Spawn(Class'RTOVFirst',,, Loc, Rot);
				OVFirstBottom[i].setOV(i, False);
				OVFirstBottom[i].setOVTimeCycle(FxSectionsDownNormalTime);
				OVFirstBottom[i].setOVAngleOffset(i/6.f * 2.f*PI);
			}
			
			if (CanvasCurTransStatus != TransStatus)
			{
				if (TransStatus == TS_Normal)
				{
					OVFirstBottom[i].setOVTimeCycle(FxSectionsDownNormalTime);
					OVFirstBottom[i].setOVAngleOffset(i/6.f * 2.f*PI);
				}
				else if (TransStatus == TS_Razor)
				{
					OVFirstBottom[i].setOVTimeCycle(FxSectionsDownRazorTime);
					OVFirstBottom[i].setOVAngleOffset(i/6.f * 2.f*PI);
				}
			}
			OVFirstBottom[i].setTeam(PlayerPawn(Owner).PlayerReplicationInfo.Team);
			OVFirstBottom[i].HandleMesh(PlayerPawn(Owner).Handedness != 1);
			OVFirstBottom[i].SetLocation(Loc);
			OVFirstBottom[i].SetRotation(Rot);
			OVFirstBottom[i].AnimSequence = AnimSequence;
			OVFirstBottom[i].AnimFrame = AnimFrame;
			Canvas.DrawActor(OVFirstBottom[i], False, False);
		}
	}
	
	ClientSetTStatus(TransStatus, CanvasCurTransStatus);
}

simulated function RenderBlood(canvas Canvas, vector Loc, rotator Rot)
{
local byte i;

	if (BloodFirstOV == None)
		BloodFirstOV = Spawn(Class'RTBloodFirstOV');

	BloodFirstOV.HandleMesh(PlayerPawn(Owner).Handedness != 1);
	BloodFirstOV.SetLocation(Loc);
	BloodFirstOV.SetRotation(Rot);
	BloodFirstOV.AnimSequence = AnimSequence;
	BloodFirstOV.AnimFrame = AnimFrame;
	
	for (i = 0; i < ArrayCount(HighBlood); i++)
	{
		if (HighBlood[i] != None)
		{
			BloodFirstOV.MultiSkins[1] = HighBlood[i];
			Canvas.DrawActor(BloodFirstOV, False, False);
		}
	}
	
	for (i = 0; i < ArrayCount(LowBlood); i++)
	{
		if (LowBlood[i] != None)
		{
			BloodFirstOV.MultiSkins[1] = LowBlood[i];
			Canvas.DrawActor(BloodFirstOV, False, False);
		}
	}
}

simulated function bool hasBlood()
{
local byte i;

	for (i = 0; i < ArrayCount(HighBlood); i++)
	{
		if (HighBlood[i] != None)
			return True;
	}
	
	for (i = 0; i < ArrayCount(LowBlood); i++)
	{
		if (LowBlood[i] != None)
			return True;
	}
	
	return False;
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	if (Class'NWUtils'.static.isValidBot(Pawn(Owner)) && TransAI != None && Role == ROLE_Authority && RTTarget != None && TransAI.TTarget != None)
		TransAI.TTarget.SetLocation(RTTarget.Location);
}

simulated function PlaySelect()
{
	bForceFire = false;
    bForceAltFire = false;
    bCanClientFire = false;
    if ((!IsAnimating() || GetAnimGroup(AnimSequence) != 'Select') && Mesh != PickupViewMesh && Mesh != ThirdPersonMesh)
        PlayAnim(SelectRTAnim[TransStatus],1.0,0.0);
	
	if (Owner != None)
		Owner.PlaySound(SelectSound, SLOT_Misc, Pawn(Owner).SoundDampening);  

	if (Role == ROLE_Authority && Class'NWInfo'.default.bWeaponsDynLight)
		LightType = Default.LightType;
}

simulated function TweenDown()
{
    if (IsAnimating() && AnimSequence != '' && GetAnimGroup(AnimSequence) == 'Select')
        TweenAnim(AnimSequence, AnimFrame * 0.4);
    else
        PlayAnim(DownRTAnim[TransStatus], 1.0, 0.05);
	LightType = LT_None;
}

simulated function TweenToStill()
{
	TweenAnim(TransStillAnim[TransStatus], 0.1);
}

simulated function Destroyed()
{
local byte i;

	for (i = 0; i < ArrayCount(OVFirstTop); i++)
	{
		if (OVFirstTop[i] != None)
			OVFirstTop[i].Destroy();
		OVFirstTop[i] = None;
	}
	
	for (i = 0; i < ArrayCount(OVFirstBottom); i++)
	{
		if (OVFirstBottom[i] != None)
			OVFirstBottom[i].Destroy();
		OVFirstBottom[i] = None;
	}
	
	for (i = 0; i < ArrayCount(OVPickTop); i++)
	{
		if (OVPickTop[i] != None)
			OVPickTop[i].Destroy();
		OVPickTop[i] = None;
	}
	
	for (i = 0; i < ArrayCount(OVPickBottom); i++)
	{
		if (OVPickBottom[i] != None)
			OVPickBottom[i].Destroy();
		OVPickBottom[i] = None;
	}
	
	if (BloodFirstOV != None)
		BloodFirstOV.Destroy();
	if (rtCmbk != None)
		rtCmbk.Destroy();
	if (OVFirstMainTop != None)
		OVFirstMainTop.Destroy();
	if (OVFirstMainBottom != None)
		OVFirstMainBottom.Destroy();
	if (OVPickMainTop != None)
		OVPickMainTop.Destroy();
	if (OVPickMainBottom != None)
		OVPickMainBottom.Destroy();
	if (RTTarget != None)
		RTTarget.Destroy();
	if (TransAI != None)
		TransAI.Destroy();
		
	BloodFirstOV = None;
	rtCmbk = None;
	OVFirstMainTop = None;
	OVFirstMainBottom = None;
	OVPickMainTop = None;
	OVPickMainBottom = None;
	RTTarget = None;
	TransAI = None;

	Super.Destroyed();
}

simulated function SetTransInvisibility(bool bInvisible)
{
	if (bInvisible)
	{
		PickupViewMesh = NoTransPickupViewMesh;
		ThirdPersonMesh = NoTransThirdPersonMesh;
		if (Mesh == default.PickupViewMesh)
			Mesh = NoTransPickupViewMesh;
	}
	else
	{
		PickupViewMesh = default.PickupViewMesh;
		ThirdPersonMesh = default.ThirdPersonMesh;
		if (Mesh == NoTransPickupViewMesh)
			Mesh = default.PickupViewMesh;
	}
}


function Fire(float Value)
{
	HandleFire(Value);
}

function HandleFire(optional float Value)
{	
	GotoState('NormalFire');
	bPointing = True;
	bCanClientFire = True;
	ClientFire(Value);
	
	if (bRapidFire || FiringSpeed > 0)
		Pawn(Owner).PlayRecoil(FiringSpeed);

	if (TransStatus < TS_Empty)
	{
		RTTarget = RTTrans(ProjectileFire(TranslocatorClass[TransStatus], ProjectileSpeed, bWarnTarget));
		if (RTTarget != None)
		{
			SetTStatus(TS_Empty, TransStatus);
			RTTarget.SetMaster(Self);
			InitializeBlood(RTTarget);
			if (Class'NWUtils'.static.isValidBot(Pawn(Owner)) && !RTTarget.bRazor)
				RTTarget.SetCollisionSize(0,0);
		}
	}
	else
		ReturnRTTarget();
	
	SetTransInvisibility(TransStatus==TS_Empty);
}

simulated function HandleClientFire()
{
	if (TransStatus < TS_Empty)
		ClientSetTStatus(TS_Empty, TransStatus);
	SetTransInvisibility(TransStatus==TS_Empty);
}

function ReturnRTTarget()
{
	if (RTTarget != None && RTTarget.bDisrupted)
	{
		PlayTeleportSound();
		if (Pawn(Owner) != None)
			Pawn(Owner).gibbedBy(RTTarget.Disruptor);
	}
	
	SetTStatus(PreFireTransStatus, TransStatus);
	DestroyRTTarget();
}

function Projectile ProjectileFire(class<projectile> ProjClass, float ProjSpeed, bool bWarn)
{
local Vector Start;
local Pawn PawnOwner;
local Projectile projT;

    PawnOwner = Pawn(Owner);
    Owner.MakeNoise(PawnOwner.SoundDampening);
	
	if (Class'NWUtils'.static.isValidBot(Pawn(Owner)))
	{
		if (TransAI != None)
			Start = Owner.Location + TransAI.CalcDrawOffset();
		else
			Start = Owner.Location + CalcDrawOffset();
		Pawn(Owner).ViewRotation = Pawn(Owner).AdjustToss(default.TranslocatorNormalSpeed, Start, 0, True, True);
		AdjustedAim = Pawn(Owner).ViewRotation;
	}
	else
	{
		Start = Owner.Location + CalcNewDrawOffset() + (FireOffset >> PawnOwner.ViewRotation); 
		AdjustedAim = PawnOwner.AdjustAim(ProjSpeed, Start, AimError, True, bWarn);
	}
	
	projT = Spawn(ProjClass,,, Start, AdjustedAim);
	if (NaliProjectile(projT) != None)
	{
		NaliProjectile(projT).Kickback = Kickback;
		NaliProjectile(projT).HealthGiver = HealthGiver;
		NaliProjectile(projT).Splasher = Splasher;
		if (bHighFireRate)
			NaliProjectile(projT).MoreDamage = GetDamageMult() * GetFirerateMult();
		else
			NaliProjectile(projT).MoreDamage = GetDamageMult();
	}
	
    return projT;
}

simulated function PlayFiring()
{
	if (TransStatus < TS_Empty)
	{
		PlayAnim('Fire', 3.0, 0.0);
		PlayOwnedSound(FireSnd[TransStatus], SLOT_None, Pawn(Owner).SoundDampening*4.0);
	}
	else
	{
		PlayAnim(TransStillAnim[PreFireTransStatus], (1/RelaunchDelays[PreFireTransStatus])*GetFirerateMult(), 0.0);
		PlayOwnedSound(ComebackSnd, SLOT_None, Pawn(Owner).SoundDampening*4.0);
		isComingBack = True;
	}
	
	if (Role < ROLE_Authority)
		HandleClientFire();
}

function AltFire(float Value)
{
	GotoState('AltFiring');
	bPointing = True;
	bCanClientFire = true;
	ClientAltFire(Value);
	HandleAltFire();
}

simulated function HandleAltFire()
{
local bool bRetRTTarget;

	if (TransStatus < TS_Empty)
    {
		if (Role == ROLE_Authority)
		{
			ToggleTStatus(TransStatus);
			SetTStatus(TransStatus, PreFireTransStatus);
		}
		else
		{
			ClientToggleTStatus(TransStatus);
			ClientSetTStatus(TransStatus, PreFireTransStatus);
		}
	}
	else
	{
		bRetRTTarget = (RTTarget != None && RTTarget.bRazor && !bRazorTeleport);
		if (bRetRTTarget && Role == ROLE_Authority)
			ReturnRTTarget();
		else if (!bRetRTTarget)
		{
			if (Role == ROLE_Authority)
			{
				Translocate();
				SetTStatus(PreFireTransStatus, TransStatus);
			}
			else
				ClientSetTStatus(PreFireTransStatus, TransStatus);
		}
	}
	
	SetTransInvisibility(TransStatus==TS_Empty);
}

simulated function PlayAltFiring()
{
	if (TransStatus < TS_Empty && TType == TTP_Both)
	{
		PlayOwnedSound(ChangeTransTypeSnd[TransStatus], SLOT_None, Pawn(Owner).SoundDampening*1.5);
		PlayAnim(ChangeTransTypeAnim[TransStatus], 5.0, 0.0);
	}
	else
	{
		PlayAnim(TransStillAnim[PreFireTransStatus], (1/RelaunchDelays[PreFireTransStatus])*GetFirerateMult(True), 0.0);
		if (TType == TTP_Both || TransStatus == TS_Empty)
		{
			isComingBack = True;
			if (!bRazorTeleport && PreFireTransStatus == TS_Razor)
				PlayOwnedSound(ComebackSnd, SLOT_None, Pawn(Owner).SoundDampening*4.0);
		}
	}
	
	if (Role < ROLE_Authority)
		HandleAltFire();
}


simulated function ClientPlayTransPickupAnim()
{
	PlayAnim(TransStillAnim[PreFireTransStatus], (1/RelaunchDelays[PreFireTransStatus])*GetFirerateMult(), 0.0);
}

function Translocate()
{
local vector Dest, Start;
local Pawn P, POwner;
local E_TFXEffect TFX;

	if (RTTarget == None || RTTarget.bDeleteMe || Pawn(Owner)==None)
		return;

	Dest = RTTarget.Location;
	if (RTTarget.Physics == PHYS_None)
		Dest += (vect(0,0,1) * (Owner.CollisionHeight + 1));

	if (DeathMatchPlus(Level.Game) != None && !DeathMatchPlus(Level.Game).AllowTranslocation(Pawn(Owner), Dest))
		return;

	Start = Pawn(Owner).Location;
	RTTarget.SetCollision(False, False, False);
	if (!RTTarget.bRazor)
		TFX = TeleportFXNormal;
	else
		TFX = TeleportFXRazor;
	
	if (CheckTelefrag() && Pawn(Owner).SetLocation(Dest))
	{
		if (!Owner.Region.Zone.bWaterZone)
			Owner.SetPhysics(PHYS_Falling);
		if (RTTarget.bDisrupted)
		{
			PlayTeleportSound(Start);
			PlayTeleportEffectStart(TFX, Start, Dest);
			Pawn(Owner).gibbedBy(RTTarget.Disruptor);
			DestroyRTTarget();
			return;
		}

		if (!FastTrace(Pawn(Owner).Location, RTTarget.Location))
		{
			Pawn(Owner).SetLocation(Start);
			Owner.PlaySound(ComebackSnd, SLOT_Misc, 4 * Pawn(Owner).SoundDampening);
		}   
		else 
		{
			Owner.Velocity.X = 0;
			Owner.Velocity.Y = 0;
			POwner = Pawn(Owner);
			if (Class'NWUtils'.static.isValidBot(POwner))
			{
				if (NavigationPoint(RTTarget.DesiredTarget) != None && TranslocDest(RTTarget.DesiredTarget) == None)
					POwner.MoveTarget = RTTarget.DesiredTarget;
				POwner.bJumpOffPawn = True;
				if (!Owner.Region.Zone.bWaterZone && Bot(POwner) != None)
					Bot(POwner).SetFall();
			}
			else
			{
				// bots must re-acquire this player
				for (P = Level.PawnList; P != None; P = P.NextPawn)
				{
					if (P.Enemy == Owner && Bot(P) != None)
						Bot(P).LastAcquireTime = Level.TimeSeconds;
				}
			}

			PlayTeleportSound(Start);
			PlayTeleportEffectStart(TFX, Start, Dest);
			PlayTeleportEffectEnd(TFX, Start, Dest);
			if ((!RTTarget.bRazor && default.enableNormalTeleportShake) || (RTTarget.bRazor && default.enableRazorTeleportShake))
				Spawn(Class'RTTeleShake',,, Owner.Location);
			if (PlayerPawn(Owner) != None)
			{
				if (!RTTarget.bRazor && default.enableNormalAffectFOV && default.TeleFOVNormal > 10 && default.TeleFOVNormal < 180)
					PlayerPawn(Owner).SetFOVAngle(default.TeleFOVNormal);
				else if (RTTarget.bRazor && default.enableRazorAffectFOV && default.TeleFOVRazor > 10 && default.TeleFOVRazor < 180)
					PlayerPawn(Owner).SetFOVAngle(default.TeleFOVRazor);
			}
		}
	} 
	else if (RTTarget.bDisrupted)
	{
		PlayTeleportSound();
		Pawn(Owner).gibbedBy(RTTarget.Disruptor);
		DestroyRTTarget();
		return;
	}
	else
		Owner.PlaySound(ComebackSnd, SLOT_Misc, 4 * Pawn(Owner).SoundDampening);

	DestroyRTTarget();
	bPointing = True;
}

function DestroyRTTarget()
{
	if (RTTarget != None)
	{
		RTTarget.Destroy();
		RTTarget = None;
		if (TransAI != None && TransAI.TTarget != None)
		{
			TransAI.TTarget.Destroy();
			TransAI.TTarget = None;
		}
	}
}

function bool CheckTelefrag()
{
local int i;
local Actor A;
local Pawn P;
local float LTPDistXY, LTPDistZ;
local vector HitLoc, HitNorm;

	if (Pawn(Owner) == None || RTTarget == None)
		return False;
	if ((!RTTarget.bRazor && !default.enableNormalTelefrag) || (RTTarget.bRazor && !default.enableRazorTelefrag))
		return False;
	
	if (RTTarget.LastTouchedPawn != None)
	{
		P = RTTarget.LastTouchedPawn;
		LTPDistXY = VSize((P.Location - RTTarget.Location)*vect(1,1,0));
		LTPDistZ = VSize((P.Location - RTTarget.Location)*vect(0,0,1));
		if (LTPDistXY < (Owner.CollisionRadius + P.CollisionRadius) && LTPDistZ < (Owner.CollisionHeight + P.CollisionHeight))
			A = P;
	}
	
	if (Pawn(A) == None)
		A = RTTarget.Trace(HitLoc, HitNorm, RTTarget.Location + vect(0,0,1)*Owner.CollisionHeight, RTTarget.Location, True);
	if (Pawn(A) == None)
		A = RTTarget.Trace(HitLoc, HitNorm, RTTarget.Location - vect(0,0,1)*Owner.CollisionHeight, RTTarget.Location, True);
	if (Pawn(A) == None)
		return True;
	
	if (default.bInvertListsProcessing)
	{
		for (i = maxTelefragListClasses-1; i >= 0; i--)
		{
			if (NoTelefragList[i] != '' && A.IsA(NoTelefragList[i]))
				return False;
		}
	}
	else
	{
		for (i = 0; i < maxTelefragListClasses; i++)
		{
			if (NoTelefragList[i] != '' && A.IsA(NoTelefragList[i]))
				return False;
		}
	}
	return True;
}

function PlayTeleportEffectStart(E_TFXEffect TFX, vector Start, vector Dest)
{
local TranslocOutEffect e;
local RTTranslocateFX RTFX;
local byte t;

	if (TFX == TFX_None || Pawn(Owner) == None)
		return;
	
	if (TFX == TFX_Standard)
	{
		e = Spawn(class'TranslocOutEffect',,, Start, Owner.Rotation);
		e.Mesh = Owner.Mesh;
		e.Animframe = Owner.Animframe;
		e.Animsequence = Owner.Animsequence;
		e.Velocity = 900 * Normal(Dest - Start);
	}
	else if (TFX == TFX_FX1)
	{
		RTFX = Spawn(Class'RTTranslocateFX',,, Start, Owner.Rotation);
		RTFX.initFX(Owner.Mesh, Owner.AnimSequence, Owner.AnimFrame, Normal(Dest - Start));
	}
	else if (TFX == TFX_FX2)
	{
		RTFX = Spawn(Class'RTTranslocateFX',,, Start, Owner.Rotation);
		if (Pawn(Owner).PlayerReplicationInfo != None) 
			t = Pawn(Owner).PlayerReplicationInfo.Team;
		else t = 0;
		
		RTFX.initFX(Owner.Mesh, Owner.AnimSequence, Owner.AnimFrame, Normal(Dest - Start), True, t);
	}
}

function PlayTeleportEffectEnd(E_TFXEffect TFX, vector Start, vector Dest)
{
local UTTeleportEffect PTE;
local RTTranslocateDestFX RTFX;
local RTTranslocateEndFX rtFXEnd;
local byte t;

	if (TFX == TFX_None || Pawn(Owner) == None)
		return;
	
	if (TFX == TFX_Standard)
	{
		PTE = Spawn(class'UTTeleportEffect',,, Owner.Location, Owner.Rotation);
		PTE.Initialize(Pawn(Owner), True);
	}
	else if (TFX == TFX_FX1)
	{
		RTFX = Spawn(Class'RTTranslocateDestFX', Owner,, Owner.Location, Owner.Rotation);
		RTFX.initFX(Owner.Mesh);
		rtFXEnd = Spawn(Class'RTTranslocateEndMasterFX',,, Owner.Location - vect(0,0,32), rotator(vector(RotRand())*vect(1,1,0)));
		rtFXEnd.initFX();
	}
	else if (TFX == TFX_FX2)
	{
		RTFX = Spawn(Class'RTTranslocateDestFX', Owner,, Owner.Location, Owner.Rotation);
		if (Pawn(Owner).PlayerReplicationInfo != None) 
			t = Pawn(Owner).PlayerReplicationInfo.Team;
		else t = 0;
			
		RTFX.initFX(Owner.Mesh, True, t);
		rtFXEnd = Spawn(Class'RTTranslocateEndMasterFX',,, Owner.Location - vect(0,0,32), rotator(vector(RotRand())*vect(1,1,0)));
		rtFXEnd.initFX(True, t);
	}
}


function PlayTeleportSound(optional vector Start)
{
local sound sndToPlay;
local RTTeleSndGen sndGen;
local vector Dest;

	if (RTTarget == None || Pawn(Owner) == None)
		return;
	
	if (RTTarget.bDisrupted)
	{
		sndToPlay = RTTarget.DisruptGibSnd;
		RTTarget.MakeNoise(1.5);
	}
	else if (!RTTarget.bRazor && TeleportSoundNormal < TSND_Silent)
	{
		sndToPlay = TeleportSnd[TeleportSoundNormal];
		RTTarget.MakeNoise(TeleportSoundNormal * 0.25);
	}
	else if (RTTarget.bRazor && TeleportSoundRazor < TSND_Silent)
	{
		sndToPlay = TeleportSnd[TeleportSoundRazor];
		RTTarget.MakeNoise(TeleportSoundRazor * 0.25);
	}
	
	if (sndToPlay != None)
	{
		Owner.PlaySound(sndToPlay,, 10.0);
		Dest = Owner.Location;
		if (VSize(Start) > 0 && VSize(Dest - Start) > Class'RTTeleSndGen'.default.MinDistToSpawn)
		{
			sndGen = Spawn(Class'RTTeleSndGen',,, Start);
			sndGen.PlaySound(sndToPlay,, 10.0);
			if (PlayerPawn(Owner) != None && Level.NetMode != NM_StandAlone)
				PlayClientTeleportSound(sndToPlay);
		}
	}
}

simulated function PlayPostSelect()
{
local Actor RealTarget;

	Super.PlayPostSelect();
	
	// If Bot is wanting a specific target fired at, do it
	if (DesiredTarget != None)
	{
		RealTarget = Owner.Target;
		Owner.Target = DesiredTarget;
		HandleFire();
		Owner.Target = RealTarget;
		if (RTTarget != None)
			RTTarget.DesiredTarget = DesiredTarget;
		DesiredTarget = None;
	}   
}

simulated function PlayClientTeleportSound(sound Snd)
{
	PlayOwnedSound(Snd, SLOT_None, 10.0);
}

simulated function byte getRenderOptionIndex()
{
	if (TType < TTP_Both)
		return 2;
	return PreFireTransStatus;
}

function SetSwitchPriority(pawn Other)
{
	AutoSwitchPriority = 0;
}

function float RateSelf(out int bUseAltMode)
{
local Pawn P;
local float EnemyDist, rating;

	P = Pawn(Owner);
	if (P == None || P.Enemy == None)
		return -2;
	
	rating = AIRating + FRand() * 0.05;
	if (RTTarget != None)
	{
		if ((!RTTarget.bRazor && VSize(RTTarget.Location - P.Location) > 500) || (RTTarget.bRazor && VSize(RTTarget.Location - P.Location) > 850))
			bUseAltMode = 0;
		else if (RTTarget.CanAITranslocate())
			bUseAltMode = 1;
	}
	else
	{
		EnemyDist = VSize(P.Enemy.Location - P.Location);
		if (TransStatus == TS_Normal)
		{
			if (EnemyDist >= 700 && TType != TTP_NormalOnly)
				bUseAltMode = 1;
			else if (EnemyDist < 700)
				bUseAltMode = 0;
		}
		else
			return Super.RateSelf(bUseAltMode);
	}
	return rating;
}

function float SuggestAttackStyle()
{
local float EnemyDist;

	if (Pawn(Owner) == None || Pawn(Owner).Enemy == None)
		return -0.6;
	if (TransStatus == TS_Razor)
		return 0.0;

	EnemyDist = VSize(Pawn(Owner).Enemy.Location - Owner.Location);
	if (TransStatus == TS_Normal && EnemyDist < 700)
		return 1.0;
	return -0.2;
}

function float SuggestDefenseStyle()
{   
	if (RTTarget != None || TransStatus == TS_Razor)
		return 0.0;
	return -0.6;
}

state NormalFire
{
    function AnimEnd()
    {
		if (Pawn(Owner) != None && Pawn(Owner).bFire != 0)
			TweenAnim(TransStillAnim[TransStatus], 0.1);
		else
			Super.AnimEnd();
    }

Begin:
	if (Class'NWUtils'.static.isValidBot(Pawn(Owner)))
		Pawn(Owner).SwitchToBestWeapon();
}

state ClientFiring
{
    simulated function AnimEnd()
    {
		if (Pawn(Owner) != None && Pawn(Owner).bFire != 0)
			TweenAnim(TransStillAnim[TransStatus], 0.1);
		else
			Super.AnimEnd();
    }
}

state AltFiring
{
    function AnimEnd()
    {
		if (Pawn(Owner) != None && Pawn(Owner).bAltFire != 0)
			PlayAnim(TransStillAnim[TransStatus], 10.0, 0.0);
		else
			Super.AnimEnd();
    }
}

state ClientAltFiring
{
    simulated function AnimEnd()
    {
		if (Pawn(Owner) != None && Pawn(Owner).bAltFire != 0)
			PlayAnim(TransStillAnim[TransStatus], 10.0, 0.0);
		else
			Super.AnimEnd();
    }
}


static function E_TType GetTTypeFromByte(byte n)
{
	if (n == 0)		return E_TType.TTP_NormalOnly;
	if (n == 1)		return E_TType.TTP_RazorOnly;
	if (n == 2)		return E_TType.TTP_Both;
	return E_TType.TTP_NormalOnly;
}

static function E_TSndEffect GetTSndEffectFromByte(byte n)
{
	if (n == 0)		return E_TSndEffect.TSND_Discrete;
	if (n == 1)		return E_TSndEffect.TSND_Electric;
	if (n == 2)		return E_TSndEffect.TSND_Normal;
	if (n == 3)		return E_TSndEffect.TSND_UT2k4;
	if (n == 4)		return E_TSndEffect.TSND_UT3;
	if (n == 5)		return E_TSndEffect.TSND_Overload;
	if (n == 6)		return E_TSndEffect.TSND_Silent;
	return E_TSndEffect.TSND_Discrete;
}

static function E_TFXEffect GetTFXEffectFromByte(byte n)
{
	if (n == 0)		return E_TFXEffect.TFX_None;
	if (n == 1)		return E_TFXEffect.TFX_Standard;
	if (n == 2)		return E_TFXEffect.TFX_FX1;
	if (n == 3)		return E_TFXEffect.TFX_FX2;
	return E_TFXEffect.TFX_None;
}


//Oversurrection
static function OversurrectorExplodeServer(TheOversProj ref, vector HitLocation, vector HitNormal)
{
	if (ref == None)
		return;
	ref.Spawn(Class'RTDisc',,, HitLocation + HitNormal, rot(0,0,0));
}

static function bool hasOversurrectorFXFusion(byte i, optional out class<TheOversColoredFX> CFXClass)
{
	switch (i)
	{
		case 0:	CFXClass = Class'RTCFXA';		break;
		case 1:	CFXClass = Class'RTCFXB';		break;
		case 2:	CFXClass = Class'RTCFXCMaster';	break;
	}
	return (i <= 2);
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=RTPick
	CollisionHeight=14.000000
	CollisionRadius=30.000000
	AutoSwitchPriority=1
	Icon=RTIcon
	InventoryGroup=1
	ItemArticle="a"
	ItemName="Razored Translocator (R.T.)"
	MaxDesireability=0.400000
	PickupMessage="You got the Razored Translocator (R.T.)."
	PickupSound=RTPick
	PickupViewMesh=RTPick
	PickupViewScale=1.000000
	PlayerViewMesh=RTR
	PlayerViewOffset=(X=11.00000,Y=-5.250000,Z=-4.500000)
	WidePlayerViewOffset=(X=10.50000,Y=-5.250000,Z=-5.000000)
	PlayerViewScale=1.000000
	RespawnTime=30.000000
	StatusIcon=RTIcon
	ThirdPersonMesh=RTM
	ThirdPersonScale=0.750000
	AltDamageType=None
	AltFireSound=None
	AltProjectileClass=None
	AmmoName=None
	bInstantHit=False
	bRapidFire=True
	DeathMessage="%o got tele-sliced by %k's %w!"
	FireSound=None
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=Telefragged
	NameColor=(R=255,G=128,B=0)
	PickupAmmoCount=1
	ProjectileClass=None
	SelectSound=RTSelect
	shakemag=0.000000
	shaketime=0.000000
	shakevert=0.000000
	AIRating=0.300000
	AltRefireRate=8.000000
	bAltWarnTarget=True
	bRecommendAltSplashDamage=False
	bRecommendSplashDamage=False
	bSplashDamage=False
	bWarnTarget=True
	RefireRate=8.000000
	Mass=10.000000
	bNoSmooth=False
	bOwnsCrossHair=True
	CustomCross=RTCross
	CustomCrossAlpha=RTCrossAlpha
	CrossHairScale=0.500000
	WeaponDescription="Classification: Translocation and self-defense device.\n\nPrimary Fire: Disc launch which can be teleported to.\n\nSecondary Fire: Toggles the disc blades if the disc is still in the device, teleports if otherwise."
	
	Texture=RT_Metal
	
	PlayerViewMeshLeft=RT
	PlayerViewMeshRight=RTR
	HandPartMeshL(0)=RTHandL
	HandPartMeshR(0)=RTHandR
	BobDamping=1.075000
	FireOffset=(X=0.000000,Y=0.000000,Z=0.00000)
	
	RenderOffsetSelect=(Y=-2.500000,Z=0.000000)
	AnimMaxFrame=0.857129
	
	bRenderOptionsOnHiddenWeapon=True
	renderOptions(0)=(optionText="Translocator: Normal",optionColor=(R=255,G=255,B=255))
	renderOptions(1)=(optionText="Translocator: Razor",optionColor=(R=255,G=255,B=255))
	renderOptions(2)=(optionText=" ",optionColor=(R=0,G=0,B=0))
	
	
	TransAIClass=Class'RTTransAI'
	TranslocatorClass(0)=Class'RTTrans'
	TranslocatorClass(1)=Class'RTTransRazor'
	
	SelectRTAnim(0)=SelectNormal
	SelectRTAnim(1)=SelectRazor
	SelectRTAnim(2)=SelectEmpty
	DownRTAnim(0)=DownNormal
	DownRTAnim(1)=DownRazor
	DownRTAnim(2)=DownEmpty
	ChangeTransTypeAnim(0)=ChangeToRazor
	ChangeTransTypeAnim(1)=ChangeToNormal
	TransStillAnim(0)=StillNormal
	TransStillAnim(1)=StillRazor
	TransStillAnim(2)=StillEmpty
	
	ChangeTransTypeSnd(0)=RTRazorOn
	ChangeTransTypeSnd(1)=RTRazorOff
	FireSnd(0)=RTFireNormal
	FireSnd(1)=RTFireRazor
	ComebackSnd=RTComeback
	TeleportSnd(0)=RTTeleportDiscrete
	TeleportSnd(1)=RTTeleportElectric
	TeleportSnd(2)=RTTeleportNormal
	TeleportSnd(3)=RTTeleportUT2k4
	TeleportSnd(4)=RTTeleportUT3
	TeleportSnd(5)=RTTeleportOverload

	FxSectionsUpNormalTime=1.000000
	FxSectionsUpRazorTime=0.350000
	FxSectionsDownNormalTime=0.500000
	FxSectionsDownRazorTime=0.350000
	FxMainNormalTime=2.000000
	FxMainRazorTime=1.000000
	
	NoTransPickupViewMesh=RTNoTransStillPick
	NoTransThirdPersonMesh=RTNoTransStillM
	
	
	canDropTranslocator=False
	TranslocatorType=TTP_Both
	TransRazorDamage=60
	TransRazorHeadshotDamage=150
	enableTransRazorHeadshot=True
	enableRazorTeleport=True
	enableNormalHitSound=True
	enableRazorHitSound=True
	enableNormalAmbSound=True
	enableRazorAmbSound=True
	enableNormalTeleportShake=False
	enableRazorTeleportShake=True
	TeleportSoundNormal=TSND_Electric
	TeleportSoundRazor=TSND_Overload
	TeleportFXNormal=TFX_FX2
	TeleportFXRazor=TFX_FX2
	enableTeleportFXSmartPerformance=True
	TranslocatorNormalSpeed=830.000000
	TranslocatorRazorSpeed=1600.000000
	RelaunchDelayNormal=0.350000
	RelaunchDelayRazor=0.850000
	canDisruptNormalTrans=True
	canDisruptRazorTrans=True
	canDisruptNormalByInstigator=True
	canDisruptRazorByInstigator=True
	TransNormalDisruptDmg=100
	TransRazorDisruptDmg=50
	enableNormalAffectFOV=True
	enableRazorAffectFOV=True
	TeleFOVNormal=135
	TeleFOVRazor=165
	
	ObjectsBlood(0)=(ObjectType="Pawn",BloodType=BLDT_Red)
	ObjectsBlood(1)=(ObjectType="MercCarcass",BloodType=BLDT_Green)
	ObjectsBlood(2)=(ObjectType="Mercenary",BloodType=BLDT_Green)
	ObjectsBlood(3)=(ObjectType="StationaryPawn",BloodType=BLDT_Black)
	ObjectsBlood(4)=(ObjectType="FortStandard",BloodType=BLDT_None)
	ObjectsBlood(5)=(ObjectType="NaliWPawn",BloodType=BLDT_None)
	
	enableNormalTelefrag=True
	enableRazorTelefrag=True
	
	NoTelefragList(0)=FortStandard
	NoTelefragList(1)=TeamCannon
	NoTelefragList(2)=sgBuilding
	
	bOversurrective=True
	OversurrectorShellColor=(R=255,G=0,B=0)
	OversurrectorFXColors(0)=(R=255,G=64,B=64)
	OversurrectorFXColors(1)=(R=255,G=64,B=64)
	OversurrectorFXColors(2)=(R=96,G=0,B=8)
	OversurrectorFXColors(3)=(R=255,G=0,B=8)
	OversurrectorFXColors(4)=(R=255,G=0,B=8)
	OversurrectorFXColors(5)=(R=192,G=32,B=8)
	OversurrectorFXColors(6)=(R=192,G=32,B=8)
	OversurrectorFXColors(7)=(R=255,G=0,B=0)
	OversurrectorFXColors(8)=(R=255,G=0,B=0)
	OversurrectorFXColors(9)=(R=255,G=16,B=8)
	OversurrectorFXColors(10)=(R=255,G=16,B=8)
	OversurrectorFXColors(11)=(R=255,G=0,B=0)
	OversurrectorFXColors(12)=(R=128,G=0,B=64)
	OversurrectorFXColors(13)=(R=255,G=0,B=0)
	OversurrectorFXColors(14)=(R=255,G=0,B=32)
	OversurrectorFXColors(15)=(R=192,G=0,B=64)
	OversurrectorFXColors(16)=(R=128,G=0,B=32)
	OversurrectorFXColors(17)=(R=128,G=0,B=0)
	OversurrectorFXColors(18)=(R=255,G=0,B=0)
	OversurrectorFXColors(19)=(R=128,G=0,B=16)
	OversurrectorFXColors(20)=(R=255,G=0,B=32)
	OversurrectorFXColors(21)=(R=255,G=0,B=8)
	OversurrectorFXColors(22)=(R=255,G=0,B=8)
	OversurrectorFXColors(23)=(R=255,G=0,B=8)
	
	OversurrectorLightHue(0)=0
	OversurrectorLightSaturation(0)=0
	OversurrectorLightBrightness(0)=100
	OversurrectorLightHue(1)=0
	OversurrectorLightSaturation(1)=0
	OversurrectorLightBrightness(1)=100
	OversurrectorLightHue(2)=0
	OversurrectorLightSaturation(2)=0
	OversurrectorLightBrightness(2)=100
	
	OversurrectorProjClass=Class'RTOversProj'
	
	
	enableOversurrection=True
	OversurrectionLifeTime=15.000000
	OversurrectionHeadshotDmg=10000
	OversurrectionNormalDmg=3500
}
