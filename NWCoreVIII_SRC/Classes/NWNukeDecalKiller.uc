//////////////////////////////////////////////////////////////
//	Nali Weapons III decals killer to avoid crashes with 
//	active nuclear explosions being processed
//				Feralidragon (28-12-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWNukeDecalKiller expands SpawnNotify;

var float ActiveCount;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && ActiveCount > 0.0)
		ActiveCount -= Delta;
}

simulated event Actor SpawnNotification(Actor A)
{
	if (Class'NWInfo'.default.enableClientNukeCrashFix && Level.NetMode != NM_DedicatedServer)
	{
		if (NuclearExplosions(A) != None)
			ActiveCount = FMax(ActiveCount, FMax(NuclearExplosions(A).ShockTime, NuclearExplosions(A).NucleusTime));
		else if (Scorch(A) != None && ActiveCount > 0.0)
		{
			A.Destroy();
			return None;
		}
	}
	return A;
}

defaultproperties
{
	ActorClass=Class'Actor'
	bNetTemporary=False
	RemoteRole=ROLE_SimulatedProxy
}
