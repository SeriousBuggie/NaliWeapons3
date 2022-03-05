//////////////////////////////////////////////////////////////
//				Feralidragon (21-01-2013)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravThrownAttach expands NaliWActor;

var int Kickback;
var float MoreDamage;
var bool bInitAttach;
var vector oldOwnerLoc;

function InitAttach(float tSpan, int KickB, float MDmg)
{
	Kickback = KickB;
	MoreDamage = MDmg;
	SetTimer(FMax(0.1, tSpan), False);
	bInitAttach = True;
	if (Owner != None)
		oldOwnerLoc = Owner.Location;
}

function Tick(float Delta)
{
local vector WallDir, HitWallLoc, HitWallNorm;
local Actor HitLevel;
local float wDmgCount, hitDmg, hitSpeed;

	if (bInitAttach)
	{
		if (Owner == None || Owner.bDeleteMe || Owner.bHidden || (Pawn(Owner) != None && Pawn(Owner).Health <= 0))
		{
			Destroy();
			return;
		}

		WallDir = Normal(Owner.Location - oldOwnerLoc) * FMax(5.0, FMax(1.5*Owner.CollisionHeight, 1.5*Owner.CollisionRadius));
		HitLevel = Trace(HitWallLoc, HitWallNorm, Owner.Location + WallDir, Owner.Location, False);
		
		if (HitLevel != None)
		{
			hitSpeed = VSize(Owner.Location - oldOwnerLoc)/Delta;
			if (Class'GravBeam'.static.isSmashableSpeed(hitSpeed))
			{
				hitDmg = hitSpeed * FMax(1.0,MoreDamage);
				Class'GravBeam'.static.staticGiveSmashDamage(Owner, HitWallNorm, hitDmg, wDmgCount, Instigator, Kickback);
				if (Class'Graviton'.default.enableSmashShake)
					Spawn(Class'GravSmashShake',,, Owner.Location);
			}
			Destroy();
		}
		oldOwnerLoc = Owner.Location;
	}
}

function Timer()
{
	Destroy();
}


defaultproperties
{
    bHidden=True
	RemoteRole=ROLE_None
}
