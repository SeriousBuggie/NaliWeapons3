//////////////////////////////////////////////////////////////
//				Feralidragon (14-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltOversProj expands TheOversProj;

defaultproperties
{
	bExplodeOnlyOnGround=False
	DistToExplode=1000.000000
	GroundMaxSlope=0.000000
	DistToDetourToGround=0.000000
	DelayToGround=0.000000

	LightBrightness=100
	LightHue=148
	LightSaturation=0
	
	ProjectileColor(0)=(bUseThisColor=True,ProjColor=(R=0,G=128,B=255))
	TrailFXColor01=(R=0,G=128,B=255)
	TrailFXColor02=(R=0,G=0,B=255)
	
	TrailFXColors(0)=TFXC_Blue
	TrailFXColors(1)=TFXC_Cyan
	TrailFXColors(2)=TFXC_LightBlue
	TrailFXColors(3)=TFXC_BoltBlue
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
