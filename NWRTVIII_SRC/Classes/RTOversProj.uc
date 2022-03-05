//////////////////////////////////////////////////////////////
//				Feralidragon (13-05-2013)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTOversProj expands TheOversProj;

defaultproperties
{
	bExplodeOnlyOnGround=False
	DistToExplode=600.000000
	GroundMaxSlope=0.000000
	DistToDetourToGround=0.000000
	DelayToGround=0.000000

	LightBrightness=100
	LightHue=0
	LightSaturation=128
	
	ProjectileColor(0)=(bUseThisColor=True,ProjColor=(R=255,G=0,B=0))
	TrailFXColor01=(R=255,G=0,B=0)
	TrailFXColor02=(R=255,G=64,B=64)
	
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
