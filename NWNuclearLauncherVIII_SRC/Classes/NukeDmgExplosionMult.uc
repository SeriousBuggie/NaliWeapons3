//////////////////////////////////////////////////////////////
//				Feralidragon (18-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeDmgExplosionMult expands NukeDmgExplosion;

#exec AUDIO IMPORT NAME="NukeDmgExplA" FILE=SOUNDS\NukeDmgExplA.wav GROUP="Explosions"

var() float MaxDistOffset;
var byte ExplCount;

simulated function PostBeginPlay()
{
	if (FRand() > 0.5)
		EffectSound1 = Class'NukeDmgExplosion'.default.EffectSound1;
	Super.PostBeginPlay();
	SetTimer(0.1 + FRand()/8, False);
}

simulated function Timer()
{
local vector newLoc;

	newLoc.X = 2*FRand()*MaxDistOffset - MaxDistOffset;
	newLoc.Y = 2*FRand()*MaxDistOffset - MaxDistOffset;
	newLoc.Z = 2*FRand()*MaxDistOffset - MaxDistOffset;
	newLoc = newLoc + Location;
	Spawn(Class'NukeDmgExplosionSoundless',,, newLoc);
	ExplCount++;
	if (ExplCount <= 2)
		SetTimer(0.1 + FRand()/8, False);
}

defaultproperties
{
	EffectSound1=NukeDmgExplA
	MaxDistOffset=85.000000
}
