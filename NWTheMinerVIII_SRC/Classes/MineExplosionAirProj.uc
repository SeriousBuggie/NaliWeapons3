//////////////////////////////////////////////////////////////
//				Feralidragon (29-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class MineExplosionAirProj expands MineExplosionProjC;

function Timer()
{
local rotator r;
local vector v;
local Effects e;

	if (FXClass != None)
	{
		r.Roll = Rand(16384) * 4;
		v.z = FRand() * MaxDist * (LifeSpan/Default.LifeSpan);
		v = (v >> r);
		e = Spawn(FXClass,,, Location + (v >> Rotation));
		if (e != None)
			e.DrawScale = (LifeSpan/Default.LifeSpan) * e.default.DrawScale;
	}
}

defaultproperties
{
	EffectSound1=None
	
	LifeSpan=1.000000
	LightRadius=8
	
	Physics=PHYS_Falling
	
	RiseSpeed=1200.000000
	MaxDist=100.000000
	ExplRate=10.000000
	FXClass=Class'MineAirExplosion'
}
