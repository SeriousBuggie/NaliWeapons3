//////////////////////////////////////////////////////////////
//				Feralidragon (11-08-2013)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTGndSmokeGen expands UT_ShortSmokeGen;

#exec AUDIO IMPORT NAME="FlameTGndHotSteam" FILE=SOUNDS\FlameTGndHotSteam.wav GROUP="Eruption"

var float TLSpan;

simulated function PostBeginPlay()
{
	TLSpan = LifeSpan;
	Super.PostBeginPlay();
}

simulated function SetLSpan(float LSpan)
{
	LifeSpan = FMax(0.1, LSpan);
	TLSpan = LSpan;
}

simulated function Tick(float Delta)
{
	SoundPitch = Byte(default.SoundPitch + ((TLSpan-LifeSpan)/TLSpan)*64);
	Super.Tick(Delta);
}

auto State Active
{
	simulated function Timer()
	{
		local Effects d;

		d = Spawn(GenerationType);
		d.DrawScale = BasePuffSize + FRand()*SizeVariance;
		d.RemoteRole = ROLE_None;
		d.Velocity.Z = RisingVelocity;
		i++;
		if (i>TotalNumPuffs && TotalNumPuffs!=0)
			Destroy();
	}
}

defaultproperties
{
    RemoteRole=ROLE_SimulatedProxy
	SmokeDelay=0.050000
    SizeVariance=1.500000
    BasePuffSize=2.750000
    TotalNumPuffs=100000
    RisingVelocity=300.000000
    GenerationType=Class'Botpack.UT_SpriteSmokePuff'
	
	bHidden=False
	DrawType=DT_Sprite
	Style=STY_Translucent
	Texture=TranslucInvis
	DrawScale=0.100000
	
	LifeSpan=7.000000
	AmbientSound=FlameTGndHotSteam
	SoundVolume=32
	SoundRadius=64
	SoundPitch=48
}