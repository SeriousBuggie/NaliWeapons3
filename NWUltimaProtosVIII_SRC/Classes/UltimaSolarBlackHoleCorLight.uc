//////////////////////////////////////////////////////////////
//				Feralidragon (26-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarBlackHoleCorLight expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=UltimaCorLight FILE=Coronas\UltimaCorLight.bmp GROUP=Coronas FLAGS=2

var float uGlow, uScale;

simulated function PostBeginPlay()
{
	uGlow = ScaleGlow;
	uScale = DrawScale;
	Super.PostBeginPlay();
}

simulated function Tick(float DeltaTime)
{
	ScaleGlow = uGlow;
	DrawScale = uScale;
	Super.Tick(DeltaTime);
	uGlow = ScaleGlow;
	uScale = DrawScale;
	
	if (Level.NetMode != NM_DedicatedServer && localPlayer != None)
	{
		ScaleGlow *= FRand()*(CGlowMax-CGlowMin) + CGlowMin;
		DrawScale *= (FRand()*(DScaleCoefMax-DScaleCoefMin) + DScaleCoefMin);
	}
}

defaultproperties
{
	MaxDistance=60000.000000
	FadeInTime=2.500000
	FadeOutTime=1.000000
	CoronaSprite=UltimaCorLight
	MaxCoronaSize=15.000000
	MinCoronaSize=10.000000
	CGlow=1.500000
	StartScaleTime=7.000000
	EndScaleTime=0.000000
	LifeSpan=7.000000
	
	CGlowMax=1.000000
	CGlowMin=0.000000
	DScaleCoefMax=1.200000
	DScaleCoefMin=0.500000
}
