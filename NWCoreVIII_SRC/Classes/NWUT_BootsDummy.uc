//////////////////////////////////////////////////////////////
//				Feralidragon (20-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWUT_BootsDummy expands UT_JumpBoots;


var NaliPickups NWPickupArmor;


function InitDummy(NaliPickups NP)
{
	if (NP == None || Pawn(NP.Owner) == None)
	{
		Destroy();
		return;
	}
	
	RespawnTime = 0.0;
	bHeldItem = True;
	NWPickupArmor = NP;
	ProtectionType1 = NP.ProtectionType1;
	ProtectionType2 = NP.ProtectionType2;
	Charge = NP.Charge;
	ArmorAbsorption = NP.ArmorAbsorption;
	AbsorptionPriority = NP.AbsorptionPriority;
	bIsAnArmor = NP.bIsArmor;
	GiveTo(Pawn(NP.Owner));
}

function GiveTo(Pawn Other)
{
    Instigator = Other;
    Other.AddInventory(Self);
    GotoState('Idle2');
}

function ArmorImpactEffect(vector HitLocation)
{ 
	if (NWPickupArmor != None)
		NWPickupArmor.ArmorImpactEffect(HitLocation);
}

function int ArmorAbsorbDamage(int Damage, name DamageType, vector HitLocation)
{
	if (NWPickupArmor != None)
		return NWPickupArmor.ArmorAbsorbDamage(Damage, DamageType, HitLocation);
	return Damage;
}


function Timer();
function BecomeItem();
function BecomePickup();
function PickupFunction(Pawn Other);

event float BotDesireability(pawn Bot)
{
	return 0.0;
}

function bool HandlePickupQuery(inventory Item)
{
	if (Item.Class == Class)
		return False;
	return Super.HandlePickupQuery(Item);
}

simulated function Destroyed()
{
	Super(Pickup).Destroyed();
}

function Inventory SpawnCopy(Pawn Other)
{
	return None;
}

function DropFrom(vector StartLocation)
{
	Destroy();
}

//Jump boots specific
function OwnerJumped()
{
	Super(Pickup).OwnerJumped();
}



defaultproperties
{
	bAutoActivate=False
	bActivatable=False
	bDisplayableInv=False
	PickupMessage=""
	ItemName=""
	PickupSound=None
	DeActivateSound=None
	bHidden=True
	RemoteRole=ROLE_SimulatedProxy
    bOnlyOwnerSee=True
    bCarriedItem=True
    NetPriority=1.400000
	bBlockActors=False
	bBlockPlayers=False
	bCollideWorld=False
	bCollideActors=False
	bProjTarget=False
    Physics=PHYS_None
    AmbientGlow=0
}