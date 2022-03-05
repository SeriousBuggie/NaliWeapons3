//////////////////////////////////////////////////////////////
//				Feralidragon (19-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerLauncherColPart expands NaliWActor;

function SetCollidingPart(float ColRadius, float ColHeight)
{
	SetCollision(True, True, True);
	SetCollisionSize(ColRadius, ColHeight);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=LodMesh'UnrealShare.BarrelM'
	RemoteRole=ROLE_SimulatedProxy
	Style=STY_Translucent
	MultiSkins(0)=TranslucInvis
	MultiSkins(1)=TranslucInvis
	MultiSkins(2)=TranslucInvis
	MultiSkins(3)=TranslucInvis
	MultiSkins(4)=TranslucInvis
	MultiSkins(5)=TranslucInvis
	MultiSkins(6)=TranslucInvis
	MultiSkins(7)=TranslucInvis
	Texture=TranslucInvis
	Skin=TranslucInvis
	LODBias=0.250000
	DrawScale=0.010000
}
