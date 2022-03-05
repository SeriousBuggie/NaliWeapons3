//////////////////////////////////////////////////////////////
//				Feralidragon (30-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class MineExplosionAirMult expands MineExplosionMultA;

#exec AUDIO IMPORT NAME="MineExplosion6" FILE=SOUNDS\MineExplosion6.wav GROUP="Explosions"

simulated function Timer()
{
local vector newLoc;

	newLoc.X = 2*FRand()*MaxDistOffset - MaxDistOffset;
	newLoc.Y = 2*FRand()*MaxDistOffset - MaxDistOffset;
	newLoc.Z = 2*FRand()*MaxDistOffset - MaxDistOffset;
	newLoc = newLoc + Location;
	Spawn(Class'MineAirExplosion',,, newLoc);
	ExplCount++;
	if (ExplCount <= 6)
		SetTimer(0.1 + FRand()/10, False);
}

defaultproperties
{
	EffectSound1=MineExplosion6
	SndVol=32.000000
	SndRadius=3575.000000
	MaxDistOffset=100.000000
	DrawScale=3.550000
	ScaleGlow=1.750000
	RndExplTex(0)=MineExplA01
	RndExplTex(1)=MineExplB01
	RndExplTex(2)=MineExplC01
}
