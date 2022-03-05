//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2012)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class IonNukeAtmosRing expands IonNukeThinSmkRing;

#exec MESH IMPORT MESH=IonNukeAtmosRing ANIVFILE=MODELS\IonNukeAtmosRing_a.3d DATAFILE=MODELS\IonNukeAtmosRing_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonNukeAtmosRing STRENGTH=0.1
#exec MESH ORIGIN MESH=IonNukeAtmosRing X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IonNukeAtmosRing SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonNukeAtmosRing SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonNukeAtmosRing MESH=IonNukeAtmosRing
#exec MESHMAP SCALE MESHMAP=IonNukeAtmosRing X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=IonNukeAtmosRing FILE=CORONAS\IonNukeAtmosRing.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=IonNukeAtmosRing NUM=1 TEXTURE=IonNukeAtmosRing


simulated function PostBeginPlay()
{
local Rotator R;

	Super.PostBeginPlay();
	
	R = Rotation;
	R.Yaw = Int(Rand(16384) * 4.f);
	SetRotation(R);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonNukeAtmosRing
	
	LifeSpan=10.000000
	ScaleGlow=1.000000
	
	fadeInTime=3.500000
	fadeOutTime=6.500000
	minDrawScale=50.000000
	maxDrawScale=110.000000
}
