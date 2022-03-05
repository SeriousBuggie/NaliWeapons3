//////////////////////////////////////////////////////////////
//				Feralidragon (09-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPROversProj expands TheOversProj;

defaultproperties
{
	bExplodeOnlyOnGround=True
	DistToExplode=0.000000
	GroundMaxSlope=0.250000
	DistToDetourToGround=450.000000
	DelayToGround=1.000000

	LightBrightness=100
	LightHue=244
	LightSaturation=64
	
	ProjectileColor(0)=(bUseThisColor=True,ProjColor=(R=192,G=48,B=48))
	TrailFXColor01=(R=192,G=64,B=32)
	TrailFXColor02=(R=192,G=0,B=32)
	
	TrailFXColors(0)=TFXC_Red
	TrailFXColors(1)=TFXC_Red
	TrailFXColors(2)=TFXC_Red
	TrailFXColors(3)=TFXC_Red
	TrailFXColors(4)=TFXC_Red
	
	TrailFXGlowMin=0.850000
	TrailFXGlowMax=2.750000
	TrailFXScaleStartMin=0.750000
	TrailFXScaleStartMax=1.000000
	TrailFXScaleEndMin=1.500000
	TrailFXScaleEndMax=2.500000
	TrailFXRateMin=30.000000
	TrailFXRateMax=40.000000
}
