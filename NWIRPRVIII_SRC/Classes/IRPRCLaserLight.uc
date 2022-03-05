//////////////////////////////////////////////////////////////
//				Feralidragon (10-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCLaserLight expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=IRPRCLaserLight FILE=Coronas\IRPRCLaserLight.bmp GROUP=Coronas FLAGS=2

var float curScaleGlow, curDScale;

simulated function PostBeginPlay()
{
	curScaleGlow = CGlow;
	Super.PostBeginPlay();
}

simulated function Tick(float Delta)
{
	ScaleGlow = curScaleGlow;
	Super.Tick(Delta);
	curScaleGlow = ScaleGlow;
	if (Level.NetMode != NM_DedicatedServer)
	{
		ScaleGlow = curScaleGlow * (FRand()*(CGlowMax-CGlowMin) + CGlowMin);
		DrawScale *= (FRand()*(DScaleCoefMax-DScaleCoefMin) + DScaleCoefMin);
	}
}

defaultproperties
{
	MaxDistance=40000.000000
	FadeInTime=0.100000
	FadeOutTime=0.150000
	CoronaSprite=IRPRCLaserLight
	MaxCoronaSize=2.50000
	MinCoronaSize=1.000000
	StartScaleTime=0.100000
	EndScaleTime=0.000000
	CGlow=2.000000
	LifeSpan=4.000000
	
	CGlowMax=1.100000
	CGlowMin=0.900000
	DScaleCoefMax=1.200000
	DScaleCoefMin=0.800000
}
