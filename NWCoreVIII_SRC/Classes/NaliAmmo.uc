//////////////////////////////////////////////////////////////
//	Nali Weapons III Ammo core
//				Feralidragon (21-03-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NaliAmmo expands TournamentAmmo
abstract;

var() bool bMegaAmmo;
var() bool denyReplacement;

var() name OpenedAnimSeq, ClosedAnimSeq, AmmoAnimSeq;
var() float AmmoAnimRate, AmmoAnimTime;
var() sound AmmoAnimSound, EndAnimSound;

var() float RessurectionTime;
var() sound RessurectSound1, RessurectSound2;
var NRessurectFX ResFX;
var WResReplace WRes;

//Team variables
//******************************
var byte PTeam;
var ControlPoint CPTeam;
var PlayerStart PSTeam;
var FortStandard FSTeam;
var byte bHaveFort;
//******************************

var bool isAnimAmmo;
var NWInvLightFX NWLightFX;
var int replMaxAmmo;

replication
{
	reliable if (Role == ROLE_Authority)
		replMaxAmmo;
	unreliable if (Role == ROLE_Authority)
		isAnimAmmo;
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	
	if (Role == ROLE_Authority)
	{
		if (Class'NWInfo'.default.enable_AmmoRessurectFX)
			ReSpawnTime = FMax(0.1, ReSpawnTime - RessurectionTime);
		
		if (Class'NWInfo'.default.AmmoBehaviour == AMOB_Animated)
		{
			ReSpawnTime = FMax(0.1, ReSpawnTime - AmmoAnimTime);
			isAnimAmmo = True;
			PlayAmmoAnim();
		}
		else if (Class'NWInfo'.default.AmmoBehaviour == AMOB_AlwaysOpened)
			PlayAmmoAnim(1);
		else if (Class'NWInfo'.default.AmmoBehaviour == AMOB_AlwaysClosed)
			PlayAmmoAnim(2);
		
		PTeam = Class'NWUtils'.static.IdentifyTeam(Level, Self, CPTeam, PSTeam, FSTeam, bHaveFort);
	}

	setDetail();
}

simulated function setDetail()
{
	Class'NWUtils'.static.processActorDetail(Level, Self, Class'NWInfo'.default.bAmmoDynLight, Class'NWInfo'.default.AmmoDistDetail);
}

simulated function Tick(float Delta)
{
	if (Class'NWInfo'.default.enableSmartPerformanceAmmo && Level.NetMode != NM_DedicatedServer)
		LODBias = Class'NWUtils'.static.getFrameRateBasedLODBias(Level, Delta, LODBias);
	if (replMaxAmmo != MaxAmmo)
	{
		if (Role == ROLE_Authority)
			replMaxAmmo = MaxAmmo;
		else if (replMaxAmmo > 0)
			MaxAmmo = replMaxAmmo;
	}
}

simulated function PlayAmmoAnim(optional byte Type)
{
	if (Mesh != None)
	{
		if (Type == 0)
			PlayAnim(AmmoAnimSeq, AmmoAnimRate, 0.0);
		else if (Type == 1)
			PlayAnim(OpenedAnimSeq, 10.0, 0.0);
		else if (Type == 2)
			PlayAnim(ClosedAnimSeq, 10.0, 0.0);
	}
}

simulated function Destroyed()
{
	if (ResFX != None)
		ResFX.Destroy();
	if (WRes != None)
		WRes.Destroy();
	if (NWLightFX != None)
		NWLightFX.Destroy();
		
	ResFX = None;
	WRes = None;
	NWLightFX = None;
		
	Super.Destroyed();
}

function PlayResSound(bool bBirth)
{
	if (bBirth)
		PlaySound(RessurectSound1);
	else
		PlaySound(RessurectSound2);
}

function PlayAmmoAnimSound(bool bEnd)
{
	if (bEnd && EndAnimSound != None)
		PlaySound( EndAnimSound);
	else if (!bEnd && AmmoAnimSound != None)
		PlaySound( AmmoAnimSound);
}

simulated function float PlayOpenAnim()
{
local byte i;

	if (WRes == None)
	{
		WRes = Spawn(Class'AmmoResReplace', Self);
		WRes.Mesh = Mesh;
		WRes.AmbientGlow = AmbientGlow;
		WRes.DrawScale = DrawScale;
		for (i = 0; i < 8; i++)
			WRes.MultiSkins[i] = MultiSkins[i];
		WRes.SetLifeSpan(AmmoAnimTime + 0.25);
	}
	
	WRes.PlayAnim(AmmoAnimSeq, AmmoAnimRate, 0.0);
	return AmmoAnimTime;
}

simulated function float PlayRessurection()
{
local byte i;

	bHidden = false;
	
	WRes = Spawn(Class'AmmoResReplace', Self);
	WRes.Mesh = Mesh;
	WRes.AmbientGlow = AmbientGlow;
	WRes.DrawScale = DrawScale;
	
	for (i = 0; i < 8; i++)
		WRes.MultiSkins[i] = MultiSkins[i];
	
	WRes.ScaleGlow = 0.0;
	WRes.bMeshEnviroMap = True;
	WRes.Texture = Class'NRessurectFX'.default.InvisTex;
	WRes.Style = STY_Masked;
	
	if (!isAnimAmmo)
	{
		WRes.SetLifeSpan(RessurectionTime + 0.25);
		if (HasAnim(AnimSequence))
			WRes.PlayAnim(AnimSequence, 10.0, 0.0);
	}
	else
	{
		WRes.SetLifeSpan(RessurectionTime + AmmoAnimTime + 0.25);
		if (HasAnim(ClosedAnimSeq))
			WRes.PlayAnim(ClosedAnimSeq, 10.0, 0.0);
	}
	
	ResFX = Spawn(Class'NRessurectFX', WRes);
	ResFX.Mesh = Mesh;
	if (Level.NetMode != NM_DedicatedServer)
		ResFX.LODBias = LODBias;
	ResFX.DrawScale = DrawScale;
	ResFX.SetLifeTime(RessurectionTime);
	ResFX.LifeCount = RessurectionTime;
	ResFX.StartFraming(RessurectionTime/3*2);
	Class'NWUtils'.static.InitializeRes(ResFX, Self, Level, Class'NWInfo'.default.enable_AmmoResTeamBasedColor, 
		Class'NWInfo'.default.AmmoResFXColor, PTeam, CPTeam, PSTeam, FSTeam, bHaveFort);
	
	PlayResSound(True);
	bHidden = true;
	return RessurectionTime/3*2;
}


State Sleeping
{
ignores Touch;

    function BeginState()
    {
		BecomePickup();
		bHidden = True;
		if (Level.NetMode == NM_StandAlone)
			LightType = LT_None;
    }
	
	function EndState()
    {
	local byte i;

		bSleepTouch = false;
		if (Level.NetMode == NM_StandAlone && Class'NWInfo'.default.bAmmoDynLight)
			LightType = Default.LightType;
		for (i = 0; i < ArrayCount(Touching); i++)
		{
			if (Pawn(Touching[i]) != None)
				bSleepTouch = true;
		}
    }   
       
Begin:
	if (Class'NWInfo'.default.enable_AmmoRessurectFX)
	{
		Sleep(ReSpawnTime);
		Sleep(PlayRessurection());
		PlayResSound(False);
		Sleep(RessurectionTime/3);
		if (isAnimAmmo)
		{
			PlayAmmoAnimSound(False);
			Sleep(PlayOpenAnim());
			PlayAmmoAnimSound(True);
		}
	}
	else
	{
		Sleep(ReSpawnTime);
		PlaySound(RespawnSound);
		Sleep(Level.Game.PlaySpawnEffect(Self));
		if (isAnimAmmo)
		{
			PlayAmmoAnimSound(False);
			Sleep(PlayOpenAnim());
			PlayAmmoAnimSound(True);
		}
	}
	
    GoToState('Pickup');
}

defaultproperties
{
	AnimSequence=Still
	LODBias=8.000000
	RessurectSound1=RessurectSnd
	RessurectSound2=RessurectFinSnd
	RessurectionTime=3.000000
	OpenedAnimSeq=Opened
	ClosedAnimSeq=Closed
	AmmoAnimSeq=Openning
	AmmoAnimRate=1.000000
	AmmoAnimTime=1.000000
}