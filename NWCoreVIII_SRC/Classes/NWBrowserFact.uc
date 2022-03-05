//////////////////////////////////////////////////////////////
//				Feralidragon (09-02-2014)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBrowserFact expands UBrowserGSpyFact;

function Query(optional bool bBySuperset, optional bool bInitial)
{
	Super(UBrowserServerListFactory).Query(bBySuperset, bInitial);
	Link = GetPlayerOwner().GetEntryLevel().Spawn(Class'NWBrowserLink');
	Link.MasterServerAddress = MasterServerAddress;
	Link.MasterServerTCPPort = MasterServerTCPPort;
	Link.Region = Region;
	Link.MasterServerTimeout = MasterServerTimeout;
	Link.GameName = GameName;
	Link.OwnerFactory = Self;
	Link.Start();
}

defaultproperties
{
}