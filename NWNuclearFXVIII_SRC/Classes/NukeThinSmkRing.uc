//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2012)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////
class NukeThinSmkRing expands NaliWEffects;

#exec MESH IMPORT MESH=NukeThinSmkRing ANIVFILE=MODELS\NukeThinSmkRing_a.3d DATAFILE=MODELS\NukeThinSmkRing_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NukeThinSmkRing STRENGTH=0.25
#exec MESH ORIGIN MESH=NukeThinSmkRing X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NukeThinSmkRing SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeThinSmkRing SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NukeThinSmkRing MESH=NukeThinSmkRing
#exec MESHMAP SCALE MESHMAP=NukeThinSmkRing X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=NukeThinSmk FILE=CORONAS\NukeThinSmk.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=NukeThinSmkRing NUM=1 TEXTURE=NukeThinSmk

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
	Mesh=NukeThinSmkRing
	bUnlit=True
	Style=STY_Translucent
	LifeSpan=3.500000
	ScaleGlow=0.450000
	
	fadeInTime=0.500000
	fadeOutTime=3.000000
	minDrawScale=20.000000
	maxDrawScale=60.000000
}
