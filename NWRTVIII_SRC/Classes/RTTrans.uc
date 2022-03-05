//////////////////////////////////////////////////////////////
//				Feralidragon (19-03-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTTrans expands NaliProjectile;

#exec MESH IMPORT MESH=RTTrans ANIVFILE=MODELS\RTTrans_a.3d DATAFILE=MODELS\RTTrans_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTTrans STRENGTH=0.1
#exec MESH ORIGIN MESH=RTTrans X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=RTTrans SEQ=All STARTFRAME=0 NUMFRAMES=35
#exec MESH SEQUENCE MESH=RTTrans SEQ=Razored STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTTrans SEQ=Normal STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTTrans SEQ=RazorOff STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=RTTrans SEQ=RazorOn STARTFRAME=5 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=RTTrans SEQ=SpinOnce STARTFRAME=10 NUMFRAMES=25 RATE=24.0
#exec MESH SEQUENCE MESH=RTTrans SEQ=SpinLoop STARTFRAME=10 NUMFRAMES=24 RATE=23.0

#exec MESHMAP NEW MESHMAP=RTTrans MESH=RTTrans
#exec MESHMAP SCALE MESHMAP=RTTrans X=0.04 Y=0.04 Z=0.08

#exec TEXTURE IMPORT NAME=Sk_RT_04 FILE=SKINS\Sk_RT_04.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=RTTrans NUM=1 TEXTURE=Sk_RT_04

#exec TEXTURE IMPORT NAME=RT_Metal FILE=SKINS\RT_Metal.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="RTHit01" FILE=SOUNDS\RTHit01.wav GROUP="Hits"
#exec AUDIO IMPORT NAME="RTHit02" FILE=SOUNDS\RTHit02.wav GROUP="Hits"
#exec AUDIO IMPORT NAME="RTHit03" FILE=SOUNDS\RTHit03.wav GROUP="Hits"
#exec AUDIO IMPORT NAME="RTAmbNormal" FILE=SOUNDS\RTAmbNormal.wav GROUP="Loop"
#exec AUDIO IMPORT NAME="RazorGib1" FILE=SOUNDS\RazorGib1.wav GROUP="Gibs"
#exec AUDIO IMPORT NAME="RazorGib2" FILE=SOUNDS\RazorGib2.wav GROUP="Gibs"
#exec AUDIO IMPORT NAME="HeadShotRazorGib1" FILE=SOUNDS\HeadShotRazorGib1.wav GROUP="Gibs"
#exec AUDIO IMPORT NAME="HeadShotRazorGib2" FILE=SOUNDS\HeadShotRazorGib2.wav GROUP="Gibs"
#exec AUDIO IMPORT NAME="RTDisruptAmb" FILE=SOUNDS\RTDisruptAmb.wav GROUP="Loop"
#exec AUDIO IMPORT NAME="RTDisruptGib" FILE=SOUNDS\RTDisruptGib.wav GROUP="Gibs"
#exec AUDIO IMPORT NAME="RTTelePickup" FILE=SOUNDS\RTTelePickup.wav GROUP="Pickup"

// Blood textures import
//*********************************************************************
#exec TEXTURE IMPORT NAME=HighBloodRed01 FILE=FXBlood\HighBloodRed01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodRed02 FILE=FXBlood\HighBloodRed02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodRed03 FILE=FXBlood\HighBloodRed03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodRed01 FILE=FXBlood\LowBloodRed01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodRed02 FILE=FXBlood\LowBloodRed02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodRed03 FILE=FXBlood\LowBloodRed03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodBlue01 FILE=FXBlood\HighBloodBlue01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodBlue02 FILE=FXBlood\HighBloodBlue02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodBlue03 FILE=FXBlood\HighBloodBlue03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodBlue01 FILE=FXBlood\LowBloodBlue01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodBlue02 FILE=FXBlood\LowBloodBlue02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodBlue03 FILE=FXBlood\LowBloodBlue03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodGreen01 FILE=FXBlood\HighBloodGreen01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodGreen02 FILE=FXBlood\HighBloodGreen02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodGreen03 FILE=FXBlood\HighBloodGreen03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodGreen01 FILE=FXBlood\LowBloodGreen01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodGreen02 FILE=FXBlood\LowBloodGreen02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodGreen03 FILE=FXBlood\LowBloodGreen03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodYellow01 FILE=FXBlood\HighBloodYellow01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodYellow02 FILE=FXBlood\HighBloodYellow02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodYellow03 FILE=FXBlood\HighBloodYellow03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodYellow01 FILE=FXBlood\LowBloodYellow01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodYellow02 FILE=FXBlood\LowBloodYellow02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodYellow03 FILE=FXBlood\LowBloodYellow03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodBlack01 FILE=FXBlood\HighBloodBlack01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodBlack02 FILE=FXBlood\HighBloodBlack02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodBlack03 FILE=FXBlood\HighBloodBlack03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodBlack01 FILE=FXBlood\LowBloodBlack01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodBlack02 FILE=FXBlood\LowBloodBlack02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodBlack03 FILE=FXBlood\LowBloodBlack03.bmp GROUP=Blood


var() bool bRazor;
var() sound HitSounds[3];
var() sound DisruptedAmbSnd, DisruptGibSnd;
var() name SpinAnim;
var() float SpinRate, OVFXRate;
var() sound GibSnd[2], HeadshotGibSnd[2], PickupSnd;
var() float ShadowSize;
var() float MaxAITranslocationHeight;

var() texture LowBlood_Red[3], HighBlood_Red[3];
var() texture LowBlood_Blue[3], HighBlood_Blue[3];
var() texture LowBlood_Green[3], HighBlood_Green[3];
var() texture LowBlood_Yellow[3], HighBlood_Yellow[3];
var() texture LowBlood_Black[3], HighBlood_Black[3];

var bool bDisrupted, canDisrupt, canDisruptByOwner;
var int TransHealth;
var Pawn Disruptor, LastTouchedPawn;
var vector RealLocation;
var Decal Shadow;
var RT Master;
var Actor DesiredTarget;
var bool bAlreadyHit;
var float ClientSpeed;
var float RLocX, RLocY, RLocZ, RDirX, RDirY, RDirZ;
var byte PosUpdateTracker, ClientUpdateTracker;
var float LifeTime;

var bool enableHitSound;

var RTTransOV OVMainTop, OVMainBottom, OVTop[6], OVBottom[6];
var RTBloodTransOV BloodOV[6];
var texture HighBlood[3], LowBlood[3];


replication
{
	reliable if (Role == ROLE_Authority)
		RealLocation, bDisrupted, enableHitSound, ClientSpeed, RLocX, RLocY, RLocZ, RDirX, RDirY, RDirZ, PosUpdateTracker;
	reliable if (Role == ROLE_Authority)
		StopRazors;
}

function BeginPlay()
{
local vector dir;

	if (!bRazor && Instigator != None)
	{
		speed = Class'RT'.default.TranslocatorNormalSpeed;
		if (!Class'NWUtils'.static.isValidBot(Instigator))
		{
			dir = vector(Rotation);
			dir.Z = dir.Z + 0.35 * (1 - Abs(dir.Z));
			SetRotation(rotator(dir));
		}
	}
	else
	{
		speed = Class'RT'.default.TranslocatorRazorSpeed;
		dir = vector(Rotation);
	}
	
	if (!bRazor)
		MaxSpeed = FMax(2000, speed);
	else
		MaxSpeed = speed;
	ClientSpeed = speed;
	
	enableHitSound = ((!bRazor && Class'RT'.default.enableNormalHitSound) || (bRazor && Class'RT'.default.enableRazorHitSound));
	canDisrupt = ((!bRazor && Class'RT'.default.canDisruptNormalTrans) || (bRazor && Class'RT'.default.canDisruptRazorTrans));
	canDisruptByOwner = ((!bRazor && Class'RT'.default.canDisruptNormalByInstigator) || (bRazor && Class'RT'.default.canDisruptRazorByInstigator));
	if ((!bRazor && !Class'RT'.default.enableNormalAmbSound) || (bRazor && !Class'RT'.default.enableRazorAmbSound))
		AmbientSound = None;
	
	if (!bRazor)
		TransHealth = Class'RT'.default.TransNormalDisruptDmg;
	else
		TransHealth = Class'RT'.default.TransRazorDisruptDmg;
	
	Super.BeginPlay();
	
	if (!bRazor && Class'NWUtils'.static.isValidBot(Instigator))
		Velocity += vect(0,0,200);
	SavePosition();
}

simulated function PostNetBeginPlay()
{
	Super.PostNetBeginPlay();
	if (Role < ROLE_Authority && ClientSpeed > 0)
		CorrectPosition(True);
}

simulated function CorrectPosition(optional bool bForce)
{
local vector loc, dir;

	if (Role < ROLE_Authority)
	{
		loc.X = RLocX;
		loc.Y = RLocY;
		loc.Z = RLocZ;
		
		dir.X = RDirX;
		dir.Y = RDirY;
		dir.Z = RDirZ;
		dir = Normal(dir);
		
		if (bForce || VSize(Location - loc) > 32 || (dir dot Normal(Velocity)) < 0.9)
		{
			SetLocation(loc);
			SetRotation(rotator(dir));
			
			speed = ClientSpeed;
			if (!bRazor)
				MaxSpeed = FMax(2000, ClientSpeed);
			else
				MaxSpeed = ClientSpeed;
			Velocity = (ClientSpeed * dir);
		}
		
		if (!bRazor && Class'NWUtils'.static.isValidBot(Instigator))
			Velocity += vect(0,0,200);
	}
}

function SavePosition()
{
local vector dir;

	if (Role == ROLE_Authority)
	{
		RLocX = Location.X;
		RLocY = Location.Y;
		RLocZ = Location.Z;
		
		dir = Normal(Velocity);
		RDirX = dir.X;
		RDirY = dir.Y;
		RDirZ = dir.Z;
	}
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	if (SpinAnim != '' &&  SpinRate > 0)
		LoopAnim(SpinAnim, SpinRate);
}

function SpawnOV()
{
local byte i, PTeam;

	if (Instigator != None && Instigator.PlayerReplicationInfo != None && Instigator.PlayerReplicationInfo.Team < 4)
		PTeam = Instigator.PlayerReplicationInfo.Team;

	//Upper main section
	if (OVMainTop == None)
	{
		OVMainTop = Spawn(Class'RTTransOV', Self);
		OVMainTop.setOV(0, True, True);
		if (!bRazor)
		{
			OVMainTop.setOVTimeCycle(Class'RT'.default.FxMainNormalTime/OVFXRate);
			OVMainTop.setGlowType(1);
		}
		else
		{
			OVMainTop.setOVTimeCycle(Class'RT'.default.FxMainRazorTime/OVFXRate);
			OVMainTop.setGlowType(2);
		}
	}
	OVMainTop.setTeam(PTeam);
	
	//Lower main section
	if (OVMainBottom == None)
	{
		OVMainBottom = Spawn(Class'RTTransOV', Self);
		OVMainBottom.setOV(0, False, True);
		if (!bRazor)
		{
			OVMainBottom.setOVTimeCycle(Class'RT'.default.FxMainNormalTime/OVFXRate);
			OVMainBottom.setGlowType(1);
		}
		else
		{
			OVMainBottom.setOVTimeCycle(Class'RT'.default.FxMainRazorTime/OVFXRate);
			OVMainBottom.setGlowType(2);
		}
	}
	OVMainBottom.setTeam(PTeam);
	
	//Upper 6 sections
	for (i = 0; i < ArrayCount(OVTop); i++)
	{
		if (OVTop[i] == None)
		{
			OVTop[i] = Spawn(Class'RTTransOV', Self);
			OVTop[i].setOV(i, True);
			if (!bRazor)
			{
				OVTop[i].setOVTimeCycle(Class'RT'.default.FxSectionsUpNormalTime/OVFXRate);
				OVTop[i].setOVAngleOffset((6.f - i/6.f) * 2.f*PI);
			}
			else
			{
				OVTop[i].setOVTimeCycle(Class'RT'.default.FxSectionsUpRazorTime/OVFXRate);
				OVTop[i].setOVAngleOffset(i/6.f * 2.f*PI);
			}
		}
		OVTop[i].setTeam(PTeam);
	}
	
	//Lower 6 sections
	for (i = 0; i < ArrayCount(OVBottom); i++)
	{
		if (OVBottom[i] == None)
		{
			OVBottom[i] = Spawn(Class'RTTransOV', Self);
			OVBottom[i].setOV(i, False);
			if (!bRazor)
			{
				OVBottom[i].setOVTimeCycle(Class'RT'.default.FxSectionsDownNormalTime/OVFXRate);
				OVBottom[i].setOVAngleOffset(i/6.f * 2.f*PI);
			}
			else
			{
				OVBottom[i].setOVTimeCycle(Class'RT'.default.FxSectionsDownRazorTime/OVFXRate);
				OVBottom[i].setOVAngleOffset(i/6.f * 2.f*PI);
			}
		}
		OVBottom[i].setTeam(PTeam);
	}
}

function SetMaster(RT newMaster)
{
	Master = newMaster;
	SetOwner(newMaster.Owner);
	SpawnOV();
}

function SetTransInstigator(Pawn newInstigator)
{
	Instigator = newInstigator;
	SpawnOV();
}


function UpdateBlood(Actor A, bool bHighBlood)
{
local byte ABType, texSlot;
	
	if (Master == None || A == None)
		return;

	if (Pawn(A) == None || !noHurtThisPawn(Pawn(A)))
	{
		ABType = Master.GetBloodTypeFromActor(A);
		if (ABType > Master.E_BloodType.BLDT_None)
		{
			if (bHighBlood)
			{
				texSlot = GetFreeBloodSlot(HighBlood);
				GiveBlood(True, texSlot, GetBloodTexture(True, ABType-1, texSlot));
				Master.UpdateBlood(HighBlood[texSlot], True, texSlot);
			}
			else
			{
				texSlot = GetFreeBloodSlot(LowBlood);
				GiveBlood(False, texSlot, GetBloodTexture(False, ABType-1, texSlot));
				Master.UpdateBlood(LowBlood[texSlot], False, texSlot);
			}
		}
	}
}

function GiveBlood(bool bHighBlood, byte slot, texture BldTex)
{
	if (bHighBlood)
	{
		HighBlood[slot] = BldTex;
		if (BloodOV[slot+3] == None)
			BloodOV[slot+3] = Spawn(Class'RTBloodTransOV', Self);
		BloodOV[slot+3].MultiSkins[1] = BldTex;
	}
	else
	{
		LowBlood[slot] = BldTex;
		if (BloodOV[slot] == None)
			BloodOV[slot] = Spawn(Class'RTBloodTransOV', Self);
		BloodOV[slot].MultiSkins[1] = BldTex;
	}
}

function byte GetFreeBloodSlot(texture BloodList[3])
{
local byte i, j, freeSlots;
local byte BloodSlots[3];

	freeSlots = ArrayCount(BloodList);
	for (i = 0; i < ArrayCount(BloodList); i++)
	{
		if (BloodList[i] != None)
			freeSlots--;
	}
	
	if (freeSlots > 0)
	{
		for (i = 0; i < ArrayCount(BloodList); i++)
		{
			if (BloodList[i] == None)
			{
				BloodSlots[j] = i;
				j++;
			}
		}
		return BloodSlots[Rand(freeSlots)];
	}
	
	return Rand(ArrayCount(BloodList));
}

function texture GetBloodTexture(bool bHighBlood, byte type, byte n)
{
	if (type == 0)
	{
		if (bHighBlood)
			return HighBlood_Red[n];
		else
			return LowBlood_Red[n];
	}
	else if (type == 1)
	{
		if (bHighBlood)
			return HighBlood_Blue[n];
		else
			return LowBlood_Blue[n];
	}
	else if (type == 2)
	{
		if (bHighBlood)
			return HighBlood_Green[n];
		else
			return LowBlood_Green[n];
	}
	else if (type == 3)
	{
		if (bHighBlood)
			return HighBlood_Yellow[n];
		else
			return LowBlood_Yellow[n];
	}
	else if (type == 4)
	{
		if (bHighBlood)
			return HighBlood_Black[n];
		else
			return LowBlood_Black[n];
	}
	
	return None;
}

simulated function Timer()
{
local Pawn P;

	if (Physics == PHYS_None && Role != ROLE_Authority && RealLocation != Location && RealLocation != vect(0,0,0))
		SetLocation(RealLocation);

	if (!bDisrupted && Role == ROLE_Authority)
	{
		//Tell local bots about self
		for (P=Level.PawnList; P!=None; P=P.NextPawn)
		{
			if (Bot(P) != None && P.Weapon != None && !P.Weapon.bMeleeWeapon && !noHurtThisPawn(P))
			{
				if (VSize(P.Location - Location) < 500 && P.LineOfSightTo(Self))
				{
					Bot(P).ShootTarget(self);
					break;
				}
				else if (P.IsInState('Roaming') && Bot(P).bCamping && CheckThisTranslocator(Bot(P), Self))
				{
					Bot(P).SetPeripheralVision();
					Bot(P).TweenToRunning(0.1);
					Bot(P).bCamping = false;
					Bot(P).GotoState('Roaming', 'SpecialNavig');
					break;
				}
			}
		}
	}
	
	SetTimer(1 + 2*FRand(), False);
}

simulated function Landed(vector HitNormal)
{
local rotator newRot;

	newRot = Rotation;
	newRot.Pitch = 0;
	newRot.Roll = 0;
	SetRotation(newRot);
	
	if (Role == ROLE_Authority)
	{
		RemoteRole = ROLE_DumbProxy;
		RealLocation = Location;
		if (Class'NWUtils'.static.isValidBot(Pawn(Master.Owner)))
		{
			if (Pawn(Master.Owner).Weapon == Master)
				Pawn(Master.Owner).SwitchToBestWeapon();
			LifeTime = 10;
		}
	}
	
	SetTimer(2.5, False);
}

function TakeDamage(int Dmg, Pawn EventInstigator, vector HitLocation, vector Momentum, name DType)
{
	if ((EventInstigator != Instigator || !canDisruptByOwner) && noHurtThisPawn(EventInstigator))
		return;

	Disruptor = EventInstigator;
	TransHealth -= Dmg;
	bDisrupted = (TransHealth <= 0);

	if (!bRazor || bDisrupted)
	{
		RemoteRole = ROLE_DumbProxy;
		SetPhysics(PHYS_Falling);
		Velocity = Momentum/Mass;
		Velocity.Z = FMax(Velocity.Z, 0.7 * VSize(Velocity));
		if (bDisrupted)
			SetDisruption();
	}
		
	if (!bDisrupted)
		SetTimer(0.3, False);
}

function SetDisruption()
{
local byte i;

	if (bRazor)
		StopRazors();

	if (OVMainTop != None)
		OVMainTop.SetDisruption();
	if (OVMainBottom != None)
		OVMainBottom.SetDisruption();
		
	for (i = 0; i < ArrayCount(OVTop); i++)
	{
		if (OVTop[i] != None)
			OVTop[i].SetDisruption();
	}
	for (i = 0; i < ArrayCount(OVBottom); i++)
	{
		if (OVBottom[i] != None)
			OVBottom[i].SetDisruption();
	}
	
	AmbientSound = DisruptedAmbSnd;
}

simulated function StopRazors()
{
	TweenAnim('Razored', 0.1);
}

simulated singular function Touch(Actor Other)
{
local actor HitActor;
local vector HitLocation, HitNormal, TestLocation;
local vector NewPos;

	if (BlockAll(Other) != None)
	{
		HitWall(Normal(Location - Other.Location), Other);
		return;
	}
	
	if (Other.bProjTarget || (Other.bBlockActors && Other.bBlockPlayers))
	{
		//get exact hitlocation (changed for translocator)
		HitActor = Trace(HitLocation, HitNormal, OldLocation + 
			Normal(vect(1,1,0)*Normal(Other.Location - OldLocation) + vect(0,0,1)*Normal(Velocity))*(VSize(Velocity)/15 + CollisionRadius*4), 
			OldLocation, True);
			
		if (Pawn(Other) != None)
			LastTouchedPawn = Pawn(Other);
		
		if (HitActor == Other)
		{
			if (Other.bIsPawn && !Pawn(Other).AdjustHitLocation(HitLocation, Velocity))
				return;
			ProcessTouch(Other, HitLocation); 
		}
		else 
			ProcessTouch(Other, Other.Location + Other.CollisionRadius * Normal(Location - Other.Location));
	}
	else if (Master != None && Class'NWUtils'.static.isValidBot(Instigator) && (Inventory(Other) != None || Triggers(Other) != None || NavigationPoint(Other) != None))
	{
		NewPos = Other.Location;
		NewPos.Z = Location.Z;
		SetLocation(NewPos);
		Velocity = vect(0,0,0);
		Master.Translocate();
	}
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
local NWKillMsgManager NWkmsg;

	if (Role == ROLE_Authority && Physics == PHYS_None && Other == Instigator && Master != None)
	{
		MasterPickupSelf();
		return;
	}
	
	if ((!CanHitInstigator || (CanHitInstigator && (Default.LifeSpan - LifeSpan) < HitInstigatorTimeOut)) && Other == Instigator)
		return;
	
	if (Role == ROLE_Authority)
	{
		if (Master != None && Class'NWUtils'.static.isValidBot(Instigator) && Pawn(Other) != None && Master.CheckTelefrag())
		{
			if (CanAITranslocate())
				Master.Translocate();
			else
				MasterPickupSelf();
			return;
		}
		
		if (bDirectHit && bRazor && Physics == PHYS_Projectile)
		{
			Damage = Class'RT'.default.TransRazorDamage;
			if (Damage > 0)
			{
				if (Class'RT'.default.enableTransRazorHeadshot && Master != None && Master.isHeadShotDmg(Other, HitLocation))
				{
					Damage = Class'RT'.default.TransRazorHeadshotDamage;
					MyDamageType = 'Decapitated';
					if (Other.bIsPawn)
						PlaySound(HeadshotGibSnd[Rand(ArrayCount(HeadshotGibSnd))], SLOT_Misc, 4.0);
					UpdateBlood(Other, True);
					if (Instigator != None)
					{
						NWkmsg = Class'NWUtils'.static.getKillMsgManager(Level);
						if (NWkmsg != None)
							NWkmsg.prepareHeadshotKillMsg(Instigator, Pawn(Other), Class'RT');
					}
				}
				else
				{
					MyDamageType = default.MyDamageType;
					if (Other.bIsPawn || Carcass(Other) != None)
						PlaySound(GibSnd[Rand(ArrayCount(GibSnd))], SLOT_Misc, 4.0);
					UpdateBlood(Other, False);
				}
				DirectHurtProcess(Other, HitLocation);
			}
		}
	}
	
	if (Physics != PHYS_None && (!bRazor || !Other.bIsPawn) && Triggers(Other)==None && Other.bBlockPlayers && Other.bBlockActors)
		HitWall(-1 * Normal(Velocity), Other);
}

function MasterPickupSelf()
{
	PlaySound(PickupSnd,, 2.0);
	if (Master != None)
	{
		Master.RTTarget = None;
		Master.SetTStatus(Master.PreFireTransStatus, Master.TransStatus);
		Master.SetTransInvisibility(Master.TransStatus==TS_Empty);
		Master.ClientPlayTransPickupAnim();
	}
	Destroy();
}

simulated function HitWall (vector HitNormal, actor Wall)
{
local vector newPos;

	if (Physics == PHYS_Projectile)
	{
		if (Mover(Wall) != None && Mover(Wall).bDamageTriggered && Role == ROLE_Authority)
			Wall.TakeDamage(Damage, Instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);

		Spawn(Class'WallCrack',,, Location, rotator(HitNormal));
		Velocity -= (2 * (Velocity dot HitNormal) * HitNormal);  
		SetRotation(rotator(Velocity));
		if (Level.NetMode != NM_StandAlone && Role == ROLE_Authority)
		{
			SavePosition();
			PosUpdateTracker++;
		}
	}
	else
	{
		if (Pawn(Wall) != None)
		{
			newPos = Wall.Location;
			newPos.Z = Location.Z;
			SetLocation(newPos);
			Velocity = vect(0,0,0);
			return;
		}
		
		if (bAlreadyHit)
		{
			bBounce = false;
			return;
		}
		bAlreadyHit = (HitNormal.Z > 0.7);
		Velocity = 0.3*((Velocity dot HitNormal) * HitNormal * (-2.0) + Velocity);
		speed = VSize(Velocity);
	}
	
	if (enableHitSound)
		PlaySound(HitSounds[Rand(ArrayCount(HitSounds))], SLOT_Misc);
}

simulated function Tick(float Delta)
{
	//Keep razor in sync with server version in an online game
	if (Level.NetMode != NM_StandAlone && Role < ROLE_Authority && ClientUpdateTracker != PosUpdateTracker)
	{
		ClientUpdateTracker = PosUpdateTracker;
		CorrectPosition();
		if (enableHitSound)
			PlaySound(HitSounds[Rand(ArrayCount(HitSounds))], SLOT_Misc);
	}
		
	if (Level.bHighDetailMode && Shadow == None && PlayerPawn(Instigator) != None && ViewPort(PlayerPawn(Instigator).Player) != None)
	{
		Shadow = Spawn(class'TargetShadow', Self,,, rot(16384,0,0));
		Shadow.DrawScale = ShadowSize;
	}

	//AI stuff
	if ( Role == ROLE_Authority )
	{
		if (LifeTime > 0)
		{
			LifeTime -= Delta;
			if (LifeTime <= 0)
			{
				MasterPickupSelf();
				return;
			}
		}
		
		if (DesiredTarget == None || Master == None)
		{
			if (Class'NWUtils'.static.isValidBot(Pawn(Master.Owner)) && Pawn(Master.Owner).Weapon == Master)
				Pawn(Master.Owner).SwitchToBestWeapon();
			return;
		}

		if (Abs(Location.X - DesiredTarget.Location.X) < Master.Owner.CollisionRadius
		&& Abs(Location.Y - DesiredTarget.Location.Y) < Master.Owner.CollisionRadius)
		{
			if (!FastTrace(DesiredTarget.Location, Location))
				return;

			Pawn(Master.Owner).StopWaiting();
			Master.Translocate();
			if (Class'NWUtils'.static.isValidBot(Pawn(Master.Owner)) && Pawn(Master.Owner).Weapon == Master)
				Pawn(Master.Owner).SwitchToBestWeapon();
		}
	}
}

//Code to make this translocator functional AI wise, basically a copy of already existing code in CTFGame with some enhancements/fixes
function bool CheckThisTranslocator(Bot aBot, RTTrans T)
{
local FlagBase F;

	if (CTFGame(Level.Game) == None)
		return False;

	if (aBot.Weapon.bMeleeWeapon)
		return False;
	F = CTFReplicationInfo(Level.Game.GameReplicationInfo).FlagList[aBot.PlayerReplicationInfo.Team].HomeBase;

	if (T.Region.Zone == F.Region.Zone && !noHurtThisPawn(aBot) && !T.bDisrupted && VSize(T.Location - F.Location) < 1000)
	{
		if (VSize(aBot.Location - T.Location) < 850 && aBot.LineOfSightTo(T))
		{
			aBot.AmbushSpot = None;
			aBot.ShootTarget(T);
			return True;
		}
		else
		{
			aBot.MoveTarget = aBot.FindPathToward(T);
			if (aBot.MoveTarget != None)
			{
				if (VSize(aBot.Location - aBot.MoveTarget.Location) < 1.5 * aBot.CollisionRadius)
				{
					aBot.CampTime = 3.0;
					aBot.GotoState('Roaming', 'Camp');
				}
				aBot.AmbushSpot = None;
				return True;
			}
		}
	}
	
	return False;
}

function bool CanAITranslocate()
{
	return !FastTrace(Location - MaxAITranslocationHeight*vect(0,0,1), Location);
}

simulated function Destroyed()
{
local byte i;

	if (Shadow != None)
		Shadow.Destroy();
	if (OVMainTop != None)
		OVMainTop.Destroy();
	if (OVMainBottom != None)
		OVMainBottom.Destroy();
		
	Shadow = None;
	OVMainTop = None;
	OVMainBottom = None;
		
	for (i = 0; i < ArrayCount(OVTop); i++)
	{
		if (OVTop[i] != None)
			OVTop[i].Destroy();
		OVTop[i] = None;
	}
	for (i = 0; i < ArrayCount(OVBottom); i++)
	{
		if (OVBottom[i] != None)
			OVBottom[i].Destroy();
		OVBottom[i] = None;
	}
	for (i = 0; i < ArrayCount(BloodOV); i++)
	{
		if (BloodOV[i] != None)
			BloodOV[i].Destroy();
		BloodOV[i] = None;
	}
	
	DesiredTarget = None;
	if (Role == ROLE_Authority && Master != None && Master.Owner != None && Class'NWUtils'.static.isValidBot(Pawn(Master.Owner)) && Pawn(Master.Owner).Weapon == Master)
		Pawn(Master.Owner).SwitchToBestWeapon();
		
	Super.Destroyed();
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=RTTrans
	LifeSpan=50000.000000
	bNetTemporary=False
	CollisionHeight=3.000000
	CollisionRadius=8.000000
	Texture=RT_Metal
	
	AnimSequence=Normal
	bBounce=True
	bProjTarget=True
	Physics=PHYS_Falling
	Mass=50.000000
	
	SoundPitch=64
	SoundRadius=20
	SoundVolume=128
	AmbientSound=RTAmbNormal
	
	Damage=0
	ExplosionDecal=None
	ImpactSound=None
	MaxSpeed=2000.000000
	MomentumTransfer=0
	MyDamageType=RazorCut
	speed=830.000000
	DmgRadius=0.000000
	bNeverHurtInstigator=True
	bNoHurtTeam=True
	ExplosionNoise=0.000000
	
	bWaterHitFX=True
	WaterSplashType=1
	Mass=50.000000
	
	PickupSnd=RTTelePickup
	DisruptedAmbSnd=RTDisruptAmb
	DisruptGibSnd=RTDisruptGib
	HitSounds(0)=RTHit01
	HitSounds(1)=RTHit02
	HitSounds(2)=RTHit03
	GibSnd(0)=RazorGib1
	GibSnd(1)=RazorGib2
	HeadshotGibSnd(0)=HeadShotRazorGib1
	HeadshotGibSnd(1)=HeadShotRazorGib2
	
	OVFXRate=2.000000
	ShadowSize=0.250000
	MaxAITranslocationHeight=1200.000000
	
	LowBlood_Red(0)=LowBloodRed01
	LowBlood_Red(1)=LowBloodRed02
	LowBlood_Red(2)=LowBloodRed03
	HighBlood_Red(0)=HighBloodRed01
	HighBlood_Red(1)=HighBloodRed02
	HighBlood_Red(2)=HighBloodRed03
	LowBlood_Blue(0)=LowBloodBlue01
	LowBlood_Blue(1)=LowBloodBlue02
	LowBlood_Blue(2)=LowBloodBlue03
	HighBlood_Blue(0)=HighBloodBlue01
	HighBlood_Blue(1)=HighBloodBlue02
	HighBlood_Blue(2)=HighBloodBlue03
	LowBlood_Green(0)=LowBloodGreen01
	LowBlood_Green(1)=LowBloodGreen02
	LowBlood_Green(2)=LowBloodGreen03
	HighBlood_Green(0)=HighBloodGreen01
	HighBlood_Green(1)=HighBloodGreen02
	HighBlood_Green(2)=HighBloodGreen03
	LowBlood_Yellow(0)=LowBloodYellow01
	LowBlood_Yellow(1)=LowBloodYellow02
	LowBlood_Yellow(2)=LowBloodYellow03
	HighBlood_Yellow(0)=HighBloodYellow01
	HighBlood_Yellow(1)=HighBloodYellow02
	HighBlood_Yellow(2)=HighBloodYellow03
	LowBlood_Black(0)=LowBloodBlack01
	LowBlood_Black(1)=LowBloodBlack02
	LowBlood_Black(2)=LowBloodBlack03
	HighBlood_Black(0)=HighBloodBlack01
	HighBlood_Black(1)=HighBloodBlack02
	HighBlood_Black(2)=HighBloodBlack03
}
