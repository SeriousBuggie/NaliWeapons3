//////////////////////////////////////////////////////////////
//				Feralidragon (03-05-2013)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////

class TheOversFXGearA expands TheOversColoredFX;

#exec MESH IMPORT MESH=TheOversFXGear ANIVFILE=MODELS\TheOversFXGear_a.3d DATAFILE=MODELS\TheOversFXGear_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheOversFXGear STRENGTH=0
#exec MESH ORIGIN MESH=TheOversFXGear X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=TheOversFXGear SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=TheOversFXGear MESH=TheOversFXGear
#exec MESHMAP SCALE MESHMAP=TheOversFXGear X=0.015 Y=0.015 Z=0.03

#exec TEXTURE IMPORT NAME=OversFXGearR FILE=Coronas\OversFXGearR.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=OversFXGearG FILE=Coronas\OversFXGearG.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=OversFXGearB FILE=Coronas\OversFXGearB.bmp GROUP=Coronas FLAGS=2


simulated function Tick(float Delta)
{
local float L;

	if (!isSlave && Level.NetMode != NM_DedicatedServer)
	{
		L = Default.LifeSpan - LifeSpan;
		if (enableScaling)
		{
			if (L <= fadeInTime)
				DrawScaleStart = L * default.DrawScaleStart / fadeInTime;
			else
				DrawScaleStart = default.DrawScaleStart;
		}
	}
	
	Super.Tick(Delta);
}


defaultproperties
{
    DrawType=DT_Mesh
	Mesh=TheOversFXGear
    MultiSkins(1)=OversFXGearR
    MultiSkinsG(1)=OversFXGearG
    MultiSkinsB(1)=OversFXGearB
	
	renderOnTop=False
	
	bUnlit=True
	LifeSpan=3.900000
	DrawScale=3.000000
	ScaleGlow=2.000000
	
	enableScaling=True
	FlickerFactorMax=1.350000
	FlickerFactorMin=0.750000
	ScaleVarianceMax=1.000000
	ScaleVarianceMin=1.000000
	fadeInTime=0.500000
	fadeOutTime=0.000000
	scaleInTime=3.800000
	scaleOutTime=0.100000
	DrawScaleStart=0.7500000
	
	enableRot=True
	StartingRot=(Roll=0)
	RRate1=(Pitch=650,Roll=500)
	RRate2=(Yaw=25000)
	
	enableOffset=True
	OffsetStart=(X=0.000000,Y=0.000000,Z=0.000000)
	OffsetActive=(X=0.000000,Y=0.000000,Z=2.500000)
	OffsetEnd=(X=0.000000,Y=0.000000,Z=0.000000)
	OffsetTimeStart=6.000000
	OffsetTimeEnd=0.100000
}
