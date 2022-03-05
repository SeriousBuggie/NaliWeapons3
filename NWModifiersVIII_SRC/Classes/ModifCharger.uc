//////////////////////////////////////////////////////////////
//		Nali Weapons III Modifer Charger
//				Feralidragon (28-03-2010)
//
// NW3 MODIFIERS BUILD 1.00
//////////////////////////////////////////////////////////////

class ModifCharger expands NaliWActor;

#exec MESH IMPORT MESH=ModifCharger ANIVFILE=MODELS\ModifCharger_a.3d DATAFILE=MODELS\ModifCharger_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=ModifCharger STRENGTH=0
#exec MESH ORIGIN MESH=ModifCharger X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=ModifCharger SEQ=All STARTFRAME=0 NUMFRAMES=11
#exec MESH SEQUENCE MESH=ModifCharger SEQ=Closed STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifCharger SEQ=Openned STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifCharger SEQ=Closing STARTFRAME=0 NUMFRAMES=6 RATE=1.0
#exec MESH SEQUENCE MESH=ModifCharger SEQ=Openning STARTFRAME=5 NUMFRAMES=6 RATE=1.0

#exec MESHMAP NEW MESHMAP=ModifCharger MESH=ModifCharger
#exec MESHMAP SCALE MESHMAP=ModifCharger X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=ModifChargerSk FILE=Skins\ModifChargerSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=ModifCharger NUM=1 TEXTURE=ModifChargerSk

#exec TEXTURE IMPORT NAME=ModifChargLight FILE=Skins\ModifChargLight.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=ModifCharger NUM=2 TEXTURE=ModifChargLight

#exec AUDIO IMPORT NAME="ModifChargSnd" FILE=SOUNDS\ModifChargSnd.wav GROUP="Chargers"

var ModifChargOv mOv;
var() float TransTime;
var() sound TransSnd;
var float FadeTimeC;
var() float MinScGlow;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		LODBias = FMax(1.0, Class'NWInfo'.default.ChargersDistDetail * Class'NWInfo'.default.MaxLODBias/255);
	PlayAnim('Closing', 5/TransTime, 0.0);
}

function SetOverlayering(texture LightTex)
{
	mOv = Spawn(Class'ModifChargOv', Self);
	mOv.MultiSkins[1] = LightTex;
}

simulated function SetRespawn(float ResTime)
{
	SetTimer(ResTime - TransTime, False);
	PlayAnim('Openning', 5/TransTime, 0.0);
	MakeSound();
	if (mOv != None)
		mOv.ScaleGlow = MinScGlow;
}

simulated function Timer()
{
	FadeTimeC = TransTime;
	PlayAnim('Closing', 5/TransTime, 0.0);
	MakeSound();
}

function MakeSound()
{
	PlaySound(TransSnd);
}

simulated function Tick( float Delta)
{
	if (Class'NWInfo'.default.enableSmartPerformanceCharger && Level.NetMode != NM_DedicatedServer)
		LODBias = Class'NWUtils'.static.getFrameRateBasedLODBias(Level, Delta, LODBias);
	
	if (FadeTimeC > 0)
	{
		FadeTimeC -= Delta;
		if (mOv != None)
			mOv.ScaleGlow = (TransTime - FadeTimeC) * (mOv.default.ScaleGlow - MinScGlow) / TransTime + MinScGlow;
	}
}

simulated function Destroyed()
{
	if (mOv != None)
		mOv.Destroy();
	mOv = None;
	
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=ModifCharger
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	Texture=SilverMetal01
	
	TransTime=2.000000
	TransSnd=ModifChargSnd
	MinScGlow=0.100000
}
