//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2012)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeAtmosRing expands NukeThinSmkRing;

#exec MESH IMPORT MESH=NukeAtmosRing ANIVFILE=MODELS\NukeAtmosRing_a.3d DATAFILE=MODELS\NukeAtmosRing_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NukeAtmosRing STRENGTH=0.1
#exec MESH ORIGIN MESH=NukeAtmosRing X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NukeAtmosRing SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeAtmosRing SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NukeAtmosRing MESH=NukeAtmosRing
#exec MESHMAP SCALE MESHMAP=NukeAtmosRing X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=NukeAtmosRing FILE=CORONAS\NukeAtmosRing.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=NukeAtmosRing NUM=1 TEXTURE=NukeAtmosRing


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
	Mesh=NukeAtmosRing
	
	LifeSpan=10.000000
	ScaleGlow=1.000000
	
	fadeInTime=3.500000
	fadeOutTime=6.500000
	minDrawScale=100.000000
	maxDrawScale=220.000000
}
