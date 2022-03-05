//////////////////////////////////////////////////////////////
//				Feralidragon (28-07-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WRESoldCorR expands NWCoronaFX;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && localPlayer != None)
	{
		if (Owner != None)
			PrePivot = (default.PrePivot >> Owner.Rotation);
		Super.Tick(Delta);
	}
}

defaultproperties
{
	MaxDistance=25000.000000
	FadeInTime=0.000000
	FadeOutTime=0.085000
	StartScaleTime=0.000000
	EndScaleTime=0.000000
	
	CoronaSprite=WREMuzzle02
	CGlowMax=2.000000
	CGlowMin=1.000000
	MaxCoronaSize=8.000000
	MinCoronaSize=5.000000
	CGlow=1.500000
	LifeSpan=0.085000
	
	Physics=PHYS_Trailer
	bTrailerPrePivot=True
	PrePivot=(X=304.000000,Y=-164.000000,Z=-124.000000)
	
	bForceNoColDetail=True
}
