//////////////////////////////////////////////////////////////
//				Feralidragon (20-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanSkyFireBaseCloud expands NWBaseCloud;

var() float MaxDrawScale;
var float LSpan;

simulated function PostBeginPlay()
{
	LSpan = Default.LifeSpan;
	Super.PostBeginPlay();
}

simulated function InitializeLightningClouds(float lifeTime, float minDScale, float maxDScale, optional int rotRate)
{
	LSpan = lifeTime;
	LifeSpan = LSpan;
	MinDrawScale = minDScale;
	MaxDrawScale = maxDScale;
	RotationRate.Yaw = rotRate;
}

simulated function Tick(float Delta)
{
	DrawScale = (LSpan-LifeSpan) * (MaxDrawScale - MinDrawScale) / LSpan + MinDrawScale;
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (bWhiteSmoke)
		{
			if ((LSpan-LifeSpan) <= FadeInTime && FadeInTime > 0)
				ScaleGlow = (LSpan-LifeSpan) * Default.ScaleGlow / FadeInTime;
			else if (LifeSpan <= FadeOutTime && FadeOutTime > 0)
				ScaleGlow = LifeSpan * Default.ScaleGlow / FadeOutTime;
		}
		else
		{
			if ((LSpan-LifeSpan) <= FadeInTime && FadeInTime > 0)
				ChangeBlackSmoke(Byte((LSpan-LifeSpan) * 8.0 / FadeInTime));
			else if (LifeSpan <= FadeOutTime && FadeOutTime > 0)
				ChangeBlackSmoke(Byte(LifeSpan * 8.0 / FadeOutTime));
		}
	}
}

simulated function vector getRandomCloudLoc(optional bool bFlat)
{
local vector V;
local rotator R;

	V.X = DrawScale * RandRange(64, 96);
	R.Yaw = int(FRand()*65536 - 32768);
	V = (V >> R);
	if (!bFlat)
		V.Z = DrawScale * RandRange(-96, 96);
	return (Location + (V >> Rotation));
}

defaultproperties
{
	DrawScale=25.000000
	MaxDrawScale=25.000000
	MinDrawScale=1.000000
	
	LifeSpan=15.000000
	bWhiteSmoke=True
	FadeInTime=2.500000
	FadeOutTime=5.000000
	ScaleGlow=0.350000
	CloudDetail=8
	
	Physics=PHYS_Rotating
	bFixedRotationDir=True
	RemoteRole=ROLE_None
}
