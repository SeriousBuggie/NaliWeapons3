//////////////////////////////////////////////////////////////
//				Feralidragon (10-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearGuidedMissileLevelD expands NuclearGuidedMissile;

defaultproperties
{
	ExplosionNoise=160.000000
	ExplosionDecal=Class'NuclearBlastDecalLevelD'
	MyDamageType=Nuclear04
	NuclearBlastClass=Class'NuclearExplosionLevelD'
	bIgnoreHitNormal=True
	NuclearLauncherClass=Class'NuclearLauncherLevelD'
	NuclearBlastCustomRot=(Pitch=0,Yaw=0,Roll=0)
	RegularNukeClass=Class'NuclearMissileSoundlessLevelD'
	
	NuclearLevel=4
}
