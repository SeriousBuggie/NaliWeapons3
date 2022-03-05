//////////////////////////////////////////////////////////////
//				Feralidragon (25-03-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWClientGoreSettingsMenuPageInfo expands NWMenuPageInfo;


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'NWBloodyMess'.default.UseClientGoreMultSettings);
	if (i == 1)
		return String(Class'NWBloodyMess'.default.UseClientGoreDecalSettings);
	if (i == 2)
		return String(Class'NWBloodyMess'.default.enableSlideBloodDecals);
	if (i == 3)
		return String(Class'NWBloodyMess'.default.BloodDecalsMinLifespan);
	if (i == 4)
		return String(Class'NWBloodyMess'.default.BloodDecalsMaxLifespan);
	if (i == 5)
		return String(Class'NWBloodyMess'.default.GoreLifeSpanMultiplier);
	if (i == 6)
		return String(Class'NWBloodyMess'.default.GorePartsMultiplier);
	if (i == 7)
		return String(Class'NWBloodyMess'.default.GoreScaleMultiplier);
	if (i == 8)
		return String(Class'NWBloodyMess'.default.bCordCollideWithActors);
	if (i == 9)
		return String(Class'NWBloodyMess'.default.MaxCordIterations);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
local NWBloodyMess NW;

	if (i == 0)
		Class'NWBloodyMess'.default.UseClientGoreMultSettings = Bool(val);
	else if (i == 1)
		Class'NWBloodyMess'.default.UseClientGoreDecalSettings = Bool(val);
	else if (i == 2)
		Class'NWBloodyMess'.default.enableSlideBloodDecals = Bool(val);
	else if (i == 3)
		Class'NWBloodyMess'.default.BloodDecalsMinLifespan = Float(val);
	else if (i == 4)
		Class'NWBloodyMess'.default.BloodDecalsMaxLifespan = Float(val);
	else if (i == 5)
		Class'NWBloodyMess'.default.GoreLifeSpanMultiplier = Float(val);
	else if (i == 6)
		Class'NWBloodyMess'.default.GorePartsMultiplier = Float(val);
	else if (i == 7)
		Class'NWBloodyMess'.default.GoreScaleMultiplier = Float(val);
	else if (i == 8)
		Class'NWBloodyMess'.default.bCordCollideWithActors = Bool(val);
	else if (i == 9)
		Class'NWBloodyMess'.default.MaxCordIterations = Int(val);

	if (P != None)
	{
		ForEach P.AllActors(Class'NWBloodyMess', NW)
		{
			NW.UseClientGoreMultSettings = Class'NWBloodyMess'.default.UseClientGoreMultSettings;
			NW.default.UseClientGoreMultSettings = Class'NWBloodyMess'.default.UseClientGoreMultSettings;
			NW.UseClientGoreDecalSettings = Class'NWBloodyMess'.default.UseClientGoreDecalSettings;
			NW.default.UseClientGoreDecalSettings = Class'NWBloodyMess'.default.UseClientGoreDecalSettings;
			
			NW.enableSlideBloodDecals = Class'NWBloodyMess'.default.enableSlideBloodDecals;
			NW.default.enableSlideBloodDecals = Class'NWBloodyMess'.default.enableSlideBloodDecals;
			NW.BloodDecalsMinLifespan = Class'NWBloodyMess'.default.BloodDecalsMinLifespan;
			NW.default.BloodDecalsMinLifespan = Class'NWBloodyMess'.default.BloodDecalsMinLifespan;
			NW.BloodDecalsMaxLifespan = Class'NWBloodyMess'.default.BloodDecalsMaxLifespan;
			NW.default.BloodDecalsMaxLifespan = Class'NWBloodyMess'.default.BloodDecalsMaxLifespan;
			NW.GoreLifeSpanMultiplier = Class'NWBloodyMess'.default.GoreLifeSpanMultiplier;
			NW.default.GoreLifeSpanMultiplier = Class'NWBloodyMess'.default.GoreLifeSpanMultiplier;
			NW.GorePartsMultiplier = Class'NWBloodyMess'.default.GorePartsMultiplier;
			NW.default.GorePartsMultiplier = Class'NWBloodyMess'.default.GorePartsMultiplier;
			NW.GoreScaleMultiplier = Class'NWBloodyMess'.default.GoreScaleMultiplier;
			NW.default.GoreScaleMultiplier = Class'NWBloodyMess'.default.GoreScaleMultiplier;
			
			NW.bCordCollideWithActors = Class'NWBloodyMess'.default.bCordCollideWithActors;
			NW.default.bCordCollideWithActors = Class'NWBloodyMess'.default.bCordCollideWithActors;
			NW.MaxCordIterations = Class'NWBloodyMess'.default.MaxCordIterations;
			NW.default.MaxCordIterations = Class'NWBloodyMess'.default.MaxCordIterations;
		}
	}

	Class'NWBloodyMess'.static.StaticSaveConfig();
	return val;
}


defaultproperties
{
	ModMenuInfoClass=Class'NWClientSettingsMainModMenuInfo'
	PageTitle="Gore"
	
	SettingsList(0)=(Description="Overwrite server multiplier")
	SettingsList(0)=(HelpTip="Overwrite server gore multiplier settings")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Overwrite server decals")
	SettingsList(1)=(HelpTip="Overwrite server decal multiplier settings")
	SettingsList(1)=(Type=ST_Checkbox)
	SettingsList(1)=(BottomMargin=20.000000)
	
	SettingsList(2)=(Description="Enable slide decals")
	SettingsList(2)=(HelpTip="Enable blood sliding decals")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="Decals min lifespan")
	SettingsList(3)=(HelpTip="Blood decals min life time (in seconds)%n%NOTE: If both max and min lifespan are set to zero, the decal will stay as long as it's seen.")
	SettingsList(3)=(Type=ST_FloatInput,MaxChars=5)
	
	SettingsList(4)=(Description="Decals max lifespan")
	SettingsList(4)=(HelpTip="Blood decals max life time (in seconds)%n%NOTE: If both max and min lifespan are set to zero, the decal will stay as long as it's seen.")
	SettingsList(4)=(Type=ST_FloatInput,MaxChars=5)
	
	SettingsList(5)=(Description="Gore lifespan multiplier")
	SettingsList(5)=(HelpTip="Gore life time multiplier")
	SettingsList(5)=(Type=ST_FloatInput,MaxChars=5)
	
	SettingsList(6)=(Description="Gore parts multiplier")
	SettingsList(6)=(HelpTip="Amount of gore parts multiplier")
	SettingsList(6)=(Type=ST_FloatInput,MaxChars=5)
	
	SettingsList(7)=(Description="Gore scale multiplier")
	SettingsList(7)=(HelpTip="Gore parts scale multiplier")
	SettingsList(7)=(Type=ST_FloatInput,MaxChars=5)
	SettingsList(7)=(BottomMargin=20.000000)
	
	SettingsList(8)=(Description="Cord physics actor collision")
	SettingsList(8)=(HelpTip="Enable cord physics to collide and interact with normal objects")
	SettingsList(8)=(Type=ST_Checkbox)
	
	SettingsList(9)=(Description="Cord physics iterations")
	SettingsList(9)=(HelpTip="Number of cord physics calculation iterations")
	SettingsList(9)=(Type=ST_IntegerInput,MaxChars=2)
	SettingsList(9)=(BottomMargin=20.000000)
}
