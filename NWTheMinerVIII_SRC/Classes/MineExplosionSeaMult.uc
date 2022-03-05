//////////////////////////////////////////////////////////////
//				Feralidragon (30-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class MineExplosionSeaMult expands MineExplosionMultA;

simulated function Timer()
{
local vector newLoc;

	newLoc.X = 2*FRand()*MaxDistOffset - MaxDistOffset;
	newLoc.Y = 2*FRand()*MaxDistOffset - MaxDistOffset;
	newLoc.Z = 2*FRand()*MaxDistOffset - MaxDistOffset;
	newLoc = newLoc + Location;
	Spawn(Class'MineSeaExplosion',,, newLoc);
	ExplCount++;
	if (ExplCount <= 3)
		SetTimer(0.1 + FRand()/10, False);
}

defaultproperties
{
	EffectSound1=None
	MaxDistOffset=50.000000
	DrawScale=2.850000
	ScaleGlow=1.750000
	RndExplTex(0)=MineExplD01
	RndExplTex(1)=MineExplE01
	RndExplTex(2)=MineExplF01
}
