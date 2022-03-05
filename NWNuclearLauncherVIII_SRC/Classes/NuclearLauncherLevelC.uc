//////////////////////////////////////////////////////////////
//	Nali Weapons III Nuclear Launcher weapon
//				Feralidragon (02-06-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearLauncherLevelC expands NuclearLauncher config(NWeaponsCfg);

defaultproperties
{
	ItemName="Nuclear Launcher Level 3"
	MaxDesireability=40.000000
	PickupMessage="You got the Nuclear Launcher Level 3."
	AltProjectileClass=Class'NuclearGuidedMissileLevelC'
	AmmoName=Class'NuclearAmmoLevelC'
	ProjectileClass=Class'NuclearMissileLevelC'
	MultiSkins(5)=NuclearScreen03
	FirstPersonOverFX(0)=(OverTex1=NuclearScreen03)
	
	bRenderOptionsOnHiddenWeapon=True
	renderOptions(0)=(optionText="Nuclear Level 3",optionColor=(R=255,G=128,B=0))
}
