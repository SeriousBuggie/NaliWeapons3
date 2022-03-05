//////////////////////////////////////////////////////////////
//				Feralidragon (07-08-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WRESoldTrailCor expands NWCoronaFX;

var() float FlamesRate, FlamesDepthOffset;
var float flameRCount;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && localPlayer != None)
	{
		if (Owner != None)
			PrePivot = (default.PrePivot >> Owner.Rotation);
		Super.Tick(Delta);
		
		if (Owner != None && Delta != 0.5 && FlamesRate > 0.0)
		{
			flameRCount += Delta;
			if (flameRCount >= (1/FlamesRate))
			{
				flameRCount = 0.0;
				Spawn(Class'WRESoldTrailFlame',,, Owner.Location + PrePivot + Normal(PrePivot)*FlamesDepthOffset, rotator(PrePivot));
			}
		}
	}
}

defaultproperties
{
	MaxDistance=25000.000000
	FadeInTime=0.000000
	StartScaleTime=0.000000
	
	CoronaSprite=WREGrenadeExplCor
	CGlowMax=0.800000
	CGlowMin=0.400000
	MaxCoronaSize=5.000000
	MinCoronaSize=2.500000
	CGlow=1.500000
	LifeSpan=0.000000
	
	bNetTemporary=False
	Physics=PHYS_Trailer
	bTrailerPrePivot=True
	PrePivot=(Z=-128.000000)
	
	bForceColDetail=True
	FlamesRate=10.000000
	FlamesDepthOffset=-32.000000
}
