//////////////////////////////////////////////////////////////
//				Feralidragon (22-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybFFieldTarget expands NWPoint;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	SetTimer(0.15, False);
}

simulated function Timer()
{
	Destroy();
}

singular function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation, vector momentum, name damageType)
{
	if (Cybot(Owner) != None && !Cybot(Owner).isFriend(instigatedBy))
		Owner.TakeDamage(Damage, instigatedBy, Owner.Location, momentum, 'FieldDamage');
	Destroy();
}

defaultproperties
{
    CollisionRadius=16.000000
	CollisionHeight=16.000000
	bProjTarget=True
	bCollideActors=True
	bCollideWorld=False
	bBlockActors=True
	bBlockPlayers=True
	bNetTemporary=False
}
