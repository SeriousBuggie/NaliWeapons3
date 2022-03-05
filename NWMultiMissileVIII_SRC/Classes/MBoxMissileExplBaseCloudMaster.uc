//////////////////////////////////////////////////////////////
//				Feralidragon (04-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MBoxMissileExplBaseCloudMaster expands NWBaseCloudMaster;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		SpawnSmkClouds();
	Super.PostBeginPlay();
}

simulated function SpawnSmkClouds()
{
	Spawn(Class'MBoxMissileExplBaseCloud', Self);
	Spawn(Class'MBoxMissileExplBaseCloudB', Self);
}

defaultproperties
{
	LifeSpan=5.000000
	bNetTemporary=True
}
