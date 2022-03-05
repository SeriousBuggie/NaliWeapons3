//////////////////////////////////////////////////////////////
//	Nali Weapons III Object to replace inventory
//				Feralidragon (18-08-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWRepObj expands NaliWActor;

var() class<NWCharger> ChargerClassesA[3], ChargerClassesB[3];

var Inventory Inv;
var string NewInvClass;
var bool alreadyProcessed, bReplace;
var NWReplacer Replacer;
var bool isSetToDestroy;

enum EChargerType
{
	RCT_None,
	RCT_Charger1,
	RCT_Charger2
};

var EChargerType CType;
var bool bTeam;
var color defaultColorFX;
var float TimeToRespawn;
var byte fxAnimStyle;
var int listIndex;
var bool evaluateReplOnly;

var texture cChargerTexR, cChargerTexG, cChargerTexB;
var float ChargerDScale;
var int ChargerRRate;

function SetInitial(int lIndex, Inventory NInv, string NSClass, NWReplacer repl, byte ChargerType, float RespawnTime, color FXDefaultColor, bool bTeamFX, 
byte FXStyle, float dScale, float rRate)
{
	listIndex = lIndex;
	Inv = NInv;
	NewInvClass = NSClass;
	Replacer = repl;
	CType = getEChargerTypeFromByte(ChargerType);
	TimeToRespawn = RespawnTime;
	defaultColorFX = FXDefaultColor;
	fxAnimStyle = FXStyle;
	bTeam = bTeamFX;
	ChargerDScale = dScale;
	ChargerRRate = rRate;
}

function SetEvalReplOnly(Inventory NInv, NWReplacer repl)
{
	Inv = NInv;
	Replacer = repl;
	evaluateReplOnly = True;
}

function SetToDestroy(Inventory NInv, NWReplacer repl)
{
	isSetToDestroy = True;
	Inv = NInv;
	Replacer = repl;
}

function SetCustomCharger(texture Tr, texture Tg, texture Tb)
{
	cChargerTexR = Tr;
	cChargerTexG = Tg;
	cChargerTexB = Tb;
}

function EChargerType getEChargerTypeFromByte(byte n)
{
	if (n == 0)			return RCT_None;
	else if (n == 1)	return RCT_Charger1;
	else if (n == 2)	return RCT_Charger2;
	
	return RCT_None;
}

function Tick(float Delta)
{
local Pawn P;
local bool bMax, rOk;
local Actor newInv;
local Weapon W;
local class<Weapon> WClass;
local bool isReplaced;

	if (alreadyProcessed)
		return;

	if (Inv != None)
	{
		P = Pawn(Inv.Owner);
		if (Replacer != None)
		{
			isReplaced = (!isSetToDestroy && Replacer.isReplacedOrDefaultItem(Inv.Tag));
			if ((isSetToDestroy || evaluateReplOnly || isReplaced))
			{
				if (isSetToDestroy)
				{
					if (!Replacer.isReplacedOrDefaultItem(Inv.Tag) && (Ammo(Inv) == None || Pawn(Inv.Owner) == None))
					{
						if (ImpactHammer(Inv) != None && Bot(P) != None)
							Bot(P).bHasImpactHammer = False;
						Inv.Destroy();
						Inv = None;
					}
					else
						Inv.Tag = Replacer.getReplacedItemTagName(listIndex);
				}
				else if (isReplaced)
					Replacer.SetOptions(Inv);
				alreadyProcessed = True;
				Destroy();
				return;
			}
		}
		
		if (Inv.bDeleteMe || Inv.bTossedOut || (Inv.bHeldItem && P == None))
		{
			if (Inv.bHeldItem && P == None)
			{
				Inv.Destroy();
				Inv = None;
			}
			alreadyProcessed = True;
			Destroy();
			return;
		}
		
		if (P != None && Weapon(Inv) != None)
		{
			bMax = (Weapon(Inv).AmmoType != None && Weapon(Inv).AmmoType.AmmoAmount == Weapon(Inv).AmmoType.MaxAmmo);
			WClass = class<Weapon>(Inv.Class);
			if (ImpactHammer(Inv) != None && Bot(P) != None)
				Bot(P).bHasImpactHammer = False;
			Inv.Destroy();
			Inv = None;
			W = GiveWeapon(P, NewInvClass, bMax);
			if (Replacer != None)
				Replacer.CheckTrooper(P, W, WClass);
		}
		else if (Inv.bCarriedItem)
		{
			alreadyProcessed = True;
			Destroy();
			return;
		}
		else if (Replacer != None)
		{
			rOk = Replacer.doReplace(listIndex, Inv, NewInvClass, newInv);
			if (Inventory(newInv) != None && TimeToRespawn > 0.0)
				Inventory(newInv).RespawnTime = TimeToRespawn;
			if (rOk)
				SpawnCharger(Inventory(newInv), CType);
		}
		
		if (Inv != None)
		{
			Inv.Destroy();
			Inv = None;
		}
	}
	alreadyProcessed = True;
	Destroy();
}

function Weapon GiveWeapon(Pawn P, string aClassName, optional bool bMaxAmmo)
{
local class<Weapon> WeaponClass;

	WeaponClass = class<Weapon>(DynamicLoadObject(aClassName, class'Class'));
	if (WeaponClass != None)
		return GiveWeaponByClass(listIndex, P, WeaponClass, bMaxAmmo);
	return None;
}

function Weapon GiveWeaponByClass(int listIndex, Pawn P, class<Weapon> WeaponClass, optional bool bMaxAmmo)
{
	if (Replacer != None)
		return Replacer.GiveWeaponByClass(listIndex, P, WeaponClass, bMaxAmmo);
	return None;
}

function NWCharger SpawnCharger(Inventory Inv, EChargerType ChargerType)
{
local actor A;
local vector HitLocation, HitNormal, End, Start, Elevation;
local class<NWCharger> NWChargerClass;
local NWCharger NWC;
local byte InvType;

	if (Inv == None || ChargerType == RCT_None || ChargerDScale <= 0.0)
		return None;
		
	if (Weapon(Inv) != None)
		InvType = 0;
	else if (Ammo(Inv) != None)
		InvType = 1;
	else
		InvType = 2;
		
	if (ChargerType == RCT_Charger1)
		NWChargerClass = ChargerClassesA[InvType];
	else
		NWChargerClass = ChargerClassesB[InvType];
	
	Start = Location + (Inv.CollisionHeight*vect(0,0,1));
	End = Location - (Inv.CollisionHeight*vect(0,0,6));
	A = Trace(HitLocation, HitNormal, End, Start, False);
	if (A == None)
		return None;
	if (ChargerType == RCT_Charger1)
		Elevation = HitNormal;
	NWC = Spawn(NWChargerClass,,, HitLocation + Elevation, rotator(HitNormal));
	if (NWChargerCustom(NWC) != None)
		NWChargerCustom(NWC).InitCustomization(cChargerTexR, cChargerTexG, cChargerTexB, ChargerRRate);
	NWC.DrawScale = NWC.getScaleByInv(Inv) * ChargerDScale;
	NWC.SetupOVProperties(defaultColorFX, fxAnimStyle, bTeam);		
	SetupChargerInv(Inv, NWC);
	return NWC;
}

function SetupChargerInv(Inventory Inv, NWCharger NWC)
{
	if (Inv == None)
		return;
	Inv.SetLocation(NWC.Location + vector(NWC.Rotation)*(NWC.getInvSpawnHeight(Inv) + Inv.CollisionHeight));
	if (NaliPickups(Inv) != None)
		Inv.Move(NaliPickups(Inv).PlacementZOffset*vect(0,0,1));
	if (!NWC.bAlwaysRotatingInv && (NaliPickups(Inv) == None || !NaliPickups(Inv).default.bRotatingPickup) && !Inv.bRotatingPickup && Inv.Physics != PHYS_Rotating)
	{
		Inv.SetPhysics(PHYS_None);
		Inv.SetRotation(Class'NWUtils'.static.rTurn(NWC.Rotation, rot(-16384,0,0)));
	}
	else
	{	
		Inv.SetPhysics(PHYS_Rotating);
		Inv.SetRotation(rot(0,0,0));
	}
}

defaultproperties
{
	bHidden=True
	ChargerClassesA(0)=Class'NWWeaponCustomCharger'
	ChargerClassesA(1)=Class'NWAmmoCustomCharger'
	ChargerClassesA(2)=Class'NWPickupCustomCharger'
	ChargerClassesB(0)=Class'NWWeaponCharger'
	ChargerClassesB(1)=Class'NWAmmoCharger'
	ChargerClassesB(2)=Class'NWPickupCharger'
}
