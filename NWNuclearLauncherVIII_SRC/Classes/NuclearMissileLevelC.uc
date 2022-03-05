//////////////////////////////////////////////////////////////
//				Feralidragon (08-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearMissileLevelC expands NuclearMissile;

defaultproperties
{
	ExplosionNoise=80.000000
	ExplosionDecal=Class'NuclearBlastDecalLevelC'
	MyDamageType=Nuclear03
	NuclearBlastClass=Class'NuclearExplosionLevelC'
	bIgnoreHitNormal=False
	NuclearLauncherClass=Class'NuclearLauncherLevelC'
	NuclearBlastCustomRot=(Pitch=0,Yaw=0,Roll=0)
	
	NuclearLevel=3
}
