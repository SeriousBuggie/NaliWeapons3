//////////////////////////////////////////////////////////////
//				Feralidragon (07-03-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWSkillKillsManager expands Mutator config(NWConfig);

#exec AUDIO IMPORT NAME="NWSkillMsgSnd" FILE=SOUNDS\NWSkillMsgSnd.wav GROUP="Others"

var() class<NWUtils> UtilsClass;

var(ServerConfig) config bool enableSkillKills;
var(ServerConfig) config float PointsMultiplier;
var(ServerConfig) config float TimeBetweenMsgs;
var(ServerConfig) config localized string PointsMessage;
var(ServerConfig) config bool disableExtraPointsOnDMGames;
var(ServerConfig) config byte MaxMsgsMerging;

var(ClientConfig) config bool bUseClientColorSettings;
var(MixedConfig) config color MsgColor, MsgPointsColor;
var color serverMsgColor, serverMsgPointsColor;

var(ClientConfig) config bool bUseClientHeightSettings;
var(MixedConfig) config float MsgHeight, MsgPointsHeight;
var float serverMsgHeight, serverMsgPointsHeight;

var(ClientConfig) config bool bUseClientSoundSettings;
var(MixedConfig) config bool enableMsgSound;
var() sound MsgSound;
var bool serverEnableMsgSound;



/* Conditions:
 *		- disable=1 (disable this skill entirely)
 *		- dmglist=? (damage types)
 *		- gibbed=? (victim gibbed)
 *		- nogibbed=? (victim NOT gibbed)
 *		- headshot=? (victim headshot)
 *		- noheadshot=? (victim NOT headshot)
 *		- wpn=? (victim weapon class name)
 *		- mywpn=? (killer weapon class name)
 *		- ktime=? (max amount of time to count as same skill)
 *		- kills=? (amount of kills spaced by "ktime" seconds to count for this skill)
 *		- klimit=? (amount of max kills to invalidate this skill - related to kills)
 *		- airh=? (victim min air height)
 *		- myairh=? (killer min air height)
 *		- mindist=? (min distance from victim)
 *		- maxdist=? (max distance from victim)
 *		- minhealth=? (victim min health before the kill)
 *		- maxhealth=? (victim max health before the kill)
 *		- myminhealth=? (killer min health before the kill)
 *		- mymaxhealth=? (killer max health before the kill)
 *		- mindmg=? (kill min damage amount)
 *		- maxdmg=? (kill max damage amount)
 *		- minlftime=? (victim min lifetime before the kill - players and bots only)
 *		- maxlftime=? (victim max lifetime before the kill - players and bots only)
 *		- myminlftime=? (killer min lifetime before the kill - players and bots only)
 *		- mymaxlftime=? (killer max lifetime before the kill - players and bots only)
 *		- noview=? (victim does not see the killer)
 *		- mynoview=? (killer does not see the victim)
 *		- nowview=? (victim does not have line of sight to killer)
 *		- mynowview=? (killer does not have line of sight to victim)
 *		- waterzone=? (victim in water zone)
 *		- mywaterzone=? (killer in water zone)
 *		- dmgzone=? (victim in damage/kill zone)
 *		- mydmgzone=? (killer in damage/kill zone)
 *		- revenge=? (revenge act - players and bots only)
 *		- fragsdifdir=? (difference direction of number of frags: 1=(victim > killer), 2=(victim < killer))
 *		- pntsdifdir=? (difference direction of number of points: 1=(victim > killer), 2=(victim < killer))
 *		- minfragsdif=? (min difference of number of frags)
 *		- maxfragsdif=? (max difference of number of frags)
 *		- minpntsdif=? (min difference of number of points)
 *		- maxpntsdif=? (max difference of number of points)
 *		- minfrags=? (min number of victim frags)
 *		- maxfrags=? (max number of victim frags)
 *		- myminfrags=? (min number of killer frags)
 *		- mymaxfrags=? (max number of killer frags)
 *		- minpnts=? (min number of victim points)
 *		- maxpnts=? (max number of victim points)
 *		- myminpnts=? (min number of killer points)
 *		- mymaxpnts=? (max number of killer points)
 *		- denylist=? (deny indexes list)
 */
struct Skill
{
	var() string Conditions;
	var() localized string Message;	//Use %n for number of kills
	var() int extraPoints;
	var() int extraFrags;
	var() bool allowExcessPoints;
};
var(ServerConfig) config localized Skill Skills[128];


struct origSkill
{
	var string Message;
	var int extraPoints;
	var int extraFrags;
};
var origSkill originalSkills[128];


struct CachedSkill
{
	var bool enabled;
	var string dmgTypeList;
	var bool isGibbed, isHeadshot;
	var bool isNOTGibbed, isNOTHeadshot;
	var name victWClassName, myWClassName;
	var float killTime;
	var int kills, kLimit;
	var float victAirHeight, myAirHeight;
	var float minDist, maxDist;
	var int victMinHealth, victMaxHealth, myMinHealth, myMaxHealth;
	var int minDmg, maxDmg;
	var float victMinLifetime, victMaxLifetime, myMinLifetime, myMaxLifetime;
	var bool bVictNoView, bVictNoWallView, bMyNoView, bMyNoWallView;
	var bool bVictWaterZone, bMyWaterZone;
	var bool bVictDmgZone, bMyDmgZone;
	var bool bRevenge;
	var int minFragsDif, maxFragsDif, minPointsDif, maxPointsDif;
	var int minVictFrags, maxVictFrags, minMyFrags, maxMyFrags;
	var int minVictPoints, maxVictPoints, minMyPoints, maxMyPoints;
	var byte fragsDifDir, pointsDifDir;
	var string denyIndexesList;
	var string customCall;
	var string Message;
	var int extraPoints;
	var int extraFrags;
};
var CachedSkill CachedSkills[128];
var int CachedSkillsSize;
var name tempName;
var int tempVictHealth, tempMyHealth, tempDamage;

struct PlayerL
{
	var Pawn P;
	var string PendingSkills;		//Format: 1,2,3,4,5...
	var string ActiveTimedSkills;	//Format: 1=0.4,3;2=0.325,5;...
	var float timeAlive;
	var float timeSinceLastMsg;
	var Pawn LastKillers[5];
};
var PlayerL PlayerSkills[40];
var Pawn serverPlayers[40];
var string ClientMsgs[40], ClientPntsMsgs[40];
var byte clientCurMsgNotif[40], serverCurMsgNotif[40];
var byte clientCurMsgPntsNotif[40], serverCurMsgPntsNotif[40];


replication
{
	reliable if (Role == ROLE_Authority)
		ClientMsgs, ClientPntsMsgs, serverMsgColor, serverMsgPointsColor, serverMsgHeight, serverMsgPointsHeight, 
		MsgSound, serverEnableMsgSound, serverCurMsgNotif, serverCurMsgPntsNotif, serverPlayers;
}


function PostBeginPlay()
{
local int i;

	serverMsgColor = default.MsgColor;
	serverMsgPointsColor = default.MsgPointsColor;
	serverMsgHeight = default.MsgHeight;
	serverMsgPointsHeight = default.MsgPointsHeight;
	serverEnableMsgSound = default.enableMsgSound;

	for (i = ArrayCount(Skills) - 1; i >= 0; i--)
	{
		if (Skills[i].Conditions != "")
		{
			CachedSkillsSize = i + 1;
			break;
		}
	}
	
	for (i =0; i < CachedSkillsSize; i++)
	{
		if (Skills[i].Conditions != "")
		{
			CachedSkills[i].enabled = !Bool(UtilsClass.static.getValueFromSettingsString("disable", Skills[i].Conditions));
			CachedSkills[i].dmgTypeList = UtilsClass.static.getValueFromSettingsString("dmglist", Skills[i].Conditions);
			CachedSkills[i].isGibbed = Bool(UtilsClass.static.getValueFromSettingsString("gibbed", Skills[i].Conditions));
			CachedSkills[i].isNOTGibbed = Bool(UtilsClass.static.getValueFromSettingsString("nogibbed", Skills[i].Conditions));
			CachedSkills[i].isHeadshot = Bool(UtilsClass.static.getValueFromSettingsString("headshot", Skills[i].Conditions));
			CachedSkills[i].isNOTHeadshot = Bool(UtilsClass.static.getValueFromSettingsString("noheadshot", Skills[i].Conditions));
			CachedSkills[i].victWClassName = getNameFromString(UtilsClass.static.getValueFromSettingsString("wpn", Skills[i].Conditions));
			CachedSkills[i].myWClassName = getNameFromString(UtilsClass.static.getValueFromSettingsString("mywpn", Skills[i].Conditions));
			CachedSkills[i].killTime = Float(UtilsClass.static.getValueFromSettingsString("ktime", Skills[i].Conditions));
			CachedSkills[i].kills = Int(UtilsClass.static.getValueFromSettingsString("kills", Skills[i].Conditions));
			CachedSkills[i].kLimit = Int(UtilsClass.static.getValueFromSettingsString("klimit", Skills[i].Conditions));
			CachedSkills[i].victAirHeight = Float(UtilsClass.static.getValueFromSettingsString("airh", Skills[i].Conditions));
			CachedSkills[i].myAirHeight = Float(UtilsClass.static.getValueFromSettingsString("myairh", Skills[i].Conditions));
			CachedSkills[i].minDist = Float(UtilsClass.static.getValueFromSettingsString("mindist", Skills[i].Conditions));
			CachedSkills[i].maxDist = Float(UtilsClass.static.getValueFromSettingsString("maxdist", Skills[i].Conditions));
			CachedSkills[i].victMinHealth = Int(UtilsClass.static.getValueFromSettingsString("minhealth", Skills[i].Conditions));
			CachedSkills[i].victMaxHealth = Int(UtilsClass.static.getValueFromSettingsString("maxhealth", Skills[i].Conditions));
			CachedSkills[i].myMinHealth = Int(UtilsClass.static.getValueFromSettingsString("myminhealth", Skills[i].Conditions));
			CachedSkills[i].myMaxHealth = Int(UtilsClass.static.getValueFromSettingsString("mymaxhealth", Skills[i].Conditions));
			CachedSkills[i].minDmg = Int(UtilsClass.static.getValueFromSettingsString("mindmg", Skills[i].Conditions));
			CachedSkills[i].maxDmg = Int(UtilsClass.static.getValueFromSettingsString("maxdmg", Skills[i].Conditions));
			CachedSkills[i].victMinLifetime = Float(UtilsClass.static.getValueFromSettingsString("minlftime", Skills[i].Conditions));
			CachedSkills[i].victMaxLifetime = Float(UtilsClass.static.getValueFromSettingsString("maxlftime", Skills[i].Conditions));
			CachedSkills[i].myMinLifetime = Float(UtilsClass.static.getValueFromSettingsString("myminlftime", Skills[i].Conditions));
			CachedSkills[i].myMaxLifetime = Float(UtilsClass.static.getValueFromSettingsString("mymaxlftime", Skills[i].Conditions));
			CachedSkills[i].bVictNoView = Bool(UtilsClass.static.getValueFromSettingsString("noview", Skills[i].Conditions));
			CachedSkills[i].bVictNoWallView = Bool(UtilsClass.static.getValueFromSettingsString("nowview", Skills[i].Conditions));
			CachedSkills[i].bMyNoView = Bool(UtilsClass.static.getValueFromSettingsString("mynoview", Skills[i].Conditions));
			CachedSkills[i].bMyNoWallView = Bool(UtilsClass.static.getValueFromSettingsString("mynowview", Skills[i].Conditions));
			CachedSkills[i].bVictWaterZone = Bool(UtilsClass.static.getValueFromSettingsString("waterzone", Skills[i].Conditions));
			CachedSkills[i].bMyWaterZone = Bool(UtilsClass.static.getValueFromSettingsString("mywaterzone", Skills[i].Conditions));
			CachedSkills[i].bVictDmgZone = Bool(UtilsClass.static.getValueFromSettingsString("dmgzone", Skills[i].Conditions));
			CachedSkills[i].bMyDmgZone = Bool(UtilsClass.static.getValueFromSettingsString("mydmgzone", Skills[i].Conditions));
			CachedSkills[i].bRevenge = Bool(UtilsClass.static.getValueFromSettingsString("revenge", Skills[i].Conditions));
			CachedSkills[i].minFragsDif = Int(UtilsClass.static.getValueFromSettingsString("minfragsdif", Skills[i].Conditions));
			CachedSkills[i].maxFragsDif = Int(UtilsClass.static.getValueFromSettingsString("maxfragsdif", Skills[i].Conditions));
			CachedSkills[i].minPointsDif = Int(UtilsClass.static.getValueFromSettingsString("minpntsdif", Skills[i].Conditions));
			CachedSkills[i].maxPointsDif = Int(UtilsClass.static.getValueFromSettingsString("maxpntsdif", Skills[i].Conditions));
			CachedSkills[i].minVictFrags = Int(UtilsClass.static.getValueFromSettingsString("minfrags", Skills[i].Conditions));
			CachedSkills[i].maxVictFrags = Int(UtilsClass.static.getValueFromSettingsString("maxfrags", Skills[i].Conditions));
			CachedSkills[i].minMyFrags = Int(UtilsClass.static.getValueFromSettingsString("myminfrags", Skills[i].Conditions));
			CachedSkills[i].maxMyFrags = Int(UtilsClass.static.getValueFromSettingsString("mymaxfrags", Skills[i].Conditions));
			CachedSkills[i].minVictPoints = Int(UtilsClass.static.getValueFromSettingsString("minpnts", Skills[i].Conditions));
			CachedSkills[i].maxVictPoints = Int(UtilsClass.static.getValueFromSettingsString("maxpnts", Skills[i].Conditions));
			CachedSkills[i].minMyPoints = Int(UtilsClass.static.getValueFromSettingsString("myminpnts", Skills[i].Conditions));
			CachedSkills[i].maxMyPoints = Int(UtilsClass.static.getValueFromSettingsString("mymaxpnts", Skills[i].Conditions));
			CachedSkills[i].fragsDifDir = Byte(UtilsClass.static.getValueFromSettingsString("fragsdifdir", Skills[i].Conditions));
			CachedSkills[i].pointsDifDir = Byte(UtilsClass.static.getValueFromSettingsString("pntsdifdir", Skills[i].Conditions));
			CachedSkills[i].denyIndexesList = UtilsClass.static.getValueFromSettingsString("denylist", Skills[i].Conditions);
			CachedSkills[i].customCall = UtilsClass.static.getValueFromSettingsString("C", Skills[i].Conditions);
			CachedSkills[i].Message = Skills[i].Message;
			CachedSkills[i].extraPoints = Skills[i].extraPoints;
			CachedSkills[i].extraFrags = Skills[i].extraFrags;
			originalSkills[i].Message = Skills[i].Message;
			originalSkills[i].extraPoints = Skills[i].extraPoints;
			originalSkills[i].extraFrags = Skills[i].extraFrags;
			
			if (PointsMultiplier > 0.0)
			{
				CachedSkills[i].minPointsDif *= PointsMultiplier;
				CachedSkills[i].maxPointsDif *= PointsMultiplier;
				CachedSkills[i].minVictPoints *= PointsMultiplier;
				CachedSkills[i].maxVictPoints *= PointsMultiplier;
				CachedSkills[i].minMyPoints *= PointsMultiplier;
				CachedSkills[i].maxMyPoints *= PointsMultiplier;
			}
		}
	}
	
	Level.Game.RegisterDamageMutator(Self);
	Super.PostBeginPlay();
}

function name getNameFromString(string str)
{
	SetPropertyText("tempName", str);
	return tempName;
}

simulated function color getMsgColor(int msgID, bool bPoints)
{
	if (bUseClientColorSettings)
	{
		if (bPoints)
			return MsgPointsColor;
		return MsgColor;
	}
	
	if (bPoints)
		return serverMsgPointsColor;
	return serverMsgColor;
}

simulated function float getMsgHeight(int msgID, bool bPoints)
{
	if (bUseClientHeightSettings)
	{
		if (bPoints)
			return MsgPointsHeight;
		return MsgHeight;
	}
	
	if (bPoints)
		return serverMsgPointsHeight;
	return serverMsgHeight;
}

simulated function sound getMsgSound(int msgID, bool bPoints)
{
	if ((ClientMsgs[msgID] != "" && bPoints) || ((bUseClientSoundSettings && !enableMsgSound) || (!bUseClientSoundSettings && !serverEnableMsgSound)))
		return None;
	return MsgSound;
}

function ModifyPlayer(Pawn Other)
{
	if (Spectator(Other) == None && (Bot(Other) != None || PlayerPawn(Other) != None))
		addToPlayerList(Other);
	
	if (NextMutator != None)
		NextMutator.ModifyPlayer(Other);
}

function bool isInPlayerList(Pawn P)
{
local int i;

	for (i = 0; i < ArrayCount(PlayerSkills); i++)
	{
		if (PlayerSkills[i].P == P)
			return True;
	}
	return False;
}

function int addToPlayerList(Pawn Other)
{
local int i, curSlot;

	if (Other == None)
		return -1;
	curSlot = getPlayerIndex(Other);
	if (curSlot >= 0)
	{
		PlayerSkills[curSlot].timeAlive = 0;
		return -2;
	}

	for (i = 0; i < ArrayCount(PlayerSkills); i++)
	{
		if (PlayerSkills[i].P == None || PlayerSkills[i].P.bDeleteMe)
		{
			PlayerSkills[i].P = Other;
			PlayerSkills[i].PendingSkills = "";
			PlayerSkills[i].ActiveTimedSkills = "";
			PlayerSkills[i].timeAlive = 0;
			PlayerSkills[i].timeSinceLastMsg = 0;
			return i;
		}
	}
	return -3;
}

function int getPlayerIndex(Pawn Other)
{
local int i;

	for (i = 0; i < ArrayCount(PlayerSkills); i++)
	{
		if (PlayerSkills[i].P == Other)
			return i;
	}
	return -1;
}

function MutatorTakeDamage(out int ActualDamage, Pawn Victim, Pawn InstigatedBy, out Vector HitLocation, out Vector Momentum, name DamageType)
{
	if (NextDamageMutator != None)
		NextDamageMutator.MutatorTakeDamage(ActualDamage, Victim, InstigatedBy, HitLocation, Momentum, DamageType);
		
	if (Victim != None && InstigatedBy != None && Victim != InstigatedBy)
	{
		tempVictHealth = Victim.Health;
		tempMyHealth = InstigatedBy.Health;
		tempDamage = ActualDamage;
	}
}

function bool PreventDeath(Pawn Killed, Pawn Killer, name damageType, vector HitLocation)
{
local bool bPreventDeath;

	bPreventDeath = (NextMutator != None && NextMutator.PreventDeath(Killed, Killer, damageType, HitLocation));
	if (!bPreventDeath && Killer != None && Killed != None && Killed != Killer)
		processSkill(getPlayerIndex(Killer), Killer, Killed, damageType);
	return bPreventDeath;
}

simulated function Tick(float Delta)
{
local int i, k;

	if (Role == ROLE_Authority)
	{
		for (i = 0; i < ArrayCount(PlayerSkills); i++)
		{
			if (PlayerSkills[i].P != None && !PlayerSkills[i].P.bDeleteMe)
			{
				if (!PlayerSkills[i].P.bHidden && PlayerSkills[i].P.Health > 0)
					PlayerSkills[i].timeAlive += Delta;
				PlayerSkills[i].timeSinceLastMsg += Delta;
				updateSkillNotifications(Delta, i);
			}
		}
	}
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		for (k = 0; k < ArrayCount(serverPlayers); k++)
		{
			if (serverPlayers[k] != None && !serverPlayers[k].bDeleteMe)
			{
				if (clientCurMsgNotif[k] != serverCurMsgNotif[k])
				{
					serverPlayers[k].ReceiveLocalizedMessage(Class'NWSkillMsgPlus', k,,, Self);
					clientCurMsgNotif[k] = serverCurMsgNotif[k];
				}
				
				if (clientCurMsgPntsNotif[k] != serverCurMsgPntsNotif[k])
				{
					serverPlayers[k].ReceiveLocalizedMessage(Class'NWSkillMsgPlusPoints', k,,, Self);
					clientCurMsgPntsNotif[k] = serverCurMsgPntsNotif[k];
				}
			}
		}
	}
}

function updateSkillNotifications(float Delta, int k)
{
local string actvProperty, actvData, getData, dataFetched;
local string initSavedData, newSaveData, jData;
local int i, j, actvIndex, msgID, id, merged;
local byte l;
local float kTime;
local int kNumber;
local string msgs[4];
local int tempPoints, tempFrags, tempKills;

	if (PlayerSkills[k].P == None || PlayerSkills[k].P.bDeleteMe || PlayerSkills[k].timeSinceLastMsg < TimeBetweenMsgs || 
	(PlayerSkills[k].ActiveTimedSkills == "" && PlayerSkills[k].PendingSkills == ""))
		return;
		
	//Process active first
	i = 0;
	while (UtilsClass.static.hasPropertyFromStringList(PlayerSkills[k].ActiveTimedSkills, i, actvProperty, actvData))
	{
		actvIndex = Int(actvProperty);
		UtilsClass.static.hasValueFromStringList(actvData, 0, getData);
		kTime = Float(getData);
		UtilsClass.static.hasValueFromStringList(actvData, 1, getData);
		kNumber = Int(getData);
		initSavedData = getFormatedActiveTimedData(actvIndex, kTime, kNumber);
		
		kTime += Delta;
		if (kTime >= CachedSkills[actvIndex].killTime)
		{
			if (kNumber >= CachedSkills[actvIndex].kills && (CachedSkills[actvIndex].kLimit <= 0 || kNumber <= CachedSkills[actvIndex].kLimit))
				addPendingSkill(k, actvIndex, kNumber);
			PlayerSkills[k].ActiveTimedSkills = UtilsClass.static.ReplaceStr(initSavedData, "", PlayerSkills[k].ActiveTimedSkills);
		}
		else
		{
			newSaveData = getFormatedActiveTimedData(actvIndex, kTime, kNumber);
			PlayerSkills[k].ActiveTimedSkills = UtilsClass.static.ReplaceStr(initSavedData, newSaveData, PlayerSkills[k].ActiveTimedSkills);
		}
		i++;
	}
	
	//Process pending
	if (!UtilsClass.static.hasValueFromStringList(PlayerSkills[k].PendingSkills, 0, getData))
		return;

	msgID = Int(getData);
	tempKills = 1;
	if (MaxMsgsMerging > 0)
	{
		for (l = 0; l < Min(ArrayCount(msgs), MaxMsgsMerging); l++)
		{
			j = 0;
			merged = 0;
			jData = "";
			getData = "";
			while (PlayerSkills[k].PendingSkills != "" && UtilsClass.static.hasValueFromStringList(PlayerSkills[k].PendingSkills, j, getData))
			{
				if (j == 0)
				{
					jData = getData;
					id = Int(getData);	
				}
				
				j++;
				if (getData == "" || getData != jData)
					continue;
				tempPoints += CachedSkills[id].extraPoints;
				tempFrags += CachedSkills[id].extraFrags;
				merged++;
				if (CachedSkills[id].kills > 1)
					break;
			}
			
			if (jData != "")
			{
				msgs[l] = CachedSkills[id].Message;
				if (CachedSkills[id].kills > 1)
				{
					UtilsClass.static.hasValueFromStringList(PlayerSkills[k].PendingSkills, 1, getData);
					dataFetched = jData $ "," $ getData $ ",";
					tempKills = Int(getData);
					msgs[l] = UtilsClass.static.ReplaceStr("%n", tempKills, msgs[l]);
					PlayerSkills[k].PendingSkills = Mid(PlayerSkills[k].PendingSkills, Len(dataFetched));
					if (Skills[id].allowExcessPoints)
						tempPoints += ((tempKills - CachedSkills[id].kills)*(CachedSkills[id].extraPoints/CachedSkills[id].kills));
				}
				else
				{
					if (merged > 1 && msgs[l] != "")
						msgs[l] = "x"$merged@msgs[l];
					PlayerSkills[k].PendingSkills = UtilsClass.static.ReplaceStr(","$jData$",", ",", PlayerSkills[k].PendingSkills);
					if (UtilsClass.static.hasValueFromStringList(PlayerSkills[k].PendingSkills, 0, getData) && getData == jData)
						PlayerSkills[k].PendingSkills = Mid(PlayerSkills[k].PendingSkills, Len(jData$","));
				}
			}
		}
		
		ClientMsgs[k] = "";
		for (l = 0; l < Min(ArrayCount(msgs), MaxMsgsMerging); l++)
		{
			if (msgs[l] != "")
			{
				if (ClientMsgs[k] == "")
					ClientMsgs[k] = msgs[l];
				else
					ClientMsgs[k] = ClientMsgs[k]@" + "@msgs[l];
			}
		}
	}
	else 
	{
		dataFetched = getData $ ",";
		tempPoints = CachedSkills[msgID].extraPoints;
		tempFrags = CachedSkills[msgID].extraFrags;
		ClientMsgs[k] = CachedSkills[msgID].Message;
		if (CachedSkills[msgID].kills > 1)
		{
			UtilsClass.static.hasValueFromStringList(PlayerSkills[k].PendingSkills, 1, getData);
			dataFetched = dataFetched $ getData $ ",";
			tempKills = Int(getData);
			ClientMsgs[k] = UtilsClass.static.ReplaceStr("%n", tempKills, ClientMsgs[k]);
		}
		PlayerSkills[k].PendingSkills = Mid(PlayerSkills[k].PendingSkills, Len(dataFetched));
	}
	
	tempPoints *= PointsMultiplier;
	ClientPntsMsgs[k] = "";
	PlayerSkills[k].timeSinceLastMsg = 0.0;
	serverPlayers[k] = PlayerSkills[k].P;
	if (ClientMsgs[k] != "")
		serverCurMsgNotif[k]++;
	
	if (tempFrags > 0)
	{
		PlayerSkills[k].P.KillCount += tempFrags;
		if (PlayerSkills[k].P.PlayerReplicationInfo != None)
			PlayerSkills[k].P.PlayerReplicationInfo.Score += tempFrags;
	}
	
	if (tempPoints > 0 && (!disableExtraPointsOnDMGames || !UtilsClass.static.isDMGame(Level.Game)))
	{
		ClientPntsMsgs[k] = UtilsClass.static.ReplaceStr("%n", tempPoints, PointsMessage);
		if (PlayerSkills[k].P.PlayerReplicationInfo != None)
			PlayerSkills[k].P.PlayerReplicationInfo.Score += tempPoints;
		serverCurMsgPntsNotif[k]++;
	}
}

simulated function string getSkillMessage(int msgID)
{
	return ClientMsgs[msgID];
}

simulated function string getSkillMessagePoints(int msgID)
{
	return ClientPntsMsgs[msgID];
}

function processSkill(int k, Pawn Killer, Pawn Victim, name damageType)
{
local string jData, activeData;
local string initSavedData, newSaveData;
local string denyList;
local int i, j, victIndex;
local bool b;
local float kTime;
local int kNumber;
local NWMutator NWM;

	if (k < 0 || k >= ArrayCount(PlayerSkills) || Killer == None || Victim == None || damageType == '')
		return;
	
	for (i = CachedSkillsSize - 1; i >= 0; i--)
	{
		if (Skills[i].Conditions == "" || !CachedSkills[i].enabled)
			continue;
	
		//Check deny list
		if (denyList != "")
		{
			j = 0;
			b = False;
			while (UtilsClass.static.hasValueFromStringList(denyList, j, jData))
			{
				if (jData != "" && i == Int(jData))
				{
					b = True;
					break;
				}
				j++;
			}
			if (b)
				continue;
		}
		
		//Check custom calls
		if (CachedSkills[i].customCall != "")
		{
			CachedSkills[i].Message = originalSkills[i].Message;
			CachedSkills[i].extraPoints = originalSkills[i].extraPoints;
			CachedSkills[i].extraFrags = originalSkills[i].extraFrags;
			NWM = Class'NWUtils'.static.getNWMutator(Level);
			if (NWM != None)
			{
				j = 0;
				b = False;
				while (UtilsClass.static.hasValueFromStringList(CachedSkills[i].customCall, j, jData))
				{
					if (NWM.ignoreSkillKill(jData, CachedSkills[i].Message, denyList, CachedSkills[i].extraPoints, CachedSkills[i].extraFrags))
					{
						b = True;
						break;
					}
					j++;
				}
				if (b)
					continue;
			}
		}
		
		//Check damage type
		if (CachedSkills[i].dmgTypeList != "")
		{
			j = 0;
			b = False;
			while (UtilsClass.static.hasValueFromStringList(CachedSkills[i].dmgTypeList, j, jData))
			{
				if (String(damageType) ~= jData)
				{
					b = True;
					break;
				}
				j++;
			}
			if (!b)
				continue;
		}
		
		//Gibbed & Headshot
		if (CachedSkills[i].isGibbed && !Victim.Gibbed(damageType))
			continue;
		if (CachedSkills[i].isNOTGibbed && Victim.Gibbed(damageType))
			continue;
		if (CachedSkills[i].isHeadshot && damageType != 'Decapitated')
			continue;
		if (CachedSkills[i].isNOTHeadshot && damageType == 'Decapitated')
			continue;
		
		//Weapon class name
		if (CachedSkills[i].victWClassName != '' && (Victim.Weapon == None || !Victim.Weapon.IsA(CachedSkills[i].victWClassName)))
			continue;
		if (CachedSkills[i].myWClassName != '' && (Killer.Weapon == None || !Killer.Weapon.IsA(CachedSkills[i].myWClassName)))
			continue;
		
		//Distances
		if (CachedSkills[i].victAirHeight > 0.0 && !Victim.FastTrace(Victim.Location + Normal(Victim.Region.Zone.ZoneGravity)*CachedSkills[i].victAirHeight, Victim.Location))
			continue;
		if (CachedSkills[i].myAirHeight > 0.0 && !Killer.FastTrace(Killer.Location + Normal(Killer.Region.Zone.ZoneGravity)*CachedSkills[i].myAirHeight, Killer.Location))
			continue;
		if (CachedSkills[i].minDist > 0.0 && VSize(Killer.Location - Victim.Location) < CachedSkills[i].minDist)
			continue;
		if (CachedSkills[i].maxDist > 0.0 && VSize(Killer.Location - Victim.Location) > CachedSkills[i].maxDist)
			continue;
			
		//Views
		if (CachedSkills[i].bVictNoView && Victim.CanSee(Killer))
			continue;
		if (CachedSkills[i].bMyNoView && Killer.CanSee(Victim))
			continue;
		if (CachedSkills[i].bVictNoWallView && Victim.FastTrace(Killer.Location))
			continue;
		if (CachedSkills[i].bMyNoWallView && Killer.FastTrace(Victim.Location))
			continue;
			
		//Zones
		if (CachedSkills[i].bVictWaterZone && !Victim.Region.Zone.bWaterZone)
			continue;
		if (CachedSkills[i].bMyWaterZone && !Killer.Region.Zone.bWaterZone)
			continue;
		if (CachedSkills[i].bVictDmgZone && Victim.Region.Zone.DamagePerSec <= 0 && !Victim.Region.Zone.bKillZone)
			continue;
		if (CachedSkills[i].bMyDmgZone && Killer.Region.Zone.DamagePerSec <= 0 && !Killer.Region.Zone.bKillZone)
			continue;
			
		//Lifetime
		if (CachedSkills[i].victMinLifetime > 0.0 || CachedSkills[i].victMaxLifetime > 0.0)
		{
			victIndex = getPlayerIndex(Victim);
			if (victIndex >= 0)
			{
				if (CachedSkills[i].victMinLifetime > 0.0 && PlayerSkills[victIndex].timeAlive < CachedSkills[i].victMinLifetime)
					continue;
				if (CachedSkills[i].victMaxLifetime > 0.0 && PlayerSkills[victIndex].timeAlive > CachedSkills[i].victMaxLifetime)
					continue;
			}
			else
				continue;
		}
		if (CachedSkills[i].myMinLifetime > 0.0 && PlayerSkills[k].timeAlive < CachedSkills[i].myMinLifetime)
			continue;
		if (CachedSkills[i].myMaxLifetime > 0.0 && PlayerSkills[k].timeAlive > CachedSkills[i].myMaxLifetime)
			continue;
			
		//Health and Damage
		if (CachedSkills[i].victMinHealth > 0 && tempVictHealth < CachedSkills[i].victMinHealth)
			continue;
		if (CachedSkills[i].victMaxHealth > 0 && tempVictHealth > CachedSkills[i].victMaxHealth)
			continue;
		if (CachedSkills[i].myMinHealth > 0 && tempMyHealth < CachedSkills[i].myMinHealth)
			continue;
		if (CachedSkills[i].myMaxHealth > 0 && tempMyHealth > CachedSkills[i].myMaxHealth)
			continue;
		if (CachedSkills[i].minDmg > 0 && tempDamage < CachedSkills[i].minDmg)
			continue;
		if (CachedSkills[i].maxDmg > 0 && tempDamage > CachedSkills[i].maxDmg)
			continue;
			
		//Frags
		if (CachedSkills[i].fragsDifDir == 1 && Victim.KillCount < Killer.KillCount)
			continue;
		if (CachedSkills[i].fragsDifDir == 2 && Victim.KillCount > Killer.KillCount)
			continue;
		if (CachedSkills[i].minFragsDif > 0 && Abs(Victim.KillCount - Killer.KillCount) < CachedSkills[i].minFragsDif)
			continue;
		if (CachedSkills[i].maxFragsDif > 0 && Abs(Victim.KillCount - Killer.KillCount) > CachedSkills[i].maxFragsDif)
			continue;
		if (CachedSkills[i].minVictFrags != 0 && Victim.KillCount < CachedSkills[i].minVictFrags)
			continue;
		if (CachedSkills[i].maxVictFrags != 0 && Victim.KillCount > CachedSkills[i].maxVictFrags)
			continue;
		if (CachedSkills[i].minMyFrags != 0 && Killer.KillCount < CachedSkills[i].minMyFrags)
			continue;
		if (CachedSkills[i].maxMyFrags != 0 && Killer.KillCount > CachedSkills[i].maxMyFrags)
			continue;
			
		//Points
		if (CachedSkills[i].minPointsDif > 0 || CachedSkills[i].maxPointsDif > 0)
		{
			if (Victim.PlayerReplicationInfo == None || Killer.PlayerReplicationInfo == None)
				continue;
			if (CachedSkills[i].pointsDifDir == 1 && Victim.PlayerReplicationInfo.Score < Killer.PlayerReplicationInfo.Score)
				continue;
			if (CachedSkills[i].pointsDifDir == 2 && Victim.PlayerReplicationInfo.Score > Killer.PlayerReplicationInfo.Score)
				continue;
			if (CachedSkills[i].minPointsDif > 0 && Abs(Victim.PlayerReplicationInfo.Score - Killer.PlayerReplicationInfo.Score) < CachedSkills[i].minPointsDif)
				continue;
			if (CachedSkills[i].maxPointsDif > 0 && Abs(Victim.PlayerReplicationInfo.Score - Killer.PlayerReplicationInfo.Score) > CachedSkills[i].maxPointsDif)
				continue;
		}
		if (CachedSkills[i].minVictPoints != 0 || CachedSkills[i].maxVictPoints != 0)
		{
			if (Victim.PlayerReplicationInfo == None)
				continue;
			if (CachedSkills[i].minVictPoints != 0 && Victim.PlayerReplicationInfo.Score < CachedSkills[i].minVictPoints)
				continue;
			if (CachedSkills[i].maxVictPoints != 0 && Victim.PlayerReplicationInfo.Score > CachedSkills[i].maxVictPoints)
				continue;
		}
		if (CachedSkills[i].minMyPoints != 0 || CachedSkills[i].maxMyPoints != 0)
		{
			if (Killer.PlayerReplicationInfo == None)
				continue;
			if (CachedSkills[i].minMyPoints != 0 && Killer.PlayerReplicationInfo.Score < CachedSkills[i].minMyPoints)
				continue;
			if (CachedSkills[i].maxMyPoints != 0 && Killer.PlayerReplicationInfo.Score > CachedSkills[i].maxMyPoints)
				continue;
		}
		
		//Revenge
		if (CachedSkills[i].bRevenge)
		{
			b = False;
			for (j = 0; j < ArrayCount(PlayerSkills[k].LastKillers); j++)
			{
				if (Victim == PlayerSkills[k].LastKillers[j])
				{
					b = True;
					break;
				}
			}
			if (!b)
				continue;
		}
		
		//Process new deny list
		if (CachedSkills[i].denyIndexesList != "")
		{
			if (denyList == "")
				denyList = CachedSkills[i].denyIndexesList;
			else
				denyList = denyList $ "," $ CachedSkills[i].denyIndexesList;
		}
			
		//Finish process
		if (CachedSkills[i].kills > 1)
		{
			activeData = UtilsClass.static.getValueFromSettingsString(i, PlayerSkills[k].ActiveTimedSkills);
			if (activeData == "")
			{
				activeData = getActiveTimeData();
				PlayerSkills[k].ActiveTimedSkills = PlayerSkills[k].ActiveTimedSkills $ getFormatedActiveTimedData(i,,, activeData);
			}
				
			UtilsClass.static.hasValueFromStringList(activeData, 0, jData);
			kTime = Float(jData);
			UtilsClass.static.hasValueFromStringList(activeData, 1, jData);
			kNumber = Int(jData);
			initSavedData = getFormatedActiveTimedData(i, kTime, kNumber);
			kNumber++;
			newSaveData = getFormatedActiveTimedData(i, 0.0, kNumber);
			PlayerSkills[k].ActiveTimedSkills = UtilsClass.static.ReplaceStr(initSavedData, newSaveData, PlayerSkills[k].ActiveTimedSkills);
		}
		else
			addPendingSkill(k, i);
			
		if (CachedSkills[i].denyIndexesList ~= "all")
			break;
	}
	
	tempVictHealth = 0;
	tempMyHealth = 0;
	tempDamage = 0;
	cleanActiveSkillsList(k, denyList);
	
	for (j = 0; j < ArrayCount(PlayerSkills[k].LastKillers); j++)
	{
		if (PlayerSkills[k].LastKillers[j] == Victim)
		{
			PlayerSkills[k].LastKillers[j] = None;
			break;
		}
	}
	
	victIndex = getPlayerIndex(Victim);
	if (victIndex >= 0)
	{
		for (j = 0; j < ArrayCount(PlayerSkills[victIndex].LastKillers); j++)
		{
			if (PlayerSkills[victIndex].LastKillers[j] == Killer)
				return;
		}
		for (j = 0; j < ArrayCount(PlayerSkills[victIndex].LastKillers); j++)
		{
			if (PlayerSkills[victIndex].LastKillers[j] == None || PlayerSkills[victIndex].LastKillers[j].bDeleteMe)
			{
				PlayerSkills[victIndex].LastKillers[j] = Killer;
				return;
			}
		}
		PlayerSkills[victIndex].LastKillers[Rand(ArrayCount(PlayerSkills[victIndex].LastKillers))] = Killer;
	}
}

function cleanActiveSkillsList(int k, string denyList)
{
local string activeData, iData;
local int i;

	if (denyList == "" || PlayerSkills[k].ActiveTimedSkills == "")
		return;

	i = 0;
	while (UtilsClass.static.hasValueFromStringList(denyList, i, iData))
	{
		if (iData != "")
		{
			activeData = UtilsClass.static.getValueFromSettingsString(iData, PlayerSkills[k].ActiveTimedSkills);
			if (activeData != "")
				PlayerSkills[k].ActiveTimedSkills = UtilsClass.static.ReplaceStr(iData$"="$activeData$";", "", PlayerSkills[k].ActiveTimedSkills);
		}
		i++;
	}
}

function addPendingSkill(int pIndex, int sIndex, optional coerce string extraData)
{
local string data;

	data =  sIndex $ ",";
	if (extraData != "")
	{
		data = data $ extraData $ ",";
		PlayerSkills[pIndex].PendingSkills = data $ PlayerSkills[pIndex].PendingSkills;
	}
	else
		PlayerSkills[pIndex].PendingSkills = PlayerSkills[pIndex].PendingSkills $ data;
}

function string getFormatedActiveTimedData(int i, optional float ktime, optional int kkills, optional string formattedData)
{
	if (formattedData != "")
		return (i $ "=" $ formattedData $ ";");
	return (i $ "=" $ getActiveTimeData(ktime, kkills) $ ";");
}

function string getActiveTimeData(optional float ktime, optional int kkills)
{
	return (ktime $ "," $ kkills);
}

defaultproperties
{
	UtilsClass=Class'NWUtils'
	RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=True
	bAlwaysTick=True
	MsgSound=NWSkillMsgSnd
	
	
	enableSkillKills=True
	PointsMultiplier=1.000000
	disableExtraPointsOnDMGames=True
	TimeBetweenMsgs=2.500000
	MaxMsgsMerging=3
	PointsMessage="+%n"
	
	bUseClientColorSettings=False
	MsgColor=(R=192,G=192,B=192)
	MsgPointsColor=(R=0,G=128,B=0)
	bUseClientHeightSettings=False
	MsgHeight=0.6500000
	MsgPointsHeight=0.620000
	bUseClientSoundSettings=False
	enableMsgSound=True
	
	
	Skills(0)=(Conditions="headshot=1;",Message="",extraPoints=20,extraFrags=1,allowExcessPoints=False)
	Skills(1)=(Conditions="revenge=1;",Message="Revenge",extraPoints=15,extraFrags=0,allowExcessPoints=False)
	Skills(2)=(Conditions="maxlftime=3.5;minhealth=100;",Message="Spawnkill",extraPoints=0,extraFrags=0,allowExcessPoints=False)
	Skills(3)=(Conditions="mindist=2500;",Message="Long Range Kill",extraPoints=8,extraFrags=0,allowExcessPoints=False)
	Skills(4)=(Conditions="mindist=5000;denylist=3;",Message="Super Long Range Kill",extraPoints=15,extraFrags=0,allowExcessPoints=False)
	Skills(5)=(Conditions="myminhealth=1;mymaxhealth=10;",Message="Close Call",extraPoints=20,extraFrags=0,allowExcessPoints=False)
	Skills(6)=(Conditions="minhealth=150;mymaxhealth=100;",Message="Juggernaut Killer",extraPoints=35,extraFrags=0,allowExcessPoints=False)
	Skills(7)=(Conditions="maxhealth=10;",Message="No Mercy",extraPoints=0,extraFrags=0,allowExcessPoints=False)
	Skills(8)=(Conditions="airh=100;mindist=1000;",Message="Eagle Eye",extraPoints=40,extraFrags=0,allowExcessPoints=False)
	Skills(9)=(Conditions="headshot=1;airh=100;mindist=600;denylist=8;",Message="Damn!",extraPoints=65,extraFrags=0,allowExcessPoints=False)
	Skills(10)=(Conditions="myairh=100;mindist=600;",Message="Target Eliminated",extraPoints=35,extraFrags=0,allowExcessPoints=False)
	Skills(11)=(Conditions="headshot=1;myairh=100;mindist=600;denylist=10;",Message="Top Gun",extraPoints=55,extraFrags=0,allowExcessPoints=False)
	Skills(12)=(Conditions="myairh=100;airh=400;mindist=1000;denylist=8,9,10,11;",Message="Matrix Style",extraPoints=75,extraFrags=0,allowExcessPoints=False)
	Skills(13)=(Conditions="myminfrags=5;minfrags=5;maxfragsdif=2;",Message="Rival Kill",extraPoints=37,extraFrags=0,allowExcessPoints=False)
	Skills(14)=(Conditions="minfragsdif=20;fragsdifdir=1;",Message="Pro Kill",extraPoints=80,extraFrags=0,allowExcessPoints=False)
	Skills(15)=(Conditions="minpntsdif=2000;pntsdifdir=1;denylist=14;",Message="Pro Lord Kill",extraPoints=55,extraFrags=0,allowExcessPoints=False)
	Skills(16)=(Conditions="disable=1;minfragsdif=20;fragsdifdir=2;maxfrags=3;myminhealth=100;",Message="Easy",extraPoints=0,extraFrags=0,allowExcessPoints=False)
	Skills(17)=(Conditions="disable=1;minfragsdif=40;fragsdifdir=2;maxfrags=3;myminhealth=100;denylist=16;",Message="Too Easy!",extraPoints=0,extraFrags=0,allowExcessPoints=False)
	Skills(18)=(Conditions="gibbed=1;minhealth=100;",Message="Giblicious",extraPoints=5,extraFrags=0,allowExcessPoints=False)
	Skills(19)=(Conditions="kills=2;klimit=7;ktime=2.0;",Message="%n Multi-Kills",extraPoints=10,extraFrags=0,allowExcessPoints=True)
	Skills(20)=(Conditions="kills=8;klimit=14;ktime=2.0;",Message="Mass Murderer! (%n kills)",extraPoints=80,extraFrags=0,allowExcessPoints=True)
	Skills(21)=(Conditions="kills=15;klimit=29;ktime=2.0;",Message="EXTERMINATION! (%n kills)",extraPoints=225,extraFrags=0,allowExcessPoints=True)
	Skills(22)=(Conditions="kills=30;ktime=2.0;",Message="DECIMATION!! (%n kills)",extraPoints=600,extraFrags=0,allowExcessPoints=True)
	Skills(23)=(Conditions="mynowview=1;nowview=1;mindist=550;",Message="Blind Fire",extraPoints=3,extraFrags=0,allowExcessPoints=False)
	Skills(24)=(Conditions="dmglist=Gibbed;mywpn=RT;",Message="Telefrag",extraPoints=7,extraFrags=0,allowExcessPoints=False)
	Skills(25)=(Conditions="dmglist=RazorCut;kills=2;ktime=1.5;",Message="Cut Like Butter",extraPoints=8,extraFrags=0,allowExcessPoints=True)
	Skills(26)=(Conditions="headshot=1;mywpn=RT;denylist=0;",Message="Razor Headshot",extraPoints=27,extraFrags=0,allowExcessPoints=False)
	Skills(27)=(Conditions="noview=1;mywpn=TheExecutioner;",Message="Back Stab",extraPoints=35,extraFrags=0,allowExcessPoints=False)
	Skills(28)=(Conditions="headshot=1;noview=1;mywpn=TheExecutioner;denylist=0,27;",Message="Ninja'd!",extraPoints=45,extraFrags=0,allowExcessPoints=False)
	Skills(29)=(Conditions="dmglist=Ionized;airh=80;gibbed=1;",Message="Grenade Guru",extraPoints=15,extraFrags=0,allowExcessPoints=False)
	Skills(30)=(Conditions="dmglist=Burned;gibbed=1;mindist=300;",Message="Hot Drop",extraPoints=10,extraFrags=0,allowExcessPoints=False)
	Skills(31)=(Conditions="dmglist=Burned;nogibbed=1;maxhealth=15;denylist=7;",Message="Kill It With Fire!",extraPoints=2,extraFrags=0,allowExcessPoints=False)
	Skills(32)=(Conditions="dmglist=ElectricCombo;gibbed=1;",Message="C-C-Combo Breaker!!",extraPoints=10,extraFrags=0,allowExcessPoints=False)
	Skills(33)=(Conditions="dmglist=Electrified;noheadshot=1;waterzone=1;",Message="Electrocution",extraPoints=5,extraFrags=0,allowExcessPoints=False)
	Skills(34)=(Conditions="mywpn=BoltRifle;headshot=1;",Message="Brain Overheat",extraPoints=5,extraFrags=0,allowExcessPoints=False)
	Skills(35)=(Conditions="dmglist=Smashed;gibbed=1;denylist=8,9,10,11,12,23;",Message="Smashed Like a Bug",extraPoints=2,extraFrags=0,allowExcessPoints=False)
	Skills(36)=(Conditions="dmglist=GravitonPush;denylist=3,4,8,9,10,11,12,23;",Message="All It Takes Is a Little Push",extraPoints=4,extraFrags=0,allowExcessPoints=False)
	Skills(37)=(Conditions="dmglist=Frozen;revenge=1;denylist=1;",Message="Cold Revenge",extraPoints=20,extraFrags=1,allowExcessPoints=False)
	Skills(38)=(Conditions="kills=2;dmglist=Frozen;",Message="x%n Cold Genocide",extraPoints=24,extraFrags=0,allowExcessPoints=True)
	Skills(39)=(Conditions="dmglist=Vulcanized;mindist=1500;",Message="Hot Potato",extraPoints=10,extraFrags=0,allowExcessPoints=False)
	Skills(40)=(Conditions="dmglist=MineExplosion;gibbed=1;denylist=10,11,12,23;",Message="It's A Trap!",extraPoints=3,extraFrags=0,allowExcessPoints=False)
	Skills(41)=(Conditions="dmglist=RocketExplosion;airh=80;gibbed=1;",Message="Rocket Guru",extraPoints=12,extraFrags=0,allowExcessPoints=False)
	Skills(42)=(Conditions="kills=3;ktime=1.0;dmglist=ThermicExplosion,MiniNuclear;gibbed=1;",Message="x%n Explosive Devastation",extraPoints=15,extraFrags=0,allowExcessPoints=True)
	Skills(43)=(Conditions="dmglist=Shot;mywpn=IRPR;nowview=1;denylist=23;",Message="Hackz",extraPoints=5,extraFrags=0,allowExcessPoints=False)
	Skills(44)=(Conditions="headshot=1;mywpn=IRPR;nowview=1;denylist=0,23,43;",Message="Hackz Boom Headshot!",extraPoints=7,extraFrags=0,allowExcessPoints=False)
	Skills(45)=(Conditions="kills=2;dmglist=Shot;mywpn=IRPR;",Message="x%n Passing Through",extraPoints=20,extraFrags=0,allowExcessPoints=True)
	Skills(46)=(Conditions="kills=2;headshot=1;mywpn=IRPR;denylist=45;",Message="x%n Passing Through Headshot",extraPoints=20,extraFrags=0,allowExcessPoints=True)
	Skills(47)=(Conditions="dmglist=CybotLaser,CybotSliced;denylist=8,9,10,11,12,23;",Message="Cybot Assassination",extraPoints=3,extraFrags=0,allowExcessPoints=False)
	Skills(48)=(Conditions="dmglist=CybotExploded;denylist=8,9,10,11,12,23;",Message="Cybot Kamikaze",extraPoints=5,extraFrags=0,allowExcessPoints=False)
	Skills(49)=(Conditions="dmglist=FieldDamage;",Message="Protected",extraPoints=1,extraFrags=0,allowExcessPoints=False)
	Skills(50)=(Conditions="maxdist=70;",Message="Approximation",extraPoints=0,extraFrags=0,allowExcessPoints=False)
	Skills(51)=(Conditions="dmglist=Nuclear00,Nuclear01,Nuclear02,Nuclear03,Nuclear04,Nuclear05,NuclearMega,NuclearUltima,NuclearIon;denylist=8,9,10,11,12,23;",Message="Nuclear Hazard",extraPoints=0,extraFrags=0,allowExcessPoints=False)
	Skills(52)=(Conditions="dmglist=SolarCore;denylist=8,9,10,11,12,23;",Message="Solar Barbecue",extraPoints=0,extraFrags=0,allowExcessPoints=False)
	Skills(53)=(Conditions="dmglist=SolarBurnt;denylist=8,9,10,11,12,23;",Message="Sun Burn 9001th Degree",extraPoints=0,extraFrags=0,allowExcessPoints=False)
	Skills(54)=(Conditions="dmglist=SolarSuperNova;denylist=8,9,10,11,12,23;",Message="Mass Extinction",extraPoints=0,extraFrags=0,allowExcessPoints=False)
}