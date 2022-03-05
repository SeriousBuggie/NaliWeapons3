//////////////////////////////////////////////////////////////
//				Feralidragon (09-03-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWSkillMsgPlus expands CriticalStringPlus;

var() bool bPointsMsg;
var float msgHeight;

static function float GetOffset(int Switch, float YL, float ClipY )
{
	return (default.msgHeight * ClipY);
}

static function string GetString(optional int S, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, 
optional Object OptionalObject)
{
	if (NWSkillKillsManager(OptionalObject) != None)
	{
		if (default.bPointsMsg)
			return NWSkillKillsManager(OptionalObject).getSkillMessagePoints(S);
		return NWSkillKillsManager(OptionalObject).getSkillMessage(S);
	}
	return "";
}

static function ClientReceive(PlayerPawn P, optional int S, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2,
optional Object OptionalObject)
{
local sound msgSound;

	if (NWSkillKillsManager(OptionalObject) != None)
	{
		default.DrawColor = NWSkillKillsManager(OptionalObject).getMsgColor(S, default.bPointsMsg);
		default.msgHeight = NWSkillKillsManager(OptionalObject).getMsgHeight(S, default.bPointsMsg);
		default.msgHeight = 1.f - FClamp(default.msgHeight, 0.0, 1.0);
		msgSound = NWSkillKillsManager(OptionalObject).getMsgSound(S, default.bPointsMsg);
		if (msgSound != None)
			P.PlaySound(msgSound, SLOT_Interface, 10.0);
	}
	
	Super.ClientReceive(P, S, RelatedPRI_1, RelatedPRI_2, OptionalObject);
}

defaultproperties
{
	FontSize=1
	bIsSpecial=True
	bIsUnique=True
	bFadeMessage=True
	bBeep=False
	DrawColor=(R=64,G=64,B=64)
	bCenter=True
}

