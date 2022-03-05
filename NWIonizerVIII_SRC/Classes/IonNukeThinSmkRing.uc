//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2012)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class IonNukeThinSmkRing expands NaliWEffects;

#exec MESH IMPORT MESH=IonNukeThinSmkRing ANIVFILE=MODELS\IonNukeThinSmkRing_a.3d DATAFILE=MODELS\IonNukeThinSmkRing_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonNukeThinSmkRing STRENGTH=0.25
#exec MESH ORIGIN MESH=IonNukeThinSmkRing X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IonNukeThinSmkRing SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonNukeThinSmkRing SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonNukeThinSmkRing MESH=IonNukeThinSmkRing
#exec MESHMAP SCALE MESHMAP=IonNukeThinSmkRing X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=IonNukeThinSmk FILE=CORONAS\IonNukeThinSmk.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=IonNukeThinSmkRing NUM=1 TEXTURE=IonNukeThinSmk

var() float fadeInTime, fadeOutTime;
var() float minDrawScale, maxDrawScale;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * (maxDrawScale - minDrawScale) / Default.LifeSpan + minDrawScale;
		if ((Default.LifeSpan - LifeSpan) <= fadeInTime)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / fadeInTime;
		else if (LifeSpan <= fadeOutTime)
			ScaleGlow = LifeSpan * Default.ScaleGlow / fadeOutTime;
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonNukeThinSmkRing
	bUnlit=True
	Style=STY_Translucent
	LifeSpan=5.500000
	ScaleGlow=0.450000
	
	fadeInTime=0.500000
	fadeOutTime=3.000000
	minDrawScale=30.000000
	maxDrawScale=110.000000
}
