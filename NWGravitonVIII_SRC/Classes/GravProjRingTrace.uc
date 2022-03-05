//////////////////////////////////////////////////////////////
//				Feralidragon (02-09-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravProjRingTrace expands NaliTrail;

#exec MESH IMPORT MESH=GravProjRingTrace ANIVFILE=MODELS\GravProjRingTrace_a.3d DATAFILE=MODELS\GravProjRingTrace_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravProjRingTrace STRENGTH=0.5
#exec MESH ORIGIN MESH=GravProjRingTrace X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravProjRingTrace SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=GravProjRingTrace SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravProjRingTrace SEQ=RotPlay STARTFRAME=0 NUMFRAMES=40 RATE=39.0
#exec MESH SEQUENCE MESH=GravProjRingTrace SEQ=RotLoop STARTFRAME=0 NUMFRAMES=39 RATE=38.0

#exec MESHMAP NEW MESHMAP=GravProjRingTrace MESH=GravProjRingTrace
#exec MESHMAP SCALE MESHMAP=GravProjRingTrace X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=GravTrace FILE=Coronas\GravTrace.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=GravProjRingTrace NUM=1 TEXTURE=GravTrace

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
    Mesh=GravProjRingTrace
	
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=1.000000
	ScaleGlow=1.650000
}
