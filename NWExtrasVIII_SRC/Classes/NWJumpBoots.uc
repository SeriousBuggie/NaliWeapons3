//////////////////////////////////////////////////////////////
//				Feralidragon (21-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWJumpBoots expands NaliPickups config(NWExtrasCfg);

#exec TEXTURE IMPORT NAME=NWJumpBoots_Sk FILE=SKINS\NWJumpBoots_Sk.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="NWJumpBootsPickup" FILE=SOUNDS\NWJumpBootsPickup.wav GROUP="NWJumpBoots"
#exec AUDIO IMPORT NAME="NWJumpBootsJump" FILE=SOUNDS\NWJumpBootsJump.wav GROUP="NWJumpBoots"

var() sound JumpSnd;
var() float JumpMult;

var(ServerConfig) config int Jumps, MaxJumps;
var(ServerConfig) config float JumpMultiplier;

function PreBeginPlay()
{
	Charge = default.Jumps;
	default.Charge = default.Jumps;
	Class.default.Charge = default.Jumps;
	
	MaxCharge = default.MaxJumps;
	default.MaxCharge = default.MaxJumps;
	Class.default.MaxCharge = default.MaxJumps;
	
	JumpMult = default.JumpMultiplier;
	default.JumpMult = default.JumpMultiplier;
	Class.default.JumpMult = default.JumpMultiplier;
	
	Super.PreBeginPlay();
}


function PostPickupInit()
{
	SetTimer(0.1, True);
	if (Pawn(Owner) != None)
	{
		Pawn(Owner).bCountJumps = True;
		Pawn(Owner).AirControl = 1.0;
		Pawn(Owner).JumpZ = Pawn(Owner).Default.JumpZ * JumpMult;
	}
}

function OwnerJumped()
{
	if (Pawn(Owner) != None && !Pawn(Owner).bIsWalking)
	{
		if (Charge <= 0 && PickupExpired())
			Destroy();
		else
			Owner.PlaySound(JumpSnd);   
		Charge--;
		ChargeDecreaseEvent();
	}
	
	if(Inventory != None)
		Inventory.OwnerJumped();
}

function bool PickupExpired()
{
	Super.PickupExpired();
	if (Pawn(Owner) != None)
	{
		Pawn(Owner).JumpZ = Pawn(Owner).default.JumpZ * Level.Game.PlayerJumpZScaling();
		if (DeathMatchPlus(Level.Game) != None)
			Pawn(Owner).AirControl = DeathMatchPlus(Level.Game).AirControl;
		else
			Pawn(Owner).AirControl = Pawn(Owner).default.AirControl;
		Pawn(Owner).bCountJumps = False;
	}
	return True;
}

function Timer()
{
	if (Charge <= 0 && (Owner == None || Owner.Physics != PHYS_Falling) && PickupExpired()) 
		Destroy();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=LodMesh'Botpack.jboot'
	CollisionRadius=22.000000
	CollisionHeight=14.000000
	MultiSkins(1)=NWJumpBoots_Sk
	AmbientGlow=64
	
	LightHue=85
	LightSaturation=192
	LightBrightness=192
	LightRadius=3
	LightType=LT_Steady
	LightEffect=LE_NonIncidence
	
	PickupPriority=10
	bForceRotatingPickupOnReplace=False
	PlacementZOffset=0.000000
	ChargerScale=0.500000
	
	ExpireMessage="The Jump Boots have drained"
	PickupMessage="You picked up the Jump Boots"
	ItemName="Jump Boots"
	RespawnTime=30.000000
	PickupViewMesh=LodMesh'Botpack.jboot'
	MaxDesireability=0.500000
	PickupSound=NWJumpBootsPickup
	JumpSnd=NWJumpBootsJump
	JumpMult=3.000000
	
	bRotatingPickup=False
	PickupType=PCK_Other
	Charge=3
	MaxCharge=9
	bBoots=True
	bCumulativeCharge=True
	
	PickupFXClasses(0)=Class'NWJumpBootsFog'
	
	Jumps=3
	MaxJumps=9
	JumpMultiplier=3.000000
}
