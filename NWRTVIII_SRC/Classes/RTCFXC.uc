//////////////////////////////////////////////////////////////
//				Feralidragon (26-05-2013)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTCFXC expands TheOversColoredFX;

#exec MESH IMPORT MESH=RTCFXC ANIVFILE=MODELS\RTCFXB_a.3d DATAFILE=MODELS\RTCFXB_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=RTCFXC STRENGTH=0
#exec MESH ORIGIN MESH=RTCFXC X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=RTCFXC SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTCFXC SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=RTCFXC MESH=RTCFXC
#exec MESHMAP SCALE MESHMAP=RTCFXC X=3.0 Y=3.0 Z=6.0


simulated function InitCFX(int i)
{
	i++;
	curRot1 = (RRate1 * i * -0.015);
	curRot2 = (RRate2 * i * -0.015);
	BaseSGlow -= (i * 0.2);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=RTCFXC
	bParticles=True
	Texture=TeleFXRed
	
	renderOnTop=False
	DrawScale=0.010000
	ScaleGlow=1.500000
	LifeSpan=6.000000
	bAnimByOwner=True
	
	enableScaling=True
	scaleInTime=1.500000
	scaleOutTime=0.100000
	
	enableRot=True
	StartingRot=(Pitch=-9000,Roll=-4000)
	RRate1=(Pitch=2000,Roll=2000)
	RRate2=(Yaw=30000)
	
	FlickerFactorMax=1.250000
	FlickerFactorMin=0.750000
	fadeInTime=0.500000
	fadeOutTime=0.100000
}
