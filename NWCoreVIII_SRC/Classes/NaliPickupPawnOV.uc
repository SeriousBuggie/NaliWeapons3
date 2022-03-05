//////////////////////////////////////////////////////////////
//				Feralidragon (16-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NaliPickupPawnOV expands NaliWEffects;

simulated function PreBeginPlay();
simulated function PostBeginPlay();

defaultproperties
{
	DrawType=DT_Mesh
	LifeSpan=0.000000
	bNetTemporary=False
	RemoteRole=ROLE_SimulatedProxy
	bAnimByOwner=True
	bOwnerNoSee=True
	bTrailerSameRotation=True
	Physics=PHYS_Trailer
}