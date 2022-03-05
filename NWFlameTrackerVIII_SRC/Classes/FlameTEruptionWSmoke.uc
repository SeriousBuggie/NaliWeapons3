//////////////////////////////////////////////////////////////
//				Feralidragon (13-08-2013)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTEruptionWSmoke expands NWBaseCloud;

var() float StartSpeed;

simulated function PostBeginPlay()
{
	Velocity = StartSpeed * vector(Rotation);
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
	Physics=PHYS_Falling
	Mass=10.000000
	
	StartSpeed=2600.000000
	MinDrawScale=15.000000
	DrawScale=45.000000
	ScaleGlow=0.550000
	bWhiteSmoke=True
	LifeSpan=5.000000
	FadeInTime=0.150000
	FadeOutTime=4.000000
}
