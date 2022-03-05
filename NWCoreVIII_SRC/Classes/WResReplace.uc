//////////////////////////////////////////////////////////////
//	Nali Weapons III weapons ressurection replace class
//				Feralidragon (17-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class WResReplace expands NaliWEffects;

var float TimeToDestroy;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		LODBias = FMax(1.0, Class'NWInfo'.default.WeaponDistDetail * Class'NWInfo'.default.MaxLODBias/255);
}

simulated function SetLifeSpan(float newLifeSpan)
{
	TimeToDestroy = newLifeSpan;
}

simulated function Tick(float Delta)
{
	TimeToDestroy -= Delta;
	
	if (Owner != None)
		SetRotation(Owner.Rotation);
	
	if (TimeToDestroy <= 0)
		Destroy();
}

defaultproperties
{
	DrawType=DT_Mesh
	bNetTemporary=False
	Mass=0.000000
	CollisionHeight=0.000000
	CollisionRadius=0.000000
	Skin=None
	Style=STY_Normal
	Physics=PHYS_None
	NetPriority=1.400000
	TimeToDestroy=5.000000
}
