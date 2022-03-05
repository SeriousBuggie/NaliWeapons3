//////////////////////////////////////////////////////////////
//	Nali Weapons III Nuclear Launcher weapon
//				Feralidragon (02-06-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearLauncherLevelA expands NuclearLauncher config(NWeaponsCfg);

defaultproperties
{
	ItemName="Nuclear Launcher Level 1"
	MaxDesireability=20.000000
	PickupMessage="You got the Nuclear Launcher Level 1."
	AltProjectileClass=Class'NuclearGuidedMissileLevelA'
	AmmoName=Class'NuclearAmmoLevelA'
	ProjectileClass=Class'NuclearMissileLevelA'
	MultiSkins(5)=NuclearScreen01
	FirstPersonOverFX(0)=(OverTex1=NuclearScreen01)
	
	bRenderOptionsOnHiddenWeapon=True
	renderOptions(0)=(optionText="Nuclear Level 1",optionColor=(R=0,G=255,B=100))
}
