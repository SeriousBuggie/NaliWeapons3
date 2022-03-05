//////////////////////////////////////////////////////////////
//				Feralidragon (27-10-2013)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheMinerOversFXB expands TheMinerOversFXA;

#exec MESH IMPORT MESH=TheMinerOversFXB ANIVFILE=MODELS\TheMinerOversFXB_a.3d DATAFILE=MODELS\TheMinerOversFXB_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheMinerOversFXB STRENGTH=0.0
#exec MESH ORIGIN MESH=TheMinerOversFXB X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=TheMinerOversFXB SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheMinerOversFXB SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=TheMinerOversFXB MESH=TheMinerOversFXB
#exec MESHMAP SCALE MESHMAP=TheMinerOversFXB X=0.025 Y=0.025 Z=0.025

#exec TEXTURE IMPORT NAME=SK_TheMinerOversFX FILE=SKINS\SK_TheMinerOversFX.bmp GROUP=Skins LODSET=2 MIPS=OFF
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerOversFXB NUM=1 TEXTURE=SK_TheMinerOversFX

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=TheMinerOversFXB
	DrawScale=0.600000
	
	enableRot=True
	StartingRot=(Pitch=-3500,Roll=2000)
	RRate1=(Roll=1000)
	RRate2=(Yaw=15000)
}
