//////////////////////////////////////////////////////////////
//				Feralidragon (08-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearMissileLevelA expands NuclearMissile;

defaultproperties
{
	ExplosionNoise=20.000000
	ExplosionDecal=Class'NuclearBlastDecalLevelA'
	MyDamageType=Nuclear01
	NuclearBlastClass=Class'NuclearExplosionLevelA'
	bIgnoreHitNormal=False
	NuclearLauncherClass=Class'NuclearLauncherLevelA'
	NuclearBlastCustomRot=(Pitch=0,Yaw=0,Roll=0)
	
	NuclearLevel=1
}
