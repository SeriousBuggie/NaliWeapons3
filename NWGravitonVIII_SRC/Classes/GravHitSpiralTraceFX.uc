//////////////////////////////////////////////////////////////
//				Feralidragon (06-09-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravHitSpiralTraceFX expands NaliWEffects;

#exec MESH IMPORT MESH=GravHitSpiralTraceFX ANIVFILE=MODELS\GravHitSpiralTraceFX_a.3d DATAFILE=MODELS\GravHitSpiralTraceFX_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravHitSpiralTraceFX STRENGTH=0.5
#exec MESH ORIGIN MESH=GravHitSpiralTraceFX X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravHitSpiralTraceFX SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=GravHitSpiralTraceFX SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravHitSpiralTraceFX SEQ=Rotate STARTFRAME=0 NUMFRAMES=30 RATE=29.0

#exec MESHMAP NEW MESHMAP=GravHitSpiralTraceFX MESH=GravHitSpiralTraceFX
#exec MESHMAP SCALE MESHMAP=GravHitSpiralTraceFX X=0.3 Y=0.3 Z=0.6

#exec TEXTURE IMPORT NAME=GravTrace FILE=Coronas\GravTrace.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=GravHitSpiralTraceFX NUM=1 TEXTURE=GravTrace

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	PlayAnim('Rotate', 1 / Default.LifeSpan, 0.0);
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / Default.LifeSpan;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=GravHitSpiralTraceFX
	
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=1.000000
	ScaleGlow=1.650000
	LifeSpan=0.300000
}
