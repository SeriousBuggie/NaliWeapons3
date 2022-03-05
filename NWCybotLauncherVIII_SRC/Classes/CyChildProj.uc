//////////////////////////////////////////////////////////////
//				Feralidragon (15-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyChildProj expands CybProj;

simulated function ProcessTouch(Actor Other, vector HitLocation)
{
	if (Other == Owner)
		return;
	Super(NaliProjectile).ProcessTouch(Other, HitLocation);
}

defaultproperties
{	
	Damage=1000.000000
	LightType=LT_None
}
