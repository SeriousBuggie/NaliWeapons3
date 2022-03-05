//////////////////////////////////////////////////////////////
//				Feralidragon (04-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MBoxMissileExplProj expands NaliWEffects;

#exec AUDIO IMPORT NAME="MBoxMissileExplSnd" FILE=SOUNDS\MBoxMissileExplSnd.wav GROUP="Explosions"

var() float RiseSpeed, MaxDist, MaxStaticDist, ExplRate;
var() float MinFXSize, MaxFXSize;
var() class<Effects> FXClass;
var float TimeCount;

simulated function PostBeginPlay()
{
	Velocity = RiseSpeed * vector(Rotation);
	if (ExplRate > 0)
		SetTimer(1/ExplRate, True);
	if (Level.NetMode == NM_StandAlone)
		SpawnClientExplFX();
	Super.PostBeginPlay();
}

simulated function PostNetBeginPlay()
{
	SpawnClientExplFX();
}

simulated function SpawnClientExplFX()
{
	Spawn(class'MBoxMissileExplAfterEffects');
	Spawn(Class'MBoxMissileExplBaseCloudMaster');
	Spawn(Class'MBoxMissileExplCorLight');
	Spawn(Class'MBoxMissileExplCorLine');
}

simulated function Timer()
{
local rotator r;
local vector v;
local Effects s;

	if (Level.NetMode != NM_DedicatedServer && FXClass != None)
	{
		r.Roll = Rand(16384) * 4;
		v.z = FRand() * MaxDist;
		v = (v >> r);
		s = Spawn(FXClass,,, Location + (v >> Rotation));
		if (s != None)
			s.DrawScale *= (((default.LifeSpan - LifeSpan) / default.LifeSpan) * (MaxFXSize - MinFXSize) + MinFXSize);
	}
}

simulated function Tick(float Delta)
{
local vector rndOffset;
local Effects s;
local float f;

	if (Level.NetMode != NM_DedicatedServer)
	{		
		TimeCount += Delta;
		if (TimeCount >= 0.05)
		{
			f = (default.LifeSpan - LifeSpan) / default.LifeSpan;
			rndOffset.X = FRand() * MaxStaticDist * f;
			rndOffset.Y = (2*FRand() - 1) * MaxStaticDist * f;
			rndOffset.Z = (2*FRand() - 1) * MaxStaticDist * f;
			s = Spawn(Class'TMissileExplFX',,, Location + (rndOffset >> Rotation));
			if (s != None)
			{
				s.DrawScale = (f * 2.25)**2 + 6;
				s = Spawn(Class'TMissileSmoke',,, Location + rndOffset);
				s.DrawScale = (f * 5.25)**2 + 8;
			}
			TimeCount = 0;
		}
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=LodMesh'Botpack.BulletImpact'
	
	EffectSound1=MBoxMissileExplSnd
	SndVol=100.000000
	SndRadius=6500.000000
	
	LifeSpan=0.500000
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
	
	RiseSpeed=2000.000000
	MaxDist=450.000000
	MaxStaticDist=450.000000
	ExplRate=35.000000
	MinFXSize=3.000000
	MaxFXSize=6.000000
	FXClass=Class'TMissileExplFX'
}
