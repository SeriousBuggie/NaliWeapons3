//////////////////////////////////////////////////////////////
//				Feralidragon (14-09-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerIceAgeCloud expands NWBaseCloud;

#exec MESH IMPORT MESH=FreezerIceAgeCloud ANIVFILE=MODELS\FreezerIceAgeCloud_a.3d DATAFILE=MODELS\FreezerIceAgeCloud_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FreezerIceAgeCloud STRENGTH=0.1
#exec MESH ORIGIN MESH=FreezerIceAgeCloud X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=FreezerIceAgeCloud SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=FreezerIceAgeCloud SEQ=PlayRevolve STARTFRAME=0 NUMFRAMES=41 RATE=40.0
#exec MESH SEQUENCE MESH=FreezerIceAgeCloud SEQ=LoopRevolve STARTFRAME=0 NUMFRAMES=40 RATE=39.0

#exec MESHMAP NEW MESHMAP=FreezerIceAgeCloud MESH=FreezerIceAgeCloud
#exec MESHMAP SCALE MESHMAP=FreezerIceAgeCloud X=0.3 Y=0.3 Z=0.6


var() float MaxDrawScale;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		DrawScale = (Default.LifeSpan-LifeSpan) * (MaxDrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
	Super.Tick(Delta);
}

defaultproperties
{
	Mesh=FreezerIceAgeCloud
	DrawScale=30.000000
	MaxDrawScale=30.000000
	MinDrawScale=1.000000
	
	ScaleGlow=0.750000
	LifeSpan=10.000000
	bWhiteSmoke=True
	FadeInTime=0.500000
	FadeOutTime=5.000000
	CloudDetail=8
}
