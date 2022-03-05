//////////////////////////////////////////////////////////////
//				Feralidragon (26-10-2013)
//
// NW3 THE MINER 1.00
//////////////////////////////////////////////////////////////

class FMineBaseCloudMaster expands NWBaseCloudMaster;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		SpawnSmkClouds();
	Super.PostBeginPlay();
}

simulated function SpawnSmkClouds()
{
	Spawn(Class'FMineBaseCloud', Self);
	Spawn(Class'FMineBaseCloudB', Self);
}

defaultproperties
{
	LifeSpan=3.000000
	bNetTemporary=True
}
