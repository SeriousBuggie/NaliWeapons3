//////////////////////////////////////////////////////////////
//				Feralidragon (24-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTLavaBubble expands FlameTWaterSmoke;

simulated function PostBeginPlay()
{
local rotator R;

	R.Yaw = Rand(16384) * 4;
	DrawScale = FRand() * 0.125 + 0.125;
	Velocity = RisingSpeed * vect(0,0,1) + vector(R) * SpreadSpeed;
}

simulated function Tick( float Delta)
{
	ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
}

simulated function ZoneChange( Zoneinfo NewZone )
{
	if (!NewZone.bWaterZone)
		Destroy();
}

defaultproperties
{
	Texture=Texture'UnrealShare.S_bubble1'
	DrawType=DT_Sprite
	DrawScale=1.500000
	LifeSpan=1.000000
	ScaleGlow=1.000000
	RisingSpeed=55.000000
	SpreadSpeed=5.000000
}
