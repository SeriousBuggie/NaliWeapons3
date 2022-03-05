//////////////////////////////////////////////////////////////
//				Feralidragon (28-09-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWClientNuclearSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetFullDefaultValue(byte i, optional byte advIndex);

static function string ProcessFullSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex);


defaultproperties
{
	ModMenuInfoClass=Class'NWClientSettingsMainModMenuInfo'
	PageTitle="Nukes"
}
