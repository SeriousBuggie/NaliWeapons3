//////////////////////////////////////////////////////////////
//	Nali Weapons III Water FX ring base class
//				Feralidragon (27-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWaterSplashRing expands NaliZPEffects;

#exec MESH IMPORT MESH=NWWaterSplashRing ANIVFILE=MODELS\NWWaterSplashRing_a.3d DATAFILE=MODELS\NWWaterSplashRing_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=NWWaterSplashRing X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NWWaterSplashRing SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterSplashRing SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWWaterSplashRing MESH=NWWaterSplashRing
#exec MESHMAP SCALE MESHMAP=NWWaterSplashRing X=0.15 Y=0.15 Z=0.3

#exec TEXTURE IMPORT NAME=NWWaterSplashRing FILE=PARTICLES\NWWaterSplashRing.bmp GROUP=Particles FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=NWWaterSplashRing NUM=1 TEXTURE=NWWaterSplashRing

var float InitDrawScale;

replication
{
	unreliable if (Role == ROLE_Authority)
		InitDrawScale;
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * InitDrawScale / Default.LifeSpan;
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
	}
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWWaterSplashRing
	Style=STY_Translucent
	ScaleGlow=1.800000
	LifeSpan=1.250000
	DrawScale=3.000000
	RemoteRole=ROLE_SimulatedProxy
	bUnlit=True
	Physics=PHYS_Rotating
	bFixedRotationDir=True
	RotationRate=(Roll=-10000)
}
