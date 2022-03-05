//////////////////////////////////////////////////////////////
//				Feralidragon (13-10-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWShellCase expands UT_ShellCase;

simulated function PostBeginPlay()
{
	if (Class'NaliZPEffects'.static.isStaticZPDiscarded(Owner))
		Destroy();
	else
		Super.PostBeginPlay();
}

simulated function PostNetBeginPlay()
{
	if (Class'NaliZPEffects'.static.isStaticZPDiscarded(Owner))
		Destroy();
}

simulated function Timer()
{
	if (Class'NaliZPEffects'.static.isStaticZPDiscarded(Owner))
	{
		Destroy();
		return;
	}
	Super.Timer();
}

simulated function HitWall(vector HitNormal, actor Wall)
{
	if (Class'NaliZPEffects'.static.isStaticZPClientDiscarded(Owner, Role))
		Destroy();
	else
		Super.HitWall(HitNormal, Wall);
}

simulated function ZoneChange(Zoneinfo NewZone)
{
	if (Class'NaliZPEffects'.static.isStaticZPClientDiscarded(Owner, Role))
		Destroy();
	else
		Super.ZoneChange(NewZone);
}

simulated function Landed(vector HitNormal)
{
	if (Class'NaliZPEffects'.static.isStaticZPClientDiscarded(Owner, Role))
		Destroy();
	else
		Super.Landed(HitNormal);
}


defaultproperties
{
}