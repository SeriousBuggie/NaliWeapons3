//////////////////////////////////////////////////////////////
//				Feralidragon (24-06-2011)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeLevelMsg expands LocalMessagePlus;

#exec AUDIO IMPORT NAME="NukeThreat0" FILE=SOUNDS\NukeThreat0.wav GROUP="NukeMsgs"
#exec AUDIO IMPORT NAME="NukeThreat1" FILE=SOUNDS\NukeThreat1.wav GROUP="NukeMsgs"
#exec AUDIO IMPORT NAME="NukeThreat2" FILE=SOUNDS\NukeThreat2.wav GROUP="NukeMsgs"
#exec AUDIO IMPORT NAME="NukeThreat3" FILE=SOUNDS\NukeThreat3.wav GROUP="NukeMsgs"
#exec AUDIO IMPORT NAME="NukeThreat4" FILE=SOUNDS\NukeThreat4.wav GROUP="NukeMsgs"
#exec AUDIO IMPORT NAME="NukeThreat5" FILE=SOUNDS\NukeThreat5.wav GROUP="NukeMsgs"

var() localized string NukeWarnMsg[6];
var() localized sound NukeWarnSnd[6];

static function float GetOffset(int Switch, float YL, float ClipY )
{
    return (Default.YPos/768.0) * ClipY + 2*YL;
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2,
optional Object OptionalObject)
{
	if (Switch >= 0 && Switch < 6)
		return Default.NukeWarnMsg[Switch];
}

static simulated function ClientReceive(PlayerPawn P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, 
optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	if (Switch >= 0 && Switch < 6)
		P.ClientPlaySound(Default.NukeWarnSnd[Switch],, true);
}

defaultproperties
{
	FontSize=2
	bIsSpecial=True
	bIsUnique=True
	bFadeMessage=True
	DrawColor=(R=255,G=128,B=0)
	YPos=128.000000
	bCenter=True
	
	NukeWarnMsg(0)="WARNING: Nuclear Threat Level 0"
	NukeWarnMsg(1)="WARNING: Nuclear Threat Level 1"
	NukeWarnMsg(2)="WARNING: Nuclear Threat Level 2"
	NukeWarnMsg(3)="WARNING: Nuclear Threat Level 3"
	NukeWarnMsg(4)="WARNING: Nuclear Threat Level 4"
	NukeWarnMsg(5)="WARNING: Nuclear Threat Level 5"
	NukeWarnSnd(0)=NukeThreat0
	NukeWarnSnd(1)=NukeThreat1
	NukeWarnSnd(2)=NukeThreat2
	NukeWarnSnd(3)=NukeThreat3
	NukeWarnSnd(4)=NukeThreat4
	NukeWarnSnd(5)=NukeThreat5
}
