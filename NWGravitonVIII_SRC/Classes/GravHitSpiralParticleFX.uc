//////////////////////////////////////////////////////////////
//				Feralidragon (06-09-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravHitSpiralParticleFX expands NaliWEffects;

#exec MESH IMPORT MESH=GravHitSpiralParticleFX ANIVFILE=MODELS\GravHitSpiralParticleFX_a.3d DATAFILE=MODELS\GravHitSpiralParticleFX_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=GravHitSpiralParticleFX X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravHitSpiralParticleFX SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=GravHitSpiralParticleFX SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravHitSpiralParticleFX SEQ=Rotate STARTFRAME=0 NUMFRAMES=30 RATE=29.0

#exec MESHMAP NEW MESHMAP=GravHitSpiralParticleFX MESH=GravHitSpiralParticleFX
#exec MESHMAP SCALE MESHMAP=GravHitSpiralParticleFX X=0.3 Y=0.3 Z=0.6

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
    Mesh=GravHitSpiralParticleFX
	
	bParticles=True
    Texture=GravGlow01
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=2.200000
	ScaleGlow=1.650000
	LifeSpan=0.300000
}
