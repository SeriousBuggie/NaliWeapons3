//////////////////////////////////////////////////////////////
//				Feralidragon (09-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeDeniedMsg expands LocalMessagePlus;

#exec AUDIO IMPORT NAME="NukeDenied" FILE=SOUNDS\NukeDenied.wav GROUP="SpecialMsgs"

var(Messages) localized string DeniedString;

static function float GetOffset(int Switch, float YL, float ClipY )
{
    return (Default.YPos/768.0) * ClipY + 2*YL;
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2,
optional Object OptionalObject)
{
	return Default.DeniedString;
}

static simulated function ClientReceive(PlayerPawn P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, 
optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	P.ClientPlaySound(sound'NukeDenied',, true);
}

defaultproperties
{
	FontSize=2
	bIsSpecial=True
	bIsUnique=True
	bFadeMessage=True
	DrawColor=(R=255,G=0,B=0)
	YPos=196.000000
	bCenter=True
	
	DeniedString="DENIED"
}
