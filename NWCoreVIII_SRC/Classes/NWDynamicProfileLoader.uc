//////////////////////////////////////////////////////////////
//				Feralidragon (22-10-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWDynamicProfileLoader expands Mutator
abstract;

var() byte ProfileID;
var() class<NWProfile> ProfileClass;


function PreBeginPlay()
{
local NWMutator NWM;

	if (ProfileID >= 8)
	{
		log("Cannot load profile with ID="$ProfileID$"; the profile ID must be within 0 and 7!");
		return;
	}
	
	if (ProfileClass == None)
	{
		log("Cannot load null profile class!");
		return;
	}
		
	ProfileClass.static.InitProfileInfo(Level);
	ProfileClass.static.ProcessFullProfileChange(ProfileID, Level);
		
	NWM = Class'NWUtils'.static.getNWMutator(Level);
	if (NWM != None)
		NWM.LoadedDynamicProfile(ProfileID);
}

 
defaultproperties
{
	ProfileID=0
	ProfileClass=Class'NWProfile'
}