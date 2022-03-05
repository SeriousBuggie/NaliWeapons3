//////////////////////////////////////////////////////////////
//				Feralidragon (08-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearMissileLevelE expands NuclearMissile;

defaultproperties
{
	ExplosionNoise=320.000000
	ExplosionDecal=Class'NuclearBlastDecalLevelE'
	MyDamageType=Nuclear05
	NuclearBlastClass=Class'NuclearExplosionLevelE'
	bIgnoreHitNormal=False
	NuclearLauncherClass=Class'NuclearLauncherLevelE'
	NuclearBlastCustomRot=(Pitch=0,Yaw=0,Roll=0)
	
	NuclearLevel=5
}
