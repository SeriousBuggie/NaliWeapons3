//////////////////////////////////////////////////////////////
//				Feralidragon (29-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MissileExplAMult expands MissileExplA;

#exec AUDIO IMPORT NAME="RegExplSnd1" FILE=SOUNDS\RegExplSnd1.wav GROUP="Explosions"
#exec AUDIO IMPORT NAME="RegExplSnd2" FILE=SOUNDS\RegExplSnd2.wav GROUP="Explosions"

var() float MaxDistOffset;
var() sound RndExplSnd[2];
var byte ExplCount;

simulated function PostBeginPlay()
{
	EffectSound1 = RndExplSnd[Rand(2)];
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
	Spawn(Class'MissileExplA',,, newLoc);
	ExplCount++;
	if (ExplCount <= 2)
		SetTimer(0.1 + FRand()/8, False);
}

defaultproperties
{
	EffectSound1=RegExplSnd1
	RndExplSnd(0)=RegExplSnd1
	RndExplSnd(1)=RegExplSnd2
	MaxDistOffset=50.000000
}
