//////////////////////////////////////////////////////////////
//				Feralidragon (27-10-2013)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheMinerOversFXBOV expands TheMinerOversFXB;

#exec MESH IMPORT MESH=TheMinerOversFXBOV ANIVFILE=MODELS\TheMinerOversFXBOV_a.3d DATAFILE=MODELS\TheMinerOversFXBOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheMinerOversFXBOV STRENGTH=0.0
#exec MESH ORIGIN MESH=TheMinerOversFXBOV X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=TheMinerOversFXBOV SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheMinerOversFXBOV SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=TheMinerOversFXBOV MESH=TheMinerOversFXBOV
#exec MESHMAP SCALE MESHMAP=TheMinerOversFXBOV X=0.025 Y=0.025 Z=0.025

#exec TEXTURE IMPORT NAME=SK_TheMinerOversFX_OV FILE=Overlays\SK_TheMinerOversFX_OV.bmp GROUP=Skins LODSET=2 MIPS=OFF
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerOversFXBOV NUM=1 TEXTURE=SK_TheMinerOversFX_OV

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=TheMinerOversFXBOV
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=0.500000

	fadeInTime=0.200000
	fadeOutTime=0.100000
	FlickerFactorMax=1.500000
	FlickerFactorMin=0.500000
}
