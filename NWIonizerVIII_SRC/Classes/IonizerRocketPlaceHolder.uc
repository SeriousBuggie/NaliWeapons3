//////////////////////////////////////////////////////////////
//				Feralidragon (19-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerRocketPlaceHolder expands NaliWActor;

var() float FadeInTime;

simulated function PostBeginPlay()
{
	ScaleGlow = 0.0;
	Super.PostBeginPlay();
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && ScaleGlow < default.ScaleGlow)
		ScaleGlow += (Delta*default.ScaleGlow/FadeInTime);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonizerRocket
	RemoteRole=ROLE_SimulatedProxy
	bCollideActors=True
	bBlockPlayers=True
	bBlockActors=True
	CollisionRadius=64.000000
	CollisionHeight=320.000000
	
	FadeInTime=3.000000
}
