//////////////////////////////////////////////////////////////
//				Feralidragon (24-08-2013)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravVortexCloud expands NWBaseCloud;

#exec MESH IMPORT MESH=GravVortexCloud ANIVFILE=MODELS\GravVortexCloud_a.3d DATAFILE=MODELS\GravVortexCloud_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravVortexCloud STRENGTH=0.1
#exec MESH ORIGIN MESH=GravVortexCloud X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravVortexCloud SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=GravVortexCloud SEQ=CollapseFull STARTFRAME=0 NUMFRAMES=41 RATE=40.0
#exec MESH SEQUENCE MESH=GravVortexCloud SEQ=CollapseH01 STARTFRAME=0 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=GravVortexCloud SEQ=CollapseH02 STARTFRAME=20 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=GravVortexCloud SEQ=CollapseQ01 STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=GravVortexCloud SEQ=CollapseQ02 STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=GravVortexCloud SEQ=CollapseQ03 STARTFRAME=20 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=GravVortexCloud SEQ=CollapseQ04 STARTFRAME=30 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=GravVortexCloud MESH=GravVortexCloud
#exec MESHMAP SCALE MESHMAP=GravVortexCloud X=0.3 Y=0.3 Z=0.6

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=GravVortexCloud
	DrawScale=0.010000
	MinDrawScale=40.000000
	
	LifeSpan=5.000000
	bWhiteSmoke=True
	FadeInTime=3.000000
	FadeOutTime=0.500000
	ScaleGlow=0.450000
	CloudDetail=8
}
