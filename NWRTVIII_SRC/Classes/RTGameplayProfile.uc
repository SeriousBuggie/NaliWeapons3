//////////////////////////////////////////////////////////////
//				Feralidragon (23-09-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTGameplayProfile expands NWProfile config(NWProfilesCfg);

struct RTStructA
{
	var() byte TranslocatorType;
	var() bool enableTransRazorHeadshot, enableRazorTeleport, canDropTranslocator;
	var() bool canDisruptNormalTrans, canDisruptRazorTrans, canDisruptNormalByInstigator, canDisruptRazorByInstigator;
};
var() config RTStructA RTProfileA[8];

struct RTStructB
{
	var() int TransNormalDisruptDmg, TransRazorDisruptDmg, TransRazorDamage, TransRazorHeadshotDamage;
};
var() config RTStructB RTProfileB[8];

struct RTStructC
{
	var() float TranslocatorNormalSpeed, TranslocatorRazorSpeed, RelaunchDelayNormal, RelaunchDelayRazor;
};
var() config RTStructC RTProfileC[8];

struct RTStructD
{
	var() bool enableNormalHitSound, enableRazorHitSound, enableNormalAmbSound, enableRazorAmbSound;
	var() bool enableNormalTelefrag, enableRazorTelefrag, enableNormalTeleportShake, enableRazorTeleportShake;
};
var() config RTStructD RTProfileD[8];

struct RTStructE
{
	var() bool enableNormalAffectFOV, enableRazorAffectFOV;
	var() byte TeleFOVNormal, TeleFOVRazor;
};
var() config RTStructE RTProfileE[8];

struct RTStructF
{
	var() byte TeleportSoundNormal, TeleportSoundRazor, TeleportFXNormal, TeleportFXRazor;
};
var() config RTStructF RTProfileF[8];

struct RTOverStruct
{
	var() bool enableOversurrection;
	var() float OversurrectionLifeTime;
	var() int OversurrectionNormalDmg, OversurrectionHeadshotDmg;
};
var() config RTOverStruct RTOversProfile[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local RT RzT;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'RT'.default.TranslocatorType = Class'RT'.static.GetTTypeFromByte(default.RTProfileA[i].TranslocatorType);
	Class'RT'.default.enableTransRazorHeadshot = default.RTProfileA[i].enableTransRazorHeadshot;
	Class'RT'.default.enableRazorTeleport = default.RTProfileA[i].enableRazorTeleport;
	Class'RT'.default.canDropTranslocator = default.RTProfileA[i].canDropTranslocator;
	Class'RT'.default.canDisruptNormalTrans = default.RTProfileA[i].canDisruptNormalTrans;
	Class'RT'.default.canDisruptRazorTrans = default.RTProfileA[i].canDisruptRazorTrans;
	Class'RT'.default.canDisruptNormalByInstigator = default.RTProfileA[i].canDisruptNormalByInstigator;
	Class'RT'.default.canDisruptRazorByInstigator = default.RTProfileA[i].canDisruptRazorByInstigator;
	
	Class'RT'.default.TransNormalDisruptDmg = default.RTProfileB[i].TransNormalDisruptDmg;
	Class'RT'.default.TransRazorDisruptDmg = default.RTProfileB[i].TransRazorDisruptDmg;
	Class'RT'.default.TransRazorDamage = default.RTProfileB[i].TransRazorDamage;
	Class'RT'.default.TransRazorHeadshotDamage = default.RTProfileB[i].TransRazorHeadshotDamage;
	
	Class'RT'.default.TranslocatorNormalSpeed = default.RTProfileC[i].TranslocatorNormalSpeed;
	Class'RT'.default.TranslocatorRazorSpeed = default.RTProfileC[i].TranslocatorRazorSpeed;
	Class'RT'.default.RelaunchDelayNormal = default.RTProfileC[i].RelaunchDelayNormal;
	Class'RT'.default.RelaunchDelayRazor = default.RTProfileC[i].RelaunchDelayRazor;
	
	Class'RT'.default.enableNormalHitSound = default.RTProfileD[i].enableNormalHitSound;
	Class'RT'.default.enableRazorHitSound = default.RTProfileD[i].enableRazorHitSound;
	Class'RT'.default.enableNormalAmbSound = default.RTProfileD[i].enableNormalAmbSound;
	Class'RT'.default.enableRazorAmbSound = default.RTProfileD[i].enableRazorAmbSound;
	Class'RT'.default.enableNormalTelefrag = default.RTProfileD[i].enableNormalTelefrag;
	Class'RT'.default.enableRazorTelefrag = default.RTProfileD[i].enableRazorTelefrag;
	Class'RT'.default.enableNormalTeleportShake = default.RTProfileD[i].enableNormalTeleportShake;
	Class'RT'.default.enableRazorTeleportShake = default.RTProfileD[i].enableRazorTeleportShake;
	
	Class'RT'.default.enableNormalAffectFOV = default.RTProfileE[i].enableNormalAffectFOV;
	Class'RT'.default.enableRazorAffectFOV = default.RTProfileE[i].enableRazorAffectFOV;
	Class'RT'.default.TeleFOVNormal = default.RTProfileE[i].TeleFOVNormal;
	Class'RT'.default.TeleFOVRazor = default.RTProfileE[i].TeleFOVRazor;
	
	Class'RT'.default.TeleportSoundNormal = Class'RT'.static.GetTSndEffectFromByte(default.RTProfileF[i].TeleportSoundNormal);
	Class'RT'.default.TeleportSoundRazor = Class'RT'.static.GetTSndEffectFromByte(default.RTProfileF[i].TeleportSoundRazor);
	Class'RT'.default.TeleportFXNormal = Class'RT'.static.GetTFXEffectFromByte(default.RTProfileF[i].TeleportFXNormal);
	Class'RT'.default.TeleportFXRazor = Class'RT'.static.GetTFXEffectFromByte(default.RTProfileF[i].TeleportFXRazor);
	
	Class'RT'.default.enableOversurrection = default.RTOversProfile[i].enableOversurrection;
	Class'RT'.default.OversurrectionLifeTime = default.RTOversProfile[i].OversurrectionLifeTime;
	Class'RT'.default.OversurrectionNormalDmg = default.RTOversProfile[i].OversurrectionNormalDmg;
	Class'RT'.default.OversurrectionHeadshotDmg = default.RTOversProfile[i].OversurrectionHeadshotDmg;
	
	if (Lvl == None)
		Class'RT'.static.StaticSaveConfig();
		
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'RT', RzT)
		{
			RzT.default.TranslocatorType = Class'RT'.default.TranslocatorType;
			RzT.TranslocatorType = Class'RT'.default.TranslocatorType;
			RzT.default.enableTransRazorHeadshot = Class'RT'.default.enableTransRazorHeadshot;
			RzT.enableTransRazorHeadshot = Class'RT'.default.enableTransRazorHeadshot;
			RzT.default.enableRazorTeleport = Class'RT'.default.enableRazorTeleport;
			RzT.enableRazorTeleport = Class'RT'.default.enableRazorTeleport;
			RzT.default.canDropTranslocator = Class'RT'.default.canDropTranslocator;
			RzT.canDropTranslocator = Class'RT'.default.canDropTranslocator;
			RzT.default.canDisruptNormalTrans = Class'RT'.default.canDisruptNormalTrans;
			RzT.canDisruptNormalTrans = Class'RT'.default.canDisruptNormalTrans;
			RzT.default.canDisruptRazorTrans = Class'RT'.default.canDisruptRazorTrans;
			RzT.canDisruptRazorTrans = Class'RT'.default.canDisruptRazorTrans;
			RzT.default.canDisruptNormalByInstigator = Class'RT'.default.canDisruptNormalByInstigator;
			RzT.canDisruptNormalByInstigator = Class'RT'.default.canDisruptNormalByInstigator;
			RzT.default.canDisruptRazorByInstigator = Class'RT'.default.canDisruptRazorByInstigator;
			RzT.canDisruptRazorByInstigator = Class'RT'.default.canDisruptRazorByInstigator;

			RzT.default.TransNormalDisruptDmg = Class'RT'.default.TransNormalDisruptDmg;
			RzT.TransNormalDisruptDmg = Class'RT'.default.TransNormalDisruptDmg;
			RzT.default.TransRazorDisruptDmg = Class'RT'.default.TransRazorDisruptDmg;
			RzT.TransRazorDisruptDmg = Class'RT'.default.TransRazorDisruptDmg;
			RzT.default.TransRazorDamage = Class'RT'.default.TransRazorDamage;
			RzT.TransRazorDamage = Class'RT'.default.TransRazorDamage;
			RzT.default.TransRazorHeadshotDamage = Class'RT'.default.TransRazorHeadshotDamage;
			RzT.TransRazorHeadshotDamage = Class'RT'.default.TransRazorHeadshotDamage;

			RzT.default.TranslocatorNormalSpeed = Class'RT'.default.TranslocatorNormalSpeed;
			RzT.TranslocatorNormalSpeed = Class'RT'.default.TranslocatorNormalSpeed;
			RzT.default.TranslocatorRazorSpeed = Class'RT'.default.TranslocatorRazorSpeed;
			RzT.TranslocatorRazorSpeed = Class'RT'.default.TranslocatorRazorSpeed;
			RzT.default.RelaunchDelayNormal = Class'RT'.default.RelaunchDelayNormal;
			RzT.RelaunchDelayNormal = Class'RT'.default.RelaunchDelayNormal;
			RzT.default.RelaunchDelayRazor = Class'RT'.default.RelaunchDelayRazor;
			RzT.RelaunchDelayRazor = Class'RT'.default.RelaunchDelayRazor;

			RzT.default.enableNormalHitSound = Class'RT'.default.enableNormalHitSound;
			RzT.enableNormalHitSound = Class'RT'.default.enableNormalHitSound;
			RzT.default.enableRazorHitSound = Class'RT'.default.enableRazorHitSound;
			RzT.enableRazorHitSound = Class'RT'.default.enableRazorHitSound;
			RzT.default.enableNormalAmbSound = Class'RT'.default.enableNormalAmbSound;
			RzT.enableNormalAmbSound = Class'RT'.default.enableNormalAmbSound;
			RzT.default.enableRazorAmbSound = Class'RT'.default.enableRazorAmbSound;
			RzT.enableRazorAmbSound = Class'RT'.default.enableRazorAmbSound;
			RzT.default.enableNormalTelefrag = Class'RT'.default.enableNormalTelefrag;
			RzT.enableNormalTelefrag = Class'RT'.default.enableNormalTelefrag;
			RzT.default.enableRazorTelefrag = Class'RT'.default.enableRazorTelefrag;
			RzT.enableRazorTelefrag = Class'RT'.default.enableRazorTelefrag;
			RzT.default.enableNormalTeleportShake = Class'RT'.default.enableNormalTeleportShake;
			RzT.enableNormalTeleportShake = Class'RT'.default.enableNormalTeleportShake;
			RzT.default.enableRazorTeleportShake = Class'RT'.default.enableRazorTeleportShake;
			RzT.enableRazorTeleportShake = Class'RT'.default.enableRazorTeleportShake;

			RzT.default.enableNormalAffectFOV = Class'RT'.default.enableNormalAffectFOV;
			RzT.enableNormalAffectFOV = Class'RT'.default.enableNormalAffectFOV;
			RzT.default.enableRazorAffectFOV = Class'RT'.default.enableRazorAffectFOV;
			RzT.enableRazorAffectFOV = Class'RT'.default.enableRazorAffectFOV;
			RzT.default.TeleFOVNormal = Class'RT'.default.TeleFOVNormal;
			RzT.TeleFOVNormal = Class'RT'.default.TeleFOVNormal;
			RzT.default.TeleFOVRazor = Class'RT'.default.TeleFOVRazor;
			RzT.TeleFOVRazor = Class'RT'.default.TeleFOVRazor;

			RzT.default.TeleportSoundNormal = Class'RT'.default.TeleportSoundNormal;
			RzT.TeleportSoundNormal = Class'RT'.default.TeleportSoundNormal;
			RzT.default.TeleportSoundRazor = Class'RT'.default.TeleportSoundRazor;
			RzT.TeleportSoundRazor = Class'RT'.default.TeleportSoundRazor;
			RzT.default.TeleportFXNormal = Class'RT'.default.TeleportFXNormal;
			RzT.TeleportFXNormal = Class'RT'.default.TeleportFXNormal;
			RzT.default.TeleportFXRazor = Class'RT'.default.TeleportFXRazor;
			RzT.TeleportFXRazor = Class'RT'.default.TeleportFXRazor;
			
			RzT.default.enableOversurrection = Class'RT'.default.enableOversurrection;
			RzT.enableOversurrection = Class'RT'.default.enableOversurrection;
			RzT.default.OversurrectionLifeTime = Class'RT'.default.OversurrectionLifeTime;
			RzT.OversurrectionLifeTime = Class'RT'.default.OversurrectionLifeTime;
			RzT.default.OversurrectionNormalDmg = Class'RT'.default.OversurrectionNormalDmg;
			RzT.OversurrectionNormalDmg = Class'RT'.default.OversurrectionNormalDmg;
			RzT.default.OversurrectionHeadshotDmg = Class'RT'.default.OversurrectionHeadshotDmg;
			RzT.OversurrectionHeadshotDmg = Class'RT'.default.OversurrectionHeadshotDmg;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.RTProfileA[i].TranslocatorType = Class'RT'.default.TranslocatorType;
	default.RTProfileA[i].enableTransRazorHeadshot = Class'RT'.default.enableTransRazorHeadshot;
	default.RTProfileA[i].enableRazorTeleport = Class'RT'.default.enableRazorTeleport;
	default.RTProfileA[i].canDropTranslocator = Class'RT'.default.canDropTranslocator;
	default.RTProfileA[i].canDisruptNormalTrans = Class'RT'.default.canDisruptNormalTrans;
	default.RTProfileA[i].canDisruptRazorTrans = Class'RT'.default.canDisruptRazorTrans;
	default.RTProfileA[i].canDisruptNormalByInstigator = Class'RT'.default.canDisruptNormalByInstigator;
	default.RTProfileA[i].canDisruptRazorByInstigator = Class'RT'.default.canDisruptRazorByInstigator;
	
	default.RTProfileB[i].TransNormalDisruptDmg = Class'RT'.default.TransNormalDisruptDmg;
	default.RTProfileB[i].TransRazorDisruptDmg = Class'RT'.default.TransRazorDisruptDmg;
	default.RTProfileB[i].TransRazorDamage = Class'RT'.default.TransRazorDamage;
	default.RTProfileB[i].TransRazorHeadshotDamage = Class'RT'.default.TransRazorHeadshotDamage;
	
	default.RTProfileC[i].TranslocatorNormalSpeed = Class'RT'.default.TranslocatorNormalSpeed;
	default.RTProfileC[i].TranslocatorRazorSpeed = Class'RT'.default.TranslocatorRazorSpeed;
	default.RTProfileC[i].RelaunchDelayNormal = Class'RT'.default.RelaunchDelayNormal;
	default.RTProfileC[i].RelaunchDelayRazor = Class'RT'.default.RelaunchDelayRazor;
	
	default.RTProfileD[i].enableNormalHitSound = Class'RT'.default.enableNormalHitSound;
	default.RTProfileD[i].enableRazorHitSound = Class'RT'.default.enableRazorHitSound;
	default.RTProfileD[i].enableNormalAmbSound = Class'RT'.default.enableNormalAmbSound;
	default.RTProfileD[i].enableRazorAmbSound = Class'RT'.default.enableRazorAmbSound;
	default.RTProfileD[i].enableNormalTelefrag = Class'RT'.default.enableNormalTelefrag;
	default.RTProfileD[i].enableRazorTelefrag = Class'RT'.default.enableRazorTelefrag;
	default.RTProfileD[i].enableNormalTeleportShake = Class'RT'.default.enableNormalTeleportShake;
	default.RTProfileD[i].enableRazorTeleportShake = Class'RT'.default.enableRazorTeleportShake;
	
	default.RTProfileE[i].enableNormalAffectFOV = Class'RT'.default.enableNormalAffectFOV;
	default.RTProfileE[i].enableRazorAffectFOV = Class'RT'.default.enableRazorAffectFOV;
	default.RTProfileE[i].TeleFOVNormal = Class'RT'.default.TeleFOVNormal;
	default.RTProfileE[i].TeleFOVRazor = Class'RT'.default.TeleFOVRazor;
	
	default.RTProfileF[i].TeleportSoundNormal = Class'RT'.default.TeleportSoundNormal;
	default.RTProfileF[i].TeleportSoundRazor = Class'RT'.default.TeleportSoundRazor;
	default.RTProfileF[i].TeleportFXNormal = Class'RT'.default.TeleportFXNormal;
	default.RTProfileF[i].TeleportFXRazor = Class'RT'.default.TeleportFXRazor;
	
	default.RTOversProfile[i].enableOversurrection = Class'RT'.default.enableOversurrection;
	default.RTOversProfile[i].OversurrectionLifeTime = Class'RT'.default.OversurrectionLifeTime;
	default.RTOversProfile[i].OversurrectionNormalDmg = Class'RT'.default.OversurrectionNormalDmg;
	default.RTOversProfile[i].OversurrectionHeadshotDmg = Class'RT'.default.OversurrectionHeadshotDmg;
	
	StaticSaveConfig();
}


defaultproperties
{
	RTProfileA(0)=(TranslocatorType=0,enableTransRazorHeadshot=False,enableRazorTeleport=False,canDropTranslocator=False)
	RTProfileA(0)=(canDisruptNormalTrans=True,canDisruptRazorTrans=True,canDisruptNormalByInstigator=True,canDisruptRazorByInstigator=True)
	RTProfileB(0)=(TransRazorDamage=45,TransRazorHeadshotDamage=100,TransNormalDisruptDmg=25,TransRazorDisruptDmg=15)
	RTProfileC(0)=(TranslocatorNormalSpeed=830.000000,TranslocatorRazorSpeed=1000.000000,RelaunchDelayNormal=0.250000,RelaunchDelayRazor=1.000000)
	RTProfileD(0)=(enableNormalHitSound=True,enableRazorHitSound=True,enableNormalAmbSound=True,enableRazorAmbSound=True)
	RTProfileD(0)=(enableNormalTelefrag=True,enableRazorTelefrag=True,enableNormalTeleportShake=False,enableRazorTeleportShake=True)
	RTProfileE(0)=(enableNormalAffectFOV=True,enableRazorAffectFOV=True,TeleFOVNormal=135,TeleFOVRazor=165)
	RTProfileF(0)=(TeleportSoundNormal=1,TeleportSoundRazor=5,TeleportFXNormal=3,TeleportFXRazor=3)
	RTOversProfile(0)=(enableOversurrection=True,OversurrectionLifeTime=7.500000,OversurrectionNormalDmg=250,OversurrectionHeadshotDmg=750)

	RTProfileA(1)=(TranslocatorType=2,enableTransRazorHeadshot=True,enableRazorTeleport=False,canDropTranslocator=False)
	RTProfileA(1)=(canDisruptNormalTrans=True,canDisruptRazorTrans=True,canDisruptNormalByInstigator=True,canDisruptRazorByInstigator=True)
	RTProfileB(1)=(TransRazorDamage=50,TransRazorHeadshotDamage=150,TransNormalDisruptDmg=50,TransRazorDisruptDmg=35)
	RTProfileC(1)=(TranslocatorNormalSpeed=830.000000,TranslocatorRazorSpeed=1400.000000,RelaunchDelayNormal=0.250000,RelaunchDelayRazor=0.850000)
	RTProfileD(1)=(enableNormalHitSound=True,enableRazorHitSound=True,enableNormalAmbSound=True,enableRazorAmbSound=True)
	RTProfileD(1)=(enableNormalTelefrag=True,enableRazorTelefrag=True,enableNormalTeleportShake=False,enableRazorTeleportShake=True)
	RTProfileE(1)=(enableNormalAffectFOV=True,enableRazorAffectFOV=True,TeleFOVNormal=135,TeleFOVRazor=165)
	RTProfileF(1)=(TeleportSoundNormal=1,TeleportSoundRazor=5,TeleportFXNormal=3,TeleportFXRazor=3)
	RTOversProfile(1)=(enableOversurrection=True,OversurrectionLifeTime=10.000000,OversurrectionNormalDmg=1000,OversurrectionHeadshotDmg=3000)

	RTProfileA(2)=(TranslocatorType=2,enableTransRazorHeadshot=True,enableRazorTeleport=True,canDropTranslocator=False)
	RTProfileA(2)=(canDisruptNormalTrans=True,canDisruptRazorTrans=True,canDisruptNormalByInstigator=True,canDisruptRazorByInstigator=True)
	RTProfileB(2)=(TransRazorDamage=60,TransRazorHeadshotDamage=150,TransNormalDisruptDmg=100,TransRazorDisruptDmg=50)
	RTProfileC(2)=(TranslocatorNormalSpeed=830.000000,TranslocatorRazorSpeed=1600.000000,RelaunchDelayNormal=0.350000,RelaunchDelayRazor=0.850000)
	RTProfileD(2)=(enableNormalHitSound=True,enableRazorHitSound=True,enableNormalAmbSound=True,enableRazorAmbSound=True)
	RTProfileD(2)=(enableNormalTelefrag=True,enableRazorTelefrag=True,enableNormalTeleportShake=False,enableRazorTeleportShake=True)
	RTProfileE(2)=(enableNormalAffectFOV=True,enableRazorAffectFOV=True,TeleFOVNormal=135,TeleFOVRazor=165)
	RTProfileF(2)=(TeleportSoundNormal=1,TeleportSoundRazor=5,TeleportFXNormal=3,TeleportFXRazor=3)
	RTOversProfile(2)=(enableOversurrection=True,OversurrectionLifeTime=15.000000,OversurrectionNormalDmg=3500,OversurrectionHeadshotDmg=10000)
	
	RTProfileA(3)=(TranslocatorType=2,enableTransRazorHeadshot=True,enableRazorTeleport=False,canDropTranslocator=False)
	RTProfileA(3)=(canDisruptNormalTrans=True,canDisruptRazorTrans=True,canDisruptNormalByInstigator=True,canDisruptRazorByInstigator=True)
	RTProfileB(3)=(TransRazorDamage=75,TransRazorHeadshotDamage=250,TransNormalDisruptDmg=250,TransRazorDisruptDmg=150)
	RTProfileC(3)=(TranslocatorNormalSpeed=830.000000,TranslocatorRazorSpeed=1000.000000,RelaunchDelayNormal=0.250000,RelaunchDelayRazor=1.000000)
	RTProfileD(3)=(enableNormalHitSound=True,enableRazorHitSound=True,enableNormalAmbSound=True,enableRazorAmbSound=True)
	RTProfileD(3)=(enableNormalTelefrag=True,enableRazorTelefrag=True,enableNormalTeleportShake=False,enableRazorTeleportShake=True)
	RTProfileE(3)=(enableNormalAffectFOV=True,enableRazorAffectFOV=True,TeleFOVNormal=135,TeleFOVRazor=165)
	RTProfileF(3)=(TeleportSoundNormal=1,TeleportSoundRazor=5,TeleportFXNormal=3,TeleportFXRazor=3)
	RTOversProfile(3)=(enableOversurrection=True,OversurrectionLifeTime=15.000000,OversurrectionNormalDmg=500,OversurrectionHeadshotDmg=2000)
	
	RTProfileA(4)=(TranslocatorType=2,enableTransRazorHeadshot=True,enableRazorTeleport=True,canDropTranslocator=False)
	RTProfileA(4)=(canDisruptNormalTrans=False,canDisruptRazorTrans=False,canDisruptNormalByInstigator=False,canDisruptRazorByInstigator=False)
	RTProfileB(4)=(TransRazorDamage=100,TransRazorHeadshotDamage=300,TransNormalDisruptDmg=300,TransRazorDisruptDmg=300)
	RTProfileC(4)=(TranslocatorNormalSpeed=800.000000,TranslocatorRazorSpeed=1600.000000,RelaunchDelayNormal=0.350000,RelaunchDelayRazor=0.650000)
	RTProfileD(4)=(enableNormalHitSound=True,enableRazorHitSound=True,enableNormalAmbSound=True,enableRazorAmbSound=True)
	RTProfileD(4)=(enableNormalTelefrag=True,enableRazorTelefrag=True,enableNormalTeleportShake=False,enableRazorTeleportShake=True)
	RTProfileE(4)=(enableNormalAffectFOV=True,enableRazorAffectFOV=True,TeleFOVNormal=135,TeleFOVRazor=165)
	RTProfileF(4)=(TeleportSoundNormal=1,TeleportSoundRazor=5,TeleportFXNormal=3,TeleportFXRazor=3)
	RTOversProfile(4)=(enableOversurrection=True,OversurrectionLifeTime=25.000000,OversurrectionNormalDmg=10000,OversurrectionHeadshotDmg=30000)
	
	RTProfileA(5)=(TranslocatorType=2,enableTransRazorHeadshot=True,enableRazorTeleport=True,canDropTranslocator=False)
	RTProfileA(5)=(canDisruptNormalTrans=True,canDisruptRazorTrans=True,canDisruptNormalByInstigator=True,canDisruptRazorByInstigator=True)
	RTProfileB(5)=(TransRazorDamage=60,TransRazorHeadshotDamage=150,TransNormalDisruptDmg=100,TransRazorDisruptDmg=50)
	RTProfileC(5)=(TranslocatorNormalSpeed=830.000000,TranslocatorRazorSpeed=1600.000000,RelaunchDelayNormal=0.350000,RelaunchDelayRazor=0.850000)
	RTProfileD(5)=(enableNormalHitSound=True,enableRazorHitSound=True,enableNormalAmbSound=True,enableRazorAmbSound=True)
	RTProfileD(5)=(enableNormalTelefrag=True,enableRazorTelefrag=True,enableNormalTeleportShake=False,enableRazorTeleportShake=True)
	RTProfileE(5)=(enableNormalAffectFOV=True,enableRazorAffectFOV=True,TeleFOVNormal=135,TeleFOVRazor=165)
	RTProfileF(5)=(TeleportSoundNormal=1,TeleportSoundRazor=5,TeleportFXNormal=3,TeleportFXRazor=3)
	RTOversProfile(5)=(enableOversurrection=True,OversurrectionLifeTime=15.000000,OversurrectionNormalDmg=3500,OversurrectionHeadshotDmg=10000)
	
	RTProfileA(6)=(TranslocatorType=2,enableTransRazorHeadshot=True,enableRazorTeleport=True,canDropTranslocator=False)
	RTProfileA(6)=(canDisruptNormalTrans=True,canDisruptRazorTrans=True,canDisruptNormalByInstigator=True,canDisruptRazorByInstigator=True)
	RTProfileB(6)=(TransRazorDamage=60,TransRazorHeadshotDamage=150,TransNormalDisruptDmg=100,TransRazorDisruptDmg=50)
	RTProfileC(6)=(TranslocatorNormalSpeed=830.000000,TranslocatorRazorSpeed=1600.000000,RelaunchDelayNormal=0.350000,RelaunchDelayRazor=0.850000)
	RTProfileD(6)=(enableNormalHitSound=True,enableRazorHitSound=True,enableNormalAmbSound=True,enableRazorAmbSound=True)
	RTProfileD(6)=(enableNormalTelefrag=True,enableRazorTelefrag=True,enableNormalTeleportShake=False,enableRazorTeleportShake=True)
	RTProfileE(6)=(enableNormalAffectFOV=True,enableRazorAffectFOV=True,TeleFOVNormal=135,TeleFOVRazor=165)
	RTProfileF(6)=(TeleportSoundNormal=1,TeleportSoundRazor=5,TeleportFXNormal=3,TeleportFXRazor=3)
	RTOversProfile(6)=(enableOversurrection=True,OversurrectionLifeTime=15.000000,OversurrectionNormalDmg=3500,OversurrectionHeadshotDmg=10000)
	
	RTProfileA(7)=(TranslocatorType=2,enableTransRazorHeadshot=True,enableRazorTeleport=True,canDropTranslocator=False)
	RTProfileA(7)=(canDisruptNormalTrans=True,canDisruptRazorTrans=True,canDisruptNormalByInstigator=True,canDisruptRazorByInstigator=True)
	RTProfileB(7)=(TransRazorDamage=60,TransRazorHeadshotDamage=150,TransNormalDisruptDmg=100,TransRazorDisruptDmg=50)
	RTProfileC(7)=(TranslocatorNormalSpeed=830.000000,TranslocatorRazorSpeed=1600.000000,RelaunchDelayNormal=0.350000,RelaunchDelayRazor=0.850000)
	RTProfileD(7)=(enableNormalHitSound=True,enableRazorHitSound=True,enableNormalAmbSound=True,enableRazorAmbSound=True)
	RTProfileD(7)=(enableNormalTelefrag=True,enableRazorTelefrag=True,enableNormalTeleportShake=False,enableRazorTeleportShake=True)
	RTProfileE(7)=(enableNormalAffectFOV=True,enableRazorAffectFOV=True,TeleFOVNormal=135,TeleFOVRazor=165)
	RTProfileF(7)=(TeleportSoundNormal=1,TeleportSoundRazor=5,TeleportFXNormal=3,TeleportFXRazor=3)
	RTOversProfile(7)=(enableOversurrection=True,OversurrectionLifeTime=15.000000,OversurrectionNormalDmg=3500,OversurrectionHeadshotDmg=10000)
}