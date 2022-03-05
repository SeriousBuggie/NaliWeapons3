//////////////////////////////////////////////////////////////
//				Feralidragon (21-08-2011)
//
// NW3 MEGATON BUILD 1.00
//////////////////////////////////////////////////////////////

class MegatonAtomParticles expands NaliWEffects;

#exec MESH IMPORT MESH=MegatonAtomParticles ANIVFILE=MODELS\MegatonAtomParticles_a.3d DATAFILE=MODELS\MegatonAtomParticles_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=MegatonAtomParticles X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MegatonAtomParticles SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonAtomParticles SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MegatonAtomParticles MESH=MegatonAtomParticles
#exec MESHMAP SCALE MESHMAP=MegatonAtomParticles X=0.0712 Y=0.0712 Z=0.1424

simulated function PostBeginPlay()
{
	RotationRate = RotRand(True);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=MegatonAtomParticles
	bParticles=True
	Texture=MegatonAtomRed
	bUnlit=True
	ScaleGlow=1.800000
	Style=STY_Translucent
	bNetTemporary=False
	Lifespan=0.000000
	DrawScale=0.020000
	
	Physics=PHYS_Rotating
	bFixedRotationDir=True
}
