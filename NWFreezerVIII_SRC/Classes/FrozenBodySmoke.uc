//////////////////////////////////////////////////////////////
//				Feralidragon (03-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FrozenBodySmoke expands NaliWEffects;

var() texture SmkTex[4];

simulated function PostBeginPlay()
{
	Texture = SmkTex[Rand(ArrayCount(SmkTex))];
}

simulated function SetColDrawScaleAndSpeed( float colR, float colH)
{
	DrawScale = colR / 8;
	Velocity = colH * vect(0,0,-2);
}

defaultproperties
{
    DrawType=DT_SpriteAnimOnce
	
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=1.000000
	LifeSpan=0.650000
	ScaleGlow=1.000000
	bNetTemporary=True
	SpriteProjForward=32.000000
	Physics=PHYS_Projectile
	
	Texture=Texture'Botpack.utsmoke.us8_a00'
	SmkTex(0)=Texture'Botpack.utsmoke.us8_a00'
	SmkTex(1)=Texture'Botpack.utsmoke.US3_A00'
	SmkTex(2)=Texture'Botpack.utsmoke.us2_a00'
	SmkTex(3)=Texture'Botpack.utsmoke.us1_a00'

}
