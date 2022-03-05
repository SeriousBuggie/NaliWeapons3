//////////////////////////////////////////////////////////////
//				Feralidragon (26-05-2013)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTCFXB expands TheOversColoredFX;

#exec MESH IMPORT MESH=RTCFXB ANIVFILE=MODELS\RTCFXB_a.3d DATAFILE=MODELS\RTCFXB_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=RTCFXB STRENGTH=0
#exec MESH ORIGIN MESH=RTCFXB X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=RTCFXB SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTCFXB SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=RTCFXB MESH=RTCFXB
#exec MESHMAP SCALE MESHMAP=RTCFXB X=1.5 Y=1.5 Z=3.0


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=RTCFXB
	bParticles=True
	Texture=TeleFXRed
	
	renderOnTop=False
	DrawScale=0.010000
	ScaleGlow=1.500000
	LifeSpan=6.000000
	bAnimByOwner=True
	
	enableScaling=True
	scaleInTime=0.200000
	scaleOutTime=0.100000
	
	enableRot=True
	StartingRot=(Pitch=700,Roll=-7000)
	RRate1=(Roll=600)
	RRate2=(Yaw=30000)
	
	FlickerFactorMax=1.250000
	FlickerFactorMin=0.750000
	fadeInTime=0.100000
	fadeOutTime=0.100000
}
