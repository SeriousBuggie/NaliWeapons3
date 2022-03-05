//////////////////////////////////////////////////////////////
//	Nali Weapons III Nuclear Launcher weapon
//				Feralidragon (04-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearLauncherLevelE expands NuclearLauncher config(NWeaponsCfg);

defaultproperties
{
	ItemName="Nuclear Launcher Level 5"
	MaxDesireability=100.000000
	PickupMessage="You got the Nuclear Launcher Level 5."
	AltProjectileClass=Class'NuclearGuidedMissileLevelE'
	AmmoName=Class'NuclearAmmoLevelE'
	ProjectileClass=Class'NuclearMissileLevelE'
	MultiSkins(5)=NuclearScreen05
	FirstPersonOverFX(0)=(OverTex1=NuclearScreen05)
	
	bRenderOptionsOnHiddenWeapon=True
	renderOptions(0)=(optionText="Nuclear Level 5",optionColor=(R=255,G=0,B=0))
}
