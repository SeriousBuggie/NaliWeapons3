//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class TMissileSmoke expands NaliWEffects;

var() texture RndSprite[7];
var() float RisingRate;
var float maxLife;

simulated function PostBeginPlay()
{
	Texture = RndSprite[Rand(7)];
	Velocity = Vect(0,0,1)*RisingRate;
	maxLife = 0.1 + FRand() * 3;
	LifeSpan = maxLife;
}

simulated function Tick( float DeltaTime)
{
	if (Level.NetMode != NM_DedicatedServer && maxLife > 0)
		ScaleGlow = LifeSpan * Default.ScaleGlow / maxLife;
}

defaultproperties
{
	Skin=None
	LightType=LT_None
	Texture=Texture'Smoke_01'
	DrawScale=1.000000
	ScaleGlow=0.750000
	LifeSpan=4.000000
	bUnlit=True
	DrawType=DT_Sprite
	Style=STY_Translucent
	Physics=PHYS_Projectile
	RndSprite(0)=Texture'Smoke_01'
	RndSprite(1)=Texture'Smoke_02'
	RndSprite(2)=Texture'Smoke_03'
	RndSprite(3)=Texture'Smoke_04'
	RndSprite(4)=Texture'Smoke_05'
	RndSprite(5)=Texture'Smoke_06'
	RndSprite(6)=Texture'Smoke_07'
	RisingRate=65.000000
	SpriteProjForward=16.000000
}