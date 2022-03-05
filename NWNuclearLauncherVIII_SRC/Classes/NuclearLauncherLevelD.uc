//////////////////////////////////////////////////////////////
//	Nali Weapons III Nuclear Launcher weapon
//				Feralidragon (04-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearLauncherLevelD expands NuclearLauncher config(NWeaponsCfg);

defaultproperties
{
	ItemName="Nuclear Launcher Level 4"
	MaxDesireability=50.000000
	PickupMessage="You got the Nuclear Launcher Level 4."
	AltProjectileClass=Class'NuclearGuidedMissileLevelD'
	AmmoName=Class'NuclearAmmoLevelD'
	ProjectileClass=Class'NuclearMissileLevelD'
	MultiSkins(5)=NuclearScreen04
	FirstPersonOverFX(0)=(OverTex1=NuclearScreen04)
	
	bRenderOptionsOnHiddenWeapon=True
	renderOptions(0)=(optionText="Nuclear Level 4",optionColor=(R=255,G=64,B=0))
}
