//////////////////////////////////////////////////////////////
//				Feralidragon (21-08-2011)
//
// NW3 MEGATON BUILD 1.00
//////////////////////////////////////////////////////////////

class MegatonAtomDecay expands NaliWEffects;

#exec MESH IMPORT MESH=MegatonAtomDecay ANIVFILE=MODELS\MegatonAtomDecay_a.3d DATAFILE=MODELS\MegatonAtomDecay_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MegatonAtomDecay STRENGTH=0.0
#exec MESH ORIGIN MESH=MegatonAtomDecay X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MegatonAtomDecay SEQ=All STARTFRAME=0 NUMFRAMES=12
#exec MESH SEQUENCE MESH=MegatonAtomDecay SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonAtomDecay SEQ=RotMove STARTFRAME=0 NUMFRAMES=12 RATE=11.0

#exec MESHMAP NEW MESHMAP=MegatonAtomDecay MESH=MegatonAtomDecay
#exec MESHMAP SCALE MESHMAP=MegatonAtomDecay X=0.0712 Y=0.0712 Z=0.1424

simulated function PostBeginPlay()
{
	AnimEnd();
}

simulated function AnimEnd()
{
	PlayAnim('RotMove', 4.0, 0.0);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=MegatonAtomDecay
	bParticles=True
	Texture=MegatonAtomRed
	bUnlit=True
	ScaleGlow=1.800000
	bNetTemporary=False
	Lifespan=0.000000
	DrawScale=0.020000
	Style=STY_Translucent
}
