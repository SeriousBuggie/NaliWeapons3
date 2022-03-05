//////////////////////////////////////////////////////////////
//				Feralidragon (27-10-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMissileOversProj expands TheOversProj;

defaultproperties
{
	bExplodeOnlyOnGround=True
	DistToExplode=0.000000
	GroundMaxSlope=0.250000
	DistToDetourToGround=450.000000
	DelayToGround=1.000000

	LightBrightness=100
	LightHue=122
	LightSaturation=64
	
	ProjectileColor(0)=(bUseThisColor=True,ProjColor=(R=96,G=192,B=128))
	TrailFXColor01=(R=64,G=128,B=96)
	TrailFXColor02=(R=0,G=128,B=96)
	
	TrailFXColors(0)=TFXC_White
	TrailFXColors(1)=TFXC_Green
	TrailFXColors(2)=TFXC_LightBlue
	TrailFXColors(3)=TFXC_OliveGreen
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
