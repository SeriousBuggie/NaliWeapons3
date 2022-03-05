//////////////////////////////////////////////////////////////
//				Feralidragon (01-09-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravRotTracesFX expands NaliTrail;

#exec TEXTURE IMPORT NAME=GravTrace FILE=Coronas\GravTrace.bmp GROUP=Coronas FLAGS=2

//Mesh 01
#exec MESH IMPORT MESH=GravRotTracesFX01 ANIVFILE=MODELS\GravRotTracesFX_a.3d DATAFILE=MODELS\GravRotTracesFX_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravRotTracesFX01 STRENGTH=0.5
#exec MESH ORIGIN MESH=GravRotTracesFX01 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravRotTracesFX01 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=GravRotTracesFX01 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravRotTracesFX01 SEQ=RotPlay STARTFRAME=0 NUMFRAMES=40 RATE=39.0
#exec MESH SEQUENCE MESH=GravRotTracesFX01 SEQ=RotLoop STARTFRAME=0 NUMFRAMES=39 RATE=38.0

#exec MESHMAP NEW MESHMAP=GravRotTracesFX01 MESH=GravRotTracesFX01
#exec MESHMAP SCALE MESHMAP=GravRotTracesFX01 X=0.075 Y=0.075 Z=0.15

#exec MESHMAP SETTEXTURE MESHMAP=GravRotTracesFX01 NUM=1 TEXTURE=GravTrace

//Mesh 02
#exec MESH IMPORT MESH=GravRotTracesFX02 ANIVFILE=MODELS\GravRotTracesFX_a.3d DATAFILE=MODELS\GravRotTracesFX_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravRotTracesFX02 STRENGTH=0.5
#exec MESH ORIGIN MESH=GravRotTracesFX02 X=0 Y=0 Z=0 YAW=32 PITCH=32 ROLL=32

#exec MESH SEQUENCE MESH=GravRotTracesFX02 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=GravRotTracesFX02 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravRotTracesFX02 SEQ=RotPlay STARTFRAME=0 NUMFRAMES=40 RATE=39.0
#exec MESH SEQUENCE MESH=GravRotTracesFX02 SEQ=RotLoop STARTFRAME=0 NUMFRAMES=39 RATE=38.0

#exec MESHMAP NEW MESHMAP=GravRotTracesFX02 MESH=GravRotTracesFX02
#exec MESHMAP SCALE MESHMAP=GravRotTracesFX02 X=0.075 Y=0.075 Z=0.15

#exec MESHMAP SETTEXTURE MESHMAP=GravRotTracesFX02 NUM=1 TEXTURE=GravTrace

//Mesh 03
#exec MESH IMPORT MESH=GravRotTracesFX03 ANIVFILE=MODELS\GravRotTracesFX_a.3d DATAFILE=MODELS\GravRotTracesFX_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravRotTracesFX03 STRENGTH=0.5
#exec MESH ORIGIN MESH=GravRotTracesFX03 X=0 Y=0 Z=0 YAW=-32 PITCH=-32 ROLL=-32

#exec MESH SEQUENCE MESH=GravRotTracesFX03 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=GravRotTracesFX03 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravRotTracesFX03 SEQ=RotPlay STARTFRAME=0 NUMFRAMES=40 RATE=39.0
#exec MESH SEQUENCE MESH=GravRotTracesFX03 SEQ=RotLoop STARTFRAME=0 NUMFRAMES=39 RATE=38.0

#exec MESHMAP NEW MESHMAP=GravRotTracesFX03 MESH=GravRotTracesFX03
#exec MESHMAP SCALE MESHMAP=GravRotTracesFX03 X=0.075 Y=0.075 Z=0.15

#exec MESHMAP SETTEXTURE MESHMAP=GravRotTracesFX03 NUM=1 TEXTURE=GravTrace

var() Mesh TraceMesh[3];

simulated function InitializePlay(byte n, float PlayRate, optional bool bLoop)
{
	if (n < ArrayCount(TraceMesh))
		Mesh = TraceMesh[n];
	
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
    Mesh=GravRotTracesFX01
	
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=1.000000
	ScaleGlow=1.650000
	
	TraceMesh(0)=GravRotTracesFX01
	TraceMesh(1)=GravRotTracesFX02
	TraceMesh(2)=GravRotTracesFX03
}
