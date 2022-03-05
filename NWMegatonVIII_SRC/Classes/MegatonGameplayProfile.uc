//////////////////////////////////////////////////////////////
//				Feralidragon (26-09-2012)
//
// NW3 MEGATON BUILD 1.00
//////////////////////////////////////////////////////////////

class MegatonGameplayProfile expands NWProfile config(NWProfilesCfg);

struct MegatonStruct
{
	var() bool bRealSeconds, bEnablePasswordCard, generateRandPasswordWhenNotSet, BroadcastDisarmMsg;
	var() string CountdownTime, MinCountdownTime, MaxCountdownTime, DisarmPassword;
};
var() config MegatonStruct MegatonProfile[8];

struct MegatonPassCStructA
{
	var() bool bReturnToOwner, bRenderLocationWhenDropped;
	var() float DroppedTime, allowedDroppedDistFromMegaton, renderLocationMaxDist;
};
var() config MegatonPassCStructA MegatonPassCProfileA[8];

struct MegatonPassCStructB
{
	var() bool BroadcastPickupMsg, BroadcastReturnToOriginMsg, BroadcastReturnToOwnerMsg, BroadcastDroppedMsg;
};
var() config MegatonPassCStructB MegatonPassCProfileB[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local Megaton Mega;
local MegatonPassCard MegaPC;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'Megaton'.default.bRealSeconds = default.MegatonProfile[i].bRealSeconds;
	Class'Megaton'.default.bEnablePasswordCard = default.MegatonProfile[i].bEnablePasswordCard;
	Class'Megaton'.default.generateRandPasswordWhenNotSet = default.MegatonProfile[i].generateRandPasswordWhenNotSet;
	Class'Megaton'.default.BroadcastDisarmMsg = default.MegatonProfile[i].BroadcastDisarmMsg;
	Class'Megaton'.default.CountdownTime = default.MegatonProfile[i].CountdownTime;
	Class'Megaton'.default.MinCountdownTime = default.MegatonProfile[i].MinCountdownTime;
	Class'Megaton'.default.MaxCountdownTime = default.MegatonProfile[i].MaxCountdownTime;
	Class'Megaton'.default.DisarmPassword = default.MegatonProfile[i].DisarmPassword;
	
	if (Lvl == None)
		Class'Megaton'.static.StaticSaveConfig();
	
	
	Class'MegatonPassCard'.default.bReturnToOwner = default.MegatonPassCProfileA[i].bReturnToOwner;
	Class'MegatonPassCard'.default.bRenderLocationWhenDropped = default.MegatonPassCProfileA[i].bRenderLocationWhenDropped;
	Class'MegatonPassCard'.default.DroppedTime = default.MegatonPassCProfileA[i].DroppedTime;
	Class'MegatonPassCard'.default.allowedDroppedDistFromMegaton = default.MegatonPassCProfileA[i].allowedDroppedDistFromMegaton;
	Class'MegatonPassCard'.default.renderLocationMaxDist = default.MegatonPassCProfileA[i].renderLocationMaxDist;
	
	Class'MegatonPassCard'.default.BroadcastPickupMsg = default.MegatonPassCProfileB[i].BroadcastPickupMsg;
	Class'MegatonPassCard'.default.BroadcastReturnToOriginMsg = default.MegatonPassCProfileB[i].BroadcastReturnToOriginMsg;
	Class'MegatonPassCard'.default.BroadcastReturnToOwnerMsg = default.MegatonPassCProfileB[i].BroadcastReturnToOwnerMsg;
	Class'MegatonPassCard'.default.BroadcastDroppedMsg = default.MegatonPassCProfileB[i].BroadcastDroppedMsg;
	
	if (Lvl == None)
		Class'MegatonPassCard'.static.StaticSaveConfig();
	
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'Megaton', Mega)
		{
			Mega.default.bRealSeconds = Class'Megaton'.default.bRealSeconds;
			Mega.bRealSeconds = Class'Megaton'.default.bRealSeconds;
			Mega.default.bEnablePasswordCard = Class'Megaton'.default.bEnablePasswordCard;
			Mega.bEnablePasswordCard = Class'Megaton'.default.bEnablePasswordCard;
			Mega.default.generateRandPasswordWhenNotSet = Class'Megaton'.default.generateRandPasswordWhenNotSet;
			Mega.generateRandPasswordWhenNotSet = Class'Megaton'.default.generateRandPasswordWhenNotSet;
			Mega.default.BroadcastDisarmMsg = Class'Megaton'.default.BroadcastDisarmMsg;
			Mega.BroadcastDisarmMsg = Class'Megaton'.default.BroadcastDisarmMsg;
			Mega.default.CountdownTime = Class'Megaton'.default.CountdownTime;
			Mega.CountdownTime = Class'Megaton'.default.CountdownTime;
			Mega.default.MinCountdownTime = Class'Megaton'.default.MinCountdownTime;
			Mega.MinCountdownTime = Class'Megaton'.default.MinCountdownTime;
			Mega.default.MaxCountdownTime = Class'Megaton'.default.MaxCountdownTime;
			Mega.MaxCountdownTime = Class'Megaton'.default.MaxCountdownTime;
			Mega.default.DisarmPassword = Class'Megaton'.default.DisarmPassword;
			Mega.DisarmPassword = Class'Megaton'.default.DisarmPassword;
		}
		
		ForEach Lvl.AllActors(Class'MegatonPassCard', MegaPC)
		{
			MegaPC.default.bReturnToOwner = Class'MegatonPassCard'.default.bReturnToOwner;
			MegaPC.bReturnToOwner = Class'MegatonPassCard'.default.bReturnToOwner;
			MegaPC.default.bRenderLocationWhenDropped = Class'MegatonPassCard'.default.bRenderLocationWhenDropped;
			MegaPC.bRenderLocationWhenDropped = Class'MegatonPassCard'.default.bRenderLocationWhenDropped;
			MegaPC.default.DroppedTime = Class'MegatonPassCard'.default.DroppedTime;
			MegaPC.DroppedTime = Class'MegatonPassCard'.default.DroppedTime;
			MegaPC.default.allowedDroppedDistFromMegaton = Class'MegatonPassCard'.default.allowedDroppedDistFromMegaton;
			MegaPC.allowedDroppedDistFromMegaton = Class'MegatonPassCard'.default.allowedDroppedDistFromMegaton;
			MegaPC.default.renderLocationMaxDist = Class'MegatonPassCard'.default.renderLocationMaxDist;
			MegaPC.renderLocationMaxDist = Class'MegatonPassCard'.default.renderLocationMaxDist;

			MegaPC.default.BroadcastPickupMsg = Class'MegatonPassCard'.default.BroadcastPickupMsg;
			MegaPC.BroadcastPickupMsg = Class'MegatonPassCard'.default.BroadcastPickupMsg;
			MegaPC.default.BroadcastReturnToOriginMsg = Class'MegatonPassCard'.default.BroadcastReturnToOriginMsg;
			MegaPC.BroadcastReturnToOriginMsg = Class'MegatonPassCard'.default.BroadcastReturnToOriginMsg;
			MegaPC.default.BroadcastReturnToOwnerMsg = Class'MegatonPassCard'.default.BroadcastReturnToOwnerMsg;
			MegaPC.BroadcastReturnToOwnerMsg = Class'MegatonPassCard'.default.BroadcastReturnToOwnerMsg;
			MegaPC.default.BroadcastDroppedMsg = Class'MegatonPassCard'.default.BroadcastDroppedMsg;
			MegaPC.BroadcastDroppedMsg = Class'MegatonPassCard'.default.BroadcastDroppedMsg;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.MegatonProfile[i].bRealSeconds = Class'Megaton'.default.bRealSeconds;
	default.MegatonProfile[i].bEnablePasswordCard = Class'Megaton'.default.bEnablePasswordCard;
	default.MegatonProfile[i].generateRandPasswordWhenNotSet = Class'Megaton'.default.generateRandPasswordWhenNotSet;
	default.MegatonProfile[i].BroadcastDisarmMsg = Class'Megaton'.default.BroadcastDisarmMsg;
	default.MegatonProfile[i].CountdownTime = Class'Megaton'.default.CountdownTime;
	default.MegatonProfile[i].MinCountdownTime = Class'Megaton'.default.MinCountdownTime;
	default.MegatonProfile[i].MaxCountdownTime = Class'Megaton'.default.MaxCountdownTime;
	default.MegatonProfile[i].DisarmPassword = Class'Megaton'.default.DisarmPassword;
	
	default.MegatonPassCProfileA[i].bReturnToOwner = Class'MegatonPassCard'.default.bReturnToOwner;
	default.MegatonPassCProfileA[i].bRenderLocationWhenDropped = Class'MegatonPassCard'.default.bRenderLocationWhenDropped;
	default.MegatonPassCProfileA[i].DroppedTime = Class'MegatonPassCard'.default.DroppedTime;
	default.MegatonPassCProfileA[i].allowedDroppedDistFromMegaton = Class'MegatonPassCard'.default.allowedDroppedDistFromMegaton;
	default.MegatonPassCProfileA[i].renderLocationMaxDist = Class'MegatonPassCard'.default.renderLocationMaxDist;
	
	default.MegatonPassCProfileB[i].BroadcastPickupMsg = Class'MegatonPassCard'.default.BroadcastPickupMsg;
	default.MegatonPassCProfileB[i].BroadcastReturnToOriginMsg = Class'MegatonPassCard'.default.BroadcastReturnToOriginMsg;
	default.MegatonPassCProfileB[i].BroadcastReturnToOwnerMsg = Class'MegatonPassCard'.default.BroadcastReturnToOwnerMsg;
	default.MegatonPassCProfileB[i].BroadcastDroppedMsg = Class'MegatonPassCard'.default.BroadcastDroppedMsg;
	
	StaticSaveConfig();
}


defaultproperties
{
	MegatonProfile(0)=(bRealSeconds=False,bEnablePasswordCard=True,generateRandPasswordWhenNotSet=True,BroadcastDisarmMsg=True)
	MegatonProfile(0)=(CountdownTime="200",MinCountdownTime="125",MaxCountdownTime="959",DisarmPassword="000")
	MegatonPassCProfileA(0)=(bReturnToOwner=False,bRenderLocationWhenDropped=True,DroppedTime=40.000000,allowedDroppedDistFromMegaton=200.000000,renderLocationMaxDist=20000.000000)
	MegatonPassCProfileB(0)=(BroadcastPickupMsg=True,BroadcastReturnToOriginMsg=True,BroadcastReturnToOwnerMsg=True,BroadcastDroppedMsg=True)

	MegatonProfile(1)=(bRealSeconds=False,bEnablePasswordCard=True,generateRandPasswordWhenNotSet=True,BroadcastDisarmMsg=True)
	MegatonProfile(1)=(CountdownTime="100",MinCountdownTime="045",MaxCountdownTime="959",DisarmPassword="000")
	MegatonPassCProfileA(1)=(bReturnToOwner=False,bRenderLocationWhenDropped=True,DroppedTime=40.000000,allowedDroppedDistFromMegaton=200.000000,renderLocationMaxDist=20000.000000)
	MegatonPassCProfileB(1)=(BroadcastPickupMsg=True,BroadcastReturnToOriginMsg=True,BroadcastReturnToOwnerMsg=True,BroadcastDroppedMsg=True)

	MegatonProfile(2)=(bRealSeconds=False,bEnablePasswordCard=True,generateRandPasswordWhenNotSet=True,BroadcastDisarmMsg=True)
	MegatonProfile(2)=(CountdownTime="030",MinCountdownTime="030",MaxCountdownTime="959",DisarmPassword="000")
	MegatonPassCProfileA(2)=(bReturnToOwner=False,bRenderLocationWhenDropped=True,DroppedTime=40.000000,allowedDroppedDistFromMegaton=200.000000,renderLocationMaxDist=20000.000000)
	MegatonPassCProfileB(2)=(BroadcastPickupMsg=True,BroadcastReturnToOriginMsg=True,BroadcastReturnToOwnerMsg=True,BroadcastDroppedMsg=True)
	
	MegatonProfile(3)=(bRealSeconds=False,bEnablePasswordCard=True,generateRandPasswordWhenNotSet=True,BroadcastDisarmMsg=False)
	MegatonProfile(3)=(CountdownTime="045",MinCountdownTime="045",MaxCountdownTime="959",DisarmPassword="000")
	MegatonPassCProfileA(3)=(bReturnToOwner=False,bRenderLocationWhenDropped=True,DroppedTime=40.000000,allowedDroppedDistFromMegaton=200.000000,renderLocationMaxDist=20000.000000)
	MegatonPassCProfileB(3)=(BroadcastPickupMsg=False,BroadcastReturnToOriginMsg=False,BroadcastReturnToOwnerMsg=False,BroadcastDroppedMsg=False)
	
	MegatonProfile(4)=(bRealSeconds=False,bEnablePasswordCard=True,generateRandPasswordWhenNotSet=True,BroadcastDisarmMsg=False)
	MegatonProfile(4)=(CountdownTime="030",MinCountdownTime="015",MaxCountdownTime="959",DisarmPassword="000")
	MegatonPassCProfileA(4)=(bReturnToOwner=False,bRenderLocationWhenDropped=True,DroppedTime=40.000000,allowedDroppedDistFromMegaton=200.000000,renderLocationMaxDist=20000.000000)
	MegatonPassCProfileB(4)=(BroadcastPickupMsg=False,BroadcastReturnToOriginMsg=False,BroadcastReturnToOwnerMsg=False,BroadcastDroppedMsg=False)
	
	MegatonProfile(5)=(bRealSeconds=False,bEnablePasswordCard=True,generateRandPasswordWhenNotSet=True,BroadcastDisarmMsg=True)
	MegatonProfile(5)=(CountdownTime="030",MinCountdownTime="030",MaxCountdownTime="959",DisarmPassword="000")
	MegatonPassCProfileA(5)=(bReturnToOwner=False,bRenderLocationWhenDropped=True,DroppedTime=40.000000,allowedDroppedDistFromMegaton=200.000000,renderLocationMaxDist=20000.000000)
	MegatonPassCProfileB(5)=(BroadcastPickupMsg=True,BroadcastReturnToOriginMsg=True,BroadcastReturnToOwnerMsg=True,BroadcastDroppedMsg=True)
	
	MegatonProfile(6)=(bRealSeconds=False,bEnablePasswordCard=True,generateRandPasswordWhenNotSet=True,BroadcastDisarmMsg=True)
	MegatonProfile(6)=(CountdownTime="030",MinCountdownTime="030",MaxCountdownTime="959",DisarmPassword="000")
	MegatonPassCProfileA(6)=(bReturnToOwner=False,bRenderLocationWhenDropped=True,DroppedTime=40.000000,allowedDroppedDistFromMegaton=200.000000,renderLocationMaxDist=20000.000000)
	MegatonPassCProfileB(6)=(BroadcastPickupMsg=True,BroadcastReturnToOriginMsg=True,BroadcastReturnToOwnerMsg=True,BroadcastDroppedMsg=True)
	
	MegatonProfile(7)=(bRealSeconds=False,bEnablePasswordCard=True,generateRandPasswordWhenNotSet=True,BroadcastDisarmMsg=True)
	MegatonProfile(7)=(CountdownTime="030",MinCountdownTime="030",MaxCountdownTime="959",DisarmPassword="000")
	MegatonPassCProfileA(7)=(bReturnToOwner=False,bRenderLocationWhenDropped=True,DroppedTime=40.000000,allowedDroppedDistFromMegaton=200.000000,renderLocationMaxDist=20000.000000)
	MegatonPassCProfileB(7)=(BroadcastPickupMsg=True,BroadcastReturnToOriginMsg=True,BroadcastReturnToOwnerMsg=True,BroadcastDroppedMsg=True)
}