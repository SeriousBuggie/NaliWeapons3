//////////////////////////////////////////////////////////////
//				Feralidragon (03-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerIcicleSmk expands NaliWEffects;

var() texture SmkTex[4];
var() float RisingSpeed;

simulated function PostBeginPlay()
{
	Texture = SmkTex[Rand(ArrayCount(SmkTex))];
	Velocity = RisingSpeed * vect(0,0,1);
}

defaultproperties
{
    DrawType=DT_Sprite
	
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=1.500000
	LifeSpan=0.750000
	ScaleGlow=2.500000
	bNetTemporary=True
	SpriteProjForward=32.000000
	Physics=PHYS_Projectile
	RisingSpeed=32.000000
	
	Texture=Texture'Botpack.utsmoke.us8_a00'
	SmkTex(0)=Texture'Botpack.utsmoke.us8_a00'
	SmkTex(1)=Texture'Botpack.utsmoke.US3_A00'
	SmkTex(2)=Texture'Botpack.utsmoke.us2_a00'
	SmkTex(3)=Texture'Botpack.utsmoke.us1_a00'
}
