//////////////////////////////////////////////////////////////
//				Feralidragon (28-05-2013)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTDiscOV expands NaliWEffects;

#exec MESH IMPORT MESH=RTDiscOV ANIVFILE=MODELS\RTDiscOV_a.3d DATAFILE=MODELS\RTDiscOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=RTDiscOV STRENGTH=0
#exec MESH ORIGIN MESH=RTDiscOV X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=RTDiscOV SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=RTDiscOV SEQ=Closing STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTDiscOV SEQ=Opening STARTFRAME=1 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=RTDiscOV MESH=RTDiscOV
#exec MESHMAP SCALE MESHMAP=RTDiscOV X=1.0 Y=1.0 Z=2.0

#exec TEXTURE IMPORT NAME=Sk_RTDiscOV FILE=Overlays\Sk_RTDiscOV.bmp GROUP=Overlays LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=RTDiscOV NUM=1 TEXTURE=Sk_RTDiscOV


simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = default.ScaleGlow + (FRand()*0.5 - 0.25);
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=RTDiscOV
	bAnimByOwner=True
	bNetTemporary=False
	Mass=0.000000
	CollisionHeight=0.000000
	CollisionRadius=0.000000
	Skin=None
	Style=STY_Translucent
	bUnlit=True
	DrawScale=1.000000
	ScaleGlow=1.500000
	Physics=PHYS_Trailer
	PrePivot=(X=0.000000,Y=0.000000,Z=0.000000)
	bTrailerPrePivot=False
	bTrailerSameRotation=True
}
