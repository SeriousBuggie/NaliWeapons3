//////////////////////////////////////////////////////////////
//	Nali Weapons III ZP Effects base class
//				Feralidragon (06-10-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NaliZPEffects expands NaliWEffects
abstract;

var() bool enableMakeSound;
var bool bZPHandled;

simulated function PostBeginPlay()
{
	if (enableMakeSound && Level.NetMode == NM_StandAlone)
		MakeSound();
}

simulated function Tick(float Delta)
{
	if (!bZPHandled)
	{
		HandleZPEffect();
		bZPHandled = True;
	}
}

simulated function PostNetBeginPlay()
{
	if (!bZPHandled)
		HandleZPEffect();
	bZPHandled = True;
}

simulated function HandleZPEffect()
{
	if (isZPDiscarded())
	{
		bHidden = True;
		LightType = LT_None;
		AmbientSound = None;
		if (bNetTemporary)
			Destroy();
		return;
	}
	else if (enableMakeSound && Level.NetMode != NM_StandAlone && Level.NetMode != NM_DedicatedServer)
		MakeSound();
}

simulated function bool isZPDiscarded()
{
	return (isZP() && Viewport(PlayerPawn(Owner.Owner).Player) != None);
}

simulated function bool isZP()
{
	return (NaliWeapons(Owner) != None && NaliWeapons(Owner).enableZP && PlayerPawn(Owner.Owner) != None);
}

simulated static function bool isStaticZPDiscarded(Actor A)
{
	return (isStaticZP(A) && Viewport(PlayerPawn(A.Owner).Player) != None);
}

simulated static function bool isStaticZP(Actor A)
{
	return (NaliWeapons(A) != None && NaliWeapons(A).enableZP && PlayerPawn(A.Owner) != None);
}

simulated static function bool isStaticZPClientDiscarded(Actor A, ENetRole R)
{
	return (isStaticZPDiscarded(A) || (isStaticZP(A) && R == ROLE_Authority));
}

defaultproperties
{
	enableMakeSound=False
}