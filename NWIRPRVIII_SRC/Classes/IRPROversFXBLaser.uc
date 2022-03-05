//////////////////////////////////////////////////////////////
//				Feralidragon (16-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPROversFXBLaser expands TheOversColoredFX;

#exec MESH IMPORT MESH=IRPROversFXBLaser ANIVFILE=MODELS\IRPROversFXBLaser_a.3d DATAFILE=MODELS\IRPROversFXBLaser_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=IRPROversFXBLaser X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IRPROversFXBLaser SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=IRPROversFXBLaser SEQ=Shrink STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IRPROversFXBLaser SEQ=Grow STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IRPROversFXBLaser SEQ=Grown STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPROversFXBLaser SEQ=Shrunk STARTFRAME=1 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IRPROversFXBLaser MESH=IRPROversFXBLaser
#exec MESHMAP SCALE MESHMAP=IRPROversFXBLaser X=0.7 Y=0.7 Z=1.4

#exec TEXTURE IMPORT NAME=IRPRCLaserTrace FILE=CORONAS\IRPRCLaserTrace.bmp GROUP=Skins LODSET=0 MIPS=OFF
#exec MESHMAP SETTEXTURE MESHMAP=IRPROversFXBLaser NUM=1 TEXTURE=IRPRCLaserTrace

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IRPROversFXBLaser
	bUnlit=True
	Style=STY_Translucent
	bAnimByOwner=True
	
	renderOnTop=False
	DrawScale=0.025000
	ScaleGlow=1.700000
	LifeSpan=10.000000
	
	fadeInTime=0.600000
	FlickerFactorMax=1.300000
	FlickerFactorMin=0.500000
}
