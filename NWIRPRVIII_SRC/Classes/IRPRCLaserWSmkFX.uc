//////////////////////////////////////////////////////////////
//				Feralidragon (11-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCLaserWSmkFX expands NWBaseCloud;

var() float StartSpeed;

simulated function PostBeginPlay()
{
	Velocity = StartSpeed * vect(0,0,1);
	Super.PostBeginPlay();
}

defaultproperties
{
    DrawType=DT_Sprite
	Mesh=None
	Texture=NukeWSmk01
	Style=STY_Translucent
	bUnlit=True
	bParticles=False
	bRandomFrame=False
	bAnimByOwner=False
	bNetTemporary=True
	Physics=PHYS_Projectile
	Mass=10.000000
	
	StartSpeed=15.000000
	MinDrawScale=1.000000
	DrawScale=6.000000
	ScaleGlow=0.350000
	bWhiteSmoke=True
	LifeSpan=5.000000
	FadeInTime=0.150000
	FadeOutTime=4.000000
}
