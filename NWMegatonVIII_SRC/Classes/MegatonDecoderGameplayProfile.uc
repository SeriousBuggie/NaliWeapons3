//////////////////////////////////////////////////////////////
//				Feralidragon (26-09-2012)
//
// NW3 MEGATON BUILD 1.00
//////////////////////////////////////////////////////////////

class MegatonDecoderGameplayProfile expands NWProfile config(NWProfilesCfg);

struct MegatonDecStruct
{
	var() bool bDroppable, canDisarmFriendNuke;
	var() float TransmissionTime, TransmissionMaxDistance;
};
var() config MegatonDecStruct MegatonDecProfile[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local MegatonDecoder MegaD;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'MegatonDecoder'.default.bDroppable = default.MegatonDecProfile[i].bDroppable;
	Class'MegatonDecoder'.default.canDisarmFriendNuke = default.MegatonDecProfile[i].canDisarmFriendNuke;
	Class'MegatonDecoder'.default.TransmissionTime = default.MegatonDecProfile[i].TransmissionTime;
	Class'MegatonDecoder'.default.TransmissionMaxDistance = default.MegatonDecProfile[i].TransmissionMaxDistance;
	
	if (Lvl == None)
		Class'MegatonDecoder'.static.StaticSaveConfig();
	
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'MegatonDecoder', MegaD)
		{
			MegaD.default.bDroppable = Class'MegatonDecoder'.default.bDroppable;
			MegaD.bDroppable = Class'MegatonDecoder'.default.bDroppable;
			MegaD.default.canDisarmFriendNuke = Class'MegatonDecoder'.default.canDisarmFriendNuke;
			MegaD.canDisarmFriendNuke = Class'MegatonDecoder'.default.canDisarmFriendNuke;
			MegaD.default.TransmissionTime = Class'MegatonDecoder'.default.TransmissionTime;
			MegaD.TransmissionTime = Class'MegatonDecoder'.default.TransmissionTime;
			MegaD.default.TransmissionMaxDistance = Class'MegatonDecoder'.default.TransmissionMaxDistance;
			MegaD.TransmissionMaxDistance = Class'MegatonDecoder'.default.TransmissionMaxDistance;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.MegatonDecProfile[i].bDroppable = Class'MegatonDecoder'.default.bDroppable;
	default.MegatonDecProfile[i].canDisarmFriendNuke = Class'MegatonDecoder'.default.canDisarmFriendNuke;
	default.MegatonDecProfile[i].TransmissionTime = Class'MegatonDecoder'.default.TransmissionTime;
	default.MegatonDecProfile[i].TransmissionMaxDistance = Class'MegatonDecoder'.default.TransmissionMaxDistance;
	
	StaticSaveConfig();
}


defaultproperties
{
	MegatonDecProfile(0)=(bDroppable=False,canDisarmFriendNuke=False,TransmissionTime=1.850000,TransmissionMaxDistance=192.000000)
	MegatonDecProfile(1)=(bDroppable=False,canDisarmFriendNuke=False,TransmissionTime=2.250000,TransmissionMaxDistance=128.000000)
	MegatonDecProfile(2)=(bDroppable=False,canDisarmFriendNuke=False,TransmissionTime=3.000000,TransmissionMaxDistance=128.000000)
	MegatonDecProfile(3)=(bDroppable=False,canDisarmFriendNuke=False,TransmissionTime=2.500000,TransmissionMaxDistance=128.000000)
	MegatonDecProfile(4)=(bDroppable=False,canDisarmFriendNuke=True,TransmissionTime=3.000000,TransmissionMaxDistance=128.000000)
	MegatonDecProfile(5)=(bDroppable=False,canDisarmFriendNuke=False,TransmissionTime=3.000000,TransmissionMaxDistance=128.000000)
	MegatonDecProfile(6)=(bDroppable=False,canDisarmFriendNuke=False,TransmissionTime=3.000000,TransmissionMaxDistance=128.000000)
	MegatonDecProfile(7)=(bDroppable=False,canDisarmFriendNuke=False,TransmissionTime=3.000000,TransmissionMaxDistance=128.000000)
}