//////////////////////////////////////////////////////////////
//				Feralidragon (27-10-2013)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheMinerOversFXAOV expands TheMinerOversFXA;

#exec MESH IMPORT MESH=TheMinerOversFXAOV ANIVFILE=MODELS\TheMinerOversFXAOV_a.3d DATAFILE=MODELS\TheMinerOversFXAOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheMinerOversFXAOV STRENGTH=0.0
#exec MESH ORIGIN MESH=TheMinerOversFXAOV X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=TheMinerOversFXAOV SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheMinerOversFXAOV SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=TheMinerOversFXAOV MESH=TheMinerOversFXAOV
#exec MESHMAP SCALE MESHMAP=TheMinerOversFXAOV X=0.025 Y=0.025 Z=0.025

#exec TEXTURE IMPORT NAME=SK_TheMinerOversFX_OV FILE=Overlays\SK_TheMinerOversFX_OV.bmp GROUP=Skins LODSET=2 MIPS=OFF
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerOversFXAOV NUM=1 TEXTURE=SK_TheMinerOversFX_OV

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=TheMinerOversFXAOV
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=1.500000

	fadeInTime=0.200000
	fadeOutTime=0.100000
	FlickerFactorMax=1.500000
	FlickerFactorMin=0.500000
}
