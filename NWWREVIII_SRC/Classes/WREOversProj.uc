//////////////////////////////////////////////////////////////
//				Feralidragon (24-07-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WREOversProj expands TheOversProj;

defaultproperties
{
	bExplodeOnlyOnGround=False
	DistToExplode=450.000000
	GroundMaxSlope=0.000000
	DistToDetourToGround=0.000000
	DelayToGround=0.000000

	LightBrightness=100
	LightHue=170
	LightSaturation=0
	
	ProjectileColor(0)=(bUseThisColor=True,ProjColor=(R=64,G=0,B=255))
	TrailFXColor01=(R=0,G=0,B=255)
	TrailFXColor02=(R=0,G=0,B=128)
	
	TrailFXColors(0)=TFXC_Blue
	TrailFXColors(1)=TFXC_White
	TrailFXColors(2)=TFXC_Purple
	TrailFXColors(3)=TFXC_White
	TrailFXColors(4)=TFXC_Blue
	
	TrailFXGlowMin=0.850000
	TrailFXGlowMax=2.750000
	TrailFXScaleStartMin=0.750000
	TrailFXScaleStartMax=1.000000
	TrailFXScaleEndMin=1.500000
	TrailFXScaleEndMax=2.500000
	TrailFXRateMin=30.000000
	TrailFXRateMax=40.000000
}
