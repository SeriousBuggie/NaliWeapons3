//////////////////////////////////////////////////////////////
//	Nali Weapons III Megaton password card
//				Feralidragon (27-08-2011)
//
// NW3 MEGATON BUILD 1.00
//////////////////////////////////////////////////////////////

class MegatonPassCard expands NaliWeapons;

//WEAPON
//*******************************************************

//1st person
#exec MESH IMPORT MESH=MegatonPassCard ANIVFILE=MODELS\MegatonPassCard_a.3d DATAFILE=MODELS\MegatonPassCard_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MegatonPassCard STRENGTH=0
#exec MESH ORIGIN MESH=MegatonPassCard X=0 Y=0 Z=0

//Pickup
#exec MESH IMPORT MESH=MegatonPassCardPick ANIVFILE=MODELS\MegatonPassCard_a.3d DATAFILE=MODELS\MegatonPassCard_d.3d X=0 Y=0 Z=0 UNMIRROR=1
//#exec MESH LODPARAMS MESH=MegatonPassCardPick STRENGTH=0
#exec MESH ORIGIN MESH=MegatonPassCardPick X=0 Y=0 Z=0 Yaw=128

//3rd person
#exec MESH IMPORT MESH=MegatonPassCardM ANIVFILE=MODELS\MegatonPassCard_a.3d DATAFILE=MODELS\MegatonPassCard_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MegatonPassCardM STRENGTH=0.45
#exec MESH ORIGIN MESH=MegatonPassCardM X=0 Y=120 Z=-12

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=MegatonPassCard SEQ=All STARTFRAME=0 NUMFRAMES=14
#exec MESH SEQUENCE MESH=MegatonPassCard SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonPassCard SEQ=Select STARTFRAME=6 NUMFRAMES=7 RATE=14.0 GROUP=Select
#exec MESH SEQUENCE MESH=MegatonPassCard SEQ=Down STARTFRAME=0 NUMFRAMES=7 RATE=27.0

//#exec MESH SEQUENCE MESH=MegatonPassCardPick SEQ=All STARTFRAME=0 NUMFRAMES=14
//#exec MESH SEQUENCE MESH=MegatonPassCardPick SEQ=Still STARTFRAME=0 NUMFRAMES=1
//#exec MESH SEQUENCE MESH=MegatonPassCardPick SEQ=Dropped STARTFRAME=13 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonPassCardPick SEQ=Still STARTFRAME=13 NUMFRAMES=1

#exec MESH SEQUENCE MESH=MegatonPassCardM SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonPassCardM SEQ=Still STARTFRAME=0 NUMFRAMES=1

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=MegatonPassCard MESH=MegatonPassCard
#exec MESHMAP SCALE MESHMAP=MegatonPassCard X=0.015 Y=0.015 Z=0.03

#exec MESHMAP NEW MESHMAP=MegatonPassCardPick MESH=MegatonPassCardPick
#exec MESHMAP SCALE MESHMAP=MegatonPassCardPick X=0.1068 Y=0.1068 Z=0.2136

#exec MESHMAP NEW MESHMAP=MegatonPassCardM MESH=MegatonPassCardM
#exec MESHMAP SCALE MESHMAP=MegatonPassCardM X=0.0562 Y=0.0562 Z=0.1124

//-----------------------------------------------------------------------------------

//Screens
#exec TEXTURE IMPORT NAME=PassCard_N0 FILE=DIGITAL\PassCard_N0.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=PassCard_N1 FILE=DIGITAL\PassCard_N1.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=PassCard_N2 FILE=DIGITAL\PassCard_N2.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=PassCard_N3 FILE=DIGITAL\PassCard_N3.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=PassCard_N4 FILE=DIGITAL\PassCard_N4.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=PassCard_N5 FILE=DIGITAL\PassCard_N5.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=PassCard_N6 FILE=DIGITAL\PassCard_N6.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=PassCard_N7 FILE=DIGITAL\PassCard_N7.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=PassCard_N8 FILE=DIGITAL\PassCard_N8.bmp GROUP=Digital LODSET=0 MIPS=OFF
#exec TEXTURE IMPORT NAME=PassCard_N9 FILE=DIGITAL\PassCard_N9.bmp GROUP=Digital LODSET=0 MIPS=OFF

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=Sk_PassCard01 FILE=SKINS\Sk_PassCard01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCard NUM=1 TEXTURE=Sk_PassCard01
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCardPick NUM=1 TEXTURE=Sk_PassCard01
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCardM NUM=1 TEXTURE=Sk_PassCard01

#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCard NUM=2 TEXTURE=PassCard_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCardPick NUM=2 TEXTURE=PassCard_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCardM NUM=2 TEXTURE=PassCard_N0

#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCard NUM=3 TEXTURE=PassCard_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCardPick NUM=3 TEXTURE=PassCard_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCardM NUM=3 TEXTURE=PassCard_N0

#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCard NUM=4 TEXTURE=PassCard_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCardPick NUM=4 TEXTURE=PassCard_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCardM NUM=4 TEXTURE=PassCard_N0

//--------------------------------------------------------------

//Icons
#exec TEXTURE IMPORT NAME=MegatonPassCardIcon FILE=ICONS\MegatonPassCardIcon.bmp GROUP=Icons MIPS=OFF LODSET=0

//--------------------------------------------------------------

//Sounds
#exec AUDIO IMPORT NAME="MegatonPassCard_Pickup" FILE=SOUNDS\MegatonPassCard_Pickup.wav GROUP="MegatonPassCard"
#exec AUDIO IMPORT NAME="MegatonPassCard_Select" FILE=SOUNDS\MegatonPassCard_Select.wav GROUP="MegatonPassCard"

//HAND
//*******************************************************

//Left Hand
#exec MESH IMPORT MESH=MegatonPassCardHandL ANIVFILE=MODELS\MegatonPassCardHand_a.3d DATAFILE=MODELS\MegatonPassCardHand_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MegatonPassCardHandL STRENGTH=0
#exec MESH ORIGIN MESH=MegatonPassCardHandL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=MegatonPassCardHandR ANIVFILE=MODELS\MegatonPassCardHand_a.3d DATAFILE=MODELS\MegatonPassCardHand_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=MegatonPassCardHandR STRENGTH=0
#exec MESH ORIGIN MESH=MegatonPassCardHandR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=MegatonPassCardHandL SEQ=All STARTFRAME=0 NUMFRAMES=14
#exec MESH SEQUENCE MESH=MegatonPassCardHandL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonPassCardHandL SEQ=Select STARTFRAME=6 NUMFRAMES=7 RATE=14.0 GROUP=Select
#exec MESH SEQUENCE MESH=MegatonPassCardHandL SEQ=Down STARTFRAME=0 NUMFRAMES=7 RATE=27.0

#exec MESH SEQUENCE MESH=MegatonPassCardHandR SEQ=All STARTFRAME=0 NUMFRAMES=14
#exec MESH SEQUENCE MESH=MegatonPassCardHandR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonPassCardHandR SEQ=Select STARTFRAME=6 NUMFRAMES=7 RATE=14.0 GROUP=Select
#exec MESH SEQUENCE MESH=MegatonPassCardHandR SEQ=Down STARTFRAME=0 NUMFRAMES=7 RATE=27.0

//Scale
#exec MESHMAP NEW MESHMAP=MegatonPassCardHandL MESH=MegatonPassCardHandL
#exec MESHMAP SCALE MESHMAP=MegatonPassCardHandL X=0.015 Y=0.015 Z=0.03

#exec MESHMAP NEW MESHMAP=MegatonPassCardHandR MESH=MegatonPassCardHandR
#exec MESHMAP SCALE MESHMAP=MegatonPassCardHandR X=0.015 Y=0.015 Z=0.03

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCardHandL NUM=1 TEXTURE=HumanHand
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCardHandR NUM=1 TEXTURE=HumanHand

//===========================================================================

//OVERLAYER
//*******************************************************

//1st person
#exec MESH IMPORT MESH=MegatonPassCardOV ANIVFILE=MODELS\MegatonPassCardOV_a.3d DATAFILE=MODELS\MegatonPassCardOV_d.3d X=0 Y=0 Z=0 UNMIRROR=1
//#exec MESH LODPARAMS MESH=MegatonPassCardOV STRENGTH=0
#exec MESH ORIGIN MESH=MegatonPassCardOV X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=MegatonPassCardOV SEQ=All STARTFRAME=0 NUMFRAMES=14
#exec MESH SEQUENCE MESH=MegatonPassCardOV SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonPassCardOV SEQ=Select STARTFRAME=6 NUMFRAMES=7 RATE=14.0 GROUP=Select
#exec MESH SEQUENCE MESH=MegatonPassCardOV SEQ=Down STARTFRAME=0 NUMFRAMES=7 RATE=27.0

//Scale
#exec MESHMAP NEW MESHMAP=MegatonPassCardOV MESH=MegatonPassCardOV
#exec MESHMAP SCALE MESHMAP=MegatonPassCardOV X=0.015 Y=0.015 Z=0.03

//Skinning
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCardOV NUM=1 TEXTURE=PassCard_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCardOV NUM=2 TEXTURE=PassCard_N0
#exec MESHMAP SETTEXTURE MESHMAP=MegatonPassCardOV NUM=3 TEXTURE=PassCard_N0

//===========================================================================


var() texture NumbersTex[10];
var() localized string passwordCanvas;
var() color passwordColor;
var() localized string PickupCardMsg, ReturnToOriginMsg, ReturnToOwnerMsg, DroppedCardMsg;

var(ServerConfig) config bool bReturnToOwner;
var(ServerConfig) config float DroppedTime;
var(ServerConfig) config float allowedDroppedDistFromMegaton;
var(ServerConfig) config float renderLocationMaxDist;
var(ServerConfig) config bool bRenderLocationWhenDropped;
var(ServerConfig) config bool BroadcastPickupMsg;
var(ServerConfig) config bool BroadcastReturnToOriginMsg;
var(ServerConfig) config bool BroadcastReturnToOwnerMsg;
var(ServerConfig) config bool BroadcastDroppedMsg;


var bool bDestroyCard;
var MegatonDeploy MDeploy;
var Pawn OriginalOwner;
var vector curLoc;
var float droppedTimeCount;
var bool bInvalidDropEvent;
var texture NTex[3];


replication
{
	reliable if (Role == ROLE_Authority)
		NTex;
}

function PreBeginPlay()
{
	Super.PreBeginPlay();
	
	if (default.bRenderLocationWhenDropped && default.renderLocationMaxDist > 0.0)
		AddAuxMutator(Class'MegatonMut');
}

simulated function SetDefaultDisplay()
{
local byte i;

	Super.SetDefaultDisplay();
	for (i = 0; i < 3; i++)
		MultiSkins[i + 2] = NTex[i];
}

simulated function bool isDigitTexture(texture Tex, optional bool bTrueIfDefault, optional byte DefSkinN)
{
local byte i;
local texture DefTex;

	if (bTrueIfDefault)
	{
		if (DefSkinN < 8)
			DefTex = default.MultiSkins[DefSkinN];
		else
			DefTex = default.Texture;
			
		if (Tex == DefTex)
			return True;
	}
	
	for (i = 0; i < ArrayCount(NumbersTex); i++)
	{
		if (Tex == NumbersTex[i])
			return True;
	}
	
	return False;
}

simulated function RenderOther( canvas Canvas, vector Loc, rotator Rot)
{
local byte i;

	//Screen flickering and update
	if (FirstOverFXActor[0] != None)
	{
		FirstOverFXActor[0].ScaleGlow = 0.75 + FRand() * 0.75 ;
		for (i = 0; i < 3; i++)
			FirstOverFXActor[0].MultiSkins[i + 1] = NTex[i];
	}
}

simulated function string getRenderCustomCanvasText()
{
	return passwordCanvas$getStringFromTex(0)$getStringFromTex(1)$getStringFromTex(2);
}

simulated function color getRenderCustomCanvasColor()
{
	return passwordColor;
}

simulated function string getStringFromTex(byte n)
{
local byte i;

	if (n > 7)
		return "";

	for (i = 0; i < ArrayCount(NumbersTex); i++)
	{
		if (NTex[n] == NumbersTex[i])
			return string(i);
	}
	
	return "_";
}

function processDigits(string data)
{
local byte i;

	for (i = 0; i < 3; i++)
	{
		NTex[i] = NumbersTex[int(Mid(data, i, 1))];
		if (isDigitTexture(MultiSkins[i + 2], True, i + 2))
			MultiSkins[i + 2] = NTex[i];
	}
}

function vector getValidDropSpot(actor Ref, optional byte directions)
{
local float rStep;
local byte i;
local rotator R;
local vector Start, End;

	if (Ref == None)
		return vect(0,0,0);

	if (directions == 0)
		directions = 4;
		
	rStep = 65536.0 / directions;
	for (i = 0; i < directions; i++)
	{
		R.Yaw = rStep * i;
		Start = Ref.Location;
		End = Start + vector(R)*(Ref.CollisionRadius + 64.0);
		if (!FastTrace(End, Start))
			continue;
		
		Start = End;
		End = Start + vect(0,0,-1)*(Ref.CollisionHeight + 64.0);
		if (FastTrace(End, Start))
			continue;
		
		return Start;
	}
	
	return Ref.Location + (Ref.CollisionHeight+32.0)*vect(0,0,1);
}

function SpawnCardCopy()
{
local MegatonPassCard MPC;
local byte i;

	MPC = Spawn(Class,,, curLoc);
	if (MPC != None)
	{
		MPC.OriginalOwner = OriginalOwner;
		MPC.MDeploy = MDeploy;
		if (MDeploy != None)
			MDeploy.MPassCard = MPC;

		for (i = 0; i < 3; i++)
		{
			MPC.NTex[i] = NTex[i];
			MPC.MultiSkins[i + 2] = NTex[i];
		}
		
		if (bReturnToOwner && isValidPawn(OriginalOwner))
		{
			MPC.GiveSelfToPawn(OriginalOwner);
			if (BroadcastReturnToOwnerMsg)
				BroadcastMessage(getEscapedString(ReturnToOwnerMsg, OriginalOwner), True, 'CriticalEvent');
		}
		else if (isBadZone(MPC.Region.Zone) && MDeploy != None && VSize(MPC.Location-MDeploy.Location) > allowedDroppedDistFromMegaton)
		{
			bInvalidDropEvent = True;
			MPC.DropFrom(getValidDropSpot(MDeploy, 12));
			if (BroadcastReturnToOriginMsg)
				BroadcastMessage(getEscapedString(ReturnToOriginMsg), True, 'CriticalEvent');
		}
		else
			MPC.DropFrom(curLoc);
	}
}

simulated function Tick(float Delta)
{
local rotator R;

	if (Role == ROLE_Authority)
	{
		if (Pawn(Owner) == None)
		{
			if (isBadZone(Region.Zone))
			{
				if (bReturnToOwner && isValidPawn(OriginalOwner))
				{
					GiveSelfToPawn(OriginalOwner);
					if (BroadcastReturnToOwnerMsg)
						BroadcastMessage(getEscapedString(ReturnToOwnerMsg, OriginalOwner), True, 'CriticalEvent');
				}
				else if (MDeploy != None && !isBadZone(MDeploy.Region.Zone) && VSize(Location-MDeploy.Location) > allowedDroppedDistFromMegaton)
				{
					bInvalidDropEvent = True;
					DropFrom(getValidDropSpot(MDeploy, 12));
					if (BroadcastReturnToOriginMsg)
						BroadcastMessage(getEscapedString(ReturnToOriginMsg), True, 'CriticalEvent');
				}
				else if (MDeploy == None)
					DestroyCard();
			}
			else if (OriginalOwner == None && Pawn(Owner) == None && GetStateName() != 'Pickup')
				Destroy();
		}
		
		if (Pawn(Owner) != None)
			curLoc = Pawn(Owner).Location;
		else
			curLoc = Location;
	}
	
	Super.Tick(Delta);
}

simulated function bool isBadZone(ZoneInfo Z)
{
	return (Z.DamagePerSec > 0 || Z.bKillZone);
}

function bool isValidPawn(Pawn P)
{
	return (P != None && !P.bDeleteMe && P.Health > 0 && !P.bHidden && Spectator(P) == None);
}

function GiveSelfToPawn(Pawn P)
{
	if (P == None)
		return;
	
	RespawnTime = 0.0;
	GiveTo(P);
	bHeldItem = true;
	AmbientGlow = 0;
	if (PlayerPawn(P) != None)
		SetHand(PlayerPawn(P).Handedness);
	else
		GotoState('Idle');
}

function DestroyCard()
{
	bDestroyCard = True;
	if (Pawn(Owner) != None)
        Pawn(Owner).DeleteInventory(Self);
	Inventory = None;
	Destroy();
}

simulated function Destroyed()
{
	if (!bDestroyCard && MDeploy != None && !isBadZone(MDeploy.Region.Zone))
		SpawnCardCopy();
	Super.Destroyed();
}

function bool HandlePickupQuery(inventory Item)
{
	if (Item.Class == Class || Inventory == None)
		return False;
	return Inventory.HandlePickupQuery(Item);
}

function DropFrom(vector StartLocation)
{
local rotator R;

	if (!bInvalidDropEvent && BroadcastDroppedMsg)
		BroadcastMessage(getEscapedString(DroppedCardMsg, Pawn(Owner)), True, 'CriticalEvent');
	bInvalidDropEvent = False;

	Super.DropFrom(StartLocation);
	
	if (MDeploy == None || VSize(Location-MDeploy.Location) > allowedDroppedDistFromMegaton)
		droppedTimeCount = DroppedTime;
	
	TweenToStill();
	R.Yaw = Rand(16384)*4;
	SetRotation(R);
}

//Cancel firing functions
function Fire(float Value);
function AltFire(float Value);

simulated function bool ClientFire(float Value)
{
	return False;
}

simulated function bool ClientAltFire(float Value)
{
	return False;
}

function float RateSelf(out int bUseAltMode)
{
	return -2;
}

function string getEscapedString(coerce string s, optional Pawn P)
{
local int sn;
local string sname;
	
	sn = InStr(s, "%i");
	if (sn > -1)
		s = Left(s, sn) $ ItemName $ Mid(s, sn+2);
	
	sn = InStr(s, "%p");
	if (sn > -1)
	{
		if (P == None)
			sname = "";
		else if (P.PlayerReplicationInfo != None)
			sname = P.PlayerReplicationInfo.PlayerName;
		else
			sname = P.GetHumanName();
			
		s = Left(s, sn) $ sname $ Mid(s, sn+2);
	}
	
	return s;
}

function assignDecoderAICode(Actor A)
{
local Inventory Inv;

	if (A == None || A.Inventory == None)
		return;

	for( Inv = A.Inventory; Inv != None; Inv = Inv.Inventory )
	{
		if (MegatonDecoder(Inv) != None)
		{
			MegatonDecoder(Inv).EnemyMDeploy = MDeploy;
			MegatonDecoder(Inv).knowsCode = True;
			return;
		}
	}
}

function float BotDesireability(Pawn B)
{
	return 10;
}

function BringUp()
{
	if (PlayerPawn(Owner) != None)
	{
		SetHand(PlayerPawn(Owner).Handedness);
		PlayerPawn(Owner).EndZoom();
	}
	bWeaponUp = false;
	PlaySelect();
	GotoState('Active');
}

function float SwitchPriority() 
{
	return -1;
}

state DownWeapon
{
ignores Fire, AltFire;

	function BeginState()
	{
		bChangeWeapon = False;
		bMuzzleFlash = 0;
		if (Pawn(Owner) != None)
			Pawn(Owner).ClientPutDown(Self, Pawn(Owner).PendingWeapon);
	}
}

auto state Pickup
{
    function bool ValidTouch(actor Other)
    {
	local Actor A;
	local string s;
	
	
        if (isValidPawn(Pawn(Other)) && Pawn(Other).bIsPlayer)
        {
			if( Event != '' )
			{
				foreach AllActors( class 'Actor', A, Event )
					A.Trigger( Other, Other.Instigator );
			}
			
			if (BroadcastPickupMsg)
				BroadcastMessage(getEscapedString(PickupCardMsg, Pawn(Other)), True, 'CriticalEvent');
			
			droppedTimeCount = -1;
			if (Class'NWUtils'.static.isValidBot(Pawn(Other)) && MDeploy != None && MDeploy.Instigator != Pawn(Other) && !MDeploy.noHurtThisPawn(Pawn(Other)))
				assignDecoderAICode(Other);
			
            return True;
        }
		
        return False;
    }
	
	function Timer();
	
	simulated function Tick(float Delta)
	{
		Global.Tick(Delta);
		
		if (Role == ROLE_Authority && Pawn(Owner) == None && droppedTimeCount > 0)
		{
			droppedTimeCount -= Delta;
			if (droppedTimeCount <= 0)
			{
				if (bReturnToOwner && isValidPawn(OriginalOwner))
				{
					GiveSelfToPawn(OriginalOwner);
					if (BroadcastReturnToOwnerMsg)
						BroadcastMessage(getEscapedString(ReturnToOwnerMsg, OriginalOwner), True, 'CriticalEvent');
				}
				else if (MDeploy != None && VSize(Location-MDeploy.Location) > allowedDroppedDistFromMegaton)
				{
					bInvalidDropEvent = True;
					DropFrom(getValidDropSpot(MDeploy, 12));
					if (BroadcastReturnToOriginMsg)
						BroadcastMessage(getEscapedString(ReturnToOriginMsg), True, 'CriticalEvent');
				}
				else if (MDeploy == None)
					DestroyCard();
			}
		}
	}
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=MegatonPassCardPick
	CollisionHeight=8.000000
	CollisionRadius=16.000000
	AutoSwitchPriority=0
	Icon=MegatonPassCardIcon
	InventoryGroup=1
	ItemArticle="a"
	ItemName="MegaTon Password Card"
	MaxDesireability=1.000000
	PickupMessage="You got the MegaTon Password Card."
	PickupSound=MegatonPassCard_Pickup
	PickupViewMesh=MegatonPassCardPick
	PickupViewScale=1.000000
	PlayerViewMesh=MegatonPassCard
	PlayerViewOffset=(X=5.50000,Y=0.000000,Z=-2.500000)
	WidePlayerViewOffset=(X=6.00000,Y=0.000000,Z=-2.250000)
	CenterPlayerViewOffset=(X=5.50000,Y=0.000000,Z=-2.500000)
	WideCenterPlayerViewOffset=(X=6.00000,Y=0.000000,Z=-2.250000)
	PlayerViewScale=1.000000
	RespawnTime=30.000000
	StatusIcon=MegatonPassCardIcon
	ThirdPersonMesh=MegatonPassCardM
	ThirdPersonScale=0.750000
	AltDamageType=None
	AltFireSound=None
	AltProjectileClass=None
	AmmoName=None
	bInstantHit=False
	bAltInstantHit=False
	bRapidFire=False
	DeathMessage=""
	FireOffset=(X=0.000000,Y=0.000000,Z=0.000000)
	FireSound=None
	FiringSpeed=1.000000
	MaxTargetRange=4096.000000
	MyDamageType=""
	NameColor=(R=255,G=64,B=0)
	PickupAmmoCount=1
	ProjectileClass=None
	SelectSound=MegatonPassCard_Select
	shakemag=0.000000
	shaketime=0.000000
	shakevert=0.000000
	AIRating=1.000000
	AltRefireRate=1.000000
	bAltWarnTarget=False
	bRecommendAltSplashDamage=False
	bRecommendSplashDamage=False
	bSplashDamage=False
	bWarnTarget=False
	RefireRate=0.500000
	Mass=100.000000
	bNoSmooth=False
	bOwnsCrossHair=True
	CustomCross=None
	
	denyReplacement=True
	bMegaWeapon=True
	bForceHands=True
	bRotatingPickup=False
	
	PlayerViewMeshLeft=MegatonPassCard
	PlayerViewMeshRight=MegatonPassCard
	HandPartMeshL(0)=MegatonPassCardHandL
	HandPartMeshR(0)=MegatonPassCardHandR
	HandsBaseFatness=129
	BobDamping=1.075000
	
	FirstPersonOverFX(0)=(bLit=True)
	FirstPersonOverFX(0)=(GlowStyle=STY_Translucent,GlowAmount=1.75000,bCustomMesh=True)
	FirstPersonOverFX(0)=(CustomMeshLeft=Mesh'MegatonPassCardOV',CustomMesh=Mesh'MegatonPassCardOV')
	
	NumbersTex(0)=PassCard_N0
	NumbersTex(1)=PassCard_N1
	NumbersTex(2)=PassCard_N2
	NumbersTex(3)=PassCard_N3
	NumbersTex(4)=PassCard_N4
	NumbersTex(5)=PassCard_N5
	NumbersTex(6)=PassCard_N6
	NumbersTex(7)=PassCard_N7
	NumbersTex(8)=PassCard_N8
	NumbersTex(9)=PassCard_N9
	
	bRenderCustomOnHiddenWeapon=True
	passwordCanvas="Password: "
	passwordColor=(R=0,G=255,B=0)
	
	cannotRespawn=True
	
	PickupCardMsg="%i has been picked up by %p"
	ReturnToOriginMsg="%i has been returned to origin MegaTon"
	ReturnToOwnerMsg="%p got a %i back"
	DroppedCardMsg="%i has been dropped"
	
	bReturnToOwner=False
	DroppedTime=40.000000
	allowedDroppedDistFromMegaton=200.000000
	renderLocationMaxDist=20000.000000
	bRenderLocationWhenDropped=True
	BroadcastPickupMsg=True
	BroadcastReturnToOriginMsg=True
	BroadcastReturnToOwnerMsg=True
	BroadcastDroppedMsg=True
}
