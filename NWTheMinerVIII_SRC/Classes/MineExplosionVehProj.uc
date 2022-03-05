//////////////////////////////////////////////////////////////
//				Feralidragon (29-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class MineExplosionVehProj expands MineExplosionProjC;

#exec AUDIO IMPORT NAME="MineExplosion5" FILE=SOUNDS\MineExplosion5.wav GROUP="Explosions"

defaultproperties
{
	EffectSound1=MineExplosion5
	SndVol=24.000000
	SndRadius=3000.000000
	
	LifeSpan=0.150000
	LightRadius=16
	
	Physics=PHYS_Projectile
	
	RiseSpeed=1800.000000
	MaxDist=65.000000
	ExplRate=50.000000
	FXClass=Class'MineExplosionVehPart'
}
