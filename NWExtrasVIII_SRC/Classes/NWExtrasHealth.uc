//////////////////////////////////////////////////////////////
//				Feralidragon (30-09-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWExtrasHealth expands NaliPickups config(NWExtrasCfg);

var(ServerConfig) config int HealthPoints;
var string clientHealthMsg;
var bool bSetClientMsg;

replication
{
	reliable if (Role == ROLE_Authority)
		clientHealthMsg;
}

function PreBeginPlay()
{
	SetupHealthMsg();
	Super.PreBeginPlay();
}

simulated function Tick(float Delta)
{
	if (!bSetClientMsg && clientHealthMsg != "" && Role < ROLE_Authority)
		SetupHealthMsg();
	Super.Tick(Delta);
}

simulated function SetupHealthMsg()
{
local string healthMsg;

	if (Role == ROLE_Authority)
	{
		HealthAmount = default.HealthPoints;
		healthMsg = " +"$HealthAmount;
	}
	
	if (Role < ROLE_Authority || InStr(PickupMessage, healthMsg) < 0)
	{
		if (Role == ROLE_Authority)
			PickupMessage = PickupMessage$healthMsg;
		else
		{
			PickupMessage = clientHealthMsg;
			bSetClientMsg = True;
		}
		
		default.PickupMessage = PickupMessage;
		if (Role < ROLE_Authority || InStr(Class.default.PickupMessage, healthMsg) < 0)
			Class.default.PickupMessage = PickupMessage;
		
		if (Role == ROLE_Authority)
			clientHealthMsg = PickupMessage;
	}
}

defaultproperties
{
}
