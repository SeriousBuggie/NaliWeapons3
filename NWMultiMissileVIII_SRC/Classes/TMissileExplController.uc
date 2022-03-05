//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class TMissileExplController expands NaliWEffects;

#exec AUDIO IMPORT NAME="TExplSnd01" FILE=SOUNDS\TExplSnd01.wav GROUP="Explosions"
#exec AUDIO IMPORT NAME="TExplSnd02" FILE=SOUNDS\TExplSnd02.wav GROUP="Explosions"

var float TimeCount;

simulated function PostBeginPlay()
{
	MakeSound();
}

function MakeSound()
{
	if (Rand(50) > 25)
		PlaySound(EffectSound1,,150.0,,9500);
	else
		PlaySound(EffectSound2,,150.0,,9500);
}

simulated function Tick(float Delta)
{
local byte i;
local vector rndOffset;
local float maxDist;
local Effects s;

	if (Level.NetMode != NM_DedicatedServer)
	{
		maxDist = 420;
		TimeCount += Delta;
		if (TimeCount >= 0.05)
		{
			for( i = 0; i < 3; i++)
			{
				rndOffset.X = FRand() * maxDist * (default.LifeSpan - LifeSpan) / default.LifeSpan;
				rndOffset.Y = (2*FRand() - 1) * maxDist * (default.LifeSpan - LifeSpan) / default.LifeSpan;
				rndOffset.Z = (2*FRand() - 1) * maxDist * (default.LifeSpan - LifeSpan) / default.LifeSpan;
				
				s = Spawn(Class'TMissileExplFX',,, Location + (rndOffset >> Rotation));
				
				if (s != None)
				{
					s.DrawScale = ((default.LifeSpan - LifeSpan) / default.LifeSpan * 2.25)**2 + 3;
					s = Spawn(Class'TMissileSmoke',,, Location + rndOffset);
					s.DrawScale = ((default.LifeSpan - LifeSpan) / default.LifeSpan * 3.25)**2 + 3;
				}
			}
			TimeCount = 0;
		}
	}
}

defaultproperties
{
	EffectSound1=TExplSnd01
	EffectSound2=TExplSnd02
	LifeSpan=0.50000
	bNetTemporary=True
	LightType=LT_TexturePaletteOnce
	LightEffect=LE_NonIncidence
	LightBrightness=85
	LightHue=27
	LightSaturation=71
	LightRadius=24
	Skin=Texture'UnrealShare.Effects.ExplosionPal'
}


