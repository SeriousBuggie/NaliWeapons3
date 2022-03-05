//////////////////////////////////////////////////////////////
//				Feralidragon (12-07-2010)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WREIonWave expands NaliWEffects;

#exec MESH IMPORT MESH=WREIonWave ANIVFILE=MODELS\WREIonWave_a.3d DATAFILE=MODELS\WREIonWave_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=WREIonWave X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=WREIonWave SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WREIonWave SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=WREIonWave MESH=WREIonWave
#exec MESHMAP SCALE MESHMAP=WREIonWave X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=WREIonWave FILE=CORONAS\WREIonWave.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=WREIonWave NUM=1 TEXTURE=WREIonWave

var() float MinDrawScale;

simulated function Tick(float DeltaTime)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * (Default.DrawScale + MinDrawScale) / Default.LifeSpan + MinDrawScale;
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
	}
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=WREIonWave
	Style=STY_Translucent
	ScaleGlow=4.000000
	LifeSpan=0.450000
	DrawScale=6.000000
	MinDrawScale=1.500000
	RemoteRole=ROLE_SimulatedProxy
	bUnlit=True
}
