//////////////////////////////////////////////////////////////
//	Nali Weapons III Locker Arm
//				Feralidragon (05-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWTagActor expands NaliWActor;

var Actor TaggedActor;

event Trigger(Actor Other, Pawn EventInstigator)
{
	if (TaggedActor != None)
		TaggedActor.Trigger(Other, EventInstigator);
}

event UnTrigger(Actor Other, Pawn EventInstigator)
{
	if (TaggedActor != None)
		TaggedActor.UnTrigger(Other, EventInstigator);
}

defaultproperties
{
	RemoteRole=ROLE_DumbProxy
	NetUpdateFrequency=1.000000
	bHidden=True
}