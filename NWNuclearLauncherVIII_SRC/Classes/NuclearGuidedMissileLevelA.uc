//////////////////////////////////////////////////////////////
//				Feralidragon (10-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearGuidedMissileLevelA expands NuclearGuidedMissile;

defaultproperties
{
	ExplosionNoise=20.000000
	ExplosionDecal=Class'NuclearBlastDecalLevelA'
	MyDamageType=Nuclear01
	NuclearBlastClass=Class'NuclearExplosionLevelA'
	bIgnoreHitNormal=False
	NuclearLauncherClass=Class'NuclearLauncherLevelA'
	NuclearBlastCustomRot=(Pitch=0,Yaw=0,Roll=0)
	RegularNukeClass=Class'NuclearMissileSoundlessLevelA'
	
	NuclearLevel=1
}
