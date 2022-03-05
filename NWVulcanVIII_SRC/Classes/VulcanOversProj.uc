//////////////////////////////////////////////////////////////
//				Feralidragon (12-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanOversProj expands TheOversProj;

defaultproperties
{
	bExplodeOnlyOnGround=False
	DistToExplode=1000.000000
	GroundMaxSlope=0.000000
	DistToDetourToGround=0.000000
	DelayToGround=0.000000

	LightBrightness=100
	LightHue=42
	LightSaturation=0
	
	ProjectileColor(0)=(bUseThisColor=True,ProjColor=(R=128,G=128,B=0))
	TrailFXColor01=(R=128,G=64,B=0)
	TrailFXColor02=(R=128,G=96,B=0)
	
	TrailFXColors(0)=TFXC_Yellow
	TrailFXColors(1)=TFXC_Orange
	TrailFXColors(2)=TFXC_Yellow
	TrailFXColors(3)=TFXC_Orange
	TrailFXColors(4)=TFXC_Yellow
	
	TrailFXGlowMin=0.850000
	TrailFXGlowMax=2.750000
	TrailFXScaleStartMin=0.750000
	TrailFXScaleStartMax=1.000000
	TrailFXScaleEndMin=1.500000
	TrailFXScaleEndMax=2.500000
	TrailFXRateMin=30.000000
	TrailFXRateMax=40.000000
}
