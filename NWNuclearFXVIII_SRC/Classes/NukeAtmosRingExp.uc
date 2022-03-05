//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2012)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeAtmosRingExp expands NukeAtmosRing;

#exec MESH IMPORT MESH=NukeAtmosRingExp ANIVFILE=MODELS\NukeAtmosRing_a.3d DATAFILE=MODELS\NukeAtmosRing_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NukeAtmosRingExp STRENGTH=0.1
#exec MESH ORIGIN MESH=NukeAtmosRingExp X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NukeAtmosRingExp SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeAtmosRingExp SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NukeAtmosRingExp MESH=NukeAtmosRingExp
#exec MESHMAP SCALE MESHMAP=NukeAtmosRingExp X=0.1 Y=0.1 Z=0.3

#exec TEXTURE IMPORT NAME=NukeAtmosRingExp FILE=CORONAS\NukeAtmosRingExp.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=NukeAtmosRingExp NUM=1 TEXTURE=NukeAtmosRingExp

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NukeAtmosRingExp
	Physics=PHYS_Rotating
	bFixedRotationDir=True
	RotationRate=(Yaw=2000)
	ScaleGlow=2.000000
}
