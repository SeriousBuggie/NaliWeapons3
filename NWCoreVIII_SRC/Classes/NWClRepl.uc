//////////////////////////////////////////////////////////////
//	Nali Weapons III Server->Client settings replicator 
//		for non-installed versions of the mod (cached)
//				Feralidragon (09-02-2014)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWClRepl expands NaliWActor
nousercreate;

function PreBeginPlay()
{
	SetServerReplVars();
}

simulated function PostNetBeginPlay()
{
local PlayerPawn PP, localPlayer;

	if (Level.NetMode != NM_DedicatedServer) 
	{
		foreach AllActors(class'PlayerPawn', PP)
		{
			if (Viewport(PP.Player) != None)
			{
				localPlayer = PP;
				break;
			}
		}
		if (localPlayer != None && !Class'NWInfo'.static.hasModInstalled())
			SetClientReplVars(localPlayer);
	}
}

function SetServerReplVars(); //called in subclasses
simulated function SetClientReplVars(PlayerPawn PP); //called in subclasses

defaultproperties
{
	bNetTemporary=True
	LifeSpan=60.000000
	RemoteRole=ROLE_SimulatedProxy
	NetPriority=3.000000
	bHidden=True
}