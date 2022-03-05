//////////////////////////////////////////////////////////////
//				Feralidragon (01-09-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravRotParticlesFX expands NaliTrail;

//Mesh 01
#exec MESH IMPORT MESH=GravRotParticlesFX01 ANIVFILE=MODELS\GravRotParticlesFX_a.3d DATAFILE=MODELS\GravRotParticlesFX_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=GravRotParticlesFX01 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravRotParticlesFX01 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=GravRotParticlesFX01 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravRotParticlesFX01 SEQ=RotPlay STARTFRAME=0 NUMFRAMES=40 RATE=39.0
#exec MESH SEQUENCE MESH=GravRotParticlesFX01 SEQ=RotLoop STARTFRAME=0 NUMFRAMES=39 RATE=38.0

#exec MESHMAP NEW MESHMAP=GravRotParticlesFX01 MESH=GravRotParticlesFX01
#exec MESHMAP SCALE MESHMAP=GravRotParticlesFX01 X=0.075 Y=0.075 Z=0.15

//Mesh 02
#exec MESH IMPORT MESH=GravRotParticlesFX02 ANIVFILE=MODELS\GravRotParticlesFX_a.3d DATAFILE=MODELS\GravRotParticlesFX_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=GravRotParticlesFX02 X=0 Y=0 Z=0 YAW=32 PITCH=32 ROLL=32

#exec MESH SEQUENCE MESH=GravRotParticlesFX02 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=GravRotParticlesFX02 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravRotParticlesFX02 SEQ=RotPlay STARTFRAME=0 NUMFRAMES=40 RATE=39.0
#exec MESH SEQUENCE MESH=GravRotParticlesFX02 SEQ=RotLoop STARTFRAME=0 NUMFRAMES=39 RATE=38.0

#exec MESHMAP NEW MESHMAP=GravRotParticlesFX02 MESH=GravRotParticlesFX02
#exec MESHMAP SCALE MESHMAP=GravRotParticlesFX02 X=0.075 Y=0.075 Z=0.15

//Mesh 03
#exec MESH IMPORT MESH=GravRotParticlesFX03 ANIVFILE=MODELS\GravRotParticlesFX_a.3d DATAFILE=MODELS\GravRotParticlesFX_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=GravRotParticlesFX03 X=0 Y=0 Z=0 YAW=-32 PITCH=-32 ROLL=-32

#exec MESH SEQUENCE MESH=GravRotParticlesFX03 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=GravRotParticlesFX03 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravRotParticlesFX03 SEQ=RotPlay STARTFRAME=0 NUMFRAMES=40 RATE=39.0
#exec MESH SEQUENCE MESH=GravRotParticlesFX03 SEQ=RotLoop STARTFRAME=0 NUMFRAMES=39 RATE=38.0

#exec MESHMAP NEW MESHMAP=GravRotParticlesFX03 MESH=GravRotParticlesFX03
#exec MESHMAP SCALE MESHMAP=GravRotParticlesFX03 X=0.075 Y=0.075 Z=0.15

var() Mesh PartMesh[3];

simulated function InitializePlay(byte n, float PlayRate, optional bool bLoop)
{
	if (n < ArrayCount(PartMesh))
		Mesh = PartMesh[n];
	
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
    Mesh=GravRotParticlesFX01
	
	bParticles=True
    Texture=GravGlow01
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=0.065000
	ScaleGlow=1.650000
	
	PartMesh(0)=GravRotParticlesFX01
	PartMesh(1)=GravRotParticlesFX02
	PartMesh(2)=GravRotParticlesFX03
}
