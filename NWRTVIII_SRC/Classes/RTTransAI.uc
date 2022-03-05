//////////////////////////////////////////////////////////////
//				Feralidragon (09-04-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTTransAI expands Translocator;

var RT TransToNotify;

function Fire(float Value);
simulated function bool ClientFire(float Value){ return False; }
function SpawnEffect(vector Start, vector Dest);
function Translocate();
function AltFire(float Value);
function ThrowTarget();

simulated function PlaySelect()
{
	bForceFire = false;
	bForceAltFire = false;
	PlayAnim('Select', 10, 0.0);  
}

simulated function TweenDown()
{
	PlayAnim('Down', 10, 0.0);
}

simulated function PlayPostSelect()
{
	if (DesiredTarget != None && TransToNotify != None && Pawn(Owner) != None)
	{
		if (TTarget == None)
			TTarget = Spawn(Class'RTTransTargetAI');
		TransToNotify.DesiredTarget = DesiredTarget;
		DesiredTarget = None;
		Pawn(Owner).PendingWeapon = TransToNotify;
		PutDown();
	}
}

simulated function Destroyed()
{
	if (TTarget != None)
		TTarget.Destroy();
	TTarget = None;
		
	Super.Destroyed();
}

defaultproperties
{
}
