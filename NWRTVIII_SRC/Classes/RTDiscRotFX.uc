//////////////////////////////////////////////////////////////
//				Feralidragon (26-05-2013)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTDiscRotFX expands NaliWEffects;

#exec MESH IMPORT MESH=RTDiscRotFX ANIVFILE=MODELS\RTCFXB_a.3d DATAFILE=MODELS\RTCFXB_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=RTDiscRotFX STRENGTH=0
#exec MESH ORIGIN MESH=RTDiscRotFX X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=RTDiscRotFX SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTDiscRotFX SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=RTDiscRotFX MESH=RTDiscRotFX
#exec MESHMAP SCALE MESHMAP=RTDiscRotFX X=1.5 Y=1.5 Z=2.5


var() float fadeInTime, YawRate, YawInTime;
var float BaseSGlow;

simulated function PostBeginPlay()
{
	BaseSGlow = ScaleGlow;
	Super.PostBeginPlay();
}

simulated function InitFX(int i)
{
local rotator R;
	
	if (i == 0)
		DrawScale *= 2;

	i++;
	R.Yaw = Rotation.Yaw - i*250;
	SetRotation(R);
	BaseSGlow -= (i * 0.05);
}

simulated function Tick(float Delta)
{
local rotator R;

	if (Level.NetMode != NM_DedicatedServer)
	{
		if ((default.LifeSpan - LifeSpan) < fadeInTime)
			ScaleGlow = (default.LifeSpan - LifeSpan) * BaseSGlow / fadeInTime;
		else
			ScaleGlow = LifeSpan * BaseSGlow / (default.LifeSpan - fadeInTime);
			
		R = Rotation;
		if ((default.LifeSpan - LifeSpan) < YawInTime)
			R.Yaw += ((default.LifeSpan - LifeSpan)/YawInTime) * (YawRate*Delta);
		else
			R.Yaw += (LifeSpan/(default.LifeSpan - YawInTime)) * (YawRate*Delta);
		SetRotation(R);
	}
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=RTDiscRotFX
	bParticles=True
	Texture=TeleFXRed
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=0.600000
	ScaleGlow=2.000000
	LifeSpan=3.000000
	
	YawInTime=0.000000
	fadeInTime=0.100000
	YawRate=300000.000000
}
