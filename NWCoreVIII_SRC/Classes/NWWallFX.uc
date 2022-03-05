//////////////////////////////////////////////////////////////
//	Nali Weapons III wall texture Effects class
//				Feralidragon (01-07-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWallFX expands UT_HeavyWallHitEffect
abstract;

var texture WallTex;

simulated function SpawnEffects()
{
local NWWallTexDetector NWDec;
local bool bFog;

	if (!Class'NWInfo'.default.enableDebris || Class'NaliZPEffects'.static.isStaticZPDiscarded(Owner))
		return;

	bFog = Region.Zone.bFogZone;
	if (bFog)
		Region.Zone.bFogZone = False;
	
	if (NuclearExplosions(Owner) != None && NuclearExplosions(Owner).NukeFloorTex != None)
		WallTex = NuclearExplosions(Owner).NukeFloorTex;
	else
	{
		NWDec = Spawn(Class'NWWallTexDetector');
		WallTex = NWDec.AttachDecal(200);
		NWDec.Destroy();
		NWDec = None;
	}
	
	InitPlayFX();
	Region.Zone.bFogZone = bFog;
}

simulated function InitPlayFX();

defaultproperties
{
	bNetTemporary=False
	bHidden=False
	bGameRelevant=True
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