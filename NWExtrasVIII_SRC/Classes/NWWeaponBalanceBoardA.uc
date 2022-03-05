//////////////////////////////////////////////////////////////
//				Feralidragon (04-01-2013)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWeaponBalanceBoardA expands NWWeaponBalanceBoardMut config(NWExtrasCfg);

//Example mutator with IRPR with some tweaks

defaultproperties
{
	WeaponOptions(0)=(WeaponClassName="IRPR",BasicOptions="ammorespawn=7.5;respawn=5.0;maxammo=100;ammo=40;startammo=66;firerate1=2.0;",PropertyOptions="ShotDamage=200;")
}