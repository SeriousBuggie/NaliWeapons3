//////////////////////////////////////////////////////////////
//				Feralidragon (10-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearGuidedMissileLevelC expands NuclearGuidedMissile;

defaultproperties
{
	ExplosionNoise=80.000000
	ExplosionDecal=Class'NuclearBlastDecalLevelC'
	MyDamageType=Nuclear03
	NuclearBlastClass=Class'NuclearExplosionLevelC'
	bIgnoreHitNormal=False
	NuclearLauncherClass=Class'NuclearLauncherLevelC'
	NuclearBlastCustomRot=(Pitch=0,Yaw=0,Roll=0)
	RegularNukeClass=Class'NuclearMissileSoundlessLevelC'
	
	NuclearLevel=3
}
