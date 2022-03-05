//////////////////////////////////////////////////////////////
//	Nali Weapons III object to multiple replaces
//				Feralidragon (18-08-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWRepMulti expands NWRepObj;

var class<Inventory> IList[64];
var int listIndexes[64];
var byte ListSize, CurrentInv;
var Inventory InvInUse;
var InventorySpot InvMarker;
var bool bRespawning, bRotatingInv;

var class<NWLockerBase> LockerClasses[3];

enum EMultiType
{
	RMT_Sequencial,
	RMT_RandomStatic,
	RMT_RandomTimed,
	RMT_Locker
};

var EMultiType MBehaviour;
var bool bGiveAll;
var NWCharger InvCharger;


function SetInitial(int lIndex, Inventory NInv, string NSClass, NWReplacer repl, byte ChargerType, float RespawnTime, color FXDefaultColor, bool bTeamFX, 
byte FXStyle, float dScale, float rRate)
{
	Super.SetInitial(lIndex, NInv, NSClass, repl, ChargerType, RespawnTime, FXDefaultColor, bTeamFX, FXStyle, dScale, rRate);
	InvMarker = NInv.MyMarker;
	bRotatingInv = NInv.bRotatingPickup;
	Tag = NInv.Tag;
	Event = NInv.Event;
}

function SetListItem(class<Inventory> InvClass, int i, int lIndex)
{
	if (i < ArrayCount(IList))
	{
		IList[i] = InvClass;
		listIndexes[i] = lIndex;
	}
}

function SetMultiInitial(byte newListSize, byte MultiBehaviour, bool bGiveAllToPawn, bool bKeepItem)
{	
	ListSize = Min(ArrayCount(IList), newListSize);
	MBehaviour = getEMultiTypeFromByte(MultiBehaviour);
	bGiveAll = bGiveAllToPawn;
	if (bKeepItem && Inv != None && Replacer != None && ListSize < ArrayCount(IList)-1)
	{
		SetListItem(Inv.Class, ListSize, -1);
		ListSize++;
	}
}

function EMultiType getEMultiTypeFromByte(byte n)
{
	if (n == 0)			return RMT_Sequencial;
	else if (n == 1)	return RMT_RandomStatic;
	else if (n == 2)	return RMT_RandomTimed;
	else if (n == 3)	return RMT_Locker;
	
	return RMT_Sequencial;
}

function Tick(float Delta)
{
local Pawn P;
local byte i, k;
local bool bMax;
local Weapon W;
local class<Weapon> WClass;

	if (alreadyProcessed)
	{
		Disable('Tick');
		return;
	}

	if (Inv != None)
	{
		if (Inv.bDeleteMe || Inv.bTossedOut || (Replacer != None && Replacer.isReplacedOrDefaultItem(Inv.Tag)))
		{
			alreadyProcessed = True;
			Destroy();
			return;
		}
		
		P = Pawn(Inv.Owner);
		if (Inv.bHeldItem && P == None)
		{
			if (ImpactHammer(Inv) != None && Bot(P) != None)
				Bot(P).bHasImpactHammer = False;
			Inv.Destroy();
			Inv = None;
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
			if (bGiveAll)
			{
				k = Rand(ListSize);
				for (i = 0; i < ListSize; i++)
				{
					W = GiveWeaponByClass(listIndexes[i], P, class<Weapon>(IList[i]), bMax);
					if (Replacer != None && i == k)
						Replacer.CheckTrooper(P, W, WClass);
				}
			}
			else
			{
				W = GiveWeaponByClass(listIndexes[i], P, class<Weapon>(IList[Rand(ListSize)]), bMax);
				if (Replacer != None)
					Replacer.CheckTrooper(P, W, WClass);
			}

			alreadyProcessed = True;
			Destroy();
			return;
		}
		else if (Inv.bCarriedItem)
		{
			alreadyProcessed = True;
			Destroy();
			return;
		}
		else if (MBehaviour == RMT_RandomStatic)
		{
			NewInvClass = String(IList[Rand(ListSize)]);
			Super.Tick(Delta);
			return;
		}
		
		SetupMultiReplacement();
		alreadyProcessed = True;
	}
}

function SetupMultiReplacement()
{
local class<Inventory> InvClass;
local byte i;
local float MaxInvRadius, OldColRadius;

	if (Inv == None)
		return;
		
	if (MBehaviour == RMT_Locker)
		SetupLocker();
	else
	{
		InvCharger = SpawnCharger(Inv, CType);
		for (i = 0; i < ListSize; i++)
			MaxInvRadius = FMax(MaxInvRadius, IList[i].default.CollisionRadius);
		OldColRadius = Inv.CollisionRadius;
		Inv.SetCollisionSize(MaxInvRadius, Inv.CollisionHeight);
		InvCharger.DrawScale = InvCharger.getScaleByInv(Inv);
		Inv.SetCollisionSize(OldColRadius, Inv.CollisionHeight);
		
		if (InvMarker != None)
			InvMarker.markedItem = None;
		Inv.MyMarker = None;
		Inv.Destroy();
		Inv = None;
		bRespawning = True;
		CurrentInv = 240;
		Timer();
	}
}

function SetupLocker()
{
local byte lockerType, i;
local actor A;
local vector HitLocation, HitNormal, End;
local NWLockerBase NWL;

	if (class<Weapon>(IList[0]) != None)
		lockerType = 0;
	else if (class<Ammo>(IList[0]) != None)
		lockerType = 1;
	else
		lockerType = 2;

	End = Location - (Inv.CollisionHeight*vect(0,0,10));
	A = Trace(HitLocation, HitNormal, End, Location, False);
	if (A == None)
		return;
	NWL = Spawn(LockerClasses[lockerType],,, HitLocation, rotator(HitNormal));
	for (i = 0; i < ListSize; i++)
		NWL.SetInventoryList(IList[i], i);
	NWL.Init(ListSize, Replacer, InvMarker, Inv.Tag, Inv.Event);
	NWL.SetupOVProperties(defaultColorFX, fxAnimStyle, bTeam);
	
	if (InvMarker != None)
		InvMarker.markedItem = None;
	Inv.MyMarker = None;
	Inv.Destroy();
	Inv = None;
	Destroy();
}

function Timer()
{
	if (bRespawning)
	{
		bRespawning = False;
		if (MBehaviour == RMT_Sequencial)
		{
			CurrentInv++;
			if (CurrentInv >= ListSize)
				CurrentInv = 0;
		}
		else
			CurrentInv = Rand(ListSize);
		
		InvInUse = Spawn(IList[CurrentInv]);
		InvInUse.bRotatingPickup = bRotatingInv;
		InvInUse.bFixedRotationDir = bRotatingInv;
		InvInUse.bAlwaysRelevant = True;
		InvInUse.NetUpdateFrequency = 8;
		if (Replacer != None)
			InvInUse.Tag = Replacer.getReplacedItemTagName(listIndexes[CurrentInv]);
		InvInUse.Event = Event;
		SetInventoryPosition(InvInUse);
		if (InvMarker != None)
		{
			InvInUse.MyMarker = InvMarker;
			InvInUse.MyMarker.markedItem = InvInUse;
		}
		if (Weapon(InvInUse) != None)
			Weapon(InvInUse).bWeaponStay = False;
		Level.Game.PlaySpawnEffect(InvInUse);
		SetTimer(0.1, False);
	}
	else if (InvInUse != None && (InvInUse.bHidden || InvInUse.Owner != None || InvInUse.bCarriedItem))
	{
		bRespawning = True;
		InvInUse.MyMarker = None;
		if (InvMarker != None)
			InvMarker.markedItem = None;
		if (InvInUse.Owner == None && !InvInUse.bCarriedItem)
		{
			InvInUse.Destroy();
			InvInUse = None;
		}
		SetRespawnTimer();
	}
	else
		SetTimer(0.5, False);
}

function SetRespawnTimer()
{
	if (TimeToRespawn > 0.0)
		SetTimer(TimeToRespawn, False);
	else
		SetTimer(IList[CurrentInv].default.RespawnTime, False);
}

function SetInventoryPosition(Inventory Inv)
{
local actor A;
local vector HitLocation, HitNormal, End;

	if (InvCharger != None)
		SetupChargerInv(Inv, InvCharger);
	else
	{
		End = Location - (Inv.CollisionHeight*vect(0,0,2)) - vect(0,0,10);
		A = Trace(HitLocation, HitNormal, End, Location, False);
		if (A == None)
			HitLocation = End;
		Inv.SetLocation(HitLocation + HitNormal*Inv.CollisionHeight);
	}
}

event Trigger(Actor Other, Pawn EventInstigator)
{
	if (InvInUse != None)
		InvInUse.Trigger(Other, EventInstigator);
}

event UnTrigger(Actor Other, Pawn EventInstigator)
{
	if (InvInUse != None)
		InvInUse.UnTrigger(Other, EventInstigator);
}

defaultproperties
{
	LockerClasses(0)=Class'NWWeaponLockerBase'
	LockerClasses(1)=Class'NWAmmoLockerBase'
	LockerClasses(2)=Class'NWPickupLockerBase'
}