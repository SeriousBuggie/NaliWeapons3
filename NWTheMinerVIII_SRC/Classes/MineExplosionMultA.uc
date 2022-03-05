//////////////////////////////////////////////////////////////
//				Feralidragon (30-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class MineExplosionMultA expands MineExplosionA;

#exec AUDIO IMPORT NAME="MineExplosion2" FILE=SOUNDS\MineExplosion2.wav GROUP="Explosions"

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

	newLoc.X = 2*FRand()*MaxDistOffset - MaxDistOffset;
	newLoc.Y = 2*FRand()*MaxDistOffset - MaxDistOffset;
	newLoc.Z = 2*FRand()*MaxDistOffset - MaxDistOffset;
	newLoc = newLoc + Location;
	Spawn(Class'MineExplosionSoundlessA',,, newLoc);
	ExplCount++;
	if (ExplCount <= 2)
		SetTimer(0.1 + FRand()/8, False);
}

defaultproperties
{
	EffectSound1=MineExplosion2
	MaxDistOffset=50.000000
}
