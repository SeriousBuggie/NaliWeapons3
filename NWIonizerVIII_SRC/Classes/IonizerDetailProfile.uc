//////////////////////////////////////////////////////////////
//				Feralidragon (25-09-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerDetailProfile expands NWProfile config(NWProfilesCfg);

struct IonizerDetailStruct
{
	var() float IonDebrisRate, IonLightningsRate;
	var() byte IonDebrisAmountPerUpdate, IonLightingsAmountPerUpdate;
};
var() config IonizerDetailStruct IonDetailProfile[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local Ionizer Ion;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'Ionizer'.default.IonDebrisRate = default.IonDetailProfile[i].IonDebrisRate;
	Class'Ionizer'.default.IonLightningsRate = default.IonDetailProfile[i].IonLightningsRate;
	Class'Ionizer'.default.IonDebrisAmountPerUpdate = default.IonDetailProfile[i].IonDebrisAmountPerUpdate;
	Class'Ionizer'.default.IonLightingsAmountPerUpdate = default.IonDetailProfile[i].IonLightingsAmountPerUpdate;
	
	if (Lvl == None)
		Class'Ionizer'.static.StaticSaveConfig();
	
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'Ionizer', Ion)
		{
			Ion.default.IonDebrisRate = Class'Ionizer'.default.IonDebrisRate;
			Ion.IonDebrisRate = Class'Ionizer'.default.IonDebrisRate;
			Ion.default.IonLightningsRate = Class'Ionizer'.default.IonLightningsRate;
			Ion.IonLightningsRate = Class'Ionizer'.default.IonLightningsRate;
			Ion.default.IonDebrisAmountPerUpdate = Class'Ionizer'.default.IonDebrisAmountPerUpdate;
			Ion.IonDebrisAmountPerUpdate = Class'Ionizer'.default.IonDebrisAmountPerUpdate;
			Ion.default.IonLightingsAmountPerUpdate = Class'Ionizer'.default.IonLightingsAmountPerUpdate;
			Ion.IonLightingsAmountPerUpdate = Class'Ionizer'.default.IonLightingsAmountPerUpdate;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.IonDetailProfile[i].IonDebrisRate = Class'Ionizer'.default.IonDebrisRate;
	default.IonDetailProfile[i].IonLightningsRate = Class'Ionizer'.default.IonLightningsRate;
	default.IonDetailProfile[i].IonDebrisAmountPerUpdate = Class'Ionizer'.default.IonDebrisAmountPerUpdate;
	default.IonDetailProfile[i].IonLightingsAmountPerUpdate = Class'Ionizer'.default.IonLightingsAmountPerUpdate;
	
	StaticSaveConfig();
}


defaultproperties
{
	IonDetailProfile(0)=(IonDebrisRate=5.000000,IonLightningsRate=1.000000,IonDebrisAmountPerUpdate=4,IonLightingsAmountPerUpdate=3)
	IonDetailProfile(1)=(IonDebrisRate=10.000000,IonLightningsRate=2.000000,IonDebrisAmountPerUpdate=4,IonLightingsAmountPerUpdate=3)
	IonDetailProfile(2)=(IonDebrisRate=17.500000,IonLightningsRate=3.500000,IonDebrisAmountPerUpdate=6,IonLightingsAmountPerUpdate=4)
	IonDetailProfile(3)=(IonDebrisRate=25.000000,IonLightningsRate=5.000000,IonDebrisAmountPerUpdate=8,IonLightingsAmountPerUpdate=5)
	IonDetailProfile(4)=(IonDebrisRate=25.000000,IonLightningsRate=5.000000,IonDebrisAmountPerUpdate=10,IonLightingsAmountPerUpdate=6)
	IonDetailProfile(5)=(IonDebrisRate=30.000000,IonLightningsRate=6.000000,IonDebrisAmountPerUpdate=12,IonLightingsAmountPerUpdate=7)
	IonDetailProfile(6)=(IonDebrisRate=45.000000,IonLightningsRate=7.000000,IonDebrisAmountPerUpdate=16,IonLightingsAmountPerUpdate=9)
	IonDetailProfile(7)=(IonDebrisRate=25.000000,IonLightningsRate=5.000000,IonDebrisAmountPerUpdate=8,IonLightingsAmountPerUpdate=5)
}