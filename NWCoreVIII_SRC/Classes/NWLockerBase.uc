//////////////////////////////////////////////////////////////
//	Nali Weapons III Locker
//				Feralidragon (05-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWLockerBase expands NWInvPods;

var() float SpawnRadius, SpawnHeight;
var() bool bAddInventoryRadius;
var() bool bTopDown;
var() class<NWLockerArm> ArmClass;
var class<Inventory> InventoryClasses[16];
var byte ListSize;
var NWReplacer Replacer;
var NWLockerInv LockerInv;

var NWLockerArm Arms[16];
var Inventory InventoryList[16];


function SetInventoryList(class<Inventory> InvClass, byte i)
{
	if (i < ArrayCount(InventoryClasses))
		InventoryClasses[i] = InvClass;
}

function Init(byte Size, NWReplacer repl, InventorySpot InvMarker, name newTag, name newEvent)
{
	ListSize = Min(ArrayCount(InventoryClasses), Size);
	Replacer = repl;
	Tag = newTag;
	Event = newEvent;
	if (InvMarker != None)
	{
		LockerInv = Spawn(Class'NWLockerInv',,, Location + vector(Rotation)*32.0);
		LockerInv.LBase = Self;
		LockerInv.MyMarker = InvMarker;
		LockerInv.MyMarker.markedItem = LockerInv;
	}
	InitArms();
}

function InitArms()
{
local byte i, j, RotationType;
local float angleMax, curAngle, ZOffset;
local actor A, B;
local vector HitLocation, HitNormal, End, Start, Dir;
local vector SpawnOffset, FinalSpawnOffset;
local rotator R, SpawnR;
local byte LType;

	if (Replacer == None)
		return;
		
	if (class<Weapon>(InventoryClasses[0]) != None)
		LType = 0;
	else if (class<Ammo>(InventoryClasses[0]) != None)
		LType = 1;
	else
		LType = 2;

	angleMax = 65536.f / ListSize;
	for (i = 0; i < ListSize; i++)
	{
		if (InventoryClasses[i] == None)
			continue;
		
		j = 0;
		curAngle = angleMax * i;
		do
		{
			j++;
			R.Roll = curAngle;
			Start = Location + vector(Rotation)*FMax(5.0, SpawnHeight);
			Dir = ((vect(0,0,1) >> R) >> Rotation);
			SpawnOffset = Dir*SpawnRadius;
			if (bAddInventoryRadius)
				SpawnOffset += (Dir*InventoryClasses[i].default.CollisionRadius);
			End = Start + SpawnOffset;
			A = Trace(HitLocation, HitNormal, End, Start, False);
			if (A != None)
			{
				curAngle += (65536.f / 32);
				continue;
			}
			
			FinalSpawnOffset = Location + vector(Rotation)*SpawnHeight + SpawnOffset;
			B = Trace(HitLocation, HitNormal, End - vector(Rotation)*InventoryClasses[i].default.CollisionHeight, End, False);
			if (B != None)
				FinalSpawnOffset = HitLocation + vector(Rotation)*InventoryClasses[i].default.CollisionHeight;
			
			if (Replacer != None)
				Replacer.getLockerItemPosSettings(String(InventoryClasses[i]), LType, RotationType, ZOffset);
			else
			{
				ZOffset = 0.0;
				RotationType = 0;	
			}
			if (RotationType == 0)
			{
				if (bTopDown)
					RotationType = 2;
				else
					RotationType = 1;
			}
			
			FinalSpawnOffset += (vector(Rotation)*ZOffset);
			if (RotationType == 1)
				SpawnR = Class'NWUtils'.static.rTurn(Rotation + R, rot(-16384,0,0));
			else if (RotationType == 2)
				SpawnR = Rotation + R;
			else if (RotationType == 3)
				SpawnR = Class'NWUtils'.static.rTurn(Rotation + R, rot(0,16384,0));
			
			Arms[i] = Spawn(ArmClass,,, Location, Rotation + R);
			InventoryList[i] = Spawn(InventoryClasses[i],,, FinalSpawnOffset, SpawnR);
			InventoryList[i].SetPhysics(PHYS_None);
			InventoryList[i].bRotatingPickup = False;
			InventoryList[i].bFixedRotationDir = False;
			InventoryList[i].RotationRate = rot(0,0,0);
			InventoryList[i].Event = Event;
			InventoryList[i].bAlwaysRelevant = True;
			InventoryList[i].NetUpdateFrequency = 8;
			if (Replacer != None)
				InventoryList[i].Tag = Replacer.ReplacedInventoryTag;
		}
		until (A == None || j > 32)
	}
}

event Trigger(Actor Other, Pawn EventInstigator)
{
local byte i;

	for (i = 0; i < ListSize; i++)
	{
		if (InventoryList[i] != None)
			InventoryList[i].Trigger(Other, EventInstigator);
	}
}

event UnTrigger(Actor Other, Pawn EventInstigator)
{
local byte i;

	for (i = 0; i < ListSize; i++)
	{
		if (InventoryList[i] != None)
			InventoryList[i].UnTrigger(Other, EventInstigator);
	}
}

function float getBotDesireability(Pawn Bot)
{
local float f, desire;
local byte i;

	desire = -1.0;
	for (i = 0; i < ListSize; i++)
	{
		if (InventoryList[i] != None)
		{
			f = InventoryList[i].BotDesireability(Bot);
			if (f > 0)
				desire = FMax(f, desire + f);
		}
	}
	return desire;
}

simulated function Destroyed()
{
local byte i;

	for (i = 0; i < ArrayCount(Arms); i++)
	{
		if (Arms[i] != None)
			Arms[i].Destroy();
		Arms[i] = None;
	}
	
	for (i = 0; i < ArrayCount(InventoryList); i++)
	{
		if (InventoryList[i] != None)
			InventoryList[i].Destroy();
		InventoryList[i] = None;
	}
	
	Super.Destroyed();
}

defaultproperties
{
}