//////////////////////////////////////////////////////////////
//				Feralidragon (10-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearGuidedMissileLevelB expands NuclearGuidedMissile;

defaultproperties
{
	ExplosionNoise=40.000000
	ExplosionDecal=Class'NuclearBlastDecalLevelB'
	MyDamageType=Nuclear02
	NuclearBlastClass=Class'NuclearExplosionLevelB'
	bIgnoreHitNormal=False
	NuclearLauncherClass=Class'NuclearLauncherLevelB'
	NuclearBlastCustomRot=(Pitch=0,Yaw=0,Roll=0)
	RegularNukeClass=Class'NuclearMissileSoundlessLevelB'
	
	NuclearLevel=2
}
