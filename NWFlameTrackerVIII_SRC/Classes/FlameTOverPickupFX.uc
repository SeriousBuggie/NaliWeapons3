//////////////////////////////////////////////////////////////
//				Feralidragon (18-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTOverPickupFX expands NWOverPickupFX;

simulated function Tick(float Delta)
{
local ZoneInfo Zn;

	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (Owner != None)
			Zn = Owner.Region.Zone;
		else
			Zn = Region.Zone;
		
		if (Zn != None && Zn.bWaterZone && !Zn.IsA('LavaZone') && Zn.DamageType != 'Burned')
			ScaleGlow = 0.15 + FRand()*0.35;
		else
			ScaleGlow = 0.75 + FRand()*0.95;
	}
}

defaultproperties
{
}
