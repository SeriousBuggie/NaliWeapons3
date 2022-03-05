//////////////////////////////////////////////////////////////
//	Nali Weapons III Bolt spark
//				Feralidragon (23-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class WRESoldSpark expands WRESpark;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	DrawScale = FRand() * 0.25 + 0.1;
}

defaultproperties
{
}
