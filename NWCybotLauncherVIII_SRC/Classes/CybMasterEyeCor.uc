//////////////////////////////////////////////////////////////
//				Feralidragon (14-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybMasterEyeCor expands NWCoronaFX;

var float fadeCCount;

simulated function Tick(float Delta)
{
local float f;
local int i;

	Super.Tick(Delta);
	if (Level.NetMode != NM_DedicatedServer && localPlayer != None && Owner != None)
	{
		if (localUpdater != None && Delta != 0.5)
			return;
		if (Delta == 0.5)
			Delta = updateDelta;
			
		f = 1.f;
		if (fadeCCount < FadeInTime)
		{
			fadeCCount += Delta;
			if (fadeCCount > FadeInTime)
				fadeCCount = FadeInTime;
			f *= (fadeCCount/FadeInTime);
		}
		f *= FMin(FMax((Normal(localPlayer.Location - getRealLocation()) dot vector(Owner.Rotation)) + 0.3, 0.0), 1.0);
		ScaleGlow *= f;
		
		if (enableLensFlare)
		{
			for (i = 0; i < ArrayCount(LensFlareParts); i++)
			{
				if (LensFlareParts[i].LensA != None)
					LensFlareParts[i].LensA.ScaleGlow *= f;
			}
		}
	}
}

defaultproperties
{
	MaxDistance=20000.000000
	CoronaSprite=CybProjCorRed
	MaxCoronaSize=4.500000
	MinCoronaSize=3.000000
	CGlow=1.500000
	LifeSpan=0.000000
	FadeInTime=6.000000
	bNetTemporary=False
	
	CGlowMax=1.500000
	CGlowMin=0.550000
	DScaleCoefMax=1.000000
	DScaleCoefMin=1.000000
	
	Physics=PHYS_Trailer
	bTrailerPrePivot=True
}
