//////////////////////////////////////////////////////////////
//				Feralidragon (10-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCBaseColPart expands NaliWActor;

function SetCollidingPart(float ColRadius, float ColHeight, optional bool noActorCol)
{
	SetCollision(True, !noActorCol, True);
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
	bNetTemporary=False
}
