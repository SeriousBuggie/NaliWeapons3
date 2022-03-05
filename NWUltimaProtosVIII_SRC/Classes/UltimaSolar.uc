//////////////////////////////////////////////////////////////
//				Feralidragon (25-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolar expands NaliWActor;

#exec OBJ LOAD FILE=Textures\UltimaSolarFX.utx PACKAGE=NWUltimaProtosVIII_SRC.UltimaSolarFX

#exec AUDIO IMPORT NAME="LightHoleTimeSnd" FILE=SOUNDS\LightHoleTimeSnd.wav GROUP="Solar"
#exec AUDIO IMPORT NAME="SolarBirthSnd" FILE=SOUNDS\SolarBirthSnd.wav GROUP="Solar"
#exec AUDIO IMPORT NAME="WhiteDwarfBirth" FILE=SOUNDS\WhiteDwarfBirth.wav GROUP="Solar"
#exec AUDIO IMPORT NAME="WhiteDwarfCollapse" FILE=SOUNDS\WhiteDwarfCollapse.wav GROUP="Solar"
#exec AUDIO IMPORT NAME="SuperNovaExpl" FILE=SOUNDS\SuperNovaExpl.wav GROUP="Solar"

#exec TEXTURE IMPORT NAME=BirthColdLava FILE=Effects\BirthColdLava.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BirthColdLavaOV FILE=Effects\BirthColdLavaOV.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=MatureHotLava FILE=Effects\MatureHotLava.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=MatureHotLavaOV FILE=Effects\MatureHotLavaOV.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=RedGiantLava FILE=Effects\RedGiantLava.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=RedGiantLavaOV FILE=Effects\RedGiantLavaOV.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=WhiteDwarfLava FILE=Effects\WhiteDwarfLava.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=WhiteDwarfLavaOV FILE=Effects\WhiteDwarfLavaOV.bmp GROUP=Effects FLAGS=2

var() float LightHoleTime, DarknessTime, BirthTime, MatureTime, SystemTime, RedGiantTime;
var() float WhiteDwarfTime, SuperNovaPrepTime, SuperNovaExplTime, SuperNovaTime, EndTime;
var() sound LightHoleSound, DarknessSound, BirthSound;
var() sound WhiteDwarfSound, SuperNovaPrepSound, SuperNovaExplSound;
var() float BirthZGravity, MatureZGravity, SystemZGravity, RedGiantZGravity;

var() bool bGameFinisher;
var() int SolarBirthCoreDmg, SolarMatureCoreDmg, SolarSystemCoreDmg, SolarRedGiantCoreDmg, SolarWhiteDwarfCoreDmg;
var() int SolarMatureRadialMaxDmg, SolarSystemRadialMaxDmg, SolarRedGiantRadialMaxDmg, SolarSuperNovaDmg;
var() float SolarMatureRadialDmgRadius, SolarSystemRadialDmgRadius, SolarRedGiantRadialDmgRadius;
var() float SolarCoreDmgRate, SolarRadialDmgRate, SolarSuperNovaDmgRate;
var() name SolarCoreDmgType, SolarRadialDmgType, SolarSuperNovaDmgType;
var float SlrCoreDmgCount, SlrRadDmgCount, SlrSNDmgCount;

enum SlState
{
	SOLAR_LightHole,
	SOLAR_Darkness,
	SOLAR_Birth,
	SOLAR_Mature,
	SOLAR_System,
	SOLAR_RedGiant,
	SOLAR_WhiteDwarf,
	SOLAR_SuperNovaPrep,
	SOLAR_SuperNovaExpl,
	SOLAR_SuperNova,
	SOLAR_End
};
var SlState SolarState;

struct zNfo
{
	var ZoneInfo ZI;
	var vector VFlash, VFog;
	var byte ABrightness, AHue, ASaturation;
	var vector ZGravity;
};
var zNfo ZInfo[64];

struct zNfoDeltaClient
{
	var() vector Flash, Fog;
	var() byte B, H, S;
	var() float TransTime;
	var() bool bDirDarkFlash;
};
var() zNfoDeltaClient ZInfoDeltaClient[10];
var() float ZInfoTransTimeEnd;
var() bool enableZInfoLightDelta;
var() bool enableGravityChange;

var PlayerPawn localPlayer;
var bool bAffectZones, isPhaseTransition;
var float tCount, ZInfoDeltaClientCount;

var() float NeblVariance;
var() float NeblInitSmkRate, NeblInitMinRadius, NeblInitMaxRadius;
var() int NeblInitMinAngRate, NeblInitMaxAngRate;
var() byte NeblInitSmkMinPoints, NeblInitSmkMaxPoints;
var() float NeblSmkRate, NeblMinRadius, NeblMaxRadius;
var() int NeblMinAngRate, NeblMaxAngRate;
var() byte NeblSmkMinPoints, NeblSmkMaxPoints;
var() float NeblResetInterval;
var vector NeblSpots[64];
var rotator NeblRotRate[64];
var float neblCount, nextNeblReset;
var byte neblSpotsAmount;

var() float PhaseTransitionTime;

//Birth properties section
//----------------------------------------------------------------
var() float MinBlueFlaresRate, MaxBlueFlaresRate;
var() int MinBlueFlares, MaxBlueFlares;
var() float MinBlueFlrScale, MaxBlueFlrScale;
var() float MinBlueFlrGlow, MaxBlueFlrGlow;
var() float MinBlueFlrSpeed, MaxBlueFlrSpeed;
var() float MinBlueLTime, MaxBlueLTime;
var float BlueFlrCount;

var() float BirthInitElectricTime;
var() float MinBirthInitElectricRate, MaxBirthInitElectricRate;
var() float MinBirthInitElectricSize, MaxBirthInitElectricSize;
var() float MinBirthInitElectricRadius, MaxBirthInitElectricRadius;
var() int MinInitBirthElectricSparks, MaxInitBirthElectricSparks;
var float BirthInitElecCount;

var() float MinBirthElectricRate, MaxBirthElectricRate;
var() float MinBirthElectricSize, MaxBirthElectricSize;
var() int MinBirthElectricSparks, MaxBirthElectricSparks;
var float BirthElecCount;

var() float MinBirthLightningRate, MaxBirthLightningRate;
var() int MinBirthLightnings, MaxBirthLightnings;
var float BirthLightnCount;

var() float MinBirthDebrisRate, MaxBirthDebrisRate;
var() float MinBirthDebrisChkRadius, MaxBirthDebrisChkRadius, MaxBirthDebrisChkHeight;
var() int MinBirthDebris, MaxBirthDebris;
var float BirthDebrisCount;
//----------------------------------------------------------------


//Mature properties section
//----------------------------------------------------------------
var() float MinYellowFlaresRate, MaxYellowFlaresRate;
var() int MinYellowFlares, MaxYellowFlares;
var() float MinYellowFlrScale, MaxYellowFlrScale;
var() float MinYellowFlrGlow, MaxYellowFlrGlow;
var() float MinYellowFlrSpeed, MaxYellowFlrSpeed;
var() float MinYellowLTime, MaxYellowLTime;
var float YellowFlrCount;

var() float MinMatureElectricRate, MaxMatureElectricRate;
var() float MinMatureElectricSize, MaxMatureElectricSize;
var() int MinMatureElectricSparks, MaxMatureElectricSparks;
var float MatureElecCount;

var() float MinMatureMagBlastsRate, MaxMatureMagBlastsRate;
var() float MinMatureMagBlastsSize, MaxMatureMagBlastsSize;
var() float MinMatureMagBlastsGlow, MaxMatureMagBlastsGlow;
var() float MinMatureMagBlastsSpeed, MaxMatureMagBlastsSpeed;
var() float MinMatureMagBlastsLTime, MaxMatureMagBlastsLTime;
var() int MinMatureMagBlasts, MaxMatureMagBlasts;
var float MatureMagBlastsCount;

var() float MinMatureDebrisRate, MaxMatureDebrisRate;
var() float MinMatureDebrisChkRadius, MaxMatureDebrisChkRadius, MaxMatureDebrisChkHeight;
var() int MinMatureDebris, MaxMatureDebris;
var float MatureDebrisCount;
//----------------------------------------------------------------


//System properties section
//----------------------------------------------------------------
var() float MinOrangeFlaresRate, MaxOrangeFlaresRate;
var() int MinOrangeFlares, MaxOrangeFlares;
var() float MinOrangeFlrScale, MaxOrangeFlrScale;
var() float MinOrangeFlrGlow, MaxOrangeFlrGlow;
var() float MinOrangeFlrSpeed, MaxOrangeFlrSpeed;
var() float MinOrangeLTime, MaxOrangeLTime;
var float OrangeFlrCount;

var() float MinSystemMagBlastsRate, MaxSystemMagBlastsRate;
var() float MinSystemMagBlastsSize, MaxSystemMagBlastsSize;
var() float MinSystemMagBlastsGlow, MaxSystemMagBlastsGlow;
var() float MinSystemMagBlastsSpeed, MaxSystemMagBlastsSpeed;
var() float MinSystemMagBlastsLTime, MaxSystemMagBlastsLTime;
var() int MinSystemMagBlasts, MaxSystemMagBlasts;
var float SystemMagBlastsCount;

var() float MinSystemDebrisRate, MaxSystemDebrisRate;
var() float MinSystemDebrisChkRadius, MaxSystemDebrisChkRadius, MaxSystemDebrisChkHeight;
var() int MinSystemDebris, MaxSystemDebris;
var float SystemDebrisCount;
//----------------------------------------------------------------


//Red Giant properties section
//----------------------------------------------------------------
var() float MinRedFlaresRate, MaxRedFlaresRate;
var() int MinRedFlares, MaxRedFlares;
var() float MinRedFlrScale, MaxRedFlrScale;
var() float MinRedFlrGlow, MaxRedFlrGlow;
var() float MinRedFlrSpeed, MaxRedFlrSpeed;
var() float MinRedLTime, MaxRedLTime;
var float RedFlrCount;

var() float MinRedGiantMagBlastsRate, MaxRedGiantMagBlastsRate;
var() float MinRedGiantMagBlastsSize, MaxRedGiantMagBlastsSize;
var() float MinRedGiantMagBlastsGlow, MaxRedGiantMagBlastsGlow;
var() float MinRedGiantMagBlastsSpeed, MaxRedGiantMagBlastsSpeed;
var() float MinRedGiantMagBlastsLTime, MaxRedGiantMagBlastsLTime;
var() int MinRedGiantMagBlasts, MaxRedGiantMagBlasts;
var float RedGiantMagBlastsCount;

var() float MinRedGiantElectricRate, MaxRedGiantElectricRate;
var() float MinRedGiantElectricSize, MaxRedGiantElectricSize;
var() int MinRedGiantElectricSparks, MaxRedGiantElectricSparks;
var float RedGiantElecCount;

var() float MinRedGiantDebrisRate, MaxRedGiantDebrisRate;
var() float MinRedGiantDebrisChkRadius, MaxRedGiantDebrisChkRadius, MaxRedGiantDebrisChkHeight;
var() int MinRedGiantDebris, MaxRedGiantDebris;
var float RedGiantDebrisCount;

var() float MinRedGiantLightningRate, MaxRedGiantLightningRate;
var() int MinRedGiantLightnings, MaxRedGiantLightnings;
var float RedGiantLightnCount;
//----------------------------------------------------------------

//White Dwarf properties section
//----------------------------------------------------------------
var() float MinWDFlaresRate, MaxWDFlaresRate;
var() int MinWDFlares, MaxWDFlares;
var() float MinWDFlrScale, MaxWDFlrScale;
var() float MinWDFlrGlow, MaxWDFlrGlow;
var() float MinWDFlrSpeed, MaxWDFlrSpeed;
var() float MinWDLTime, MaxWDLTime;
var float WDFlrCount;
//----------------------------------------------------------------

//Super Nova properties section
//----------------------------------------------------------------
var() float MinSNDebrisChkRadius, MaxSNDebrisChkRadius;
var() int MinSNDebris, MaxSNDebris;

var() float MinSNFlaresChkRadius, MaxSNFlaresChkRadius;
var() float MinSNFlaresScale, MaxSNFlaresScale;
var() float MinSNFlaresGlow, MaxSNFlaresGlow;
var() float MinSNFlaresSpeed, MaxSNFlaresSpeed;
var() float MinSNFlaresLTime, MaxSNFlaresLTime;
var() int MinSNFlares, MaxSNFlares;

var() int MaxSNSteamAttempts;
var() int MinSNSteamPoints, MaxSNSteamPoints;
var() float SNSteamRateStart, SNSteamRateEnd;
var() float MinSNSteamRadius, MaxSNSteamRadius;
var() float MinSNSteamScale, MaxSNSteamScale;
var() float MinSNSteamFloorNormalZ, MaxSNSteamHeightCheck;
var float SNSteamCount;
//----------------------------------------------------------------

//Aftermath properties section
//----------------------------------------------------------------
var() int MinAMSmkPoints, MaxAMSmkPoints;
var() float MinAMSmkRadius, MaxAMSmkRadius;
var() float MinAMSmkScale, MaxAMSmkScale;
var() float MinAMSmkGlow, MaxAMSmkGlow;
var() float MinAMSmkSpeed, MaxAMSmkSpeed;
//----------------------------------------------------------------


var() float BirthCloudsHeight;
struct USCloud
{
	var UltimaSolarBirthCloud WCloud, BCloud, ECloud;
};
var USCloud BElectricClouds1[7], BElectricClouds2[7];
var UltimaSolarBirthCloudMaster USBCMaster1, USBCMaster2;
var UltimaSolarSphere UBirthSph[3], UMatureSph[3], URedGiantSph[3], UWhiteDwarfSph[3];



function PreBeginPlay()
{
	bGameFinisher = Class'UltimaProtos'.default.OversurrectionGameFinisher;
	if (Class'UltimaProtos'.default.OversurrectionSolarBirthCoreDmg > 0)
		SolarBirthCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarBirthCoreDmg;
	if (Class'UltimaProtos'.default.OversurrectionSolarMatureCoreDmg > 0)
		SolarMatureCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarMatureCoreDmg;
	if (Class'UltimaProtos'.default.OversurrectionSolarSystemCoreDmg > 0)
		SolarSystemCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarSystemCoreDmg;
	if (Class'UltimaProtos'.default.OversurrectionSolarRedGiantCoreDmg > 0)
		SolarRedGiantCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarRedGiantCoreDmg;
	if (Class'UltimaProtos'.default.OversurrectionSolarWhiteDwarfCoreDmg > 0)
		SolarWhiteDwarfCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarWhiteDwarfCoreDmg;
		
	if (Class'UltimaProtos'.default.OversurrectionSolarMatureRadialMaxDmg > 0)
		SolarMatureRadialMaxDmg = Class'UltimaProtos'.default.OversurrectionSolarMatureRadialMaxDmg;
	if (Class'UltimaProtos'.default.OversurrectionSolarSystemRadialMaxDmg > 0)
		SolarSystemRadialMaxDmg = Class'UltimaProtos'.default.OversurrectionSolarSystemRadialMaxDmg;
	if (Class'UltimaProtos'.default.OversurrectionSolarRedGiantRadialMaxDmg > 0)
		SolarRedGiantRadialMaxDmg = Class'UltimaProtos'.default.OversurrectionSolarRedGiantRadialMaxDmg;
	if (Class'UltimaProtos'.default.OversurrectionSolarSuperNovaDmg > 0)
		SolarSuperNovaDmg = Class'UltimaProtos'.default.OversurrectionSolarSuperNovaDmg;
		
	if (Class'UltimaProtos'.default.OversurrectionSolarMatureRadialDmgRadius > 0.0)
		SolarMatureRadialDmgRadius = Class'UltimaProtos'.default.OversurrectionSolarMatureRadialDmgRadius;
	if (Class'UltimaProtos'.default.OversurrectionSolarSystemRadialDmgRadius > 0.0)
		SolarSystemRadialDmgRadius = Class'UltimaProtos'.default.OversurrectionSolarSystemRadialDmgRadius;
	if (Class'UltimaProtos'.default.OversurrectionSolarRedGiantRadialDmgRadius > 0.0)
		SolarRedGiantRadialDmgRadius = Class'UltimaProtos'.default.OversurrectionSolarRedGiantRadialDmgRadius;
	if (Class'UltimaProtos'.default.OversurrectionSolarCoreDmgRate > 0.0)
		SolarCoreDmgRate = Class'UltimaProtos'.default.OversurrectionSolarCoreDmgRate;
	if (Class'UltimaProtos'.default.OversurrectionSolarRadialDmgRate > 0.0)
		SolarRadialDmgRate = Class'UltimaProtos'.default.OversurrectionSolarRadialDmgRate;
	if (Class'UltimaProtos'.default.OversurrectionSolarSuperNovaDmgRate > 0.0)
		SolarSuperNovaDmgRate = Class'UltimaProtos'.default.OversurrectionSolarSuperNovaDmgRate;
	
	Super.PreBeginPlay();
}

simulated function PostBeginPlay()
{
	if (Role == ROLE_Authority)
		InitSolar();
	Super.PostBeginPlay();
}

simulated function PostNetBeginPlay()
{
	InitSolar();
}

simulated function InitSolar()
{
local PlayerPawn PP;
local UltimaSolarViewDistort USVD;

	saveDefaultZonesInfo();
	if (Level.NetMode != NM_DedicatedServer)
	{
		foreach AllActors(class'PlayerPawn', PP)
		{
			if (Viewport(PP.Player) != None)
			{
				localPlayer = PP;
				break;
			}
		}
		
		ZInfoDeltaClientCount = ZInfoDeltaClient[0].TransTime;
		initNeblSpots(True);
		Spawn(Class'UltimaSolarShaking');
		Spawn(Class'UltimaBlackHoleCor');
		Spawn(Class'UltimaSolarInitCor');
		Spawn(Class'UltimaSolarInitCorLight');
		Spawn(Class'UltimaSolarInitCorLine');
		Spawn(Class'UltimaSolarBlackHoleCorLight');
		Spawn(Class'UltimaSolarBlackHoleCorLine');
		USVD = Spawn(Class'UltimaSolarViewDistort');
		USVD.SolarOwner = Self;
	}
	
	DoUltraMegaSound(LightHoleSound);
	SetTimer(LightHoleTime, False);
}

simulated function saveDefaultZonesInfo()
{
local UltimaSolar US, firstUS;
local ZoneInfo ZN;
local byte i;

	ForEach AllActors(Class'UltimaSolar', US)
	{
		if (US != Self)
		{
			if (firstUS == None)
				firstUS = US;
			US.bAffectZones = False;
		}
	}
	
	if (firstUS != None)
	{
		for (i = 0; i < ArrayCount(ZInfo); i++)
			ZInfo[i] = firstUS.getZInfo(i);
	}
	else
	{
		i = 0;
		ForEach AllActors(Class'ZoneInfo', ZN)
		{
			ZInfo[i].ZI = ZN;
			ZInfo[i].VFlash = ZN.ViewFlash;
			ZInfo[i].VFog = ZN.ViewFog;
			ZInfo[i].ABrightness = ZN.AmbientBrightness;
			ZInfo[i].AHue = ZN.AmbientHue;
			ZInfo[i].ASaturation = ZN.AmbientSaturation;
			ZInfo[i].ZGravity = ZN.ZoneGravity;
			i++;
			if (i >= ArrayCount(ZInfo))
				break;
		}
	}
}

function setZonesGravity(vector newGravity)
{
local byte i;

	if (!bAffectZones)
		return;
	for (i = 0; i < ArrayCount(ZInfo); i++)
	{
		if (ZInfo[i].ZI != None)
			ZInfo[i].ZI.ZoneGravity = newGravity;
	}
}

function resetZonesGravity()
{
local byte i;

	if (!bAffectZones)
		return;
	for (i = 0; i < ArrayCount(ZInfo); i++)
	{
		if (ZInfo[i].ZI != None)
			ZInfo[i].ZI.ZoneGravity = ZInfo[i].ZGravity;
	}
}

simulated function zNfo getZInfo(byte i)
{
local zNfo zN;

	if (i >= ArrayCount(ZInfo))
		return zN;
	return ZInfo[i];
}

function DoSound(sound Snd)
{
	if (Snd != None)
		PlaySound(Snd,, 100,, 60000);
}

function DoMegaSound(sound Snd)
{
	if (Snd != None)
	{
		PlaySound(Snd, SLOT_None, 100, True, 60000);
		PlaySound(Snd, SLOT_Misc, 100, True, 60000);
	}
}

function DoUltraMegaSound(sound Snd)
{
	if (Snd != None)
	{
		PlaySound(Snd, SLOT_None, 100.0,, 60000);
		PlaySound(Snd, SLOT_Interface,100.0,, 60000);
		PlaySound(Snd, SLOT_Misc, 100.0,, 60000);
		PlaySound(Snd, SLOT_Talk, 100.0,, 60000);
	}
}


simulated function Timer()
{
	if (SolarState == SOLAR_LightHole)
	{
		SolarState = SOLAR_Darkness;
		DoUltraMegaSound(DarknessSound);
		SetTimer(DarknessTime, False);
	}
	else if (SolarState == SOLAR_Darkness)
	{
		SolarState = SOLAR_Birth;
		DoUltraMegaSound(BirthSound);
		SetTimer(BirthTime - PhaseTransitionTime, False);
		setZonesGravity(BirthZGravity*vect(0,0,-1));
		if (Level.NetMode != NM_DedicatedServer)
		{
			Spawn(Class'UltimaSolarAmbSoundElectro');
			SpawnBirthElectricClouds();
			SpawnBirthSolar();
		}
	}
	else if (SolarState == SOLAR_Birth)
	{
		if (!isPhaseTransition)
		{
			isPhaseTransition = True;
			SetTimer(PhaseTransitionTime, False);
			if (Level.NetMode != NM_DedicatedServer)
				SpawnMatureSolar();
		}
		else
		{
			isPhaseTransition = False;
			SolarState = SOLAR_Mature;
			SetTimer(MatureTime - PhaseTransitionTime, False);
			setZonesGravity(MatureZGravity*vect(0,0,-1));
			if (Level.NetMode != NM_DedicatedServer)
				initNeblSpots();
		}
	}
	else if (SolarState == SOLAR_Mature)
	{
		if (!isPhaseTransition)
		{
			isPhaseTransition = True;
			SetTimer(PhaseTransitionTime, False);
			if (Level.NetMode != NM_DedicatedServer)
				SpawnSystemSolar();
		}
		else
		{
			isPhaseTransition = False;
			SolarState = SOLAR_System;
			SetTimer(SystemTime - PhaseTransitionTime, False);
			setZonesGravity(SystemZGravity*vect(0,0,-1));
		}
	}
	else if (SolarState == SOLAR_System)
	{
		if (!isPhaseTransition)
		{
			isPhaseTransition = True;
			SetTimer(PhaseTransitionTime, False);
			if (Level.NetMode != NM_DedicatedServer)
				SpawnRedGiantSolar();
		}
		else
		{
			isPhaseTransition = False;
			SolarState = SOLAR_RedGiant;
			SetTimer(RedGiantTime, False);
			setZonesGravity(RedGiantZGravity*vect(0,0,-1));
		}
	}
	else if (SolarState == SOLAR_RedGiant)
	{
		if (!isPhaseTransition)
		{
			isPhaseTransition = True;
			SetTimer(PhaseTransitionTime, False);
			if (Level.NetMode != NM_DedicatedServer)
				SpawnWhiteDwarfSolar();
			DoUltraMegaSound(WhiteDwarfSound);
		}
		else
		{
			isPhaseTransition = False;
			SolarState = SOLAR_WhiteDwarf;
			SetTimer(WhiteDwarfTime, False);
		}
	}
	else if (SolarState == SOLAR_WhiteDwarf)
	{
		if (!isPhaseTransition)
		{
			isPhaseTransition = True;
			SetTimer(PhaseTransitionTime, False);
			DoMegaSound(SuperNovaPrepSound);
		}
		else
		{
			isPhaseTransition = False;
			SolarState = SOLAR_SuperNovaPrep;
			SetTimer(SuperNovaPrepTime, False);
		}
	}
	else if (SolarState == SOLAR_SuperNovaPrep)
	{
		SolarState = SOLAR_SuperNovaExpl;
		DoUltraMegaSound(SuperNovaExplSound);
		SetTimer(SuperNovaExplTime, False);
		if (Level.NetMode != NM_DedicatedServer)
			SpawnSuperNovaExpl();
	}
	else if (SolarState == SOLAR_SuperNovaExpl)
	{
		SolarState = SOLAR_SuperNova;
		SetTimer(SuperNovaTime, False);
	}
	else if (SolarState == SOLAR_SuperNova)
	{
		SolarState = SOLAR_End;
		SetTimer(EndTime, False);
		resetZonesGravity();
		if (bGameFinisher)
			AttemptFinishGame();
		if (Level.NetMode != NM_DedicatedServer)
			SpawnSolarAftermath();
	}
	else if (SolarState == SOLAR_End)
	{
		Destroy();
		return;
	}
	
	if (SolarState < SOLAR_End)
		ZInfoDeltaClientCount = ZInfoDeltaClient[SolarState].TransTime;
	else
		ZInfoDeltaClientCount = ZInfoTransTimeEnd;
	if (!isPhaseTransition)
		tCount = 0.0;
}

function AttemptFinishGame()
{
	if (Instigator == None || Instigator.PlayerReplicationInfo == None || Level.Game == None || Level.Game.bGameEnded)
		return;
	if (Level.Game.IsA('MonsterHunt'))
		Level.Game.EndGame("Hunt Successfull!");
	else if (Assault(Level.Game) != None)
	{
		if (Instigator.PlayerReplicationInfo.TeamID == Assault(Level.Game).Attacker.TeamIndex)
		{
			Assault(Level.Game).bAssaultWon = True;
			Level.Game.EndGame("Assault succeeded!");
		}
		else
			Assault(Level.Game).RemainingTime = 1;
	}
	else if (TeamGamePlus(Level.Game) != None)
	{
		TeamGamePlus(Level.Game).Teams[Instigator.PlayerReplicationInfo.Team].Score = TeamGamePlus(Level.Game).GoalTeamScore;
		Level.Game.EndGame("teamscorelimit");
	}
	else if (DeathMatchPlus(Level.Game) != None)
	{
		Instigator.PlayerReplicationInfo.Score = DeathMatchPlus(Level.Game).FragLimit;
		Level.Game.EndGame("fraglimit");
	}
}

simulated function Tick(float Delta)
{
local float f;

	tCount += Delta;
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (bAffectZones && (ZInfoDeltaClientCount > 0.0 || (SolarState < SOLAR_End && ZInfoDeltaClient[SolarState].bDirDarkFlash && localPlayer != None)))
		{
			ZInfoDeltaClientCount -= Delta;
			if (ZInfoDeltaClientCount < 0.0)
				ZInfoDeltaClientCount = 0.0;
			handleZoneDelta();
		}
		
		if (SolarState == SOLAR_LightHole)
			updateNeblSmk(Delta, True);
		else
		{
			if (SolarState == SOLAR_Birth)
				updateBirthPhase(Delta, tCount >= (BirthTime - PhaseTransitionTime));
			if (SolarState == SOLAR_Mature || (SolarState == SOLAR_Birth && tCount >= (BirthTime - PhaseTransitionTime)))
				updateMaturePhase(Delta, SolarState == SOLAR_Mature && tCount >= (MatureTime - PhaseTransitionTime), 
					SolarState == SOLAR_Birth && tCount >= (BirthTime - PhaseTransitionTime));
			if (SolarState == SOLAR_System || (SolarState == SOLAR_Mature && tCount >= (MatureTime - PhaseTransitionTime)))
				updateSystemPhase(Delta, SolarState == SOLAR_System && tCount >= (SystemTime - PhaseTransitionTime), 
					SolarState == SOLAR_Mature && tCount >= (MatureTime - PhaseTransitionTime));
			if (SolarState == SOLAR_RedGiant || (SolarState == SOLAR_System && tCount >= (SystemTime - PhaseTransitionTime)))
				updateRedGiantPhase(Delta, SolarState == SOLAR_RedGiant && tCount >= (RedGiantTime - PhaseTransitionTime), 
					SolarState == SOLAR_System && tCount >= (SystemTime - PhaseTransitionTime));
			if (SolarState == SOLAR_WhiteDwarf || (SolarState == SOLAR_RedGiant && tCount >= (RedGiantTime - PhaseTransitionTime)))
				updateWhiteDwarfPhase(Delta, SolarState == SOLAR_WhiteDwarf && tCount >= (WhiteDwarfTime - PhaseTransitionTime), 
					SolarState == SOLAR_RedGiant && tCount >= (RedGiantTime - PhaseTransitionTime));
			if (SolarState == SOLAR_SuperNovaPrep || (SolarState == SOLAR_WhiteDwarf && tCount >= (WhiteDwarfTime - PhaseTransitionTime)))
				updateSuperNovaPrepPhase(Delta, SolarState == SOLAR_SuperNovaPrep && tCount >= (SuperNovaPrepTime - PhaseTransitionTime), 
					SolarState == SOLAR_WhiteDwarf && tCount >= (WhiteDwarfTime - PhaseTransitionTime));
		}
	}
	
	if (Role == ROLE_Authority)
	{
		if (SolarCoreDmgRate >= 0 && SolarState >= SOLAR_Birth && SolarState <= SOLAR_WhiteDwarf)
		{
			SlrCoreDmgCount += Delta;
			if (SlrCoreDmgCount > (1/SolarCoreDmgRate))
			{
				SlrCoreDmgCount = 0.0;
				if (SolarState == SOLAR_Birth)
				{
					f = ((((tCount + PhaseTransitionTime)/(BirthTime + PhaseTransitionTime))*5.9) + 0.5)*Class'UltimaSolarSphere'.default.SphereBaseRadius;
					ProcessRadialDamage(SolarBirthCoreDmg, f, SolarCoreDmgType, True);
				}
				else if (SolarState == SOLAR_Mature)
				{
					f = ((((tCount + PhaseTransitionTime)/(MatureTime + SystemTime + PhaseTransitionTime))*12.2) + 3.8)*Class'UltimaSolarSphere'.default.SphereBaseRadius;
					ProcessRadialDamage(SolarMatureCoreDmg, f, SolarCoreDmgType, True);
				}
				else if (SolarState == SOLAR_System)
				{
					f = ((((tCount + PhaseTransitionTime + MatureTime)/(MatureTime + SystemTime + PhaseTransitionTime))*12.2) + 3.8)*Class'UltimaSolarSphere'.default.SphereBaseRadius;
					ProcessRadialDamage(SolarSystemCoreDmg, f, SolarCoreDmgType, True);
				}
				else if (SolarState == SOLAR_RedGiant)
				{
					f = ((((tCount + PhaseTransitionTime)/(RedGiantTime + PhaseTransitionTime*2))*10.5) + 13.5)*Class'UltimaSolarSphere'.default.SphereBaseRadius;
					ProcessRadialDamage(SolarRedGiantCoreDmg, f, SolarCoreDmgType, True);
				}
				else if (SolarState == SOLAR_WhiteDwarf)
				{
					f = ((((tCount + PhaseTransitionTime)/(WhiteDwarfTime + SuperNovaPrepTime + PhaseTransitionTime*2))*-6.9) + 7.0)*Class'UltimaSolarSphere'.default.SphereBaseRadius;
					ProcessRadialDamage(SolarWhiteDwarfCoreDmg, f, SolarCoreDmgType, True);
				}
			}
		}
		
		if (SolarRadialDmgRate >= 0 && SolarState >= SOLAR_Mature && SolarState <= SOLAR_RedGiant)
		{
			SlrRadDmgCount += Delta;
			if (SlrRadDmgCount > (1/SolarRadialDmgRate))
			{
				SlrRadDmgCount = 0.0;
				if (SolarState == SOLAR_Mature)
					ProcessRadialDamage(SolarMatureRadialMaxDmg, SolarMatureRadialDmgRadius, SolarRadialDmgType);
				else if (SolarState == SOLAR_System)
					ProcessRadialDamage(SolarSystemRadialMaxDmg, SolarSystemRadialDmgRadius, SolarRadialDmgType);
				else if (SolarState == SOLAR_RedGiant)
					ProcessRadialDamage(SolarRedGiantRadialMaxDmg, SolarRedGiantRadialDmgRadius, SolarRadialDmgType);
			}
		}
		
		if (SolarSuperNovaDmgRate >= 0 && SolarState == SOLAR_SuperNova)
		{
			SlrSNDmgCount += Delta;
			if (SlrSNDmgCount > (1/SolarSuperNovaDmgRate))
			{
				SlrSNDmgCount = 0.0;
				ProcessRadialDamage(SolarSuperNovaDmg, 100000.f, SolarSuperNovaDmgType, True);
			}
		}
	}
}

function ProcessRadialDamage(int dmg, float radius, name dmgType, optional bool bDirectSolDmg)
{
local Actor A;
local float f;
local UltimaSolarDmgExpl USDE;

	if (dmg <= 0 || radius <= 0.0 || dmgType == '')
		return;
		
	f = 1.0;
	ForEach RadiusActors(Class'Actor', A, radius)
	{
		if (!A.bStatic && (Pawn(A) == None || (isValidPawn(Pawn(A)) && !isFriendlyPawn(Pawn(A)))) && (bDirectSolDmg || FastTrace(A.Location, Location)))
		{
			if (!bDirectSolDmg)
				f = (1.0 - VSize(Location - A.Location)/radius);
			A.TakeDamage(int(f*dmg), Instigator, A.Location, vect(0,0,0), dmgType);
			if (Pawn(A) != None)
			{
				USDE = Spawn(Class'UltimaSolarDmgExpl',,, A.Location);
				USDE.SetScale(FMax(A.CollisionRadius, A.CollisionHeight)*10.f);
			}
		}
	}
}

function bool isValidPawn(Pawn P)
{
	return (P != None && !P.bDeleteMe && P.Health > 0 && !P.bHidden && P.bCollideActors && P.bBlockActors);
}

function bool isFriendlyPawn(Pawn P)
{
	return Class'NWUtils'.static.isFriend(P, Level, Instigator,, True, True);
}

simulated function updateBirthPhase(float Delta, optional bool isTransiFrom, optional bool isTransiTo)
{
	nextNeblReset += Delta;
	if (nextNeblReset >= NeblResetInterval)
	{
		nextNeblReset = 0.0;
		initNeblSpots();
	}
	updateNeblSmk(Delta);
	
	BlueFlrCount -= Delta;
	if (BlueFlrCount <= 0.0)
	{
		BlueFlrCount = (1.f/RandRange(MinBlueFlaresRate, MaxBlueFlaresRate));
		spawnBlueFlares();
	}
	
	BirthElecCount -= Delta;
	if (BirthElecCount <= 0.0)
	{
		BirthElecCount = (1.f/RandRange(MinBirthElectricRate, MaxBirthElectricRate));
		spawnBirthElectricActivity();
	}
	
	BirthLightnCount -= Delta;
	if (BirthLightnCount <= 0.0)
	{
		BirthLightnCount = (1.f/RandRange(MinBirthLightningRate, MaxBirthLightningRate));
		spawnBirthLightnings();
	}
	
	if (tCount < BirthInitElectricTime)
	{
		BirthInitElecCount -= Delta;
		if (BirthInitElecCount <= 0.0)
		{
			BirthInitElecCount = (1.f/RandRange(MinBirthInitElectricRate, MaxBirthInitElectricRate));
			spawnBirthElectricInit((BirthInitElectricTime - tCount) / BirthInitElectricTime);
		}
	}
	
	BirthDebrisCount -= Delta;
	if (BirthDebrisCount <= 0.0)
	{
		BirthDebrisCount = (1.f/RandRange(MinBirthDebrisRate, MaxBirthDebrisRate));
		SpawnOrbitalFragDebris(Class'UltimaSolOrbWallFrag', int(RandRange(MinBirthDebris, MaxBirthDebris)), 
			MinBirthDebrisChkRadius, MaxBirthDebrisChkRadius, MaxBirthDebrisChkHeight, MaxBirthDebrisChkHeight, True, True);
	}
}

simulated function updateMaturePhase(float Delta, optional bool isTransiFrom, optional bool isTransiTo)
{
	YellowFlrCount -= Delta;
	if (YellowFlrCount <= 0.0)
	{
		YellowFlrCount = (1.f/RandRange(MinYellowFlaresRate, MaxYellowFlaresRate));
		if (isTransiTo)
			YellowFlrCount *= 3.f;
		spawnYellowFlares();
	}
	
	MatureElecCount -= Delta;
	if (MatureElecCount <= 0.0)
	{
		MatureElecCount = (1.f/RandRange(MinMatureElectricRate, MaxMatureElectricRate));
		spawnMatureElectricActivity();
	}
	
	MatureMagBlastsCount -= Delta;
	if (MatureMagBlastsCount <= 0.0)
	{
		MatureMagBlastsCount = (1.f/RandRange(MinMatureMagBlastsRate, MaxMatureMagBlastsRate));
		spawnMatureMagBlastsActivity();
	}
	
	MatureDebrisCount -= Delta;
	if (MatureDebrisCount <= 0.0)
	{
		MatureDebrisCount = (1.f/RandRange(MinMatureDebrisRate, MaxMatureDebrisRate));
		SpawnOrbitalFragDebris(Class'UltimaSolOrbWallFragMT', int(RandRange(MinMatureDebris, MaxMatureDebris)), 
			MinMatureDebrisChkRadius, MaxMatureDebrisChkRadius, MaxMatureDebrisChkHeight, MaxMatureDebrisChkHeight, True, True);
	}
}

simulated function updateSystemPhase(float Delta, optional bool isTransiFrom, optional bool isTransiTo)
{
	OrangeFlrCount -= Delta;
	if (OrangeFlrCount <= 0.0)
	{
		OrangeFlrCount = (1.f/RandRange(MinOrangeFlaresRate, MaxOrangeFlaresRate));
		if (isTransiTo)
			OrangeFlrCount *= 3.f;
		spawnOrangeFlares();
	}
	
	SystemMagBlastsCount -= Delta;
	if (SystemMagBlastsCount <= 0.0)
	{
		SystemMagBlastsCount = (1.f/RandRange(MinSystemMagBlastsRate, MaxSystemMagBlastsRate));
		spawnSystemMagBlastsActivity();
	}
	
	SystemDebrisCount -= Delta;
	if (SystemDebrisCount <= 0.0)
	{
		SystemDebrisCount = (1.f/RandRange(MinSystemDebrisRate, MaxSystemDebrisRate));
		SpawnOrbitalFragDebris(Class'UltimaSolOrbWallFragSM', int(RandRange(MinSystemDebris, MaxSystemDebris)), 
			MinSystemDebrisChkRadius, MaxSystemDebrisChkRadius, MaxSystemDebrisChkHeight, MaxSystemDebrisChkHeight, True, True);
	}
}

simulated function updateRedGiantPhase(float Delta, optional bool isTransiFrom, optional bool isTransiTo)
{
	RedFlrCount -= Delta;
	if (RedFlrCount <= 0.0)
	{
		RedFlrCount = (1.f/RandRange(MinRedFlaresRate, MaxRedFlaresRate));
		if (isTransiTo || isTransiFrom)
			RedFlrCount *= 3.f;
		spawnRedFlares();
	}
	
	RedGiantMagBlastsCount -= Delta;
	if (RedGiantMagBlastsCount <= 0.0)
	{
		RedGiantMagBlastsCount = (1.f/RandRange(MinRedGiantMagBlastsRate, MaxRedGiantMagBlastsRate));
		spawnRedGiantMagBlastsActivity(isTransiFrom);
	}
	
	RedGiantElecCount -= Delta;
	if (RedGiantElecCount <= 0.0)
	{
		RedGiantElecCount = (1.f/RandRange(MinRedGiantElectricRate, MaxRedGiantElectricRate));
		spawnRedGiantElectricActivity();
	}
	
	RedGiantDebrisCount -= Delta;
	if (RedGiantDebrisCount <= 0.0)
	{
		RedGiantDebrisCount = (1.f/RandRange(MinRedGiantDebrisRate, MaxRedGiantDebrisRate));
		SpawnOrbitalFragDebris(Class'UltimaSolOrbWallFragRG', int(RandRange(MinRedGiantDebris, MaxRedGiantDebris)), 
			MinRedGiantDebrisChkRadius, MaxRedGiantDebrisChkRadius, MaxRedGiantDebrisChkHeight, MaxRedGiantDebrisChkHeight, True, True);
	}
	
	/*RedGiantLightnCount -= Delta;
	if (RedGiantLightnCount <= 0.0)
	{
		RedGiantLightnCount = (1.f/RandRange(MinRedGiantLightningRate, MaxRedGiantLightningRate));
		if (isTransiTo)
			spawnRedGiantLightnings((tCount - (SystemTime - PhaseTransitionTime))/PhaseTransitionTime);
		else
			spawnRedGiantLightnings(1.f);
	}*/
}

simulated function updateWhiteDwarfPhase(float Delta, optional bool isTransiFrom, optional bool isTransiTo)
{
	WDFlrCount -= Delta;
	if (WDFlrCount <= 0.0)
	{
		WDFlrCount = (1.f/RandRange(MinWDFlaresRate, MaxWDFlaresRate));
		spawnWDFlares();
	}
}

simulated function updateSuperNovaPrepPhase(float Delta, optional bool isTransiFrom, optional bool isTransiTo)
{
	WDFlrCount -= Delta;
	if (WDFlrCount <= 0.0)
	{
		WDFlrCount = (1.f/RandRange(MinWDFlaresRate, MaxWDFlaresRate));
		spawnWDFlares();
	}
	
	if (!isTransiTo)
	{
		SNSteamCount += Delta;
		if (SNSteamCount >= 1/((tCount/SuperNovaPrepTime) * (SNSteamRateEnd - SNSteamRateStart) + SNSteamRateStart))
		{
			SNSteamCount = 0.0;
			spawnSNSteamSpots();
		}
	}
}

simulated function spawnSNSteamSpots()
{
local int i, n, spawnedN;
local vector loc, HLoc, HNorm;
local Actor A;
local UltimaSolSteamSrc USSS;

	n = int(RandRange(MinSNSteamPoints, MaxSNSteamPoints));
	for (i = 0; spawnedN < n && i < MaxSNSteamAttempts; i++)
	{
		loc = Location + VRand()*RandRange(MinSNSteamRadius, MaxSNSteamRadius);
		if (FastTrace(loc, loc + vect(0,0,1)))
		{
			A = Trace(HLoc, HNorm, loc - MaxSNSteamHeightCheck*vect(0,0,1), loc, False);
			if (A != None && HNorm.Z >= MinSNSteamFloorNormalZ)
			{
				USSS = Spawn(Class'UltimaSolSteamSrc',,, HLoc + HNorm, rotator(HNorm));
				USSS.initSteam(RandRange(MinSNSteamScale, MaxSNSteamScale));
				spawnedN++;
			}
		}
	}
}


simulated function handleZoneDelta()
{
local byte i;
local float ziTTime, f, fFlash;
local vector prevFlash, prevFog, nextFlash, nextFog;
local byte prevB, prevH, prevS, nextB, nextH, nextS;
local vector camLoc;
local rotator camRot;
local Actor camActor;

	if (SolarState < SOLAR_End)
		ziTTime = ZInfoDeltaClient[SolarState].TransTime;
	else
		ziTTime = ZInfoTransTimeEnd;
	f = 1.f - (ZInfoDeltaClientCount/ziTTime);
	fFlash = 1.f;
	if (SolarState < SOLAR_End && ZInfoDeltaClient[SolarState].bDirDarkFlash && localPlayer != None)
	{
		localPlayer.PlayerCalcView(camActor, camLoc, camRot);
		fFlash = FMin(FMax(1.f - (vector(camRot) dot Normal(Location - camLoc)), 0.0), 1.0);
	}

	for (i = 0; i < ArrayCount(ZInfo); i++)
	{
		if (ZInfo[i].ZI == None)
			return;
		
		if (SolarState == SOLAR_LightHole)
		{
			prevFlash = ZInfo[i].VFlash;
			prevFog = ZInfo[i].VFog;
			prevB = ZInfo[i].ABrightness;
			prevH = ZInfo[i].AHue;
			prevS = ZInfo[i].ASaturation;
		}
		else
		{
			
			prevFlash = ZInfoDeltaClient[SolarState-1].Flash;
			prevFog = ZInfoDeltaClient[SolarState-1].Fog;
			prevB = ZInfoDeltaClient[SolarState-1].B;
			prevH = ZInfoDeltaClient[SolarState-1].H;
			prevS = ZInfoDeltaClient[SolarState-1].S;
		}
		
		if (SolarState == SOLAR_End)
		{
			nextFlash = ZInfo[i].VFlash;
			nextFog = ZInfo[i].VFog;
			nextB = ZInfo[i].ABrightness;
			nextH = ZInfo[i].AHue;
			nextS = ZInfo[i].ASaturation;
		}
		else
		{
			
			nextFlash = ZInfoDeltaClient[SolarState].Flash;
			nextFog = ZInfoDeltaClient[SolarState].Fog;
			nextB = ZInfoDeltaClient[SolarState].B;
			nextH = ZInfoDeltaClient[SolarState].H;
			nextS = ZInfoDeltaClient[SolarState].S;
		}
		
		ZInfo[i].ZI.ViewFlash = fFlash * (f*(nextFlash - prevFlash) + prevFlash);
		ZInfo[i].ZI.ViewFog = f*(nextFog - prevFog) + prevFog;
		if (enableZInfoLightDelta)
		{
			ZInfo[i].ZI.AmbientBrightness = Byte(f*(nextB - prevB) + prevB);
			ZInfo[i].ZI.AmbientHue = Byte(f*(nextH - prevH) + prevH);
			ZInfo[i].ZI.AmbientSaturation = Byte(f*(nextS - prevS) + prevS);
		}
	}
}

simulated function checkPlayerFlush()
{
	if (localPlayer != None)
		localPlayer.ConsoleCommand("flush");
}

simulated function initNeblSpots(optional bool bInit)
{
local byte i;
local float fr;
local vector HitLoc, HitNorm, nDir;
local Actor A;
local int minRotAng, maxRotAng, tries;

	if (bInit)
	{
		neblSpotsAmount = Byte(RandRange(NeblInitSmkMinPoints, NeblInitSmkMaxPoints));
		minRotAng = NeblInitMinAngRate;
		maxRotAng = NeblInitMaxAngRate;
	}
	else
	{
		neblSpotsAmount = Byte(RandRange(NeblSmkMinPoints, NeblSmkMaxPoints));
		minRotAng = NeblMinAngRate;
		maxRotAng = NeblMaxAngRate;
	}
	neblSpotsAmount = Byte(Min(ArrayCount(NeblSpots), neblSpotsAmount));
	
	for (i = 0; i < neblSpotsAmount; i++)
	{
		if (bInit)
			fr = RandRange(NeblInitMinRadius, NeblInitMaxRadius);
		else
			fr = RandRange(NeblMinRadius, NeblMaxRadius);
		
		tries = 35;
		do
		{
			NeblSpots[i] = Location + VRand()*fr;
			tries--;
		}
		until (tries <= 0 || i == 0 || (Normal(NeblSpots[i] - Location) dot Normal(NeblSpots[i-1] - Location)) < 0.15)
		
		A = Trace(HitLoc, HitNorm, NeblSpots[i], Location, False);
		if (A != None)
			NeblSpots[i] = HitLoc + HitNorm*16;
			
		NeblRotRate[i].Yaw = int(RandRange(minRotAng, maxRotAng));
		NeblRotRate[i].Pitch = int(RandRange(minRotAng, maxRotAng));
	}
}

simulated function updateNeblSmk(float Delta, optional bool bInit)
{
local byte i;
local float neblSMTime, neblLARadius, nLSpanVar, nFadeInVar, nFadeOutVar;
local UltimaSolarNeblSmkW uSolarSmk;

	if (bInit)
	{
		neblSMTime = 1/NeblInitSmkRate;
		neblLARadius = NeblInitMaxRadius;
	}
	else
	{
		neblSMTime = 1/NeblSmkRate;
		neblLARadius = NeblMaxRadius;
	}

	neblCount += Delta;
	if (neblCount < neblSMTime)
		return;
	neblCount -= neblSMTime;
	
	for (i = 0; i < neblSpotsAmount; i++)
	{
		nLSpanVar = getRandVariance(NeblVariance);
		nFadeInVar = getRandVariance(NeblVariance);
		nFadeOutVar = getRandVariance(NeblVariance);
	
		uSolarSmk = Spawn(Class'UltimaSolarNeblSmkW',,, NeblSpots[i]);
		if (uSolarSmk != None)
		{
			uSolarSmk.setLocAssimilation(Location, neblLARadius, NeblRotRate[i]);
			uSolarSmk.setLifeVariance(nLSpanVar, nFadeInVar, nFadeOutVar);
		}
		
		uSolarSmk = Spawn(Class'UltimaSolarNeblSmkB',,, NeblSpots[i]);
		if (uSolarSmk != None)
		{
			uSolarSmk.setLocAssimilation(Location, neblLARadius, NeblRotRate[i]);
			uSolarSmk.setLifeVariance(nLSpanVar, nFadeInVar, nFadeOutVar);
		}
	}
}

simulated function spawnFlares(class<UltimaSolarBirthSolarFlr> USBSFlrClass, UltimaSolarSphere USS, int minFlrs, int maxFlrs, float minFlrScale, 
float maxFlrScale, float minFlrGlow, float maxFlrGlow, float minFlrSpeed, float maxFlrSpeed, float minFlrLTime, float maxFlrLTime)
{
local UltimaSolarBirthSolarFlr USBSFlr;
local int blFlares, i;
local float dSclS, dSclE, glow;
local vector spPoint, spVel;

	blFlares = int(RandRange(minFlrs, maxFlrs));
	for (i = 0; i < blFlares; i++)
	{
		dSclS = RandRange(minFlrScale, maxFlrScale);
		dSclE = RandRange(minFlrScale, maxFlrScale);
		glow = RandRange(minFlrGlow, maxFlrGlow);
		spPoint = Location + USS.getRandomSurfaceLoc();
		spVel = Normal(spPoint - Location);
		spPoint -= (spVel * USBSFlrClass.default.Texture.USize * dSclS / 4);
		if ((Normal(spPoint - Location) dot spVel) < 0)
			spPoint = Location;
		spVel *= RandRange(minFlrSpeed, maxFlrSpeed);
		
		USBSFlr = Spawn(USBSFlrClass,,, spPoint);
		if (USBSFlr != None)
			USBSFlr.initFlare(RandRange(minFlrLTime, maxFlrLTime), spVel, dSclS, dSclE, glow);
	}
}

simulated function spawnBlueFlares()
{
	if (UBirthSph[0] != None && !UBirthSph[0].bDeleteMe)
		spawnFlares(Class'UltimaSolarBirthSolarFlr', UBirthSph[0], MinBlueFlares, MaxBlueFlares, MinBlueFlrScale, MaxBlueFlrScale, MinBlueFlrGlow, 
			MaxBlueFlrGlow, MinBlueFlrSpeed, MaxBlueFlrSpeed, MinBlueLTime, MaxBlueLTime);
}

simulated function spawnYellowFlares()
{
	if (UMatureSph[0] != None && !UMatureSph[0].bDeleteMe)
		spawnFlares(Class'UltimaSolarMatureSolarFlr', UMatureSph[0], MinYellowFlares, MaxYellowFlares, MinYellowFlrScale, MaxYellowFlrScale, MinYellowFlrGlow, 
			MaxYellowFlrGlow, MinYellowFlrSpeed, MaxYellowFlrSpeed, MinYellowLTime, MaxYellowLTime);
}

simulated function spawnOrangeFlares()
{
	if (UMatureSph[0] != None && !UMatureSph[0].bDeleteMe)
		spawnFlares(Class'UltimaSolarSystemSolarFlr', UMatureSph[0], MinOrangeFlares, MaxOrangeFlares, MinOrangeFlrScale, MaxOrangeFlrScale, MinOrangeFlrGlow, 
			MaxOrangeFlrGlow, MinOrangeFlrSpeed, MaxOrangeFlrSpeed, MinOrangeLTime, MaxOrangeLTime);
}

simulated function spawnRedFlares()
{
	if (URedGiantSph[0] != None && !URedGiantSph[0].bDeleteMe)
		spawnFlares(Class'UltimaSolarRedGiantSolarFlr', URedGiantSph[0], MinRedFlares, MaxRedFlares, MinRedFlrScale, MaxRedFlrScale, MinRedFlrGlow, 
			MaxRedFlrGlow, MinRedFlrSpeed, MaxRedFlrSpeed, MinRedLTime, MaxRedLTime);
}

simulated function spawnWDFlares()
{
	if (UWhiteDwarfSph[0] != None && !UWhiteDwarfSph[0].bDeleteMe)
		spawnFlares(Class'UltimaSolarBirthSolarFlr', UWhiteDwarfSph[0], MinWDFlares, MaxWDFlares, MinWDFlrScale, MaxWDFlrScale, MinWDFlrGlow, 
			MaxWDFlrGlow, MinWDFlrSpeed, MaxWDFlrSpeed, MinWDLTime, MaxWDLTime);
}


simulated function spawnElectricActivity(class<UltimaSolarNeblSmkE> USNSeClass, UltimaSolarSphere USS, int minESparks, int maxESparks, float minESize, float maxESize)
{
local UltimaSolarNeblSmkE USNSe;
local int neblN, i;

	neblN = int(RandRange(minESparks, maxESparks));
	for (i = 0; i < neblN; i++)
	{		
		USNSe = Spawn(USNSeClass,,, Location + USS.getRandomSurfaceLoc());
		if (USNSe != None)
			USNSe.DrawScale = RandRange(minESize, maxESize);
	}
}

simulated function spawnBirthElectricActivity()
{
	if (UBirthSph[0] != None && !UBirthSph[0].bDeleteMe)
		spawnElectricActivity(Class'UltimaSolarNeblSmkE', UBirthSph[0], MinBirthElectricSparks, MaxBirthElectricSparks, MinBirthElectricSize, MaxBirthElectricSize);
}

simulated function spawnMatureElectricActivity()
{
	if (UMatureSph[0] != None && !UMatureSph[0].bDeleteMe)
		spawnElectricActivity(Class'UltimaSolarNeblSmkE', UMatureSph[0], MinMatureElectricSparks, MaxMatureElectricSparks, MinMatureElectricSize, MaxMatureElectricSize);
}

simulated function spawnRedGiantElectricActivity()
{
local class<UltimaSolarNeblSmkE> ElecClass;

	ElecClass = Class'UltimaSolarNeblSmkRE';
	if (FRand() > 0.5)
		ElecClass = Class'UltimaSolarNeblSmkE';
	if (URedGiantSph[0] != None && !URedGiantSph[0].bDeleteMe)
		spawnElectricActivity(ElecClass, URedGiantSph[0], MinRedGiantElectricSparks, MaxRedGiantElectricSparks, MinRedGiantElectricSize, MaxRedGiantElectricSize);
}


simulated function spawnMagBlastsActivity(class<UltimaSolMagBlast> USMBaClass, UltimaSolarSphere USS, int minMagBlasts, int maxMagBlasts, float minMagSize, 
float maxMagSize, float minMBSpeed, float maxMBSpeed, float minMBLTime, float maxMBLTime, float minMBGlow, float maxMBGlow, optional bool bMuteFX)
{
local UltimaSolMagBlast USMBa;
local int magN, i, j;
local float dSclS, dSclE, glow;
local vector spPoint, spVel;

	magN = int(RandRange(minMagBlasts, maxMagBlasts));
	for (i = 0; i < magN; i++)
	{
		dSclS = RandRange(minMagSize, maxMagSize);
		dSclE = RandRange(minMagSize, maxMagSize);
		glow = RandRange(minMBGlow, maxMBGlow);
		spPoint = Location + USS.getRandomSurfaceLoc();
		spVel = Normal(spPoint - Location);
		spPoint -= (spVel * USMBaClass.default.Texture.USize * dSclS / 4);
		if ((Normal(spPoint - Location) dot spVel) < 0)
			spPoint = Location;
		spVel *= RandRange(minMBSpeed, maxMBSpeed);

		USMBa = Spawn(USMBaClass,,, spPoint);
		if (USMBa != None)
			USMBa.initMagBlast(RandRange(minMBLTime, maxMBLTime), spVel, dSclS, dSclE, glow, bMuteFX);
	}
}


simulated function spawnMatureMagBlastsActivity()
{
	if (UMatureSph[0] != None && !UMatureSph[0].bDeleteMe)
		spawnMagBlastsActivity(Class'UltimaSolMagBlast', UMatureSph[0], MinMatureMagBlasts, MaxMatureMagBlasts, MinMatureMagBlastsSize, MaxMatureMagBlastsSize, 
			MinMatureMagBlastsSpeed, MaxMatureMagBlastsSpeed, MinMatureMagBlastsLTime, MaxMatureMagBlastsLTime, MinMatureMagBlastsGlow, MaxMatureMagBlastsGlow);
}

simulated function spawnSystemMagBlastsActivity()
{
	if (UMatureSph[0] != None && !UMatureSph[0].bDeleteMe)
		spawnMagBlastsActivity(Class'UltimaSolMagBlastB', UMatureSph[0], MinSystemMagBlasts, MaxSystemMagBlasts, MinSystemMagBlastsSize, MaxSystemMagBlastsSize, 
			MinSystemMagBlastsSpeed, MaxSystemMagBlastsSpeed, MinSystemMagBlastsLTime, MaxSystemMagBlastsLTime, MinSystemMagBlastsGlow, MaxSystemMagBlastsGlow);
}

simulated function spawnRedGiantMagBlastsActivity(optional bool bMuteFX)
{
	if (URedGiantSph[0] != None && !URedGiantSph[0].bDeleteMe)
		spawnMagBlastsActivity(Class'UltimaSolMagBlastC', URedGiantSph[0], MinRedGiantMagBlasts, MaxRedGiantMagBlasts, MinRedGiantMagBlastsSize, MaxRedGiantMagBlastsSize, 
			MinRedGiantMagBlastsSpeed, MaxRedGiantMagBlastsSpeed, MinRedGiantMagBlastsLTime, MaxRedGiantMagBlastsLTime, MinRedGiantMagBlastsGlow, MaxRedGiantMagBlastsGlow, bMuteFX);
}

simulated function spawnBirthElectricInit(float ratio)
{
local UltimaSolarNeblSmkE USNSe;
local int neblN, i;
local UltimaSolarSphere USS;

	if (UBirthSph[0] == None || UBirthSph[0].bDeleteMe)
		return;
	USS = UBirthSph[0];

	neblN = int(RandRange(MinInitBirthElectricSparks, MaxInitBirthElectricSparks) * ratio);
	for (i = 0; i < neblN; i++)
	{
		USNSe = Spawn(Class'UltimaSolarNeblSmkE',,, Location + VRand()*RandRange(MinBirthInitElectricRadius, MaxBirthInitElectricRadius));
		if (USNSe != None)
			USNSe.DrawScale = RandRange(MinBirthInitElectricSize, MaxBirthInitElectricSize);
	}
}


simulated function spawnBirthLightnings()
{
local UltimaSolLightning USL;
local UltimaSolarSphere USS;
local UltimaSolarBirthCloud USBC;
local int solLN, i;
local vector sLoc, eLoc;

	if (UBirthSph[0] == None || UBirthSph[0].bDeleteMe)
		return;
	USS = UBirthSph[0];

	solLN = int(RandRange(MinBirthLightnings, MaxBirthLightnings));
	for (i = 0; i < solLN; i++)
	{
		if (FRand() > 0.5)
			USBC = BElectricClouds1[Rand(ArrayCount(BElectricClouds1))].WCloud;
		else
			USBC = BElectricClouds2[Rand(ArrayCount(BElectricClouds2))].WCloud;
		if (USBC == None || USBC.bDeleteMe)
			continue;
		
		eLoc = USBC.getRandomCloudLoc();
		sLoc = Location + USS.getSurfaceLocFromDir(eLoc - Location);
		USL = Spawn(Class'UltimaSolLightning',,, sLoc, rotator(eLoc - sLoc));
		if (USL != None)
		{
			USL.SetLightningPos(sLoc, eLoc);
			Spawn(Class'UltimaSolLightningLight',,, eLoc);
			Spawn(Class'UltimaSolLightningLightFog',,, eLoc);
		}
	}
}

simulated function spawnRedGiantLightnings(float coef)
{
local UltimaSolLightning USL;
local UltimaSolarSphere USS;
local int solLN, i;
local vector sLoc, eLoc;
local vector HitLoc, HitNorm;
local Actor A;

	if (URedGiantSph[0] == None || URedGiantSph[0].bDeleteMe)
		return;
	USS = URedGiantSph[0];

	solLN = int(coef * RandRange(MinRedGiantLightnings, MaxRedGiantLightnings));
	for (i = 0; i < solLN; i++)
	{
		eLoc = Location + VRand()*25000.f;
		A = Trace(HitLoc, HitNorm, eLoc, Location, False);
		if (A == None)
			continue;
		eLoc = HitLoc + HitNorm;
		sLoc = Location + USS.getSurfaceLocFromDir(eLoc - Location);
		USL = Spawn(Class'UltimaSolRedLightning',,, sLoc, rotator(eLoc - sLoc));
		if (USL != None)
		{
			USL.SetLightningPos(sLoc, eLoc);
			Spawn(Class'UltimaSolRedLightningLight',,, eLoc);
		}
	}
}


simulated function float getRandVariance(float coef, optional bool positiveVarOnly)
{
	if (positiveVarOnly)
		return (FRand()*coef + (1.f-coef));
	return ((FRand()*2-1)*coef + (1.f-coef));
}

simulated function SpawnBirthElectricClouds()
{
local vector CloudLoc;
local rotator R;

	R.Yaw = Rand(16384)*4;
	CloudLoc = Location + vect(0,0,1)*BirthCloudsHeight;
	SpawnBElectricClouds(CloudLoc, R, True, USBCMaster1, BElectricClouds1);
	
	R.Yaw = Rand(16384)*4;
	CloudLoc = Location + vect(0,0,-1)*BirthCloudsHeight;
	SpawnBElectricClouds(CloudLoc, R, False, USBCMaster2, BElectricClouds2);
}

simulated function SpawnBirthSolar()
{
local byte i;
local float lSpan;
local UltimaSolarBirthCorWaveShock USBCWS;

	Spawn(Class'UltimaSolarBirthCorLight');
	Spawn(Class'UltimaSolarBirthCorLightInit');
	Spawn(Class'UltimaSolarBirthCorLine');
	Spawn(Class'UltimaSolarBirthCorShock');
	Spawn(Class'UltimaOuterHoleCor');
	for (i = 0; i < ArrayCount(UBirthSph); i++)
	{
		lSpan = BirthTime + 10.0 + PhaseTransitionTime;
		UBirthSph[i] = Spawn(Class'UltimaSolarSphere',,,, rot(16384,0,0));
		UBirthSph[i].setTimeSkip(10.0, 0.25);
		if (i < 2)
		{
			UBirthSph[i].setRotatingYawSpeed(-8192);
			if (i == 0)
				UBirthSph[i].initSolarSphere(lSpan, 2.0, 0.5, 0.5, 6.4, 0.2, PhaseTransitionTime, Texture'BirthColdLava', STY_Normal);
			else
				UBirthSph[i].initSolarSphere(lSpan, 2.0, 1.0, 0.5, 6.4, 0.2, PhaseTransitionTime/3, Texture'BirthColdLavaOV', STY_Translucent);
		}
		else
		{
			UBirthSph[i].setRotatingYawSpeed(-16384);
			UBirthSph[i].initSolarSphere(lSpan, 1.5, 0.25, 0.65, 6.75, 0.2, PhaseTransitionTime, Texture'BirthColdLava', STY_Translucent);
		}
	}
	
	for (i = 0; i < 9; i++)
	{
		USBCWS = Spawn(Class'UltimaSolarBirthCorWaveShock');
		USBCWS.initWaveShock(Rand(4), RandRange(0.75, 1.35), FRand()*0.75);
	}
}


simulated function SpawnMatureSolar()
{
local int i;
local float lSpan;

	Spawn(Class'UltimaSolarMatureCorLight');
	Spawn(Class'UltimaOuterHoleCorB');
	for (i = 0; i < ArrayCount(UMatureSph); i++)
	{
		lSpan = MatureTime + SystemTime + PhaseTransitionTime;
		UMatureSph[i] = Spawn(Class'UltimaSolarSphere',,,, rot(16384,0,0));
		if (i < 2)
		{
			UMatureSph[i].setRotatingYawSpeed(-6000);
			if (i == 0)
				UMatureSph[i].initSolarSphere(lSpan, 1.5, 0.5, 3.8, 16.0, PhaseTransitionTime, PhaseTransitionTime, Texture'MatureHotLava', STY_Normal);
			else
				UMatureSph[i].initSolarSphere(lSpan, 2.0, 1.0, 4.5, 16.0, PhaseTransitionTime, PhaseTransitionTime/3, Texture'MatureHotLavaOV', STY_Translucent);
		}
		else
		{
			UMatureSph[i].setRotatingYawSpeed(-12000);
			UMatureSph[i].initSolarSphere(lSpan, 1.5, 0.25, 4.85, 16.35, PhaseTransitionTime, PhaseTransitionTime, Texture'MatureHotLava', STY_Translucent);
		}
	}
}


simulated function SpawnSystemSolar()
{
	Spawn(Class'UltimaSolarSystemCorLight');
}


simulated function SpawnRedGiantSolar()
{
local int i;
local float lSpan;

	Spawn(Class'UltimaSolarRedGiantCorLight');
	for (i = 0; i < ArrayCount(URedGiantSph); i++)
	{
		lSpan = RedGiantTime + PhaseTransitionTime*2;
		URedGiantSph[i] = Spawn(Class'UltimaSolarSphere',,,, rot(16384,0,0));
		if (i < 2)
		{
			URedGiantSph[i].setRotatingYawSpeed(-3000);
			if (i == 0)
				URedGiantSph[i].initSolarSphere(lSpan, 1.5, 0.5, 13.5, 24.0, PhaseTransitionTime, PhaseTransitionTime, Texture'RedGiantLava', STY_Normal);
			else
				URedGiantSph[i].initSolarSphere(lSpan, 2.0, 1.0, 14.5, 24.0, PhaseTransitionTime, PhaseTransitionTime/3, Texture'RedGiantLavaOV', STY_Translucent);
		}
		else
		{
			URedGiantSph[i].setRotatingYawSpeed(-6000);
			URedGiantSph[i].initSolarSphere(lSpan, 1.5, 0.25, 14.85, 24.35, PhaseTransitionTime, PhaseTransitionTime, Texture'RedGiantLava', STY_Translucent);
		}
	}
}

simulated function SpawnWhiteDwarfSolar()
{
local int i;
local float lSpan;
local UltimaSolarSphere USS;
local UltimaSolarWhiteDwarfCorWaveShock USWDCWS;

	USS = Spawn(Class'UltimaSolarSphere',,,, rot(16384,0,0));
	USS.initSolarSphere(PhaseTransitionTime * 1.3, 0.35, 0.15, 22.0, 26.0, PhaseTransitionTime, PhaseTransitionTime/3, Texture'WhiteDwarfLavaOV', STY_Translucent);
	USS.setRotatingYawSpeed(-10000);
	if (URedGiantSph[0] != None)
		URedGiantSph[0].initSolarSphere(PhaseTransitionTime, 1.5, 0.5, URedGiantSph[0].DrawScale, 1.0, 0.0, PhaseTransitionTime/20);
	
	Spawn(Class'UltimaSolarWhiteDwarfCorLight');
	Spawn(Class'UltimaSolarWhiteDwarfCorLine');
	Spawn(Class'UltimaSolarWhiteDwarfCorLightInit');
	for (i = 0; i < ArrayCount(UWhiteDwarfSph); i++)
	{
		lSpan = WhiteDwarfTime + SuperNovaPrepTime + PhaseTransitionTime*2;
		UWhiteDwarfSph[i] = Spawn(Class'UltimaSolarSphere',,,, rot(16384,0,0));
		if (i < 2)
		{
			UWhiteDwarfSph[i].setRotatingYawSpeed(-6000);
			if (i == 0)
				UWhiteDwarfSph[i].initSolarSphere(lSpan, 1.5, 0.5, 7.0, 0.1, PhaseTransitionTime, PhaseTransitionTime, Texture'WhiteDwarfLava', STY_Normal);
			else
				UWhiteDwarfSph[i].initSolarSphere(lSpan, 2.0, 1.0, 7.15, 0.15, PhaseTransitionTime, PhaseTransitionTime/3, Texture'WhiteDwarfLavaOV', STY_Translucent);
		}
		else
		{
			UWhiteDwarfSph[i].setRotatingYawSpeed(-12000);
			UWhiteDwarfSph[i].initSolarSphere(lSpan, 1.5, 0.25, 7.2, 0.2, PhaseTransitionTime, PhaseTransitionTime, Texture'WhiteDwarfLava', STY_Translucent);
		}
	}
	
	for (i = 0; i < 30; i++)
	{
		USWDCWS = Spawn(Class'UltimaSolarWhiteDwarfCorWaveShock');
		USWDCWS.initWaveShock(Rand(4), RandRange(0.75, 1.35), FRand()*0.75);
	}
}

simulated function SpawnSuperNovaExpl()
{
local UltimaSolSteamSrc USSS;
local UltimaSolarSNSolarFlr USBSF;
local int i;

	Spawn(Class'UltimaSolarSuperNovaCorLightInit');
	SpawnRadialFragDebris(Class'UltimaSolOrbWallFragSN', int(RandRange(MinSNDebris, MaxSNDebris)), MinSNDebrisChkRadius, MaxSNDebrisChkRadius, True);
	SpawnRadialFlares(Class'UltimaSolarSNSolarFlr', int(RandRange(MinSNFlares, MaxSNFlares)), MinSNFlaresChkRadius, MaxSNFlaresChkRadius, 
		MinSNFlaresScale, MaxSNFlaresScale, MinSNFlaresGlow, MaxSNFlaresGlow, MinSNFlaresSpeed, MaxSNFlaresSpeed, MinSNFlaresLTime, MaxSNFlaresLTime);
		
	foreach AllActors(Class'UltimaSolSteamSrc', USSS)
	{
		USSS.stopSteam();
		for (i = 0; i < 3; i++)
		{
			SpawnOrbFragDeb(Class'UltimaSolOrbWallFragSN', USSS.Location, USSS.FloorNorm, True);
			USBSF = Spawn(Class'UltimaSolarSNSolarFlr',,, USSS.Location);
			USBSF.initFlare(RandRange(MinSNFlaresLTime, MaxSNFlaresLTime), USSS.FloorNorm * RandRange(MinSNFlaresSpeed, MaxSNFlaresSpeed), 
				RandRange(MinSNFlaresScale, MaxSNFlaresScale), RandRange(MinSNFlaresScale, MaxSNFlaresScale), RandRange(MinSNFlaresGlow, MaxSNFlaresGlow));
		}
	}
}

simulated function SpawnSolarAftermath()
{
local int i, n;
local UltimaSolarAftermathSmkW USAS;
local class<UltimaSolarAftermathSmkW> USASClass;
local UltimaSolSteamSrc USSS;

	n = int(RandRange(MinAMSmkPoints, MaxAMSmkPoints));
	for (i = 0; i < n; i++)
	{
		if (FRand() > 0.5)
			USASClass = Class'UltimaSolarAftermathSmkW';
		else
			USASClass = Class'UltimaSolarAftermathSmkB';
		
		USAS = Spawn(USASClass,,, Location + VRand()*RandRange(MinAMSmkRadius, MaxAMSmkRadius));
		if (USAS != None)
			USAS.initAftermathSmk(FRand()*0.5 + 0.65, VRand()*RandRange(MinAMSmkSpeed, MaxAMSmkSpeed), 
				RandRange(MinAMSmkScale, MaxAMSmkScale), RandRange(MinAMSmkScale, MaxAMSmkScale), RandRange(MinAMSmkGlow, MaxAMSmkGlow));
	}
	
	foreach AllActors(Class'UltimaSolSteamSrc', USSS)
	{
		//TODO: spawn flames and a bit of smoke per USSS
		USSS.Destroy();
	}
}

simulated function SpawnRadialFlares(class<UltimaSolarBirthSolarFlr> uSBSFClass, int n, float minR, float maxR, float minScl, float maxScl, 
float minGl, float maxGl, float minSpd, float maxSpd, float minLTm, float maxLTm)
{
local int i;
local vector HitLoc, HitNorm;
local Actor A;
local UltimaSolarBirthSolarFlr USBSF;

	if (uSBSFClass == None || n <= 0 || minR <= 0 || maxR <= 0)
		return;
	
	for (i = 0; i < n; i++)
	{
		A = Trace(HitLoc, HitNorm, Location + VRand()*RandRange(minR, maxR), Location, False);
		if (A != None)
		{
			USBSF = Spawn(uSBSFClass,,, HitLoc + HitNorm);
			USBSF.initFlare(RandRange(minLTm, maxLTm), HitNorm * RandRange(minSpd, maxSpd), RandRange(minScl, maxScl), RandRange(minScl, maxScl), RandRange(minGl, maxGl));
		}
	}
}

simulated function SpawnBElectricClouds(vector Loc, rotator R, bool isUpper, out UltimaSolarBirthCloudMaster USBCMaster, out USCloud BElectricClouds[7])
{
local int i, rotRate;
local float cloudsLTime, cloudsLETime, minCloudScale, maxCloudScale, sign;
local vector realCloudLoc;

	sign = float(isUpper)*2 - 1;
	cloudsLETime = Class'UltimaSolarBirthCloud'.default.fadeOutTime + BirthTime + MatureTime/4;
	cloudsLTime = Class'UltimaSolarBirthCloud'.default.fadeOutTime + BirthTime + MatureTime + SystemTime + RedGiantTime + 
		WhiteDwarfTime + SuperNovaPrepTime + SuperNovaExplTime + SuperNovaTime;
	USBCMaster = Spawn(Class'UltimaSolarBirthCloudMaster',,, Loc, R);
	USBCMaster.LifeSpan = cloudsLTime + 1.f;
	for (i = 0; i < ArrayCount(BElectricClouds); i++)
	{
		minCloudScale = (2.f**i);
		maxCloudScale = 1.45*(2.f**i);
		rotRate = i*550 + 550;
		realCloudLoc = Loc - sign*minCloudScale*vect(0,0,64);
		BElectricClouds[i].WCloud = Spawn(Class'UltimaSolarBirthCloud', USBCMaster,, realCloudLoc, R);
		if (BElectricClouds[i].WCloud != None)
			BElectricClouds[i].WCloud.InitializeLightningClouds(cloudsLTime, minCloudScale, maxCloudScale, rotRate);
		BElectricClouds[i].BCloud = Spawn(Class'UltimaSolarBirthCloudB', USBCMaster,, realCloudLoc, R);
		if (BElectricClouds[i].BCloud != None)
			BElectricClouds[i].BCloud.InitializeLightningClouds(cloudsLTime, minCloudScale, maxCloudScale, rotRate);
		BElectricClouds[i].ECloud = Spawn(Class'UltimaSolarBirthCloudElectric', USBCMaster,, realCloudLoc, R);
		if (BElectricClouds[i].ECloud != None)
			BElectricClouds[i].ECloud.InitializeLightningClouds(cloudsLETime, minCloudScale, maxCloudScale, rotRate);
	}
}

simulated function SpawnOrbitalFragDebris(class<UltimaSolOrbWallFrag> uSOWFClass, int n, float minR, float maxR, float minH, float maxH, 
optional bool useFloorTex, optional bool bHeightTraceLast)
{
local int i;
local vector HitLoc, HitNorm, initLoc, initTraceOffset;
local Actor A;
local bool bHFirst;
local rotator R;

	if (uSOWFClass == None || n <= 0 || minR <= 0 || maxR <= 0 || minH <= 0 || maxH <= 0)
		return;
	
	for (i = 0; i < n; i++)
	{
		bHFirst = (!bHeightTraceLast && FRand() > 0.5);
		R.Yaw = int(FRand()*65536 - 32768);
		initLoc = Location;
		if (bHFirst)
			initTraceOffset = RandRange(minH, maxH)*vect(0,0,-1);
		else
			initTraceOffset = ((RandRange(minR, maxR)*vect(1,0,0)) >> R);

		A = Trace(HitLoc, HitNorm, initLoc + initTraceOffset, initLoc, False);
		if (A != None)
		{
			SpawnOrbFragDeb(uSOWFClass, HitLoc, HitNorm, useFloorTex);
			continue;
		}
		
		initLoc += initTraceOffset;
		if (!bHFirst)
			initTraceOffset = RandRange(minH, maxH)*vect(0,0,-1);
		else
			initTraceOffset = ((RandRange(minR, maxR)*vect(1,0,0)) >> R);
			
		A = Trace(HitLoc, HitNorm, initLoc + initTraceOffset, initLoc, False);
		if (A != None)
			SpawnOrbFragDeb(uSOWFClass, HitLoc, HitNorm, useFloorTex);
	}
}

simulated function SpawnRadialFragDebris(class<UltimaSolOrbWallFrag> uSOWFClass, int n, float minR, float maxR, optional bool useFloorTex)
{
local int i;
local vector HitLoc, HitNorm;
local Actor A;

	if (uSOWFClass == None || n <= 0 || minR <= 0 || maxR <= 0)
		return;
	
	for (i = 0; i < n; i++)
	{
		A = Trace(HitLoc, HitNorm, Location + VRand()*RandRange(minR, maxR), Location, False);
		if (A != None)
			SpawnOrbFragDeb(uSOWFClass, HitLoc, HitNorm, useFloorTex);
	}
}

simulated function SpawnOrbFragDeb(class<UltimaSolOrbWallFrag> uSOWFClass, vector hLoc, vector hNorm, optional bool useFloorTex)
{
local texture T;
local NWWallTexDetector nwDec;
local UltimaSolOrbWallFrag uSOWF;

	if (uSOWFClass == None)
		return;
	if (useFloorTex)
	{
		nwDec = Spawn(Class'NWWallTexDetector',,, hLoc + hNorm, rotator(hNorm));
		T = nwDec.AttachDecal(200);
		nwDec.Destroy();
		nwDec = None;
	}
	
	uSOWF = Spawn(uSOWFClass,,, hLoc + hNorm, RotRand());
	uSOWF.initWallFrag(Self, hNorm, T);
}

simulated function processWFragOrb(UltimaSolOrbWallFrag uSOWF)
{
local float fVel;
local vector fVect;

	if ((SolarState >= SOLAR_Mature && SolarState < SOLAR_SuperNovaExpl) || (SolarState == SOLAR_Birth && tCount >= (BirthTime - PhaseTransitionTime)))
	{
		fVel = VSize(uSOWF.Velocity);
		fVect = uSOWF.Location - Location;
		uSOWF.Velocity += (Normal((fVect >> rot(0,-2048,0)) - fVect) * fVel * 0.2);
		if (VSize(uSOWF.Velocity) > (uSOWF.MaxInitSpeed * 3))
			uSOWF.Velocity = Normal(uSOWF.Velocity) * uSOWF.MaxInitSpeed * 3;
			
		if (SolarState == SOLAR_System)
			uSOWF.processOverlay((tCount/SystemTime) * 0.8 + FRand()*0.2);
		else if (SolarState >= SOLAR_WhiteDwarf)
		{
			if (uSOWF.OV != None)
			{
				uSOWF.OV.Destroy();
				uSOWF.OV = None;
			}
		}
		else if (SolarState > SOLAR_System)
			uSOWF.processOverlay(0.8 + FRand()*0.2);
	}
}

simulated function Destroyed()
{
local int i;

	if (bAffectZones)
	{
		for (i = 0; i < ArrayCount(ZInfo); i++)
		{
			if (ZInfo[i].ZI != None)
			{
				if (Level.NetMode != NM_DedicatedServer)
				{
					ZInfo[i].ZI.ViewFlash = ZInfo[i].VFlash;
					ZInfo[i].ZI.ViewFog = ZInfo[i].VFog;
					ZInfo[i].ZI.AmbientBrightness = ZInfo[i].ABrightness;
					ZInfo[i].ZI.AmbientHue = ZInfo[i].AHue;
					ZInfo[i].ZI.AmbientSaturation = ZInfo[i].ASaturation;
				}
				
				if (Role == ROLE_Authority)
					ZInfo[i].ZI.ZoneGravity = ZInfo[i].ZGravity;
			}
			ZInfo[i].ZI = None;
		}
		if (Level.NetMode != NM_DedicatedServer)
			checkPlayerFlush();
	}
	localPlayer = None;
	
	for (i = 0; i < ArrayCount(BElectricClouds1); i++)
	{
		if (BElectricClouds1[i].WCloud != None)
			BElectricClouds1[i].WCloud.Destroy();
		if (BElectricClouds1[i].BCloud != None)
			BElectricClouds1[i].BCloud.Destroy();
		if (BElectricClouds1[i].ECloud != None)
			BElectricClouds1[i].ECloud.Destroy();
			
		BElectricClouds1[i].WCloud = None;
		BElectricClouds1[i].BCloud = None;
		BElectricClouds1[i].ECloud = None;
	}
	
	for (i = 0; i < ArrayCount(BElectricClouds2); i++)
	{
		if (BElectricClouds2[i].WCloud != None)
			BElectricClouds2[i].WCloud.Destroy();
		if (BElectricClouds2[i].BCloud != None)
			BElectricClouds2[i].BCloud.Destroy();
		if (BElectricClouds2[i].ECloud != None)
			BElectricClouds2[i].ECloud.Destroy();
			
		BElectricClouds2[i].WCloud = None;
		BElectricClouds2[i].BCloud = None;
		BElectricClouds2[i].ECloud = None;
	}
	
	for (i = 0; i < ArrayCount(UBirthSph); i++)
	{
		if (UBirthSph[i] != None)
			UBirthSph[i].Destroy();
		UBirthSph[i] = None;
	}
	
	for (i = 0; i < ArrayCount(UMatureSph); i++)
	{
		if (UMatureSph[i] != None)
			UMatureSph[i].Destroy();
		UMatureSph[i] = None;
	}
	
	for (i = 0; i < ArrayCount(URedGiantSph); i++)
	{
		if (URedGiantSph[i] != None)
			URedGiantSph[i].Destroy();
		URedGiantSph[i] = None;
	}
	
	for (i = 0; i < ArrayCount(UWhiteDwarfSph); i++)
	{
		if (UWhiteDwarfSph[i] != None)
			UWhiteDwarfSph[i].Destroy();
		UWhiteDwarfSph[i] = None;
	}
	
	if (USBCMaster1 != None)
		USBCMaster1.Destroy();
	if (USBCMaster2 != None)
		USBCMaster2.Destroy();
		
	USBCMaster1 = None;
	USBCMaster2 = None;

	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Sprite
	bAlwaysRelevant=True
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=True
	Texture=UltimaProjLightStart
	Physics=PHYS_None
	bHidden=True
	
	bAffectZones=True
	PhaseTransitionTime=5.000000
	
	LightHoleTime=7.000000
	DarknessTime=1.000000
	BirthTime=15.000000
	MatureTime=15.000000
	SystemTime=15.000000
	RedGiantTime=15.000000
	WhiteDwarfTime=5.000000
	SuperNovaPrepTime=6.000000
	SuperNovaExplTime=5.000000
	SuperNovaTime=5.000000
	EndTime=20.000000
	
	LightHoleSound=LightHoleTimeSnd
	DarknessSound=None
	BirthSound=SolarBirthSnd
	WhiteDwarfSound=WhiteDwarfBirth
	SuperNovaPrepSound=WhiteDwarfCollapse
	SuperNovaExplSound=SuperNovaExpl
	
	BirthZGravity=-5.000000
	MatureZGravity=-10.000000
	SystemZGravity=0.000000
	RedGiantZGravity=50.000000
	
	enableZInfoLightDelta=False
	ZInfoDeltaClient(0)=(Flash=(X=-1.000000,Y=-1.000000,Z=-1.000000),Fog=(X=0.000000,Y=0.000000,Z=0.000000),B=0,H=0,S=0,TransTime=7.000000,bDirDarkFlash=False)
	ZInfoDeltaClient(1)=(Flash=(X=-1.000000,Y=-1.000000,Z=-1.000000),Fog=(X=0.000000,Y=0.000000,Z=0.000000),B=255,H=170,S=0,TransTime=1.000000,bDirDarkFlash=False)
	ZInfoDeltaClient(2)=(Flash=(X=-0.900000,Y=-0.900000,Z=-0.900000),Fog=(X=0.000000,Y=0.000000,Z=0.000000),B=255,H=170,S=0,TransTime=0.350000,bDirDarkFlash=True)
	ZInfoDeltaClient(3)=(Flash=(X=-0.900000,Y=-0.900000,Z=-0.900000),Fog=(X=0.300000,Y=0.100000,Z=0.000000),B=255,H=20,S=0,TransTime=1.000000,bDirDarkFlash=True)
	ZInfoDeltaClient(4)=(Flash=(X=-0.900000,Y=-0.900000,Z=-0.900000),Fog=(X=0.400000,Y=0.100000,Z=0.000000),B=255,H=0,S=64,TransTime=1.000000,bDirDarkFlash=True)
	ZInfoDeltaClient(5)=(Flash=(X=-0.500000,Y=-0.500000,Z=-0.500000),Fog=(X=0.500000,Y=0.000000,Z=0.000000),B=255,H=0,S=0,TransTime=5.000000,bDirDarkFlash=True)
	ZInfoDeltaClient(6)=(Flash=(X=0.000000,Y=0.000000,Z=0.000000),Fog=(X=0.300000,Y=0.100000,Z=0.100000),B=255,H=0,S=0,TransTime=5.000000,bDirDarkFlash=True)
	ZInfoDeltaClient(7)=(Flash=(X=-0.900000,Y=-0.900000,Z=-0.900000),Fog=(X=0.200000,Y=0.200000,Z=0.200000),B=255,H=0,S=255,TransTime=5.000000,bDirDarkFlash=True)
	ZInfoDeltaClient(8)=(Flash=(X=0.000000,Y=0.000000,Z=0.000000),Fog=(X=1.000000,Y=1.000000,Z=1.000000),B=255,H=0,S=255,TransTime=5.000000,bDirDarkFlash=True)
	ZInfoDeltaClient(9)=(Flash=(X=-1.000000,Y=-1.000000,Z=-1.000000),Fog=(X=1.000000,Y=1.000000,Z=1.000000),B=255,H=0,S=255,TransTime=5.000000,bDirDarkFlash=True)
	ZInfoTransTimeEnd=10.000000
	
	NeblVariance=0.200000
	NeblResetInterval=2.000000
	NeblInitSmkRate=15.000000
	NeblInitMinAngRate=-10000
	NeblInitMaxAngRate=10000
	NeblInitMinRadius=3500.000000
	NeblInitMaxRadius=9000.000000
	NeblInitSmkMinPoints=6
	NeblInitSmkMaxPoints=8
	NeblSmkRate=10.000000
	NeblMinAngRate=-10000
	NeblMaxAngRate=10000
	NeblMinRadius=3000.000000
	NeblMaxRadius=6500.000000
	NeblSmkMinPoints=3
	NeblSmkMaxPoints=5
	
	BirthCloudsHeight=3500.000000
	
	MinBlueFlaresRate=10.000000
	MaxBlueFlaresRate=20.000000
	MinBlueFlares=6
	MaxBlueFlares=12
	MinBlueFlrScale=5.000000
	MaxBlueFlrScale=25.000000
	MinBlueFlrGlow=0.350000
	MaxBlueFlrGlow=0.850000
	MinBlueFlrSpeed=200.000000
	MaxBlueFlrSpeed=800.000000
	MinBlueLTime=0.400000
	MaxBlueLTime=2.000000
	
	MinBirthElectricRate=10.000000
	MaxBirthElectricRate=8.000000
	MinBirthElectricSize=3.000000
	MaxBirthElectricSize=30.000000
	MinBirthElectricSparks=7
	MaxBirthElectricSparks=15
	
	BirthInitElectricTime=4.500000
	MinBirthInitElectricRate=10.000000
	MaxBirthInitElectricRate=8.000000
	MinBirthInitElectricSize=45.000000
	MaxBirthInitElectricSize=85.000000
	MinBirthInitElectricRadius=256.000000
	MaxBirthInitElectricRadius=4096.000000
	MinInitBirthElectricSparks=15
	MaxInitBirthElectricSparks=30
	
	MinBirthLightningRate=2.000000
	MaxBirthLightningRate=5.000000
	MinBirthLightnings=6
	MaxBirthLightnings=16
				
	MinBirthDebrisRate=5.000000
	MaxBirthDebrisRate=7.500000
	MinBirthDebrisChkRadius=512.000000
	MaxBirthDebrisChkRadius=8192.000000
	MaxBirthDebrisChkHeight=8192.000000
	MinBirthDebris=10
	MaxBirthDebris=20
	
	MinYellowFlaresRate=10.000000
	MaxYellowFlaresRate=20.000000
	MinYellowFlares=6
	MaxYellowFlares=12
	MinYellowFlrScale=10.000000
	MaxYellowFlrScale=35.000000
	MinYellowFlrGlow=0.350000
	MaxYellowFlrGlow=0.850000
	MinYellowFlrSpeed=200.000000
	MaxYellowFlrSpeed=800.000000
	MinYellowLTime=0.400000
	MaxYellowLTime=2.000000
	
	MinMatureElectricRate=4.000000
	MaxMatureElectricRate=8.000000
	MinMatureElectricSize=5.000000
	MaxMatureElectricSize=35.000000
	MinMatureElectricSparks=7
	MaxMatureElectricSparks=15
	
	MinMatureMagBlastsRate=3.000000
	MaxMatureMagBlastsRate=5.000000
	MinMatureMagBlastsSize=10.000000
	MaxMatureMagBlastsSize=15.000000
	MinMatureMagBlastsGlow=1.500000
	MaxMatureMagBlastsGlow=1.000000
	MinMatureMagBlastsSpeed=700.000000
	MaxMatureMagBlastsSpeed=2100.000000
	MinMatureMagBlastsLTime=0.800000
	MaxMatureMagBlastsLTime=2.000000
	MinMatureMagBlasts=3
	MaxMatureMagBlasts=6
	
	MinMatureDebrisRate=5.000000
	MaxMatureDebrisRate=7.500000
	MinMatureDebrisChkRadius=512.000000
	MaxMatureDebrisChkRadius=8192.000000
	MaxMatureDebrisChkHeight=8192.000000
	MinMatureDebris=3
	MaxMatureDebris=8
	
	MinOrangeFlaresRate=10.000000
	MaxOrangeFlaresRate=20.000000
	MinOrangeFlares=9
	MaxOrangeFlares=16
	MinOrangeFlrScale=25.000000
	MaxOrangeFlrScale=50.000000
	MinOrangeFlrGlow=0.350000
	MaxOrangeFlrGlow=0.850000
	MinOrangeFlrSpeed=500.000000
	MaxOrangeFlrSpeed=1300.000000
	MinOrangeLTime=0.400000
	MaxOrangeLTime=2.000000
	
	MinSystemMagBlastsRate=3.000000
	MaxSystemMagBlastsRate=5.000000
	MinSystemMagBlastsSize=20.000000
	MaxSystemMagBlastsSize=35.000000
	MinSystemMagBlastsGlow=1.500000
	MaxSystemMagBlastsGlow=1.000000
	MinSystemMagBlastsSpeed=1000.000000
	MaxSystemMagBlastsSpeed=2600.000000
	MinSystemMagBlastsLTime=1.000000
	MaxSystemMagBlastsLTime=2.500000
	MinSystemMagBlasts=2
	MaxSystemMagBlasts=7
	
	MinSystemDebrisRate=5.000000
	MaxSystemDebrisRate=7.500000
	MinSystemDebrisChkRadius=512.000000
	MaxSystemDebrisChkRadius=12000.000000
	MaxSystemDebrisChkHeight=12000.000000
	MinSystemDebris=3
	MaxSystemDebris=8
	
	MinRedFlaresRate=12.000000
	MaxRedFlaresRate=25.000000
	MinRedFlares=6
	MaxRedFlares=16
	MinRedFlrScale=45.000000
	MaxRedFlrScale=75.000000
	MinRedFlrGlow=0.350000
	MaxRedFlrGlow=0.850000
	MinRedFlrSpeed=670.000000
	MaxRedFlrSpeed=1800.000000
	MinRedLTime=0.400000
	MaxRedLTime=2.000000
	
	MinRedGiantMagBlastsRate=3.000000
	MaxRedGiantMagBlastsRate=5.000000
	MinRedGiantMagBlastsSize=20.000000
	MaxRedGiantMagBlastsSize=35.000000
	MinRedGiantMagBlastsGlow=1.500000
	MaxRedGiantMagBlastsGlow=1.000000
	MinRedGiantMagBlastsSpeed=1000.000000
	MaxRedGiantMagBlastsSpeed=2600.000000
	MinRedGiantMagBlastsLTime=1.000000
	MaxRedGiantMagBlastsLTime=2.500000
	MinRedGiantMagBlasts=2
	MaxRedGiantMagBlasts=7
	
	MinRedGiantElectricRate=4.000000
	MaxRedGiantElectricRate=8.000000
	MinRedGiantElectricSize=10.000000
	MaxRedGiantElectricSize=50.000000
	MinRedGiantElectricSparks=12
	MaxRedGiantElectricSparks=26
	
	MinRedGiantDebrisRate=4.000000
	MaxRedGiantDebrisRate=5.000000
	MinRedGiantDebrisChkRadius=10000.000000
	MaxRedGiantDebrisChkRadius=25000.000000
	MaxRedGiantDebrisChkHeight=35000.000000
	MinRedGiantDebris=4
	MaxRedGiantDebris=6
	
	MinRedGiantLightningRate=3.000000
	MaxRedGiantLightningRate=7.000000
	MinRedGiantLightnings=5
	MaxRedGiantLightnings=10
	
	MinWDFlaresRate=5.000000
	MaxWDFlaresRate=10.000000
	MinWDFlares=6
	MaxWDFlares=12
	MinWDFlrScale=6.000000
	MaxWDFlrScale=15.000000
	MinWDFlrGlow=0.350000
	MaxWDFlrGlow=0.850000
	MinWDFlrSpeed=100.000000
	MaxWDFlrSpeed=300.000000
	MinWDLTime=0.400000
	MaxWDLTime=2.000000
	
	MinSNDebrisChkRadius=30000.000000
	MaxSNDebrisChkRadius=40000.000000
	MinSNDebris=700
	MaxSNDebris=1000
	
	MinSNFlaresChkRadius=30000.000000
	MaxSNFlaresChkRadius=40000.000000
	MinSNFlaresScale=25.000000
	MaxSNFlaresScale=100.000000
	MinSNFlaresGlow=0.150000
	MaxSNFlaresGlow=0.750000
	MinSNFlaresSpeed=100.000000
	MaxSNFlaresSpeed=400.000000
	MinSNFlaresLTime=5.000000
	MaxSNFlaresLTime=10.000000
	MinSNFlares=100
	MaxSNFlares=200
	
	MaxSNSteamAttempts=150
	MinSNSteamPoints=15
	MaxSNSteamPoints=25
	SNSteamRateStart=2.000000
	SNSteamRateEnd=6.000000
	MinSNSteamRadius=100.000000
	MaxSNSteamRadius=25000.000000
	MaxSNSteamHeightCheck=700.000000
	MinSNSteamScale=5.000000
	MaxSNSteamScale=20.000000
	MinSNSteamFloorNormalZ=0.650000
	
	MinAMSmkPoints=100
	MaxAMSmkPoints=175
	MinAMSmkRadius=2000.000000
	MaxAMSmkRadius=25000.000000
	MinAMSmkScale=300.000000
	MaxAMSmkScale=450.000000
	MinAMSmkGlow=0.350000
	MaxAMSmkGlow=0.650000
	MinAMSmkSpeed=100.000000
	MaxAMSmkSpeed=700.000000
	
	
	SolarCoreDmgType=SolarCore
	SolarRadialDmgType=SolarBurnt
	SolarSuperNovaDmgType=SolarSuperNova
	
	SolarBirthCoreDmg=30000
	SolarMatureCoreDmg=100000
	SolarSystemCoreDmg=500000
	SolarRedGiantCoreDmg=1000000
	SolarWhiteDwarfCoreDmg=750000
	
	SolarMatureRadialMaxDmg=400
	SolarSystemRadialMaxDmg=1000
	SolarRedGiantRadialMaxDmg=2000
	SolarSuperNovaDmg=9000000
	
	SolarMatureRadialDmgRadius=8000.000000
	SolarSystemRadialDmgRadius=16000.000000
	SolarRedGiantRadialDmgRadius=35000.000000

	SolarCoreDmgRate=5.000000
	SolarRadialDmgRate=5.000000
	SolarSuperNovaDmgRate=10.000000
	
	bGameFinisher=True
}
