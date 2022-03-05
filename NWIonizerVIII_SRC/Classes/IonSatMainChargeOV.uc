//////////////////////////////////////////////////////////////
//				Feralidragon (20-12-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonSatMainChargeOV expands NaliTrail;

#exec MESH IMPORT MESH=IonSatMainChargeOV ANIVFILE=MODELS\IonSatMainChargeOV_a.3d DATAFILE=MODELS\IonSatMainChargeOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatMainChargeOV STRENGTH=0.0
#exec MESH ORIGIN MESH=IonSatMainChargeOV X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatMainChargeOV SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=IonSatMainChargeOV SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatMainChargeOV SEQ=Openning STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=IonSatMainChargeOV SEQ=Closed STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatMainChargeOV SEQ=Closing STARTFRAME=0 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=IonSatMainChargeOV MESH=IonSatMainChargeOV
#exec MESHMAP SCALE MESHMAP=IonSatMainChargeOV X=0.3 Y=0.3 Z=0.6

#exec TEXTURE IMPORT NAME=IonizerSatellite01_OV FILE=SKINS\IonizerSatellite01_OV.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IonSatMainChargeOV NUM=1 TEXTURE=IonizerSatellite01_OV

#exec TEXTURE IMPORT NAME=IonizerSatellite02_OV FILE=SKINS\IonizerSatellite02_OV.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IonSatMainChargeOV NUM=2 TEXTURE=IonizerSatellite02_OV


var() float FadeOutTime;
var() float GlowNoise;

var float TimeToFadeIn, TimeAlive, TCount;

replication
{
	reliable if (Role == ROLE_Authority)
		TimeToFadeIn, TimeAlive;
}

simulated function PostBeginPlay()
{
	ScaleGlow = 0.0;
	Super.PostBeginPlay();
}

simulated function Tick(float Delta)
{
local float tTime;

	TCount += Delta;
	tTime = TimeToFadeIn + TimeAlive + FadeOutTime;
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (TCount <= TimeToFadeIn)
			Scaleglow = TCount * Default.ScaleGlow / TimeToFadeIn;
		else if (TCount >= (tTime - FadeOutTime) && TCount <= tTime)
			Scaleglow = (tTime - TCount) * Default.ScaleGlow / FadeOutTime;
		else
			ScaleGlow = Default.ScaleGlow;
			
		ScaleGlow += (ScaleGlow*(FRand()*2-1)*GlowNoise);
		if (ScaleGlow < 0.0)
			ScaleGlow = 0.0;
	}
	
	if (TCount >= tTime)
		Destroy();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonSatMainChargeOV
	bAnimByOwner=True
	Style=STY_Translucent
	bUnlit=True
	ScaleGlow=3.000000
	
	TimeToFadeIn=7.000000
	TimeAlive=6.000000
	
	FadeOutTime=2.000000
	GlowNoise=0.250000
}
