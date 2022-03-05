//////////////////////////////////////////////////////////////
//				Feralidragon (10-07-2010)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WREMuzzleCor expands WREMuzzle;

//MUZZLE
//*******************************************************

//1st person
#exec MESH IMPORT MESH=WREMuzzCor ANIVFILE=MODELS\WREMuzzCor_a.3d DATAFILE=MODELS\WREMuzzCor_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=WREMuzzCor X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=WREMuzzCorR ANIVFILE=MODELS\WREMuzzCor_a.3d DATAFILE=MODELS\WREMuzzCor_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=WREMuzzCorR X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=WREMuzzCor SEQ=All STARTFRAME=0 NUMFRAMES=4
#exec MESH SEQUENCE MESH=WREMuzzCor SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WREMuzzCor SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0

#exec MESH SEQUENCE MESH=WREMuzzCorR SEQ=All STARTFRAME=0 NUMFRAMES=4
#exec MESH SEQUENCE MESH=WREMuzzCorR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WREMuzzCorR SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=WREMuzzCor MESH=WREMuzzCor
#exec MESHMAP SCALE MESHMAP=WREMuzzCor X=0.15 Y=0.15 Z=0.30

#exec MESHMAP NEW MESHMAP=WREMuzzCorR MESH=WREMuzzCorR
#exec MESHMAP SCALE MESHMAP=WREMuzzCorR X=0.15 Y=0.15 Z=0.30

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=WREMuzzle02 FILE=Effects\WREMuzzle02.bmp GROUP=Effects FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=WREMuzzCor NUM=1 TEXTURE=WREMuzzle02
#exec MESHMAP SETTEXTURE MESHMAP=WREMuzzCorR NUM=1 TEXTURE=WREMuzzle02

//===========================================================================

defaultproperties
{
    Mesh=WREMuzzCor
	ScaleGlow=0.850000
	
	MeshL=WREMuzzCor
	MeshR=WREMuzzCorR
}
