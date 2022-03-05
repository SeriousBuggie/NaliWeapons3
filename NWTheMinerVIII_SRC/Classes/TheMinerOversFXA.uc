//////////////////////////////////////////////////////////////
//				Feralidragon (27-10-2013)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheMinerOversFXA expands TheOversColoredFX;

#exec MESH IMPORT MESH=TheMinerOversFXA ANIVFILE=MODELS\TheMinerOversFXA_a.3d DATAFILE=MODELS\TheMinerOversFXA_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheMinerOversFXA STRENGTH=0.0
#exec MESH ORIGIN MESH=TheMinerOversFXA X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=TheMinerOversFXA SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheMinerOversFXA SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=TheMinerOversFXA MESH=TheMinerOversFXA
#exec MESHMAP SCALE MESHMAP=TheMinerOversFXA X=0.025 Y=0.025 Z=0.025

#exec TEXTURE IMPORT NAME=SK_TheMinerOversFX FILE=SKINS\SK_TheMinerOversFX.bmp GROUP=Skins LODSET=2 MIPS=OFF
#exec MESHMAP SETTEXTURE MESHMAP=TheMinerOversFXA NUM=1 TEXTURE=SK_TheMinerOversFX

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=TheMinerOversFXA
	bUnlit=False
	Style=STY_Normal
	
	renderOnTop=False
	DrawScale=0.500000
	ScaleGlow=2.000000
	LifeSpan=6.000000

	fadeInTime=0.000000
	fadeOutTime=0.000000
	FlickerFactorMax=1.000000
	FlickerFactorMin=1.000000
	
	enableScaling=True
	scaleInTime=0.200000
	scaleOutTime=0.100000
	ScaleVarianceMax=1.000000
	ScaleVarianceMin=1.000000
	
	enableRot=True
	StartingRot=(Pitch=3200,Roll=1200)
	RRate1=(Roll=-1000)
	RRate2=(Yaw=7000)
}
