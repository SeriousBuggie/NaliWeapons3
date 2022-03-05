//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////
class GravitonServerSettingsMenuPageInfo expands NWMenuPageInfo;

var() localized string GravBeamSpeedType[4];


static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(Class'Graviton'.default.bGravitonFlyHack);
	if (i == 1)
		return String(Class'Graviton'.default.bUseGhostGrabStyle);
	if (i == 2)
		return String(Class'Graviton'.default.bUseGravityBeamOnly);
	if (i == 3)
		return String(Class'Graviton'.default.bGravitonStraightBeam);
	if (i == 4)
		return String(Class'Graviton'.default.bUseVortexProjectile);
	if (i == 5)
		return String(Class'Graviton'.default.bUseVortexPhysics);
	if (i == 6)
		return String(Class'Graviton'.default.bScoreGrabAndDropFrags);
	if (i == 7)
		return String(Class'Graviton'.default.bCanGrabTeam);
	if (i == 8)
		return String(Class'Graviton'.default.bCanGrabOwnedObjects);
	if (i == 9)
		return String(Class'Graviton'.default.bBeamSmashDamage);
	if (i == 10)
		return String(Class'Graviton'.default.bUseSpringBeamPhysics);
	if (i == 11)
		return String(Class'Graviton'.default.bUseSpringMassPhysics);
	if (i == 12)
		return String(Class'Graviton'.default.GravityBallAmmoConsumption);
	if (i == 13)
		return String(Class'Graviton'.default.GravityBeamSize);
	if (i == 14)
		return String(Class'Graviton'.default.SmashDifficulty);
	if (i == 15)
		return String(Class'Graviton'.default.GravityBeamBendFactor);
	if (i == 16)
		return String(Class'Graviton'.default.GravityBeamInertia);
	if (i == 17)
		return String(Class'Graviton'.default.VortexRadius);
	if (i == 18)
		return String(Class'Graviton'.default.VortexDamage);
	if (i == 21)
		return String(Class'Graviton'.default.GravitonFlyHackSpeedMult);
	if (i == 22)
		return String(Class'Graviton'.default.ThrowDamageMaxTime);
	if (i == 23)
		return String(Class'Graviton'.default.enableSmashShake);
	if (i == 24)
		return String(Class'Graviton'.default.SmashMinSpeed);
	if (i == 26)
		return String(Class'Graviton'.default.enableOversurrection);
	if (i == 27)
		return String(Class'Graviton'.default.OversurrectionLifeTime);
	if (i == 28)
		return String(Class'Graviton'.default.OversurrectivePullStrength);
	if (i == 29)
		return String(Class'Graviton'.default.OversurrectivePullRadius);
	if (i == 30)
		return String(Class'Graviton'.default.OversurrectivePullRate);
	if (i == 31)
		return String(Class'Graviton'.default.OversurrectiveDamage);
	if (i == 32)
		return String(Class'Graviton'.default.bOversurrectiveVtxPhysics);
	if (i == 33)
		return String(Class'Graviton'.default.bOversurrectivePullProj);
	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		Class'Graviton'.default.bGravitonFlyHack = Bool(val);
	else if (i == 1)
		Class'Graviton'.default.bUseGhostGrabStyle = Bool(val);
	else if (i == 2)
		Class'Graviton'.default.bUseGravityBeamOnly = Bool(val);
	else if (i == 3)
		Class'Graviton'.default.bGravitonStraightBeam = Bool(val);
	else if (i == 4)
		Class'Graviton'.default.bUseVortexProjectile = Bool(val);
	else if (i == 5)
		Class'Graviton'.default.bUseVortexPhysics = Bool(val);
	else if (i == 6)
		Class'Graviton'.default.bScoreGrabAndDropFrags = Bool(val);
	else if (i == 7)
		Class'Graviton'.default.bCanGrabTeam = Bool(val);
	else if (i == 8)
		Class'Graviton'.default.bCanGrabOwnedObjects = Bool(val);
	else if (i == 9)
		Class'Graviton'.default.bBeamSmashDamage = Bool(val);
	else if (i == 10)
		Class'Graviton'.default.bUseSpringBeamPhysics = Bool(val);
	else if (i == 11)
		Class'Graviton'.default.bUseSpringMassPhysics = Bool(val);	
	else if (i == 12 || i == 13)
	{
		if (Int(val) < 0)
			val = String(0);
		else if (Int(val) > 255)
			val = String(255);
		
		if (i == 12)
			Class'Graviton'.default.GravityBallAmmoConsumption = Byte(val);
		else if (i == 13)
			Class'Graviton'.default.GravityBeamSize = Byte(val);
	}
	else if (i == 14)
		Class'Graviton'.default.SmashDifficulty = Float(val);
	else if (i == 15)
		Class'Graviton'.default.GravityBeamBendFactor = Float(val);
	else if (i == 16)
		Class'Graviton'.default.GravityBeamInertia = Float(val);
	else if (i == 17)
		Class'Graviton'.default.VortexRadius = Float(val);
	else if (i == 18)
		Class'Graviton'.default.VortexDamage = Int(val);
	else if (i == 21)
		Class'Graviton'.default.GravitonFlyHackSpeedMult = Float(val);
	else if (i == 22)
		Class'Graviton'.default.ThrowDamageMaxTime = Float(val);
	else if (i == 23)
		Class'Graviton'.default.enableSmashShake = Bool(val);
	else if (i == 24)
		Class'Graviton'.default.SmashMinSpeed = Float(val);
	else if (i == 26)
		Class'Graviton'.default.enableOversurrection = Bool(val);
	else if (i == 27)
		Class'Graviton'.default.OversurrectionLifeTime = Float(val);
	else if (i == 28)
		Class'Graviton'.default.OversurrectivePullStrength = Float(val);
	else if (i == 29)
		Class'Graviton'.default.OversurrectivePullRadius = Float(val);
	else if (i == 30)
		Class'Graviton'.default.OversurrectivePullRate = Float(val);
	else if (i == 31)
		Class'Graviton'.default.OversurrectiveDamage = Int(val);
	else if (i == 32)
		Class'Graviton'.default.bOversurrectiveVtxPhysics = Bool(val);
	else if (i == 33)
		Class'Graviton'.default.bOversurrectivePullProj = Bool(val);
	Class'Graviton'.static.StaticSaveConfig();
	return val;
}


//Combo
static function GetComboDefaultValues(byte i, out string val1, out string val2, optional byte advIndex)
{
local byte n;

	if (i == 19 || i == 20)
	{
		if (i == 19)
			n = Class'Graviton'.default.GravityBeamStartSpeed;
		else if (i == 20)
			n = Class'Graviton'.default.GravityBeamEndSpeed;
		
		if (n < ArrayCount(default.GravBeamSpeedType))
		{
			val1 = default.GravBeamSpeedType[n];
			val2 = String(n);
			return;
		}
	}
	
	val1 = "";
	val2 = "";
}

static function bool LoadComboList(byte i, byte listIndex, out string val1, out string val2, optional byte advIndex)
{
	if ((i == 19 || i == 20) && listIndex < ArrayCount(default.GravBeamSpeedType))
	{
		val1 = default.GravBeamSpeedType[listIndex];
		val2 = String(listIndex);
		return True;
	}
	
	val1 = "";
	val2 = "";
	return False;
}

static function string ProcessSettingsChangeCombo(PlayerPawn P, byte i, string val2, optional byte advIndex)
{
	if (i == 19)
		Class'Graviton'.default.GravityBeamStartSpeed = Class'Graviton'.static.GetEGSpeedFromByte(Byte(val2));
	else if (i == 20)
		Class'Graviton'.default.GravityBeamEndSpeed = Class'Graviton'.static.GetEGSpeedFromByte(Byte(val2));

	Class'Graviton'.static.StaticSaveConfig();
	return val2;
}



defaultproperties
{
	ModMenuInfoClass=Class'GravitonAdvancedMainModMenuInfo'
	PageTitle="Settings"
	
	SettingsList(0)=(Description="Enable flying ability")
	SettingsList(0)=(HelpTip="Enable flying ability by grabbing and transporting yourself with the Graviton beam")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Ghostly grab")
	SettingsList(1)=(HelpTip="Enable ability to grabbing and place players and things through walls")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Disable secondary projectile")
	SettingsList(2)=(HelpTip="Disable secondary mode charged vortex projectile")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="Straight beam")
	SettingsList(3)=(HelpTip="Use non-bending beam, make it straight only beam (like the Pulse Gun beam)")
	SettingsList(3)=(Type=ST_Checkbox)
	
	SettingsList(4)=(Description="Enable secondary vortex")
	SettingsList(4)=(HelpTip="Use vortex projectile as secondary mode")
	SettingsList(4)=(Type=ST_Checkbox)
	
	SettingsList(5)=(Description="Enable vortex physics")
	SettingsList(5)=(HelpTip="Use more accurate physics for the vortex projectile")
	SettingsList(5)=(Type=ST_Checkbox)
	
	SettingsList(6)=(Description="Score 'grab and drop' frags")
	SettingsList(6)=(HelpTip="Score frags made by grabbing and dropping the player in a deadly zone")
	SettingsList(6)=(Type=ST_Checkbox)
	
	SettingsList(7)=(Description="Can grab teammates")
	SettingsList(7)=(HelpTip="Enable ability to grab teammates")
	SettingsList(7)=(Type=ST_Checkbox)
	
	SettingsList(8)=(Description="Can grab owned objects")
	SettingsList(8)=(HelpTip="Enable ability for a player to grab his/her own objects and projectiles")
	SettingsList(8)=(Type=ST_Checkbox)
	
	SettingsList(9)=(Description="Enable smash damage")
	SettingsList(9)=(HelpTip="Enable ability to smash players against solid surfaces using the beam")
	SettingsList(9)=(Type=ST_Checkbox)
	
	SettingsList(10)=(Description="Spring-like beam physics")
	SettingsList(10)=(HelpTip="Enable beam spring/elastic physics")
	SettingsList(10)=(Type=ST_Checkbox)
	
	SettingsList(11)=(Description="Spring-like beam mass physics")
	SettingsList(11)=(HelpTip="Consider grabbed object mass in the beam physics for spring-like behavior")
	SettingsList(11)=(Type=ST_Checkbox)
	SettingsList(11)=(BottomMargin=20.000000)
	
	SettingsList(12)=(Description="Secondary mode ammo consumption")
	SettingsList(12)=(HelpTip="Ammo needed to use secondary mode (vortex projectile)")
	SettingsList(12)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(13)=(Description="Beam size")
	SettingsList(13)=(HelpTip="Beam max length (number of beam parts)")
	SettingsList(13)=(Type=ST_IntegerInput,MaxChars=3)

	SettingsList(14)=(Description="Smash difficulty")
	SettingsList(14)=(HelpTip="Difficulty in smashing a player with the beam (bigger value = faster movements required)")
	SettingsList(14)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(15)=(Description="Beam bending factor")
	SettingsList(15)=(HelpTip="Beam bending coeficient (bigger value = higher bending amount)")
	SettingsList(15)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(16)=(Description="Beam inertia")
	SettingsList(16)=(HelpTip="Beam bending inertia")
	SettingsList(16)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(17)=(Description="Vortex radius")
	SettingsList(17)=(HelpTip="Secondary vortex projectile max pulling radius")
	SettingsList(17)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(18)=(Description="Vortex damage")
	SettingsList(18)=(HelpTip="Secondary vortex projectile amount of damage")
	SettingsList(18)=(Type=ST_IntegerInput,MaxChars=4)
	SettingsList(18)=(BottomMargin=20.000000)
	
	SettingsList(19)=(Description="Beam start speed")
	SettingsList(19)=(HelpTip="Graviton primary rotating mechanism speed when starting generating the beam")
	SettingsList(19)=(Type=ST_Combo)
	GravBeamSpeedType(0)="Slow"
	GravBeamSpeedType(1)="Normal"
	GravBeamSpeedType(2)="Fast"
	GravBeamSpeedType(3)="Instant"
	
	SettingsList(20)=(Description="Beam finish speed")
	SettingsList(20)=(HelpTip="Graviton primary rotating mechanism speed when finishing generating the beam")
	SettingsList(20)=(Type=ST_Combo)
	SettingsList(20)=(BottomMargin=20.000000)
	
	SettingsList(21)=(Description="Fly speed multiplier")
	SettingsList(21)=(HelpTip="Speed multiplier when flying (when the flying ability is enabled)")
	SettingsList(21)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(22)=(Description="Throw damage time")
	SettingsList(22)=(HelpTip="Max time to keep the throw of a player susceptible to damage")
	SettingsList(22)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(23)=(Description="Enable smash shake")
	SettingsList(23)=(HelpTip="Enable smash shaking effect")
	SettingsList(23)=(Type=ST_Checkbox)
	
	SettingsList(24)=(Description="Smash min speed")
	SettingsList(24)=(HelpTip="Min speed needed for a player to be smashed when thrown")
	SettingsList(24)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(24)=(BottomMargin=20.000000)
	
	SettingsList(25)=(Description="Oversurrection:")
	SettingsList(25)=(HelpTip="Oversurrection settings")
	SettingsList(25)=(Type=ST_Label)
	
	SettingsList(26)=(Description="    Enable Oversurrection")
	SettingsList(26)=(HelpTip="Enable this weapon to be able to be oversurrected")
	SettingsList(26)=(Type=ST_Checkbox)
	
	SettingsList(27)=(Description="    Life time")
	SettingsList(27)=(HelpTip="Oversurrection max life time (in seconds)")
	SettingsList(27)=(Type=ST_FloatInput,MaxChars=4)

	SettingsList(28)=(Description="    Pull strength")
	SettingsList(28)=(HelpTip="Oversurrection vortex amount of pull strength")
	SettingsList(28)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(29)=(Description="    Pull radius")
	SettingsList(29)=(HelpTip="Oversurrection vortex pull radius")
	SettingsList(29)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(30)=(Description="    Pull rate")
	SettingsList(30)=(HelpTip="Oversurrection vortex pull rate")
	SettingsList(30)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(31)=(Description="    Vortex damage")
	SettingsList(31)=(HelpTip="Oversurrection vortex center damage")
	SettingsList(31)=(Type=ST_IntegerInput,MaxChars=6)
	
	SettingsList(32)=(Description="    Enable vortex physics")
	SettingsList(32)=(HelpTip="Enable oversurrection full vortex physics simulation (take object mass into account)")
	SettingsList(32)=(Type=ST_Checkbox)
	
	SettingsList(33)=(Description="    Enable projectiles pull")
	SettingsList(33)=(HelpTip="Enable oversurrection pull of projectiles into the vortex")
	SettingsList(33)=(Type=ST_Checkbox)
	SettingsList(33)=(BottomMargin=20.000000)
}
