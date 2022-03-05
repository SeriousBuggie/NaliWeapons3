//////////////////////////////////////////////////////////////
//				Feralidragon (10-07-2010)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WREMuzzle expands NaliWEffects;

//MUZZLE
//*******************************************************

//1st person
#exec MESH IMPORT MESH=WREMuzzTr ANIVFILE=MODELS\WREMuzzTr_a.3d DATAFILE=MODELS\WREMuzzTr_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=WREMuzzTr X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=WREMuzzTrR ANIVFILE=MODELS\WREMuzzTr_a.3d DATAFILE=MODELS\WREMuzzTr_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=WREMuzzTrR X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=WREMuzzTr SEQ=All STARTFRAME=0 NUMFRAMES=16
#exec MESH SEQUENCE MESH=WREMuzzTr SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WREMuzzTr SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=WREMuzzTr SEQ=Down STARTFRAME=9 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=WREMuzzTrR SEQ=All STARTFRAME=0 NUMFRAMES=16
#exec MESH SEQUENCE MESH=WREMuzzTrR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WREMuzzTrR SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=WREMuzzTrR SEQ=Down STARTFRAME=9 NUMFRAMES=7 RATE=30.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=WREMuzzTr MESH=WREMuzzTr
#exec MESHMAP SCALE MESHMAP=WREMuzzTr X=0.15 Y=0.15 Z=0.30

#exec MESHMAP NEW MESHMAP=WREMuzzTrR MESH=WREMuzzTrR
#exec MESHMAP SCALE MESHMAP=WREMuzzTrR X=0.15 Y=0.15 Z=0.30

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=WREMuzzle01 FILE=Effects\WREMuzzle01.bmp GROUP=Effects FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=WREMuzzTr NUM=1 TEXTURE=WREMuzzle01
#exec MESHMAP SETTEXTURE MESHMAP=WREMuzzTrR NUM=1 TEXTURE=WREMuzzle01

//===========================================================================

var() Mesh MeshL, MeshR;

simulated function RandomizeMesh( bool bRightHand)
{
	if (bRightHand)
		Mesh = MeshR;
	else
		Mesh = MeshL;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=WREMuzzTr
	
	bHidden=True
	Style=STY_Translucent
	ScaleGlow=1.500000
	bUnlit=True
	bNetTemporary=False
	
	MeshL=WREMuzzTr
	MeshR=WREMuzzTrR
}
