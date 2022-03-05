//////////////////////////////////////////////////////////////
//				Feralidragon (23-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDmgExplosionMult expands CybDmgExplosion;

#exec AUDIO IMPORT NAME="CybExplosionSnd" FILE=SOUNDS\CybExplosionSnd.wav GROUP="Explosions"

var() float MaxDistOffset;
var byte ExplCount;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	SetTimer(0.1 + FRand()/8, False);
}

simulated function Timer()
{
local vector newLoc;

	if (Level.NetMode != NM_DedicatedServer)
	{
		newLoc.X = 2*FRand()*MaxDistOffset - MaxDistOffset;
		newLoc.Y = 2*FRand()*MaxDistOffset - MaxDistOffset;
		newLoc.Z = 2*FRand()*MaxDistOffset - MaxDistOffset;
		newLoc = newLoc + Location;
		Spawn(Class'CybDmgExplosionSoundless',,, newLoc);
		ExplCount++;
		if (ExplCount <= 2)
			SetTimer(0.1 + FRand()/8, False);
	}
}

defaultproperties
{
	EffectSound1=CybExplosionSnd
	MaxDistOffset=50.000000
}
