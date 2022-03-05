//////////////////////////////////////////////////////////////
//				Feralidragon (10-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCannonInnerC expands IRPRCannonInnerLaser;

#exec MESH IMPORT MESH=IRPRCannonInnerC ANIVFILE=MODELS\IRPRCannonInnerC_a.3d DATAFILE=MODELS\IRPRCannonInnerC_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IRPRCannonInnerC STRENGTH=0.0
#exec MESH ORIGIN MESH=IRPRCannonInnerC X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=IRPRCannonInnerC SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=IRPRCannonInnerC SEQ=Opened STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRCannonInnerC SEQ=Closed STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRCannonInnerC SEQ=Opening STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IRPRCannonInnerC SEQ=Closing STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=IRPRCannonInnerC MESH=IRPRCannonInnerC
#exec MESHMAP SCALE MESHMAP=IRPRCannonInnerC X=0.3 Y=0.3 Z=0.6

#exec TEXTURE IMPORT NAME=IRPRCRed FILE=SKINS\IRPRCRed.bmp GROUP=Skins LODSET=0 MIPS=OFF
#exec MESHMAP SETTEXTURE MESHMAP=IRPRCannonInnerC NUM=1 TEXTURE=IRPRCRed

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IRPRCannonInnerC
}
