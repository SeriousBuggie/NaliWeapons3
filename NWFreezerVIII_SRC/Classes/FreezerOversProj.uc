//////////////////////////////////////////////////////////////
//				Feralidragon (08-09-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerOversProj expands TheOversProj;

defaultproperties
{
	bExplodeOnlyOnGround=True
	DistToExplode=0.000000
	GroundMaxSlope=0.250000
	DistToDetourToGround=450.000000
	DelayToGround=1.000000

	LightBrightness=100
	LightHue=0
	LightSaturation=255
	
	ProjectileColor(0)=(bUseThisColor=True,ProjColor=(R=128,G=128,B=128))
	TrailFXColor01=(R=32,G=32,B=128)
	TrailFXColor02=(R=64,G=64,B=128)
	
	TrailFXColors(0)=TFXC_White
	TrailFXColors(1)=TFXC_Cyan
	TrailFXColors(2)=TFXC_White
	TrailFXColors(3)=TFXC_Cyan
	TrailFXColors(4)=TFXC_White
	
	TrailFXGlowMin=0.850000
	TrailFXGlowMax=2.750000
	TrailFXScaleStartMin=0.750000
	TrailFXScaleStartMax=1.000000
	TrailFXScaleEndMin=1.500000
	TrailFXScaleEndMax=2.500000
	TrailFXRateMin=30.000000
	TrailFXRateMax=40.000000
}
