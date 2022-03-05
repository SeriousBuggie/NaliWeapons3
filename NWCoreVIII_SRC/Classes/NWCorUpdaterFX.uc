//////////////////////////////////////////////////////////////
//	Nali Weapons III Dynamic Corona/LensFlare Updater
//				Feralidragon (12-03-2011)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWCorUpdaterFX expands NaliWActor;

var Actor CorToUpdate;

simulated function Tick(float Delta)
{
	if (CorToUpdate != None)
		CorToUpdate.Tick(0.5);
}

defaultproperties
{
	DrawType=DT_Sprite
	Style=STY_Translucent
	bUnlit=True
	Texture=TranslucInvis
	RemoteRole=ROLE_SimulatedProxy
	CollisionHeight=0.000000
	CollisionRadius=0.000000
	Mass=0.000000
	LifeSpan=0.000000
	bNetTemporary=False
}
