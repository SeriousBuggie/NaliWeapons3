//////////////////////////////////////////////////////////////
//				Feralidragon (23-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybSuperExplosionMult expands CybDmgExplosion;

#exec AUDIO IMPORT NAME="CybSuperExplosionSnd" FILE=SOUNDS\CybSuperExplosionSnd.wav GROUP="Explosions"

var() float MaxDistOffset;
var() float MaxZDistOffset;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	SetTimer(0.05, True);
}

simulated function Timer()
{
local vector newLoc;
local byte i;
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		MaxDistOffset = (Default.LifeSpan - LifeSpan) * Default.MaxDistOffset / Default.LifeSpan;
		for (i = 0; i < Max(4,int((Default.LifeSpan - LifeSpan)*15/Default.LifeSpan)); i++)
		{
			newLoc.X = 2*FRand()*MaxDistOffset - MaxDistOffset;
			newLoc.Y = 2*FRand()*MaxDistOffset - MaxDistOffset;
			newLoc.Z = (Default.LifeSpan - LifeSpan) * (2*FRand()*MaxZDistOffset - MaxZDistOffset) / Default.LifeSpan;
			newLoc = newLoc + Location;
			Spawn(Class'CybSuperExplosion',,, newLoc);
		}
	}
}

defaultproperties
{
	EffectSound1=CybSuperExplosionSnd
	SndVol=18.000000
	SndRadius=6500.000000
	MaxDistOffset=1024.000000
	MaxZDistOffset=256.000000
	LifeSpan=0.500000
	
	DrawType=DT_Sprite
	Texture=TranslucInvis
	DrawScale=0.100000
}
