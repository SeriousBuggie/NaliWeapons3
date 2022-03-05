//////////////////////////////////////////////////////////////
//				Feralidragon (09-04-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTTransTargetAI expands TranslocatorTarget;

function bool Disrupted(){ return False; }
function DropFrom(vector StartLocation);
simulated singular function ZoneChange(ZoneInfo NewZone);
function Throw(Pawn Thrower, float force, vector StartPosition);

auto state Pickup
{
	simulated function Timer();
	simulated event Landed(vector HitNormal);
	function AnimEnd();
	event TakeDamage(int Damage, Pawn EventInstigator, vector HitLocation, vector Momentum, name DamageType);
	singular function Touch(Actor Other);
	simulated function HitWall (vector HitNormal, actor Wall);
	simulated function Tick(float DeltaTime);
	simulated function BeginState();
	function EndState();
}

defaultproperties
{
	bHidden=True
	Physics=PHYS_None
	RemoteRole=ROLE_None
	CollisionRadius=0.000000
	CollisionHeight=0.000000
	bCollideWorld=False
	bCollideActors=False
	bProjTarget=False
	bBounce=True
	Mass=0.000000
	AmbientSound=None
	SoundRadius=0
	SoundVolume=0
}
