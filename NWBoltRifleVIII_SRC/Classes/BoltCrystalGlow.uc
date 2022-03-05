//////////////////////////////////////////////////////////////
//				Feralidragon (14-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltCrystalGlow expands NaliWEffects;

#exec MESH IMPORT MESH=BoltCrystalGlow ANIVFILE=MODELS\BoltCrystalGlow_a.3d DATAFILE=MODELS\BoltCrystalGlow_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltCrystalGlow STRENGTH=0
#exec MESH ORIGIN MESH=BoltCrystalGlow X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltCrystalGlow SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltCrystalGlow SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=BoltCrystalGlow MESH=BoltCrystalGlow
#exec MESHMAP SCALE MESHMAP=BoltCrystalGlow X=0.4 Y=0.4 Z=0.8

#exec TEXTURE IMPORT NAME=BoltCrystalGlow FILE=Coronas\BoltCrystalGlow.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=BoltCrystalGlow
	bUnlit=True
	Style=STY_Translucent
	LifeSpan=0.000000
	ScaleGlow=0.750000
	DrawScale=32.000000
	bParticles=True
	Texture=BoltCrystalGlow
	
	Physics=PHYS_Trailer
	bTrailerSameRotation=True
	SoundPitch=16
}
