//////////////////////////////////////////////////////////////
//				Feralidragon (24-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTWaterSmoke expands NaliWEffects;

var() texture SmkTex[4];
var() float RisingSpeed;
var() float SpreadSpeed;

simulated function PostBeginPlay()
{
local rotator R;

	R.Yaw = Rand(16384) * 4;
	Velocity = RisingSpeed * vect(0,0,1) + vector(R) * SpreadSpeed;
	Texture = SmkTex[Rand(ArrayCount(SmkTex))];
}

defaultproperties
{
    DrawType=DT_SpriteAnimOnce
	
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=1.000000
	LifeSpan=1.000000
	ScaleGlow=1.000000
	bNetTemporary=True
	SpriteProjForward=16.000000
	Physics=PHYS_Projectile
	RisingSpeed=45.000000
	SpreadSpeed=50.000000
	
	Texture=Texture'Botpack.utsmoke.us8_a00'
	
	SmkTex(0)=Texture'Botpack.utsmoke.us8_a00'
	SmkTex(1)=Texture'Botpack.utsmoke.US3_A00'
	SmkTex(2)=Texture'Botpack.utsmoke.us2_a00'
	SmkTex(3)=Texture'Botpack.utsmoke.us1_a00'

}
