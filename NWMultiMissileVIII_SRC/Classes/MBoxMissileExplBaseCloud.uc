//////////////////////////////////////////////////////////////
//				Feralidragon (04-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MBoxMissileExplBaseCloud expands NWBaseCloud;

#exec MESH IMPORT MESH=MBoxMissileExplBaseCloud ANIVFILE=MODELS\MBoxMissileExplBaseCloud_a.3d DATAFILE=MODELS\MBoxMissileExplBaseCloud_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MBoxMissileExplBaseCloud STRENGTH=0.1
#exec MESH ORIGIN MESH=MBoxMissileExplBaseCloud X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=MBoxMissileExplBaseCloud SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=MBoxMissileExplBaseCloud SEQ=PlayRevolve STARTFRAME=0 NUMFRAMES=41 RATE=40.0
#exec MESH SEQUENCE MESH=MBoxMissileExplBaseCloud SEQ=LoopRevolve STARTFRAME=0 NUMFRAMES=40 RATE=39.0

#exec MESHMAP NEW MESHMAP=MBoxMissileExplBaseCloud MESH=MBoxMissileExplBaseCloud
#exec MESHMAP SCALE MESHMAP=MBoxMissileExplBaseCloud X=0.3 Y=0.3 Z=0.6

defaultproperties
{
	Mesh=MBoxMissileExplBaseCloud
	DrawScale=17.500000
	MinDrawScale=5.000000
	
	LifeSpan=3.500000
	bWhiteSmoke=True
	FadeInTime=0.250000
	FadeOutTime=2.750000
	ScaleGlow=0.350000
	CloudDetail=8
}
