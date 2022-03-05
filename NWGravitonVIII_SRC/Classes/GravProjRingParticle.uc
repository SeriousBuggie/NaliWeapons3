//////////////////////////////////////////////////////////////
//				Feralidragon (02-09-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravProjRingParticle expands NaliTrail;

#exec MESH IMPORT MESH=GravProjRingParticle ANIVFILE=MODELS\GravProjRingParticle_a.3d DATAFILE=MODELS\GravProjRingParticle_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=GravProjRingParticle X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravProjRingParticle SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=GravProjRingParticle SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravProjRingParticle SEQ=RotPlay STARTFRAME=0 NUMFRAMES=40 RATE=39.0
#exec MESH SEQUENCE MESH=GravProjRingParticle SEQ=RotLoop STARTFRAME=0 NUMFRAMES=39 RATE=38.0

#exec MESHMAP NEW MESHMAP=GravProjRingParticle MESH=GravProjRingParticle
#exec MESHMAP SCALE MESHMAP=GravProjRingParticle X=0.1 Y=0.1 Z=0.2

simulated function InitializePlay(float PlayRate, optional bool bLoop)
{
	if (PlayRate <= 0)
		PlayRate = 1.0;
	
	if (bLoop)
		LoopAnim('RotLoop', PlayRate);
	else
		PlayAnim('RotPlay', PlayRate, 0.0);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=GravProjRingParticle
	
	bParticles=True
    Texture=GravGlow01
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=0.250000
	ScaleGlow=1.650000
}
