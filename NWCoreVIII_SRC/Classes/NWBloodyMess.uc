//////////////////////////////////////////////////////////////
//	Nali Weapons III mutator for gore and blood
//				Feralidragon (27-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBloodyMess expands Mutator config(NWConfig);


var(ServerConfig) config bool enableHeadshotFX;
var(ServerConfig) config bool enableHeadshotShake;
var(ServerConfig) config bool enableBodyshotFX;
var(ServerConfig) config bool enableBodyshotShake;
var(ServerConfig) config bool enableBodyCarcassDetection;
var(ServerConfig) config bool enableBodySkeleton;
var(ServerConfig) config bool enableFullNetworkRelevancy;
var(ServerConfig) config float BloodFogLifespanMultiplier;

var(ClientConfig) config int MaxCordIterations;
var(ClientConfig) config bool bCordCollideWithActors;

var(MixedConfig) config float GoreLifeSpanMultiplier;
var(MixedConfig) config float GorePartsMultiplier;
var(MixedConfig) config float GoreScaleMultiplier;
var(MixedConfig) config bool enableSlideBloodDecals;
var(MixedConfig) config float BloodDecalsMinLifespan, BloodDecalsMaxLifespan;
var(ClientConfig) config bool UseClientGoreMultSettings;
var(ClientConfig) config bool UseClientGoreDecalSettings;

var() name CarcassGibDmgType;
var float ServerGoreLifeSpanMult, ServerGorePartsMult, ServerGoreScaleMult;
var bool ServerEnableSlideBloodDecals;
var float ServerBloodDecalsMinLifespan, ServerBloodDecalsMaxLifespan;
var bool isActivated, bServerBodySkel;


enum EDamCateg
{
	DCG_Gibbed,
	DCG_Headshot,
	DCG_Both,
	DCG_List
};

struct GrTrigType
{
	var() name VictClassName;
	var() string VictModel;
	var() string VictSkin;
	var() byte VictSkinID;
	var() EDamCateg DmgCateg;  
	var() string DCGDmgList;
	var() string GoreTypeIDs;
	var() bool bDestroyOld;
};

var(ServerConfig) config GrTrigType GoreTriggerTypes[64];
var GrTrigType ClientGoreTriggerTypes[64];
var int ClientGoreTriggerTypesSize;

struct GrBlood
{
	var() name VictClassName;
	var() string VictModel;
	var() string VictSkin;
	var() byte VictSkinID;
	var() name BloodType;
};
var(ServerConfig) config GrBlood GoreBloodTypes[24];
var GrBlood ClientGoreBloodTypes[24];
var int ClientGoreBloodTypesSize;


struct GrAlias
{
	var() name VictClassName;
	var() name VictAliasClassName;
};
var(ServerConfig) config GrAlias GoreTriggerAlias[32];


struct GrType
{
	var() string GoreClass;
	var() int PartsMin;
	var() int PartsMax;
	var() float SpeedMultXY;
	var() float SpeedMultZ;
};

var(ServerConfig) config GrType GoreTypes[64];
var GrType ClientGoreTypes[64];
var class<NWGoreSet> GoreTypeClasses[64];


struct BldType
{
	var() name BldName;
	var() class<NWGoreCBoard> BldGoreClass;
};
var() BldType BldTypes[8];



replication
{
	reliable if (Role == ROLE_Authority)
		ClientGoreTriggerTypes, ClientGoreTriggerTypesSize, ClientGoreTypes, GoreTypeClasses, 
		ServerGoreLifeSpanMult, ServerGorePartsMult, ServerGoreScaleMult, ServerBloodDecalsMinLifespan, ServerBloodDecalsMaxLifespan,
		ClientGoreBloodTypes, ClientGoreBloodTypesSize, ServerEnableSlideBloodDecals, isActivated, bServerBodySkel;
}

simulated function PostBeginPlay()
{
local int i;

	Super.PostBeginPlay();
	if (Role == ROLE_Authority)
	{
		isActivated = !Class'NWUtils'.static.hasSimilarMutator(Level, "*NWBloodyMess*");
		if (!isActivated)
			return;
		
		for (i = 0; i < ArrayCount(GoreTriggerTypes); i++)
		{
			if (GoreTriggerTypes[i].VictClassName != '')
			{
				ClientGoreTriggerTypes[i] = GoreTriggerTypes[i];
				ClientGoreTriggerTypesSize = i + 1;
			}
		}
		
		for (i = 0; i < ArrayCount(GoreBloodTypes); i++)
		{
			if (GoreBloodTypes[i].VictClassName != '')
			{
				ClientGoreBloodTypes[i] = GoreBloodTypes[i];
				ClientGoreBloodTypesSize = i + 1;
			}
		}
		
		for (i = 0; i < ArrayCount(GoreTypes); i++)
		{
			ClientGoreTypes[i] = GoreTypes[i];
			if (GoreTypes[i].GoreClass != "")
				GoreTypeClasses[i] = Class<NWGoreSet>(DynamicLoadObject(GoreTypes[i].GoreClass, class'Class'));
		}
		
		ServerGoreLifeSpanMult = GoreLifeSpanMultiplier;
		ServerGorePartsMult = GorePartsMultiplier;
		ServerGoreScaleMult = GoreScaleMultiplier;
		ServerEnableSlideBloodDecals = enableSlideBloodDecals;
		ServerBloodDecalsMinLifespan = BloodDecalsMinLifespan;
		ServerBloodDecalsMaxLifespan = BloodDecalsMaxLifespan;
		bServerBodySkel = enableBodySkeleton;
	}
}

static function bool isEnabled()
{
	return (default.enableHeadshotFX || default.enableBodyshotFX);
}

function bool PreventDeath(Pawn Killed, Pawn Killer, name damageType, vector HitLocation)
{
local bool bPreventDeath;
local int n;

	bPreventDeath = (NextMutator != None && NextMutator.PreventDeath(Killed, Killer, damageType, HitLocation));
	if (isActivated && !bPreventDeath && Killed != None && Killed.CollisionHeight > 0.0)
	{
		n = GetGoreTriggerTypeIndex(damageType, Killed);
		if (n >= 0)
			setupVictimGoreFX(Killed, damageType, GetGoreBloodType(Killed), n, HitLocation);
	}
	return bPreventDeath;
}

function setupVictimGoreFX(Actor ref, name damageType, name bldGoreType, int curGrTypeIndex, vector hLoc)
{
local NWBloodExplFX nwBldFX;
local GrTrigType curGrType;
local class<NWGoreCBoard> goreCBoardClass;

	if (curGrTypeIndex < 0 || curGrTypeIndex >= ArrayCount(ClientGoreTriggerTypes))
		return;
	curGrType = ClientGoreTriggerTypes[curGrTypeIndex];
	if (curGrType.VictClassName == '' || Len(curGrType.GoreTypeIDs) <= 0)
		return;
	
	goreCBoardClass = GetGoreBloodManagerClass(bldGoreType);
	if (goreCBoardClass == None)
		goreCBoardClass = Class'NWGoreCBoard';

	if (damageType == 'Decapitated')
	{
		nwBldFX = Spawn(Class'NWHeadShotExplFXA',,, hLoc);
		if (nwBldFX != None)
		{
			nwBldFX.bAlwaysRelevant = enableFullNetworkRelevancy;
			nwBldFX.InitBloodFX(damageType, ref, goreCBoardClass, Self, curGrType.GoreTypeIDs, curGrType.bDestroyOld);
			nwBldFX = Spawn(Class'NWHeadShotExplFXB',,, hLoc);
			nwBldFX.bAlwaysRelevant = enableFullNetworkRelevancy;
			nwBldFX.InitBloodFX(damageType, ref, goreCBoardClass, Self, curGrType.GoreTypeIDs, curGrType.bDestroyOld);
			nwBldFX = Spawn(Class'NWHeadShotExplFXC',,, hLoc);
			nwBldFX.bAlwaysRelevant = enableFullNetworkRelevancy;
			nwBldFX.InitBloodFX(damageType, ref, goreCBoardClass, Self, curGrType.GoreTypeIDs, curGrType.bDestroyOld, BloodFogLifespanMultiplier);
			if (enableHeadshotShake)
				Spawn(Class'NWHeadshotShake',,, hLoc);
		}
	}
	else
	{
		nwBldFX = Spawn(Class'NWBodyShotExplFXA',,, hLoc);
		if (nwBldFX != None)
		{
			nwBldFX.bAlwaysRelevant = enableFullNetworkRelevancy;
			nwBldFX.InitBloodFX(damageType, ref, goreCBoardClass, Self, curGrType.GoreTypeIDs, curGrType.bDestroyOld);
			nwBldFX = Spawn(Class'NWBodyShotExplFXB',,, hLoc);
			nwBldFX.bAlwaysRelevant = enableFullNetworkRelevancy;
			nwBldFX.InitBloodFX(damageType, ref, goreCBoardClass, Self, curGrType.GoreTypeIDs, curGrType.bDestroyOld);
			nwBldFX = Spawn(Class'NWBodyShotExplFXC',,, hLoc);
			nwBldFX.bAlwaysRelevant = enableFullNetworkRelevancy;
			nwBldFX.InitBloodFX(damageType, ref, goreCBoardClass, Self, curGrType.GoreTypeIDs, curGrType.bDestroyOld, BloodFogLifespanMultiplier);
			if (enableBodyshotShake)
				Spawn(Class'NWBodyshotShake',,, hLoc);
		}
	}
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
local int n;
local NWGoreCarcassPH grCarcPH;

	if (enableBodyCarcassDetection && (CreatureCarcass(Other) != None || UTHumanCarcass(Other) != None) && Other.Instigator != None)
	{
		n = GetGoreTriggerTypeIndex(CarcassGibDmgType, Other.Instigator);
		if (n >= 0)
		{
			grCarcPH = Spawn(Class'NWGoreCarcassPH',,, Other.Location, Other.Rotation);
			grCarcPH.initCarcassPH(Self, Carcass(Other), CarcassGibDmgType, GetGoreBloodType(Other.Instigator), n, 
				Other.Instigator.CollisionRadius, Other.Instigator.CollisionHeight);
		}
	}	
	return true;
}

simulated function GrTrigType GetGoreTriggerType(name dmgType, Pawn Victim)
{
local int n;
local GrTrigType defGrTrigType;

	if (dmgType == '' || Victim == None)
		return defGrTrigType;
	n = GetGoreTriggerTypeIndex(dmgType, Victim);
	if (n < 0)
		return defGrTrigType;
	return ClientGoreTriggerTypes[n];
}

simulated function int GetGoreTriggerTypeIndex(name dmgType, Pawn Victim)
{
local int i;
local GrTrigType defGrTrigType, curGrType;

	if (dmgType == '' || Victim == None)
		return -1;
	for (i = (ClientGoreTriggerTypesSize-1); i >= 0; i--)
	{
		curGrType = ClientGoreTriggerTypes[i];
		if (hasMatchingTriggerClass(Victim, curGrType.VictClassName) &&
		(curGrType.VictModel == "" || Class'NWUtils'.static.StrMatch(curGrType.VictModel, String(Victim.Mesh))) && curGrType.VictSkinID < 8 && 
		(curGrType.VictSkin == "" || Class'NWUtils'.static.StrMatch(curGrType.VictSkin, String(Victim.MultiSkins[curGrType.VictSkinID]))) &&
		isValidGoreDamage(dmgType, Victim, curGrType.DmgCateg, curGrType.DCGDmgList))
			return i;
	}
	return -1;
}

simulated function name GetGoreBloodType(Pawn Victim)
{
local int i;
local GrBlood curBloodType;

	if (Victim == None)
		return 'RED';
	for (i = (ClientGoreBloodTypesSize-1); i >= 0; i--)
	{
		curBloodType = ClientGoreBloodTypes[i];
		if (hasMatchingTriggerClass(Victim, curBloodType.VictClassName) &&
		(curBloodType.VictModel == "" || Class'NWUtils'.static.StrMatch(curBloodType.VictModel, String(Victim.Mesh))) && curBloodType.VictSkinID < 8 && 
		(curBloodType.VictSkin == "" || Class'NWUtils'.static.StrMatch(curBloodType.VictSkin, String(Victim.MultiSkins[curBloodType.VictSkinID]))))
			return curBloodType.BloodType;
	}
	return 'RED';
}

function bool hasMatchingTriggerClass(Pawn Victim, name VClassName)
{
local byte i;

	if (Victim == None || VClassName == '')
		return False;
	if (Victim.IsA(VClassName))
		return True;
	for (i = 0; i < ArrayCount(GoreTriggerAlias); i++)
	{
		if (GoreTriggerAlias[i].VictClassName == '')
			return False;
		if (GoreTriggerAlias[i].VictClassName == VClassName && GoreTriggerAlias[i].VictAliasClassName != '' && 
		Victim.IsA(GoreTriggerAlias[i].VictAliasClassName))
			return True;
	}
	return False;
}

simulated function bool isValidGoreDamage(name dmgType, Pawn Victim, EDamCateg dmgCat, optional string dmgCatList)
{
local int i;
local string data;

	if (dmgType == '' || Victim == None)
		return False;
	
	if ((dmgCat == DCG_Headshot || dmgCat == DCG_Both) && dmgType == 'Decapitated' && Victim.Velocity.Z <= 250)
		return enableHeadshotFX;
	if (Victim.Gibbed(dmgType) || dmgType == CarcassGibDmgType)
	{
		Victim.Health = -1000;
		if (dmgCat == DCG_Gibbed || dmgCat == DCG_Both)
			return enableBodyshotFX;
		else if (dmgCat == DCG_List && Len(dmgCatList) > 0)
		{
			if ((dmgType == 'Decapitated' && !enableHeadshotFX) || (dmgType != 'Decapitated' && !enableBodyshotFX))
				return False;
			while (Class'NWUtils'.static.hasValueFromStringList(dmgCatList, i, data))
			{
				if (String(dmgType) ~= data)
					return True;
				i++;
			}
		}
	}
	else
		Victim.Health = -1;
	return False;
}

simulated function class<NWGoreCBoard> GetGoreBloodManagerClass(name bldType)
{
local byte i;

	for (i = 0; i < ArrayCount(BldTypes); i++)
	{
		if (BldTypes[i].BldName == '')
			return None;
		if (BldTypes[i].BldName == bldType)
			return BldTypes[i].BldGoreClass;
	}
	return None;
}

//Spawn gore
simulated function ProcessClientGore(float Delta, name dmgType, NWBloodExplFX bldExplFX, string grTrigIDs, class<NWGoreCBoard> BldGoreClass, 
rotator VictRot, vector VictLoc, bool bDestroyOld)
{
local int i, j, id, tParts;
local string data;
local NWGoreSet nwGS;
local float fxScale, lspanMult;
local vector partVel, spLoc;
local rotator R;
local class<NWBodyPiece> NWBPClass;
local Carcass C;

	if (Len(grTrigIDs) <= 0 || dmgType == '' || BldGoreClass == None || bldExplFX == None || bldExplFX.fxScale <= 0.0)
		return;
	if (bDestroyOld)
	{
		ForEach RadiusActors(Class'Carcass', C, 250*bldExplFX.fxScale, bldExplFX.Location)
		{
			if (CreatureChunks(C) != None || UTCreatureChunks(C) != None)
				C.Destroy();
		}
	}
	
	while (Class'NWUtils'.static.hasValueFromStringList(grTrigIDs, i, data))
	{
		id = Int(data);
		if (id >= 0 && id < ArrayCount(GoreTypeClasses) && GoreTypeClasses[id] != None)
		{
			NWBPClass = class<NWBodyPiece>(GoreTypeClasses[id]);
			if (class<NWGoreSkel>(NWBPClass) != None && !bServerBodySkel)
			{
				i++;
				continue;
			}
		
			fxScale = bldExplFX.fxScale;
			if (NWBPClass != None && !NWBPClass.default.bCannotMultiplyScale)
			{
				if (UseClientGoreMultSettings)
				{
					fxScale *= GoreScaleMultiplier;
					lspanMult = GoreLifeSpanMultiplier;
				}
				else
				{
					fxScale *= ServerGoreScaleMult;
					lspanMult = ServerGoreLifeSpanMult;
				}
			}
	
			if (NWBPClass != None && NWBPClass.default.FixedNumberOfParts > 0)
				tParts = NWBPClass.default.FixedNumberOfParts;
			else
				tParts = Rand((ClientGoreTypes[id].PartsMax + 1) - ClientGoreTypes[id].PartsMin) + ClientGoreTypes[id].PartsMin;
			if (NWBPClass != None && !NWBPClass.default.bCannotMultiplyAmount)
			{
				if (UseClientGoreMultSettings)
					tParts = Int(tParts * GorePartsMultiplier);
				else
					tParts = Int(tParts * ServerGorePartsMult);
			}
			
			for (j = 0; j < tParts; j++)
			{
				if (NWBPClass != None && NWBPClass.default.bDirectionalPart)
					R = VictRot;
				else
					R = RotRand(True);
				
				if (NWBPClass != None && NWBPClass.default.bRelOffset && NWBPClass.default.bRelOffsetFromVictim)
					spLoc = VictLoc;
				else
					spLoc = bldExplFX.Location;
				if (NWBPClass != None && NWBPClass.default.bRelOffset)
					spLoc += ((NWBPClass.static.getRelOffset(j) * fxScale) >> R);
				
				nwGS = Spawn(GoreTypeClasses[id],,, spLoc, R);
				partVel = (FRand()*2-1)*ClientGoreTypes[id].SpeedMultXY*vect(500,0,0);
				partVel += (FRand()*2-1)*ClientGoreTypes[id].SpeedMultXY*vect(0,500,0);
				partVel += (FRand()*2-1)*ClientGoreTypes[id].SpeedMultZ*vect(0,0,500);
				if (NWBodyPiece(nwGS) != None)
				{
					NWBodyPiece(nwGS).InitPartN(j, fxScale);
					if (UseClientGoreDecalSettings)
					{
						NWBodyPiece(nwGS).bSpawnSlideDecal = (NWBodyPiece(nwGS).bSpawnSlideDecal && enableSlideBloodDecals);
						NWBodyPiece(nwGS).decalMaxLifespan = BloodDecalsMaxLifespan;
						NWBodyPiece(nwGS).decalMinLifespan = BloodDecalsMinLifespan;
					}
					else
					{
						NWBodyPiece(nwGS).bSpawnSlideDecal = (NWBodyPiece(nwGS).bSpawnSlideDecal && ServerEnableSlideBloodDecals);
						NWBodyPiece(nwGS).decalMaxLifespan = ServerBloodDecalsMaxLifespan;
						NWBodyPiece(nwGS).decalMinLifespan = ServerBloodDecalsMinLifespan;
					}

					partVel *= NWBodyPiece(nwGS).VelMultiplier;
					partVel += (NWBodyPiece(nwGS).VelAdd*ClientGoreTypes[id].SpeedMultXY*vect(1,1,0));
					partVel += (NWBodyPiece(nwGS).VelAdd*ClientGoreTypes[id].SpeedMultZ*vect(0,0,1));
				}
				
				if (NWCordNodePiece(nwGS) != None)
				{
					NWCordNodePiece(nwGS).InitMasterNode(partVel, Delta, fxScale);
					NWCordNodePiece(nwGS).SetGoreType(BldGoreClass);
					NWCordNodePiece(nwGS).SetLifespanMult(lspanMult);
				}
				else if (NWBodyPiece(nwGS) != None)
				{
					NWBodyPiece(nwGS).InitSize(fxScale);
					NWBodyPiece(nwGS).SetGoreType(BldGoreClass);
					NWBodyPiece(nwGS).Velocity = partVel;
					NWBodyPiece(nwGS).SetLifespanMult(lspanMult);
				}
			}
		}
		i++;
	}
}

 
defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=True
	bAlwaysTick=True
	
	CarcassGibDmgType=CarcassGibbed
	BldTypes(0)=(BldName="RED",BldGoreClass=Class'NWGoreCBoard')
	BldTypes(1)=(BldName="GREEN",BldGoreClass=Class'NWGoreCBoardGreen')
	BldTypes(2)=(BldName="BLACK",BldGoreClass=Class'NWGoreCBoardBlack')
	BldTypes(3)=(BldName="SILVER",BldGoreClass=Class'NWGoreCBoardBlack')

	
	enableHeadshotFX=True
	enableHeadshotShake=True
	enableBodyshotFX=True
	enableBodyshotShake=True
	enableBodyCarcassDetection=True
	enableBodySkeleton=True
	enableFullNetworkRelevancy=False
	BloodFogLifespanMultiplier=1.000000
	MaxCordIterations=3
	bCordCollideWithActors=True
	
	GoreLifeSpanMultiplier=1.000000
	GorePartsMultiplier=1.000000
	GoreScaleMultiplier=1.000000
	enableSlideBloodDecals=True
	BloodDecalsMinLifespan=0.000000
	BloodDecalsMaxLifespan=0.000000
	UseClientGoreMultSettings=False
	UseClientGoreDecalSettings=False
	
	GoreTriggerTypes(0)=(VictClassName="ScriptedPawn",VictModel="*",VictSkin="*",VictSkinID=0,DmgCateg=DCG_Gibbed,DCGDmgList="",GoreTypeIDs="7",bDestroyOld=False)
	GoreTriggerTypes(1)=(VictClassName="Bot",VictModel="*",VictSkin="*",VictSkinID=0,DmgCateg=DCG_Headshot,DCGDmgList="",GoreTypeIDs="0,1,2",bDestroyOld=True)
	GoreTriggerTypes(2)=(VictClassName="Bot",VictModel="*",VictSkin="*",VictSkinID=0,DmgCateg=DCG_Gibbed,DCGDmgList="",GoreTypeIDs="3,4,5",bDestroyOld=False)
	GoreTriggerTypes(3)=(VictClassName="Bot",VictModel="Botpack.*",VictSkin="*",VictSkinID=0,DmgCateg=DCG_List,DCGDmgList="Electrified,Jolted,Burned,Corroded,SolarBurnt",GoreTypeIDs="3,5,6",bDestroyOld=True)
	GoreTriggerTypes(4)=(VictClassName="Bot",VictModel="Unreal*.*",VictSkin="*",VictSkinID=0,DmgCateg=DCG_List,DCGDmgList="Electrified,Jolted,Burned,Corroded,SolarBurnt",GoreTypeIDs="3,5,6",bDestroyOld=True)
	GoreTriggerTypes(5)=(VictClassName="Bot",VictModel="EpicCustomModels.*",VictSkin="*",VictSkinID=0,DmgCateg=DCG_List,DCGDmgList="Electrified,Jolted,Burned,Corroded,SolarBurnt",GoreTypeIDs="3,5,6",bDestroyOld=True)
	GoreTriggerTypes(6)=(VictClassName="Bot",VictModel="*.TCowMesh",VictSkin="*",VictSkinID=0,DmgCateg=DCG_List,DCGDmgList="Electrified,Jolted,Burned,Corroded,SolarBurnt",GoreTypeIDs="3,5",bDestroyOld=True)
	GoreTriggerTypes(7)=(VictClassName="Fly",VictModel="*",VictSkin="*",VictSkinID=0,DmgCateg=DCG_Gibbed,DCGDmgList="",GoreTypeIDs="8",bDestroyOld=False)
	GoreTriggerTypes(8)=(VictClassName="Mercenary",VictModel="*",VictSkin="*",VictSkinID=0,DmgCateg=DCG_Headshot,DCGDmgList="",GoreTypeIDs="2,9",bDestroyOld=True)
	GoreTriggerTypes(9)=(VictClassName="Mercenary",VictModel="*",VictSkin="*",VictSkinID=0,DmgCateg=DCG_Gibbed,DCGDmgList="",GoreTypeIDs="4,7",bDestroyOld=False)
	GoreTriggerTypes(10)=(VictClassName="Mercenary",VictModel="*",VictSkin="*",VictSkinID=0,DmgCateg=DCG_List,DCGDmgList="Electrified,Jolted,Burned,Corroded,SolarBurnt",GoreTypeIDs="6,7",bDestroyOld=True)
	GoreTriggerTypes(11)=(VictClassName="Skaarj",VictModel="*",VictSkin="*",VictSkinID=0,DmgCateg=DCG_Headshot,DCGDmgList="",GoreTypeIDs="2,9",bDestroyOld=True)
	GoreTriggerTypes(12)=(VictClassName="Skaarj",VictModel="*",VictSkin="*",VictSkinID=0,DmgCateg=DCG_Gibbed,DCGDmgList="",GoreTypeIDs="4,7",bDestroyOld=False)
	GoreTriggerTypes(13)=(VictClassName="Queen",VictModel="*",VictSkin="*",VictSkinID=0,DmgCateg=DCG_Gibbed,DCGDmgList="",GoreTypeIDs="10",bDestroyOld=False)
	
	GoreBloodTypes(0)=(VictClassName="Bot",VictModel="*",VictSkin="*",VictSkinID=0,BloodType="RED")
	GoreBloodTypes(1)=(VictClassName="ScriptedPawn",VictModel="*",VictSkin="*",VictSkinID=0,BloodType="RED")
	GoreBloodTypes(2)=(VictClassName="Bot",VictModel="Botpack.Boss",VictSkin="*",VictSkinID=0,BloodType="SILVER")
	GoreBloodTypes(3)=(VictClassName="Bot",VictModel="*",VictSkin="Soldierskins.HKil*",VictSkinID=3,BloodType="SILVER")
	GoreBloodTypes(4)=(VictClassName="Bot",VictModel="*",VictSkin="SGirlSkins.FWar*",VictSkinID=3,BloodType="SILVER")
	GoreBloodTypes(5)=(VictClassName="Bot",VictModel="SkeletalChars.*",VictSkin="*",VictSkinID=0,BloodType="SILVER")
	GoreBloodTypes(6)=(VictClassName="Mercenary",VictModel="*",VictSkin="*",VictSkinID=0,BloodType="GREEN")
	
	GoreTriggerAlias(0)=(VictClassName="Bot",VictAliasClassName="PlayerPawn")
	GoreTriggerAlias(1)=(VictClassName="Bot",VictAliasClassName="Bots")
	GoreTriggerAlias(2)=(VictClassName="Bot",VictAliasClassName="Nali")
	GoreTriggerAlias(3)=(VictClassName="Fly",VictAliasClassName="DevilFish")
	GoreTriggerAlias(4)=(VictClassName="Fly",VictAliasClassName="Pupae")
	GoreTriggerAlias(5)=(VictClassName="Skaarj",VictAliasClassName="Krall")
	GoreTriggerAlias(6)=(VictClassName="Queen",VictAliasClassName="Titan")
	GoreTriggerAlias(7)=(VictClassName="Queen",VictAliasClassName="Warlord")
	
	GoreTypes(0)=(GoreClass="NWCoreVIII_SRC.NWMeatGlobPiece",PartsMin=20,PartsMax=25,SpeedMultXY=1.000000,SpeedMultZ=1.000000)
	GoreTypes(1)=(GoreClass="NWCoreVIII_SRC.NWGoreCord",PartsMin=0,PartsMax=3,SpeedMultXY=0.500000,SpeedMultZ=1.750000)
	GoreTypes(2)=(GoreClass="NWCoreVIII_SRC.NWGoreSkullParts",PartsMin=1,PartsMax=1,SpeedMultXY=0.250000,SpeedMultZ=0.250000)
	GoreTypes(3)=(GoreClass="NWCoreVIII_SRC.NWMeatGlobPieceAlt",PartsMin=15,PartsMax=30,SpeedMultXY=1.250000,SpeedMultZ=1.250000)
	GoreTypes(4)=(GoreClass="NWCoreVIII_SRC.NWGoreSkelParts",PartsMin=1,PartsMax=1,SpeedMultXY=0.850000,SpeedMultZ=0.850000)
	GoreTypes(5)=(GoreClass="NWCoreVIII_SRC.NWGoreIntestine",PartsMin=0,PartsMax=1,SpeedMultXY=0.500000,SpeedMultZ=1.650000)
	GoreTypes(6)=(GoreClass="NWCoreVIII_SRC.NWGoreSkel",PartsMin=1,PartsMax=1,SpeedMultXY=0.000000,SpeedMultZ=0.000000)
	GoreTypes(7)=(GoreClass="NWCoreVIII_SRC.NWMeatGlobPieceAlt",PartsMin=10,PartsMax=15,SpeedMultXY=1.250000,SpeedMultZ=1.250000)
	GoreTypes(8)=(GoreClass="NWCoreVIII_SRC.NWMeatGlobPiece",PartsMin=5,PartsMax=10,SpeedMultXY=1.000000,SpeedMultZ=1.000000)
	GoreTypes(9)=(GoreClass="NWCoreVIII_SRC.NWMeatGlobPiece",PartsMin=10,PartsMax=16,SpeedMultXY=1.000000,SpeedMultZ=1.000000)
	GoreTypes(10)=(GoreClass="NWCoreVIII_SRC.NWMeatGlobPieceAlt",PartsMin=30,PartsMax=40,SpeedMultXY=1.250000,SpeedMultZ=1.250000)
	
}