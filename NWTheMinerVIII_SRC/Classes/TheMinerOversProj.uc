//////////////////////////////////////////////////////////////
//				Feralidragon (26-10-2013)
//
// NW3 THE MINER 1.00
//////////////////////////////////////////////////////////////

class TheMinerOversProj expands TheOversProj;

defaultproperties
{
	bExplodeOnlyOnGround=True
	DistToExplode=0.000000
	GroundMaxSlope=0.250000
	DistToDetourToGround=450.000000
	DelayToGround=1.000000

	LightBrightness=100
	LightHue=106
	LightSaturation=0
	
	ProjectileColor(0)=(bUseThisColor=True,ProjColor=(R=0,G=255,B=0))
	TrailFXColor01=(R=0,G=128,B=0)
	TrailFXColor02=(R=64,G=255,B=128)
	
	TrailFXColors(0)=TFXC_Green
	TrailFXColors(1)=TFXC_OliveGreen
	TrailFXColors(2)=TFXC_White
	TrailFXColors(3)=TFXC_OliveGreen
	TrailFXColors(4)=TFXC_Green
	
	TrailFXGlowMin=0.850000
	TrailFXGlowMax=2.750000
	TrailFXScaleStartMin=0.750000
	TrailFXScaleStartMax=1.000000
	TrailFXScaleEndMin=1.500000
	TrailFXScaleEndMax=2.500000
	TrailFXRateMin=30.000000
	TrailFXRateMax=40.000000
}
