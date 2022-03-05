//////////////////////////////////////////////////////////////
//	Nali Weapons III settings profile info
//				Feralidragon (23-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWProfile expands Info config(NWProfilesCfg);

var() config byte SelectedProfile;
var() config string ProfileNames[8];
var class<NWProfile> ExtendedProfileInfo[64];

var bool bStaticInitialized;


static function InitProfileInfo(Actor A)
{
local int i, j;
local string ProfClassStr;

	if (A == None || default.bStaticInitialized)
		return;
		
	//Load extra settings from int files
	for (i = 0; i < ArrayCount(default.ExtendedProfileInfo); i++)
	{
		ProfClassStr = A.GetNextInt(String(default.Class), i);
		if (ProfClassStr == "")
			break;
		default.ExtendedProfileInfo[i] = Class<NWProfile>(DynamicLoadObject(ProfClassStr, class'Class'));
	}
		
	default.bStaticInitialized = True;
}

//-----------------------------------------------------------------------------------------------
//  Internally handled events
//-----------------------------------------------------------------------------------------------

static function ProcessFullProfileChange(byte i, optional LevelInfo Lvl)
{
local byte j;
	
	for (j = 0; j < ArrayCount(default.ExtendedProfileInfo); j++)
	{
		if (default.ExtendedProfileInfo[j] != None)
			default.ExtendedProfileInfo[j].static.ProcessProfileChange(i, Lvl);
	}
	ProcessProfileChange(i, Lvl);
}

static function ProcessFullProfileSave(byte i)
{
local byte j;
	
	for (j = 0; j < ArrayCount(default.ExtendedProfileInfo); j++)
	{
		if (default.ExtendedProfileInfo[j] != None)
			default.ExtendedProfileInfo[j].static.ProcessProfileSave(i);
	}
	ProcessProfileSave(i);
}


//-----------------------------------------------------------------------------------------------
//  To implement on subclasses
//-----------------------------------------------------------------------------------------------

static function ProcessProfileChange(byte i, optional LevelInfo Lvl);

static function ProcessProfileSave(byte i);


defaultproperties
{
}