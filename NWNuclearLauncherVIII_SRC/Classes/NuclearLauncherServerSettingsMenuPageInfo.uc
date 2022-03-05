//////////////////////////////////////////////////////////////
//				Feralidragon (23-09-2012)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////
class NuclearLauncherServerSettingsMenuPageInfo expands NWMenuPageInfo;

var() class<NuclearLauncher> NLauncherClass;

static function string GetDefaultValue(byte i, optional byte advIndex)
{
	if (i == 0)
		return String(default.NLauncherClass.default.bDestructableNuke);
	if (i == 1)
		return String(default.NLauncherClass.default.bNukeWhenDestroyed);
	if (i == 2)
		return String(default.NLauncherClass.default.CanBeDestroyedByTeam);
	if (i == 3)
		return String(default.NLauncherClass.default.guidedNukeExplodeOnDeath);
	if (i == 4)
		return String(default.NLauncherClass.default.DamageToDestroy);
	if (i == 5)
		return String(default.NLauncherClass.default.DestroyedNukeDamage);
	if (i == 6)
		return String(default.NLauncherClass.default.DestroyedNukeRadius);
	if (i == 7)
		return String(default.NLauncherClass.default.ImpactDamage);
	if (i == 8)
		return String(default.NLauncherClass.default.ImpactRadius);
	if (i == 9)
		return String(default.NLauncherClass.default.ImpactMomentum);
	if (i == 10)
		return String(default.NLauncherClass.default.enableDeniedMsg);
	if (i == 11)
		return String(default.NLauncherClass.default.bShakeFXOnFire);
	if (i == 12)
		return String(default.NLauncherClass.default.MissileColRadius);
	if (i == 13)
		return String(default.NLauncherClass.default.MissileColHeight);
	if (i == 14)
		return String(default.NLauncherClass.default.NukeSpeed);
	if (i == 15)
		return String(default.NLauncherClass.default.MaxNukeSpeed);
	if (i == 16)
		return String(default.NLauncherClass.default.GuidedNukeSpeed);
	if (i == 17)
		return String(default.NLauncherClass.default.enableHUDOrientation);
	if (i == 18)
		return String(default.NLauncherClass.default.enableHUDAltitude);
	if (i == 19)
		return String(default.NLauncherClass.default.enableHUDPawnTargets);
	if (i == 20)
		return String(default.NLauncherClass.default.enableHUDMachineTargets);
	if (i == 21)
		return String(default.NLauncherClass.default.checkHiddenTargets);
	if (i == 22)
		return String(default.NLauncherClass.default.checkTeamTargets);
	if (i == 23)
		return String(default.NLauncherClass.default.GuidedFOVIncrease);
	if (i == 24)
		return String(default.NLauncherClass.default.MaxPawnsDetectionRadius);
	if (i == 25)
		return String(default.NLauncherClass.default.MaxMachinesDetectionRadius);

	return "";
}

static function string ProcessSettingsChange(PlayerPawn P, byte i, string val, optional byte advIndex)
{
	if (i == 0)
		default.NLauncherClass.default.bDestructableNuke = Bool(val);
	else if (i == 1)
		default.NLauncherClass.default.bNukeWhenDestroyed = Bool(val);
	else if (i == 2)
		default.NLauncherClass.default.CanBeDestroyedByTeam = Bool(val);
	else if (i == 3)
		default.NLauncherClass.default.guidedNukeExplodeOnDeath = Bool(val);
	else if (i == 4)
		default.NLauncherClass.default.DamageToDestroy = Int(val);
	else if (i == 5)
		default.NLauncherClass.default.DestroyedNukeDamage = Int(val);
	else if (i == 6)
		default.NLauncherClass.default.DestroyedNukeRadius = Float(val);
	else if (i == 7)
		default.NLauncherClass.default.ImpactDamage = Int(val);
	else if (i == 8)
		default.NLauncherClass.default.ImpactRadius = Float(val);
	else if (i == 9)
		default.NLauncherClass.default.ImpactMomentum = Int(val);
	else if (i == 10)
		default.NLauncherClass.default.enableDeniedMsg = Bool(val);
	else if (i == 11)
		default.NLauncherClass.default.bShakeFXOnFire = Bool(val);
	else if (i == 12)
		default.NLauncherClass.default.MissileColRadius = Float(val);
	else if (i == 13)
		default.NLauncherClass.default.MissileColHeight = Float(val);
	else if (i == 14)
		default.NLauncherClass.default.NukeSpeed = Float(val);
	else if (i == 15)
		default.NLauncherClass.default.MaxNukeSpeed = Float(val);
	else if (i == 16)
		default.NLauncherClass.default.GuidedNukeSpeed = Float(val);
	else if (i == 17)
		default.NLauncherClass.default.enableHUDOrientation = Bool(val);
	else if (i == 18)
		default.NLauncherClass.default.enableHUDAltitude = Bool(val);
	else if (i == 19)
		default.NLauncherClass.default.enableHUDPawnTargets = Bool(val);
	else if (i == 20)
		default.NLauncherClass.default.enableHUDMachineTargets = Bool(val);
	else if (i == 21)
		default.NLauncherClass.default.checkHiddenTargets = Bool(val);
	else if (i == 22)
		default.NLauncherClass.default.checkTeamTargets = Bool(val);
	else if (i == 23)
	{
		if (Int(val) < 0)
			val = String(0);
		else if (Int(val) > 70)
			val = String(70);
		default.NLauncherClass.default.GuidedFOVIncrease = Byte(val);
	}
	else if (i == 24)
		default.NLauncherClass.default.MaxPawnsDetectionRadius = Float(val);
	else if (i == 25)
		default.NLauncherClass.default.MaxMachinesDetectionRadius = Float(val);
	
	default.NLauncherClass.static.StaticSaveConfig();
	return val;
}



defaultproperties
{
	ModMenuInfoClass=Class'NuclearLauncherAdvancedMainModMenuInfo'
	PageTitle="Settings"
	NLauncherClass=Class'NuclearLauncher'
	
	SettingsList(0)=(Description="Destructible warhead")
	SettingsList(0)=(HelpTip="Enable the possibility of destroying a nuke by shooting at it")
	SettingsList(0)=(Type=ST_Checkbox)
	
	SettingsList(1)=(Description="Armed warhead")
	SettingsList(1)=(HelpTip="Trigger the nuclear explosion when the warhead is shot down")
	SettingsList(1)=(Type=ST_Checkbox)
	
	SettingsList(2)=(Description="Destructible warhead by teammates")
	SettingsList(2)=(HelpTip="Enable the possibility of your teammates destroying your nuke")
	SettingsList(2)=(Type=ST_Checkbox)
	
	SettingsList(3)=(Description="Explode warhead on owner's death")
	SettingsList(3)=(HelpTip="Trigger the nuclear explosion when the warhead owner dies")
	SettingsList(3)=(Type=ST_Checkbox)
	
	SettingsList(4)=(Description="Min damage to destroy warhead")
	SettingsList(4)=(HelpTip="Min amount of damage needed to destroy a warhead")
	SettingsList(4)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(5)=(Description="Destroyed warhead damage")
	SettingsList(5)=(HelpTip="Amount of damage made by a warhead when it is destroyed")
	SettingsList(5)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(6)=(Description="Destroyed warhead damage radius")
	SettingsList(6)=(HelpTip="Max radius of damage made by a warhead when it is destroyed")
	SettingsList(6)=(Type=ST_FloatInput,MaxChars=7)
	
	SettingsList(7)=(Description="Warhead impact damage")
	SettingsList(7)=(HelpTip="Amount of damage made by a warhead when it hits the ground")
	SettingsList(7)=(Type=ST_IntegerInput,MaxChars=7)
	
	SettingsList(8)=(Description="Warhead impact radius")
	SettingsList(8)=(HelpTip="Max radius of damage made by a warhead when it hits the ground")
	SettingsList(8)=(Type=ST_FloatInput,MaxChars=7)
	
	SettingsList(9)=(Description="Warhead impact momentum")
	SettingsList(9)=(HelpTip="Amount of pull force made by a warhead when it hits the ground")
	SettingsList(9)=(Type=ST_IntegerInput,MaxChars=7)
	SettingsList(9)=(BottomMargin=20.000000)
	
	SettingsList(10)=(Description="Enable 'DENIED' message")
	SettingsList(10)=(HelpTip="Show 'DENIED' message when the warhead is taken down")
	SettingsList(10)=(Type=ST_Checkbox)
	
	SettingsList(11)=(Description="Shake FX on launch")
	SettingsList(11)=(HelpTip="Enable shake effect when launching a warhead")
	SettingsList(11)=(Type=ST_Checkbox)
	
	SettingsList(12)=(Description="Warhead collision radius")
	SettingsList(12)=(HelpTip="Warhead cylindrical colliding radius")
	SettingsList(12)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(13)=(Description="Warhead collision height")
	SettingsList(13)=(HelpTip="Warhead cylindrical colliding height")
	SettingsList(13)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(14)=(Description="Warhead start speed")
	SettingsList(14)=(HelpTip="Fire and forget warhead starting speed")
	SettingsList(14)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(15)=(Description="Warhead max speed")
	SettingsList(15)=(HelpTip="Fire and forget warhead max speed")
	SettingsList(15)=(Type=ST_FloatInput,MaxChars=4)
	
	SettingsList(16)=(Description="Guided warhead speed")
	SettingsList(16)=(HelpTip="Guided warhead constant speed")
	SettingsList(16)=(Type=ST_FloatInput,MaxChars=4)
	SettingsList(16)=(BottomMargin=20.000000)
	
	SettingsList(17)=(Description="Enable HUD orientation")
	SettingsList(17)=(HelpTip="Enable guided warhead HUD orientation system rendering")
	SettingsList(17)=(Type=ST_Checkbox)
	
	SettingsList(18)=(Description="Enable HUD altitude")
	SettingsList(18)=(HelpTip="Enable guided warhead HUD altitude indicators rendering")
	SettingsList(18)=(Type=ST_Checkbox)
	
	SettingsList(19)=(Description="Enable HUD pawn targets")
	SettingsList(19)=(HelpTip="Enable guided warhead HUD player and monster targets detection rendering")
	SettingsList(19)=(Type=ST_Checkbox)
	
	SettingsList(20)=(Description="Enable HUD machine targets")
	SettingsList(20)=(HelpTip="Enable guided warhead HUD machine targets rendering")
	SettingsList(20)=(Type=ST_Checkbox)
	
	SettingsList(21)=(Description="Render hidden targets")
	SettingsList(21)=(HelpTip="Enable guided warhead HUD hidden targets rendering")
	SettingsList(21)=(Type=ST_Checkbox)
	
	SettingsList(22)=(Description="Render teammate targets")
	SettingsList(22)=(HelpTip="Enable guided warhead HUD teammate targets rendering")
	SettingsList(22)=(Type=ST_Checkbox)
	
	SettingsList(23)=(Description="Guided warhead FOV increase")
	SettingsList(23)=(HelpTip="Guided warhead FOV (Field of View) incrementation over the player's default one")
	SettingsList(23)=(Type=ST_IntegerInput,MaxChars=3)
	
	SettingsList(24)=(Description="Pawn targets detection radius")
	SettingsList(24)=(HelpTip="Player and monster targets detection max radius from the warhead")
	SettingsList(24)=(Type=ST_FloatInput,MaxChars=6)
	
	SettingsList(25)=(Description="Machine targets detection radius")
	SettingsList(25)=(HelpTip="Machine targets detection max radius from the warhead")
	SettingsList(25)=(Type=ST_FloatInput,MaxChars=6)
	SettingsList(25)=(BottomMargin=20.000000)
}
