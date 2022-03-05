//////////////////////////////////////////////////////////////
//				Feralidragon (15-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyChildHomingProj expands CybHomingProj;

simulated function ProcessTouch(Actor Other, vector HitLocation)
{
	if (Other == Owner)
		return;
	Super(NaliProjectile).ProcessTouch(Other, HitLocation);
}

defaultproperties
{	
	ExplosionNoise=1.250000
	Damage=1000.000000
	
	SeekUpdateRate=0.050000
	SeekTurnRate=0.700000
	ExplodeTimeOut=3.000000
}
