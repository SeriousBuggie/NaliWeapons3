//////////////////////////////////////////////////////////////
//				Feralidragon (03-05-2013)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////

class TheOversFXCircleA expands TheOversColoredFX;

#exec MESH IMPORT MESH=TheOversFXCircle ANIVFILE=MODELS\TheOversFXGear_a.3d DATAFILE=MODELS\TheOversFXGear_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheOversFXCircle STRENGTH=0
#exec MESH ORIGIN MESH=TheOversFXCircle X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=TheOversFXCircle SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=TheOversFXCircle MESH=TheOversFXCircle
#exec MESHMAP SCALE MESHMAP=TheOversFXCircle X=0.015 Y=0.015 Z=0.03

#exec TEXTURE IMPORT NAME=OversFXCircleR FILE=Coronas\OversFXCircleR.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=OversFXCircleG FILE=Coronas\OversFXCircleG.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=OversFXCircleB FILE=Coronas\OversFXCircleB.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
    DrawType=DT_Mesh
	Mesh=TheOversFXCircle
    MultiSkins(1)=OversFXCircleR
    MultiSkinsG(1)=OversFXCircleG
    MultiSkinsB(1)=OversFXCircleB
	
	renderOnTop=False
	
	bUnlit=True
	LifeSpan=2.900000
	DrawScale=1.500000
	ScaleGlow=2.000000
	
	enableScaling=True
	FlickerFactorMax=1.350000
	FlickerFactorMin=0.750000
	ScaleVarianceMax=1.000000
	ScaleVarianceMin=1.000000
	fadeInTime=0.500000
	fadeOutTime=0.000000
	scaleInTime=2.800000
	scaleOutTime=0.100000
	DrawScaleStart=1.0000000
	
	enableRot=True
	StartingRot=(Roll=0)
	RRate1=(Pitch=0,Roll=0)
	RRate2=(Yaw=-8000)
	
	enableOffset=True
	OffsetStart=(X=0.000000,Y=0.000000,Z=1.000000)
	OffsetActive=(X=0.000000,Y=0.000000,Z=4.00000)
	OffsetEnd=(X=0.000000,Y=0.000000,Z=0.000000)
	OffsetTimeStart=4.900000
	OffsetTimeEnd=0.100000
}
