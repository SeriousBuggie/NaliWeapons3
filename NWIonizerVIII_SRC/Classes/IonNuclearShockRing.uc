//////////////////////////////////////////////////////////////
//				Feralidragon (08-01-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonNuclearShockRing expands NaliFullMeshFX;

#exec MESH IMPORT MESH=IonNuclearShockRing ANIVFILE=MODELS\IonNuclearShockRing_a.3d DATAFILE=MODELS\IonNuclearShockRing_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=IonNuclearShockRing X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonNuclearShockRing SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonNuclearShockRing SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonNuclearShockRing MESH=IonNuclearShockRing
#exec MESHMAP SCALE MESHMAP=IonNuclearShockRing X=0.5 Y=0.5 Z=1.0

#exec TEXTURE IMPORT NAME=IonNukeShockRing FILE=CORONAS\IonNukeShockRing.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=IonNuclearShockRing NUM=1 TEXTURE=IonNukeShockRing

var() float MinDrawScale, FadeInTime, FadeOutTime;
var() float TexUVMultiplier;

simulated function Tick( float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * (Default.DrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
		DrawScale *= TexUVMultiplier;
		if (Default.LifeSpan - LifeSpan <= FadeInTime)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / FadeInTime;
		else if (FadeOutTime > 0 && LifeSpan <= FadeOutTime)
			ScaleGlow = LifeSpan * Default.ScaleGlow / FadeOutTime;
		else if (FadeOutTime == 0)
			ScaleGlow = LifeSpan * Default.ScaleGlow / (Default.LifeSpan - FadeInTime);
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonNuclearShockRing
	Style=STY_Translucent
	RemoteRole=ROLE_SimulatedProxy
	bUnlit=True
	bAlwaysRelevant=True
	
	MinDrawScale=0.250000
	FadeInTime=0.500000
	FadeOutTime=1.500000
	LifeSpan=7.500000
	DrawScale=180.000000
	ScaleGlow=1.000000
	TexUVMultiplier=1.049180
	
	RadiusView=28800.000000
	bAffectByDrawScale=False
}
