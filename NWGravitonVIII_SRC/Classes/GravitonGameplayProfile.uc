//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravitonGameplayProfile expands NWProfile config(NWProfilesCfg);

struct GravitonStructA
{
	var() bool bGravitonFlyHack, bUseGhostGrabStyle, bCanGrabOwnedObjects, bUseGravityBeamOnly, bGravitonStraightBeam, bUseVortexProjectile, bUseVortexPhysics;
};
var() config GravitonStructA GravitonProfileA[8];

struct GravitonStructB
{
	var() bool bScoreGrabAndDropFrags, bCanGrabTeam, bBeamSmashDamage, bUseSpringBeamPhysics, bUseSpringMassPhysics;
};
var() config GravitonStructB GravitonProfileB[8];

struct GravitonStructC
{
	var() byte GravityBallAmmoConsumption, GravityBeamSize;
	var() float SmashDifficulty, GravityBeamBendFactor, GravityBeamInertia;
};
var() config GravitonStructC GravitonProfileC[8];

struct GravitonStructD
{
	var() byte GravityBeamStartSpeed, GravityBeamEndSpeed;
	var() float VortexRadius;
	var() int VortexDamage;
};
var() config GravitonStructD GravitonProfileD[8];

struct GravitonStructE
{
	var() bool enableSmashShake;
	var() float GravitonFlyHackSpeedMult, ThrowDamageMaxTime, SmashMinSpeed;
};
var() config GravitonStructE GravitonProfileE[8];

struct GravOversStructA
{
	var() bool enableOversurrection, bOversurrectiveVtxPhysics, bOversurrectivePullProj;
	var() int OversurrectiveDamage;
};
var() config GravOversStructA GravOversProfileA[8];

struct GravOversStructB
{
	var() float OversurrectionLifeTime, OversurrectivePullStrength, OversurrectivePullRadius, OversurrectivePullRate;
};
var() config GravOversStructB GravOversProfileB[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local Graviton Grav;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'Graviton'.default.bGravitonFlyHack = default.GravitonProfileA[i].bGravitonFlyHack;
	Class'Graviton'.default.bUseGhostGrabStyle = default.GravitonProfileA[i].bUseGhostGrabStyle;
	Class'Graviton'.default.bCanGrabOwnedObjects = default.GravitonProfileA[i].bCanGrabOwnedObjects;
	Class'Graviton'.default.bUseGravityBeamOnly = default.GravitonProfileA[i].bUseGravityBeamOnly;
	Class'Graviton'.default.bGravitonStraightBeam = default.GravitonProfileA[i].bGravitonStraightBeam;
	Class'Graviton'.default.bUseVortexProjectile = default.GravitonProfileA[i].bUseVortexProjectile;
	Class'Graviton'.default.bUseVortexPhysics = default.GravitonProfileA[i].bUseVortexPhysics;
	
	Class'Graviton'.default.bScoreGrabAndDropFrags = default.GravitonProfileB[i].bScoreGrabAndDropFrags;
	Class'Graviton'.default.bCanGrabTeam = default.GravitonProfileB[i].bCanGrabTeam;
	Class'Graviton'.default.bBeamSmashDamage = default.GravitonProfileB[i].bBeamSmashDamage;
	Class'Graviton'.default.bUseSpringBeamPhysics = default.GravitonProfileB[i].bUseSpringBeamPhysics;
	Class'Graviton'.default.bUseSpringMassPhysics = default.GravitonProfileB[i].bUseSpringMassPhysics;
	
	Class'Graviton'.default.GravityBallAmmoConsumption = default.GravitonProfileC[i].GravityBallAmmoConsumption;
	Class'Graviton'.default.GravityBeamSize = default.GravitonProfileC[i].GravityBeamSize;
	Class'Graviton'.default.SmashDifficulty = default.GravitonProfileC[i].SmashDifficulty;
	Class'Graviton'.default.GravityBeamBendFactor = default.GravitonProfileC[i].GravityBeamBendFactor;
	Class'Graviton'.default.GravityBeamInertia = default.GravitonProfileC[i].GravityBeamInertia;
	
	Class'Graviton'.default.GravityBeamStartSpeed = Class'Graviton'.static.GetEGSpeedFromByte(default.GravitonProfileD[i].GravityBeamStartSpeed);
	Class'Graviton'.default.GravityBeamEndSpeed = Class'Graviton'.static.GetEGSpeedFromByte(default.GravitonProfileD[i].GravityBeamEndSpeed);
	Class'Graviton'.default.VortexRadius = default.GravitonProfileD[i].VortexRadius;
	Class'Graviton'.default.VortexDamage = default.GravitonProfileD[i].VortexDamage;
	
	Class'Graviton'.default.enableSmashShake = default.GravitonProfileE[i].enableSmashShake;
	Class'Graviton'.default.GravitonFlyHackSpeedMult = default.GravitonProfileE[i].GravitonFlyHackSpeedMult;
	Class'Graviton'.default.ThrowDamageMaxTime = default.GravitonProfileE[i].ThrowDamageMaxTime;
	Class'Graviton'.default.SmashMinSpeed = default.GravitonProfileE[i].SmashMinSpeed;
	
	Class'Graviton'.default.enableOversurrection = default.GravOversProfileA[i].enableOversurrection;
	Class'Graviton'.default.bOversurrectiveVtxPhysics = default.GravOversProfileA[i].bOversurrectiveVtxPhysics;
	Class'Graviton'.default.bOversurrectivePullProj = default.GravOversProfileA[i].bOversurrectivePullProj;
	Class'Graviton'.default.OversurrectiveDamage = default.GravOversProfileA[i].OversurrectiveDamage;
	
	Class'Graviton'.default.OversurrectionLifeTime = default.GravOversProfileB[i].OversurrectionLifeTime;
	Class'Graviton'.default.OversurrectivePullStrength = default.GravOversProfileB[i].OversurrectivePullStrength;
	Class'Graviton'.default.OversurrectivePullRadius = default.GravOversProfileB[i].OversurrectivePullRadius;
	Class'Graviton'.default.OversurrectivePullRate = default.GravOversProfileB[i].OversurrectivePullRate;
	
	if (Lvl == None)
		Class'Graviton'.static.StaticSaveConfig();
		
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'Graviton', Grav)
		{
			Grav.default.bGravitonFlyHack = Class'Graviton'.default.bGravitonFlyHack;
			Grav.bGravitonFlyHack = Class'Graviton'.default.bGravitonFlyHack;
			Grav.default.bUseGhostGrabStyle = Class'Graviton'.default.bUseGhostGrabStyle;
			Grav.bUseGhostGrabStyle = Class'Graviton'.default.bUseGhostGrabStyle;
			Grav.default.bCanGrabOwnedObjects = Class'Graviton'.default.bCanGrabOwnedObjects;
			Grav.bCanGrabOwnedObjects = Class'Graviton'.default.bCanGrabOwnedObjects;
			Grav.default.bUseGravityBeamOnly = Class'Graviton'.default.bUseGravityBeamOnly;
			Grav.bUseGravityBeamOnly = Class'Graviton'.default.bUseGravityBeamOnly;
			Grav.default.bGravitonStraightBeam = Class'Graviton'.default.bGravitonStraightBeam;
			Grav.bGravitonStraightBeam = Class'Graviton'.default.bGravitonStraightBeam;
			Grav.default.bUseVortexProjectile = Class'Graviton'.default.bUseVortexProjectile;
			Grav.bUseVortexProjectile = Class'Graviton'.default.bUseVortexProjectile;
			Grav.default.bUseVortexPhysics = Class'Graviton'.default.bUseVortexPhysics;
			Grav.bUseVortexPhysics = Class'Graviton'.default.bUseVortexPhysics;

			Grav.default.bScoreGrabAndDropFrags = Class'Graviton'.default.bScoreGrabAndDropFrags;
			Grav.bScoreGrabAndDropFrags = Class'Graviton'.default.bScoreGrabAndDropFrags;
			Grav.default.bCanGrabTeam = Class'Graviton'.default.bCanGrabTeam;
			Grav.bCanGrabTeam = Class'Graviton'.default.bCanGrabTeam;
			Grav.default.bBeamSmashDamage = Class'Graviton'.default.bBeamSmashDamage;
			Grav.bBeamSmashDamage = Class'Graviton'.default.bBeamSmashDamage;
			Grav.default.bUseSpringBeamPhysics = Class'Graviton'.default.bUseSpringBeamPhysics;
			Grav.bUseSpringBeamPhysics = Class'Graviton'.default.bUseSpringBeamPhysics;
			Grav.default.bUseSpringMassPhysics = Class'Graviton'.default.bUseSpringMassPhysics;
			Grav.bUseSpringMassPhysics = Class'Graviton'.default.bUseSpringMassPhysics;

			Grav.default.GravityBallAmmoConsumption = Class'Graviton'.default.GravityBallAmmoConsumption;
			Grav.GravityBallAmmoConsumption = Class'Graviton'.default.GravityBallAmmoConsumption;
			Grav.default.GravityBeamSize = Class'Graviton'.default.GravityBeamSize;
			Grav.GravityBeamSize = Class'Graviton'.default.GravityBeamSize;
			Grav.default.SmashDifficulty = Class'Graviton'.default.SmashDifficulty;
			Grav.SmashDifficulty = Class'Graviton'.default.SmashDifficulty;
			Grav.default.GravityBeamBendFactor = Class'Graviton'.default.GravityBeamBendFactor;
			Grav.GravityBeamBendFactor = Class'Graviton'.default.GravityBeamBendFactor;
			Grav.default.GravityBeamInertia = Class'Graviton'.default.GravityBeamInertia;
			Grav.GravityBeamInertia = Class'Graviton'.default.GravityBeamInertia;

			Grav.default.GravityBeamStartSpeed = Class'Graviton'.default.GravityBeamStartSpeed;
			Grav.GravityBeamStartSpeed = Class'Graviton'.default.GravityBeamStartSpeed;
			Grav.default.GravityBeamEndSpeed = Class'Graviton'.default.GravityBeamEndSpeed;
			Grav.GravityBeamEndSpeed = Class'Graviton'.default.GravityBeamEndSpeed;
			
			Grav.default.VortexRadius = Class'Graviton'.default.VortexRadius;
			Grav.VortexRadius = Class'Graviton'.default.VortexRadius;
			Grav.default.VortexDamage = Class'Graviton'.default.VortexDamage;
			Grav.VortexDamage = Class'Graviton'.default.VortexDamage;
			
			Grav.default.enableSmashShake = Class'Graviton'.default.enableSmashShake;
			Grav.enableSmashShake = Class'Graviton'.default.enableSmashShake;
			Grav.default.GravitonFlyHackSpeedMult = Class'Graviton'.default.GravitonFlyHackSpeedMult;
			Grav.GravitonFlyHackSpeedMult = Class'Graviton'.default.GravitonFlyHackSpeedMult;
			Grav.default.ThrowDamageMaxTime = Class'Graviton'.default.ThrowDamageMaxTime;
			Grav.ThrowDamageMaxTime = Class'Graviton'.default.ThrowDamageMaxTime;
			Grav.default.SmashMinSpeed = Class'Graviton'.default.SmashMinSpeed;
			Grav.SmashMinSpeed = Class'Graviton'.default.SmashMinSpeed;
			
			Grav.default.enableOversurrection = Class'Graviton'.default.enableOversurrection;
			Grav.enableOversurrection = Class'Graviton'.default.enableOversurrection;
			Grav.default.bOversurrectiveVtxPhysics = Class'Graviton'.default.bOversurrectiveVtxPhysics;
			Grav.bOversurrectiveVtxPhysics = Class'Graviton'.default.bOversurrectiveVtxPhysics;
			Grav.default.bOversurrectivePullProj = Class'Graviton'.default.bOversurrectivePullProj;
			Grav.bOversurrectivePullProj = Class'Graviton'.default.bOversurrectivePullProj;
			Grav.default.OversurrectiveDamage = Class'Graviton'.default.OversurrectiveDamage;
			Grav.OversurrectiveDamage = Class'Graviton'.default.OversurrectiveDamage;
			
			Grav.default.OversurrectionLifeTime = Class'Graviton'.default.OversurrectionLifeTime;
			Grav.OversurrectionLifeTime = Class'Graviton'.default.OversurrectionLifeTime;
			Grav.default.OversurrectivePullStrength = Class'Graviton'.default.OversurrectivePullStrength;
			Grav.OversurrectivePullStrength = Class'Graviton'.default.OversurrectivePullStrength;
			Grav.default.OversurrectivePullRadius = Class'Graviton'.default.OversurrectivePullRadius;
			Grav.OversurrectivePullRadius = Class'Graviton'.default.OversurrectivePullRadius;
			Grav.default.OversurrectivePullRate = Class'Graviton'.default.OversurrectivePullRate;
			Grav.OversurrectivePullRate = Class'Graviton'.default.OversurrectivePullRate;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.GravitonProfileA[i].bGravitonFlyHack = Class'Graviton'.default.bGravitonFlyHack;
	default.GravitonProfileA[i].bUseGhostGrabStyle = Class'Graviton'.default.bUseGhostGrabStyle;
	default.GravitonProfileA[i].bCanGrabOwnedObjects = Class'Graviton'.default.bCanGrabOwnedObjects;
	default.GravitonProfileA[i].bUseGravityBeamOnly = Class'Graviton'.default.bUseGravityBeamOnly;
	default.GravitonProfileA[i].bGravitonStraightBeam = Class'Graviton'.default.bGravitonStraightBeam;
	default.GravitonProfileA[i].bUseVortexProjectile = Class'Graviton'.default.bUseVortexProjectile;
	default.GravitonProfileA[i].bUseVortexPhysics = Class'Graviton'.default.bUseVortexPhysics;
	
	default.GravitonProfileB[i].bScoreGrabAndDropFrags = Class'Graviton'.default.bScoreGrabAndDropFrags;
	default.GravitonProfileB[i].bCanGrabTeam = Class'Graviton'.default.bCanGrabTeam;
	default.GravitonProfileB[i].bBeamSmashDamage = Class'Graviton'.default.bBeamSmashDamage;
	default.GravitonProfileB[i].bUseSpringBeamPhysics = Class'Graviton'.default.bUseSpringBeamPhysics;
	default.GravitonProfileB[i].bUseSpringMassPhysics = Class'Graviton'.default.bUseSpringMassPhysics;
	
	default.GravitonProfileC[i].GravityBallAmmoConsumption = Class'Graviton'.default.GravityBallAmmoConsumption;
	default.GravitonProfileC[i].GravityBeamSize = Class'Graviton'.default.GravityBeamSize;
	default.GravitonProfileC[i].SmashDifficulty = Class'Graviton'.default.SmashDifficulty;
	default.GravitonProfileC[i].GravityBeamBendFactor = Class'Graviton'.default.GravityBeamBendFactor;
	default.GravitonProfileC[i].GravityBeamInertia = Class'Graviton'.default.GravityBeamInertia;
	
	default.GravitonProfileD[i].GravityBeamStartSpeed = Class'Graviton'.default.GravityBeamStartSpeed;
	default.GravitonProfileD[i].GravityBeamEndSpeed = Class'Graviton'.default.GravityBeamEndSpeed;
	default.GravitonProfileD[i].VortexRadius = Class'Graviton'.default.VortexRadius;
	default.GravitonProfileD[i].VortexDamage = Class'Graviton'.default.VortexDamage;
	
	default.GravitonProfileE[i].enableSmashShake = Class'Graviton'.default.enableSmashShake;
	default.GravitonProfileE[i].GravitonFlyHackSpeedMult = Class'Graviton'.default.GravitonFlyHackSpeedMult;
	default.GravitonProfileE[i].ThrowDamageMaxTime = Class'Graviton'.default.ThrowDamageMaxTime;
	default.GravitonProfileE[i].SmashMinSpeed = Class'Graviton'.default.SmashMinSpeed;
	
	default.GravOversProfileA[i].enableOversurrection = Class'Graviton'.default.enableOversurrection;
	default.GravOversProfileA[i].bOversurrectiveVtxPhysics = Class'Graviton'.default.bOversurrectiveVtxPhysics;
	default.GravOversProfileA[i].bOversurrectivePullProj = Class'Graviton'.default.bOversurrectivePullProj;
	default.GravOversProfileA[i].OversurrectiveDamage = Class'Graviton'.default.OversurrectiveDamage;
	
	default.GravOversProfileB[i].OversurrectionLifeTime = Class'Graviton'.default.OversurrectionLifeTime;
	default.GravOversProfileB[i].OversurrectivePullStrength = Class'Graviton'.default.OversurrectivePullStrength;
	default.GravOversProfileB[i].OversurrectivePullRadius = Class'Graviton'.default.OversurrectivePullRadius;
	default.GravOversProfileB[i].OversurrectivePullRate = Class'Graviton'.default.OversurrectivePullRate;
	
	StaticSaveConfig();
}


defaultproperties
{
	GravitonProfileA(0)=(bGravitonFlyHack=False,bUseGhostGrabStyle=False,bCanGrabOwnedObjects=False,bUseGravityBeamOnly=False,bGravitonStraightBeam=False,bUseVortexProjectile=False,bUseVortexPhysics=True)
	GravitonProfileB(0)=(bScoreGrabAndDropFrags=True,bCanGrabTeam=True,bBeamSmashDamage=True,bUseSpringBeamPhysics=True,bUseSpringMassPhysics=True)
	GravitonProfileC(0)=(GravityBallAmmoConsumption=25,GravityBeamSize=6,SmashDifficulty=4.000000,GravityBeamBendFactor=9.500000,GravityBeamInertia=0.900000)
	GravitonProfileD(0)=(GravityBeamStartSpeed=0,GravityBeamEndSpeed=0,VortexRadius=128.000000,VortexDamage=65)
	GravitonProfileE(0)=(enableSmashShake=True,GravitonFlyHackSpeedMult=1.000000,ThrowDamageMaxTime=1.000000,SmashMinSpeed=1800.000000)
	GravOversProfileA(0)=(enableOversurrection=True,OversurrectiveDamage=300,bOversurrectiveVtxPhysics=True,bOversurrectivePullProj=False)
	GravOversProfileB(0)=(OversurrectionLifeTime=15.000000,OversurrectivePullStrength=1000.000000,OversurrectivePullRadius=6000.000000,OversurrectivePullRate=10.000000)
	
	GravitonProfileA(1)=(bGravitonFlyHack=False,bUseGhostGrabStyle=False,bCanGrabOwnedObjects=False,bUseGravityBeamOnly=False,bGravitonStraightBeam=False,bUseVortexProjectile=False,bUseVortexPhysics=True)
	GravitonProfileB(1)=(bScoreGrabAndDropFrags=True,bCanGrabTeam=True,bBeamSmashDamage=True,bUseSpringBeamPhysics=True,bUseSpringMassPhysics=True)
	GravitonProfileC(1)=(GravityBallAmmoConsumption=20,GravityBeamSize=7,SmashDifficulty=3.000000,GravityBeamBendFactor=9.500000,GravityBeamInertia=0.900000)
	GravitonProfileD(1)=(GravityBeamStartSpeed=1,GravityBeamEndSpeed=1,VortexRadius=256.000000,VortexDamage=65)
	GravitonProfileE(1)=(enableSmashShake=True,GravitonFlyHackSpeedMult=1.000000,ThrowDamageMaxTime=1.500000,SmashMinSpeed=1500.000000)
	GravOversProfileA(1)=(enableOversurrection=True,OversurrectiveDamage=500,bOversurrectiveVtxPhysics=True,bOversurrectivePullProj=True)
	GravOversProfileB(1)=(OversurrectionLifeTime=20.000000,OversurrectivePullStrength=1000.000000,OversurrectivePullRadius=8000.000000,OversurrectivePullRate=10.000000)
	
	GravitonProfileA(2)=(bGravitonFlyHack=False,bUseGhostGrabStyle=False,bCanGrabOwnedObjects=False,bUseGravityBeamOnly=False,bGravitonStraightBeam=False,bUseVortexProjectile=False,bUseVortexPhysics=True)
	GravitonProfileB(2)=(bScoreGrabAndDropFrags=True,bCanGrabTeam=True,bBeamSmashDamage=True,bUseSpringBeamPhysics=True,bUseSpringMassPhysics=True)
	GravitonProfileC(2)=(GravityBallAmmoConsumption=15,GravityBeamSize=9,SmashDifficulty=2.000000,GravityBeamBendFactor=9.500000,GravityBeamInertia=0.900000)
	GravitonProfileD(2)=(GravityBeamStartSpeed=2,GravityBeamEndSpeed=2,VortexRadius=256.000000,VortexDamage=95)
	GravitonProfileE(2)=(enableSmashShake=True,GravitonFlyHackSpeedMult=1.000000,ThrowDamageMaxTime=2.000000,SmashMinSpeed=1200.000000)
	GravOversProfileA(2)=(enableOversurrection=True,OversurrectiveDamage=1000,bOversurrectiveVtxPhysics=False,bOversurrectivePullProj=True)
	GravOversProfileB(2)=(OversurrectionLifeTime=25.000000,OversurrectivePullStrength=1000.000000,OversurrectivePullRadius=10000.000000,OversurrectivePullRate=10.000000)
	
	GravitonProfileA(3)=(bGravitonFlyHack=False,bUseGhostGrabStyle=False,bCanGrabOwnedObjects=False,bUseGravityBeamOnly=False,bGravitonStraightBeam=False,bUseVortexProjectile=False,bUseVortexPhysics=True)
	GravitonProfileB(3)=(bScoreGrabAndDropFrags=True,bCanGrabTeam=True,bBeamSmashDamage=True,bUseSpringBeamPhysics=True,bUseSpringMassPhysics=True)
	GravitonProfileC(3)=(GravityBallAmmoConsumption=15,GravityBeamSize=9,SmashDifficulty=2.750000,GravityBeamBendFactor=9.500000,GravityBeamInertia=0.900000)
	GravitonProfileD(3)=(GravityBeamStartSpeed=1,GravityBeamEndSpeed=1,VortexRadius=256.000000,VortexDamage=450)
	GravitonProfileE(3)=(enableSmashShake=True,GravitonFlyHackSpeedMult=1.000000,ThrowDamageMaxTime=2.000000,SmashMinSpeed=1200.000000)
	GravOversProfileA(3)=(enableOversurrection=True,OversurrectiveDamage=1500,bOversurrectiveVtxPhysics=True,bOversurrectivePullProj=True)
	GravOversProfileB(3)=(OversurrectionLifeTime=35.000000,OversurrectivePullStrength=3000.000000,OversurrectivePullRadius=10000.000000,OversurrectivePullRate=10.000000)
	
	GravitonProfileA(4)=(bGravitonFlyHack=True,bUseGhostGrabStyle=True,bCanGrabOwnedObjects=True,bUseGravityBeamOnly=False,bGravitonStraightBeam=False,bUseVortexProjectile=True,bUseVortexPhysics=True)
	GravitonProfileB(4)=(bScoreGrabAndDropFrags=True,bCanGrabTeam=True,bBeamSmashDamage=True,bUseSpringBeamPhysics=True,bUseSpringMassPhysics=False)
	GravitonProfileC(4)=(GravityBallAmmoConsumption=10,GravityBeamSize=12,SmashDifficulty=1.750000,GravityBeamBendFactor=9.500000,GravityBeamInertia=0.900000)
	GravitonProfileD(4)=(GravityBeamStartSpeed=3,GravityBeamEndSpeed=3,VortexRadius=340.000000,VortexDamage=2000)
	GravitonProfileE(4)=(enableSmashShake=True,GravitonFlyHackSpeedMult=1.000000,ThrowDamageMaxTime=4.000000,SmashMinSpeed=800.000000)
	GravOversProfileA(4)=(enableOversurrection=True,OversurrectiveDamage=10000,bOversurrectiveVtxPhysics=False,bOversurrectivePullProj=True)
	GravOversProfileB(4)=(OversurrectionLifeTime=45.000000,OversurrectivePullStrength=1000.000000,OversurrectivePullRadius=12000.000000,OversurrectivePullRate=10.000000)
	
	GravitonProfileA(5)=(bGravitonFlyHack=False,bUseGhostGrabStyle=False,bCanGrabOwnedObjects=False,bUseGravityBeamOnly=False,bGravitonStraightBeam=False,bUseVortexProjectile=False,bUseVortexPhysics=True)
	GravitonProfileB(5)=(bScoreGrabAndDropFrags=True,bCanGrabTeam=True,bBeamSmashDamage=True,bUseSpringBeamPhysics=True,bUseSpringMassPhysics=True)
	GravitonProfileC(5)=(GravityBallAmmoConsumption=15,GravityBeamSize=9,SmashDifficulty=2.000000,GravityBeamBendFactor=9.500000,GravityBeamInertia=0.900000)
	GravitonProfileD(5)=(GravityBeamStartSpeed=2,GravityBeamEndSpeed=2,VortexRadius=256.000000,VortexDamage=95)
	GravitonProfileE(5)=(enableSmashShake=True,GravitonFlyHackSpeedMult=1.000000,ThrowDamageMaxTime=2.000000,SmashMinSpeed=1200.000000)
	GravOversProfileA(5)=(enableOversurrection=True,OversurrectiveDamage=1000,bOversurrectiveVtxPhysics=False,bOversurrectivePullProj=True)
	GravOversProfileB(5)=(OversurrectionLifeTime=25.000000,OversurrectivePullStrength=1000.000000,OversurrectivePullRadius=10000.000000,OversurrectivePullRate=10.000000)
	
	GravitonProfileA(6)=(bGravitonFlyHack=False,bUseGhostGrabStyle=False,bCanGrabOwnedObjects=False,bUseGravityBeamOnly=False,bGravitonStraightBeam=False,bUseVortexProjectile=False,bUseVortexPhysics=True)
	GravitonProfileB(6)=(bScoreGrabAndDropFrags=True,bCanGrabTeam=True,bBeamSmashDamage=True,bUseSpringBeamPhysics=True,bUseSpringMassPhysics=True)
	GravitonProfileC(6)=(GravityBallAmmoConsumption=15,GravityBeamSize=9,SmashDifficulty=2.000000,GravityBeamBendFactor=9.500000,GravityBeamInertia=0.900000)
	GravitonProfileD(6)=(GravityBeamStartSpeed=2,GravityBeamEndSpeed=2,VortexRadius=256.000000,VortexDamage=95)
	GravitonProfileE(6)=(enableSmashShake=True,GravitonFlyHackSpeedMult=1.000000,ThrowDamageMaxTime=2.000000,SmashMinSpeed=1200.000000)
	GravOversProfileA(6)=(enableOversurrection=True,OversurrectiveDamage=1000,bOversurrectiveVtxPhysics=False,bOversurrectivePullProj=True)
	GravOversProfileB(6)=(OversurrectionLifeTime=25.000000,OversurrectivePullStrength=1000.000000,OversurrectivePullRadius=10000.000000,OversurrectivePullRate=10.000000)
	
	GravitonProfileA(7)=(bGravitonFlyHack=False,bUseGhostGrabStyle=False,bCanGrabOwnedObjects=False,bUseGravityBeamOnly=False,bGravitonStraightBeam=False,bUseVortexProjectile=False,bUseVortexPhysics=True)
	GravitonProfileB(7)=(bScoreGrabAndDropFrags=True,bCanGrabTeam=True,bBeamSmashDamage=True,bUseSpringBeamPhysics=True,bUseSpringMassPhysics=True)
	GravitonProfileC(7)=(GravityBallAmmoConsumption=15,GravityBeamSize=9,SmashDifficulty=2.000000,GravityBeamBendFactor=9.500000,GravityBeamInertia=0.900000)
	GravitonProfileD(7)=(GravityBeamStartSpeed=2,GravityBeamEndSpeed=2,VortexRadius=256.000000,VortexDamage=95)
	GravitonProfileE(7)=(enableSmashShake=True,GravitonFlyHackSpeedMult=1.000000,ThrowDamageMaxTime=2.000000,SmashMinSpeed=1200.000000)
	GravOversProfileA(7)=(enableOversurrection=True,OversurrectiveDamage=1000,bOversurrectiveVtxPhysics=False,bOversurrectivePullProj=True)
	GravOversProfileB(7)=(OversurrectionLifeTime=25.000000,OversurrectivePullStrength=1000.000000,OversurrectivePullRadius=10000.000000,OversurrectivePullRate=10.000000)
}