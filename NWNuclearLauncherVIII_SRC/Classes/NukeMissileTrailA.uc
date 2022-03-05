//////////////////////////////////////////////////////////////
//				Feralidragon (09-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeMissileTrailA expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=NukeMissileTrailA FILE=Coronas\NukeMissileTrailA.bmp GROUP=Coronas FLAGS=2

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && localPlayer != None)
	{
		if (Owner != None)
			PrePivot = ((Mass*vect(-1,0,0)) >> Owner.Rotation);
		Super.Tick(Delta);
	}
}

defaultproperties
{
	MaxDistance=40000.000000
	FadeInTime=0.100000
	FadeOutTime=0.000000
	CoronaSprite=NukeMissileTrailA
	MaxCoronaSize=7.000000
	MinCoronaSize=1.000000
	CGlow=2.000000
	StartScaleTime=0.100000
	StartScaleCoef=1.000000
	EndScaleTime=0.000000
	EndScaleCoef=1.000000
	
	Physics=PHYS_Trailer
	bTrailerSameRotation=True
	bTrailerPrePivot=True
	Mass=40.000000
	LifeSpan=0.000000
	bNetTemporary=False
	
	CGlowMax=2.000000
	CGlowMin=1.500000
	DScaleCoefMax=1.250000
	DScaleCoefMin=0.750000
}
