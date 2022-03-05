//////////////////////////////////////////////////////////////
//				Feralidragon (17-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWUDamCor expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=NWUDamCor FILE=Coronas\NWUDamCor.bmp GROUP=Coronas FLAGS=2

var() vector LocOffset;
var float basePickupGlow;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && localPlayer != None && Owner != None)
	{
		bHidden = Owner.bHidden;
		if (!bHidden)
		{
			PrePivot = (LocOffset >> Owner.Rotation);
			Super.Tick(Delta);
			if (!bHidden && (localUpdater == None || Delta == 0.5))
			{
				if (basePickupGlow <= 0.0)
					basePickupGlow = Owner.ScaleGlow;
				else if (Owner.ScaleGlow != Owner.default.ScaleGlow)
					Owner.ScaleGlow = Owner.default.ScaleGlow;
				ScaleGlow *= (Class'NWInfo'.default.PickupsGlowScale * (basePickupGlow/Owner.default.ScaleGlow));
				bHidden = (ScaleGlow <= 0.0);
			}
		}
	}
}

defaultproperties
{
	MaxDistance=8000.000000
	FadeInTime=0.000000
	FadeOutTime=0.000000
	CoronaSprite=NWUDamCor
	MaxCoronaSize=0.200000
	MinCoronaSize=0.300000
	CGlow=2.000000
	StartScaleTime=0.000000
	StartScaleCoef=2.000000
	EndScaleTime=0.000000
	EndScaleCoef=1.000000
	
	Physics=PHYS_Trailer
	bTrailerSameRotation=True
	bTrailerPrePivot=True
	Mass=0.000000
	LifeSpan=0.000000
	bNetTemporary=False
	
	CGlowMax=2.000000
	CGlowMin=1.500000
	DScaleCoefMax=1.150000
	DScaleCoefMin=0.850000
	
	LocOffset=(Z=4.000000)
}
