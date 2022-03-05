//////////////////////////////////////////////////////////////
//	Nali Weapons III Nuclear Launcher weapon
//				Feralidragon (02-06-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearLauncherLevelB expands NuclearLauncher config(NWeaponsCfg);

defaultproperties
{
	ItemName="Nuclear Launcher Level 2"
	MaxDesireability=30.000000
	PickupMessage="You got the Nuclear Launcher Level 2."
	AltProjectileClass=Class'NuclearGuidedMissileLevelB'
	AmmoName=Class'NuclearAmmoLevelB'
	ProjectileClass=Class'NuclearMissileLevelB'
	MultiSkins(5)=NuclearScreen02
	FirstPersonOverFX(0)=(OverTex1=NuclearScreen02)
	
	bRenderOptionsOnHiddenWeapon=True
	renderOptions(0)=(optionText="Nuclear Level 2",optionColor=(R=190,G=255,B=0))
}
