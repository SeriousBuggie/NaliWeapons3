//////////////////////////////////////////////////////////////
//	Nali Weapons III Decal Generator class
//				Feralidragon (21-03-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWDecalGen expands UT_HeavyWallHitEffect
abstract;

var() class<Decal> DecalClass;

simulated function SpawnEffects()
{
local bool bFog;

	if (DecalClass != None)
	{
		bFog = Region.Zone.bFogZone;
		if (bFog)
			Region.Zone.bFogZone = False;
		
		Spawn(DecalClass);
		
		Region.Zone.bFogZone = bFog;
	}
}

defaultproperties
{
	bHidden=False
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
}