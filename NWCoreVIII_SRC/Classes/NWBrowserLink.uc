//////////////////////////////////////////////////////////////
//				Feralidragon (09-02-2014)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBrowserLink expands UBrowserGSpyLink;

state FoundSecretState
{
	simulated function string getNW3Conds()
	{
	local string s;
	
		s = "mutators LIKE '%NW3 -%' OR mutators LIKE '%NW3 Extras -%'";
		s = s @ "OR hostname LIKE '%Nali Weapons 3%'";
		s = s @ "OR hostname LIKE '%NaliWeapons 3%'";
		s = s @ "OR hostname LIKE '%NW3%'";
		return s;
	}
	
Begin:
	Enable('Tick');
	SendBufferedData("\\list\\\\gamename\\"$GameName$"\\where\\"$getNW3Conds()$"\\final\\");
	WaitFor("ip\\", 30, NextIP);
}

defaultproperties
{
}