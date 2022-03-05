//////////////////////////////////////////////////////////////
// Gore controller board for different blood types
//				Feralidragon (10-02-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWGoreCBoard expands NaliWActor
abstract;

//Blood modulated explosion A [RED]
#exec TEXTURE IMPORT NAME=BloodExplRedModA01 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModA01.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModA02 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModA02.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModA03 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModA03.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModA04 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModA04.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModA05 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModA05.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModA06 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModA06.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModA07 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModA07.bmp GROUP=Effects

//Blood modulated explosion B [RED]
#exec TEXTURE IMPORT NAME=BloodExplRedModB01 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModB01.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModB02 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModB02.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModB03 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModB03.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModB04 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModB04.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModB05 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModB05.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModB06 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModB06.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModB07 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModB07.bmp GROUP=Effects

//Blood modulated explosion C [RED]
#exec TEXTURE IMPORT NAME=BloodExplRedModC01 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModC01.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModC02 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModC02.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModC03 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModC03.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModC04 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModC04.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModC05 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModC05.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModC06 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModC06.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModC07 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModC07.bmp GROUP=Effects

//Blood modulated explosion D [RED]
#exec TEXTURE IMPORT NAME=BloodExplRedModD01 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModD01.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModD02 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModD02.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModD03 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModD03.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModD04 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModD04.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModD05 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModD05.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModD06 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModD06.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedModD07 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedModD07.bmp GROUP=Effects

//Blood translucent explosion A [RED]
#exec TEXTURE IMPORT NAME=BloodExplRedTransA01 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransA01.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransA02 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransA02.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransA03 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransA03.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransA04 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransA04.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransA05 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransA05.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransA06 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransA06.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransA07 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransA07.bmp GROUP=Effects

//Blood translucent explosion B [RED]
#exec TEXTURE IMPORT NAME=BloodExplRedTransB01 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransB01.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransB02 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransB02.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransB03 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransB03.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransB04 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransB04.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransB05 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransB05.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransB06 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransB06.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransB07 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransB07.bmp GROUP=Effects

//Blood translucent explosion C [RED]
#exec TEXTURE IMPORT NAME=BloodExplRedTransC01 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransC01.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransC02 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransC02.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransC03 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransC03.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransC04 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransC04.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransC05 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransC05.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransC06 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransC06.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransC07 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransC07.bmp GROUP=Effects

//Blood translucent explosion D [RED]
#exec TEXTURE IMPORT NAME=BloodExplRedTransD01 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransD01.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransD02 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransD02.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransD03 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransD03.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransD04 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransD04.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransD05 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransD05.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransD06 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransD06.bmp GROUP=Effects
#exec TEXTURE IMPORT NAME=BloodExplRedTransD07 FILE=EFFECTS\BLOOD\EXPLX\BloodExplRedTransD07.bmp GROUP=Effects

//Blood burst particles [RED]
#exec TEXTURE IMPORT NAME=BloodRedParticle01 FILE=EFFECTS\BLOOD\Particles\BloodRedParticle01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=BloodRedParticle02 FILE=EFFECTS\BLOOD\Particles\BloodRedParticle02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=BloodRedParticle03 FILE=EFFECTS\BLOOD\Particles\BloodRedParticle03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=BloodRedParticle04 FILE=EFFECTS\BLOOD\Particles\BloodRedParticle04.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=BloodRedParticle05 FILE=EFFECTS\BLOOD\Particles\BloodRedParticle05.bmp GROUP=Blood

//Meat textures [RED]
#exec TEXTURE IMPORT NAME=NWMeat01 FILE=EFFECTS\BLOOD\Meat\NWMeat01.bmp GROUP=Meat
#exec TEXTURE IMPORT NAME=NWMeat02 FILE=EFFECTS\BLOOD\Meat\NWMeat02.bmp GROUP=Meat
#exec TEXTURE IMPORT NAME=NWMeat03 FILE=EFFECTS\BLOOD\Meat\NWMeat03.bmp GROUP=Meat
#exec TEXTURE IMPORT NAME=NWMeat04 FILE=EFFECTS\BLOOD\Meat\NWMeat04.bmp GROUP=Meat
#exec TEXTURE IMPORT NAME=NWMeat05 FILE=EFFECTS\BLOOD\Meat\NWMeat05.bmp GROUP=Meat
#exec TEXTURE IMPORT NAME=NWMeat03Alt FILE=EFFECTS\BLOOD\Meat\NWMeat03Alt.bmp GROUP=Meat
#exec TEXTURE IMPORT NAME=NWMeat03AltB FILE=EFFECTS\BLOOD\Meat\NWMeat03AltB.bmp GROUP=Meat
#exec TEXTURE IMPORT NAME=NWMeat02Alt FILE=EFFECTS\BLOOD\Meat\NWMeat02Alt.bmp GROUP=Meat

//Bone texture [RED]
#exec TEXTURE IMPORT NAME=BoneSk FILE=EFFECTS\BLOOD\Bone\BoneSk.bmp GROUP=Bone

//Cord textures [RED]
#exec TEXTURE IMPORT NAME=CordRedA FILE=EFFECTS\BLOOD\Cords\CordRedA.bmp GROUP=Cords
#exec TEXTURE IMPORT NAME=CordRedB FILE=EFFECTS\BLOOD\Cords\CordRedB.bmp GROUP=Cords



var() class<NWBloodSlideDecal> BloodSlideDecalClass;
var() class<NWBloodDecal> BloodDecalClass, BloodGrowingDecalClass;
var() texture BloodBurstParticlesTex[5];
var() texture MeatTexture[5], MeatTextureAlt[5], BoneTexture;

var() texture ExplTransTexA[7], ExplTransTexB[7], ExplTransTexC[7], ExplTransTexD[7];
var() texture ExplModTexA[7], ExplModTexB[7], ExplModTexC[7], ExplModTexD[7];


simulated static function NWBloodSlideDecal SpawnBloodSlide(Actor origA, vector Loc, rotator Rot)
{
	if (origA == None || default.BloodSlideDecalClass == None)
		return None;
	return origA.Spawn(default.BloodSlideDecalClass,,, Loc, Rot);
}

simulated static function NWBloodDecal SpawnBloodDecal(Actor origA, rotator Rot, optional bool bGrowing, optional float decalLifespan)
{
local NWBloodDecal nwBldDecal;
	
	if (origA == None || default.BloodDecalClass == None || default.BloodGrowingDecalClass == None)
		return None;
	if (bGrowing)
		nwBldDecal = origA.Spawn(default.BloodGrowingDecalClass,,,, Rot);
	else
		nwBldDecal = origA.Spawn(default.BloodDecalClass,,,, Rot);
		
	if (nwBldDecal != None && decalLifespan > 0.0)
		nwBldDecal.LifeSpan = decalLifespan;
	return nwBldDecal;
}

simulated static function InitBloodBurst(Actor bldBurst)
{
local byte i;

	if (bldBurst != None)
	{
		for (i = 0; i < ArrayCount(bldBurst.MultiSkins); i++)
			bldBurst.MultiSkins[i] = default.BloodBurstParticlesTex[Rand(ArrayCount(default.BloodBurstParticlesTex))];
	}
}

simulated static function texture GetExplTexture(byte i, optional byte cat, optional bool bModulated)
{
	if (i >= ArrayCount(default.ExplTransTexA))
		return None;
	
	if (bModulated)
	{
		if (cat == 0)
			return default.ExplModTexA[i];
		else if (cat == 1)
			return default.ExplModTexB[i];
		else if (cat == 2)
			return default.ExplModTexC[i];
		else if (cat == 3)
			return default.ExplModTexD[i];
	}
	else
	{
		if (cat == 0)
			return default.ExplTransTexA[i];
		else if (cat == 1)
			return default.ExplTransTexB[i];
		else if (cat == 2)
			return default.ExplTransTexC[i];
		else if (cat == 3)
			return default.ExplTransTexD[i];
	}
	
	return None;
}

simulated static function texture GetMeatTexture()
{
	return default.MeatTexture[Rand(ArrayCount(default.MeatTexture))];
}

simulated static function texture GetMeatTextureAlt()
{
	return default.MeatTextureAlt[Rand(ArrayCount(default.MeatTextureAlt))];
}

simulated static function texture GetBoneTexture()
{
	return default.BoneTexture;
}

simulated static function SetCordSegmGore(NWCordSegm cordSegm)
{
	if (NWGoreSegmB(cordSegm) != None)
		cordSegm.MultiSkins[1] = Texture'CordRedB';
	else if (NWGoreSegmA(cordSegm) != None)
		cordSegm.MultiSkins[1] = Texture'CordRedA';
	else if (cordSegm != None)
		cordSegm.MultiSkins[1] = Texture'NWMeat02';
}

simulated static function SetCordAttachGore(NWCordAttachment cordAttach);


defaultproperties
{
	BloodSlideDecalClass=Class'NWBloodSlideDecal'
	BloodDecalClass=Class'NWBloodDecal'
	BloodGrowingDecalClass=Class'NWBloodGrowingDecal'
	
	BloodBurstParticlesTex(0)=BloodRedParticle01
	BloodBurstParticlesTex(1)=BloodRedParticle02
	BloodBurstParticlesTex(2)=BloodRedParticle03
	BloodBurstParticlesTex(3)=BloodRedParticle04
	BloodBurstParticlesTex(4)=BloodRedParticle05
	
	MeatTexture(0)=NWMeat01
	MeatTexture(1)=NWMeat02
	MeatTexture(2)=NWMeat03
	MeatTexture(3)=NWMeat04
	MeatTexture(4)=NWMeat05
	
	MeatTextureAlt(0)=NWMeat03
	MeatTextureAlt(1)=NWMeat03Alt
	MeatTextureAlt(2)=NWMeat03AltB
	MeatTextureAlt(3)=NWMeat02
	MeatTextureAlt(4)=NWMeat02Alt
	
	BoneTexture=BoneSk

	ExplTransTexA(0)=BloodExplRedTransA01
	ExplTransTexA(1)=BloodExplRedTransA02
	ExplTransTexA(2)=BloodExplRedTransA03
	ExplTransTexA(3)=BloodExplRedTransA04
	ExplTransTexA(4)=BloodExplRedTransA05
	ExplTransTexA(5)=BloodExplRedTransA06
	ExplTransTexA(6)=BloodExplRedTransA07
	ExplTransTexB(0)=BloodExplRedTransB01
	ExplTransTexB(1)=BloodExplRedTransB02
	ExplTransTexB(2)=BloodExplRedTransB03
	ExplTransTexB(3)=BloodExplRedTransB04
	ExplTransTexB(4)=BloodExplRedTransB05
	ExplTransTexB(5)=BloodExplRedTransB06
	ExplTransTexB(6)=BloodExplRedTransB07
	ExplTransTexC(0)=BloodExplRedTransC01
	ExplTransTexC(1)=BloodExplRedTransC02
	ExplTransTexC(2)=BloodExplRedTransC03
	ExplTransTexC(3)=BloodExplRedTransC04
	ExplTransTexC(4)=BloodExplRedTransC05
	ExplTransTexC(5)=BloodExplRedTransC06
	ExplTransTexC(6)=BloodExplRedTransC07
	ExplTransTexD(0)=BloodExplRedTransD01
	ExplTransTexD(1)=BloodExplRedTransD02
	ExplTransTexD(2)=BloodExplRedTransD03
	ExplTransTexD(3)=BloodExplRedTransD04
	ExplTransTexD(4)=BloodExplRedTransD05
	ExplTransTexD(5)=BloodExplRedTransD06
	ExplTransTexD(6)=BloodExplRedTransD07
	
	ExplModTexA(0)=BloodExplRedModA01
	ExplModTexA(1)=BloodExplRedModA02
	ExplModTexA(2)=BloodExplRedModA03
	ExplModTexA(3)=BloodExplRedModA04
	ExplModTexA(4)=BloodExplRedModA05
	ExplModTexA(5)=BloodExplRedModA06
	ExplModTexA(6)=BloodExplRedModA07
	ExplModTexB(0)=BloodExplRedModB01
	ExplModTexB(1)=BloodExplRedModB02
	ExplModTexB(2)=BloodExplRedModB03
	ExplModTexB(3)=BloodExplRedModB04
	ExplModTexB(4)=BloodExplRedModB05
	ExplModTexB(5)=BloodExplRedModB06
	ExplModTexB(6)=BloodExplRedModB07
	ExplModTexC(0)=BloodExplRedModC01
	ExplModTexC(1)=BloodExplRedModC02
	ExplModTexC(2)=BloodExplRedModC03
	ExplModTexC(3)=BloodExplRedModC04
	ExplModTexC(4)=BloodExplRedModC05
	ExplModTexC(5)=BloodExplRedModC06
	ExplModTexC(6)=BloodExplRedModC07
	ExplModTexD(0)=BloodExplRedModD01
	ExplModTexD(1)=BloodExplRedModD02
	ExplModTexD(2)=BloodExplRedModD03
	ExplModTexD(3)=BloodExplRedModD04
	ExplModTexD(4)=BloodExplRedModD05
	ExplModTexD(5)=BloodExplRedModD06
	ExplModTexD(6)=BloodExplRedModD07
}
