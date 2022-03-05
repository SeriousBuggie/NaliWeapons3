//////////////////////////////////////////////////////////////
//				Feralidragon (29-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class MineExplosionProjC expands NaliWEffects;

#exec AUDIO IMPORT NAME="MineExplosion3" FILE=SOUNDS\MineExplosion3.wav GROUP="Explosions"

var() float RiseSpeed;
var() float MaxDist;
var() float ExplRate;
var() class<Effects> FXClass;

simulated function PostBeginPlay()
{
	Velocity = RiseSpeed * vector(Rotation);
	if (ExplRate > 0)
		SetTimer(1/ExplRate, True);
	
	Super.PostBeginPlay();
}

simulated function Timer()
{
local rotator r;
local vector v;

	if (Level.NetMode != NM_DedicatedServer && FXClass != None)
	{
		r.Roll = Rand(16384) * 4;
		v.z = FRand() * MaxDist;
		v = (v >> r);
		Spawn(FXClass,,, Location + (v >> Rotation));
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=LodMesh'Botpack.BulletImpact'
	
	EffectSound1=MineExplosion3
	SndVol=24.000000
	SndRadius=2500.000000
	
	LifeSpan=0.150000
	Style=STY_Translucent
	MultiSkins(0)=TranslucInvis
	MultiSkins(1)=TranslucInvis
	MultiSkins(2)=TranslucInvis
	MultiSkins(3)=TranslucInvis
	MultiSkins(4)=TranslucInvis
	MultiSkins(5)=TranslucInvis
	MultiSkins(6)=TranslucInvis
	MultiSkins(7)=TranslucInvis
	Texture=TranslucInvis
	Skin=TranslucInvis
	
	bUnlit=True
	LightType=LT_TexturePaletteOnce
	LightEffect=LE_NonIncidence
	LightBrightness=65
	LightHue=27
	LightSaturation=71
	LightRadius=12
	
	DrawScale=0.100000
	ScaleGlow=1.500000
	
	Physics=PHYS_Projectile
	
	RiseSpeed=1500.000000
	MaxDist=32.000000
	ExplRate=50.000000
	FXClass=Class'MineExplosionPartC'
}
