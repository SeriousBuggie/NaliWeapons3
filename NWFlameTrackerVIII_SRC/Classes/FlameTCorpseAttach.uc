//////////////////////////////////////////////////////////////
//				Feralidragon (18-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTCorpseAttach expands NaliWEffects;

var bool bDamage;
var FlameTStaticReplic StaticReplic;
var byte savedTeam;
var string ownerName;

//Modifiers
var float MoreDamage;
var bool HealthGiver;


function BeginPlay()
{	
	if (Instigator != None && Instigator.PlayerReplicationInfo != None)
	{
		ownerName = Instigator.PlayerReplicationInfo.PlayerName;
		savedTeam = Instigator.PlayerReplicationInfo.Team;
	}
}

simulated function PostBeginPlay()
{
	SetTimer(0.1, False);
}

simulated function Timer()
{
local ZoneInfo OwnZone;

	if (Owner != None && (!Owner.bHidden || Owner.IsA('Vehicle')) && Owner.Mesh != None && Owner.DrawScale > 0)
	{
		OwnZone = Owner.Region.Zone;
		if (OwnZone.bWaterZone && !OwnZone.IsA('LavaZone') && OwnZone.DamageType != 'Burned')
		{
			MakeSound();
			Destroy();
			return;
		}
		
		if (Owner.bStatic || Owner.bNoDelete)
			SetTimer(0.025, False);
		else if ((FMax(Owner.CollisionRadius, Owner.CollisionHeight) / Owner.DrawScale) < 42.5)
			SetTimer(0.1, False);
		else if ((FMax(Owner.CollisionRadius, Owner.CollisionHeight) / Owner.DrawScale) < 80.0)
		{
			SoundRadius = Default.SoundRadius * 2;
			SoundVolume = Default.SoundVolume * 2;
			SetTimer(0.15, False);
		}
		else
		{
			SetTimer(0.1, False);
			SoundRadius = Default.SoundRadius * 3;
			SoundVolume = Default.SoundVolume * 3;
		}
		
		if (Level.NetMode != NM_DedicatedServer)
			SpawnFlames();
		BurnIn();
	}
}

simulated function SpawnFlames()
{
local FlameTCorpseFlames ftcf;
local vector FlameLocOffset;
local actor FlamesOwnership;

	if (Level.NetMode != NM_DedicatedServer && Owner != None && (!Owner.bHidden || Owner.IsA('Vehicle')) && Owner.Mesh != None && Owner.DrawScale > 0)
	{
		if (Owner.bStatic)
		{
			if (StaticReplic == None)
			{
				StaticReplic = Spawn(Class'FlameTStaticReplic',,, Owner.Location, Owner.Rotation);
				StaticReplic.SetOwnershipProperties(Owner);
			}
			FlamesOwnership = StaticReplic;
		}
		else
			FlamesOwnership = Owner;
			
		FlameLocOffset.X = (2*FRand()-1) * Owner.DrawScale;
		FlameLocOffset.Y = (2*FRand()-1) * Owner.DrawScale;
		
		if ((FMax(Owner.CollisionRadius, Owner.CollisionHeight) / Owner.DrawScale) < 42.5)
		{
			FlameLocOffset *= 10;
			ftcf = Spawn(Class'FlameTCorpseFlamesQuarter', FlamesOwnership,, FlamesOwnership.Location + FlamesOwnership.PrePivot + FlameLocOffset, FlamesOwnership.Rotation);
			ftcf.Velocity = Owner.DrawScale * vect(0,0,165);
		}
		else if ((FMax(Owner.CollisionRadius, Owner.CollisionHeight) / Owner.DrawScale) < 80.0)
		{
			FlameLocOffset *= 20;
			ftcf = Spawn(Class'FlameTCorpseFlamesHalf', FlamesOwnership,, FlamesOwnership.Location + FlamesOwnership.PrePivot + FlameLocOffset, FlamesOwnership.Rotation);
			ftcf.Velocity = Owner.DrawScale * vect(0,0,200);
		}
		else
		{
			FlameLocOffset *= 30;
			ftcf = Spawn(Class'FlameTCorpseFlames', FlamesOwnership,, FlamesOwnership.Location + FlamesOwnership.PrePivot + FlameLocOffset, FlamesOwnership.Rotation);
			ftcf.Velocity = Owner.DrawScale * vect(0,0,300);
		}
		
		if (ftcf != None)
		{
			ftcf.DrawScale = FlamesOwnership.DrawScale;
			ftcf.Mesh = FlamesOwnership.Mesh;
			
			if (Owner.bStatic || Owner.bNoDelete)
				ftcf.Velocity *= 1.35;
		}
	}
}

function MakeSound()
{
	if (Owner != None)
		PlaySound(Sound'FlamesEnd',, Owner.DrawScale * 65.0,, Owner.DrawScale * 400);
	else
		PlaySound(Sound'FlamesEnd');
}

function BurnIn()
{
local Pawn P;
local bool isF;

	bDamage = !bDamage;
	if (Owner != None && bDamage)
	{
		P = Pawn(Owner);
		isF = Class'NWUtils'.static.isFriend(P, Level, Instigator, savedTeam, True,, ownerName, Self);
		if ((HealthGiver && (isF || P == Instigator) && 
		Class'NWUtils'.static.processFiredHealth(Class'FlameTracker'.default.BodyFlamesDamage * FMax(1.0, MoreDamage), P, Instigator)) || isF)
			return;
		Owner.TakeDamage(Class'FlameTracker'.default.BodyFlamesDamage * FMax(1.0, MoreDamage), Instigator, Owner.Location, vect(0,0,0), 'Burned');
	}
}


simulated function Tick(float Delta)
{
	if (Owner != None)
	{
		if ((Owner.bHidden && !Owner.IsA('Vehicle')) || (Pawn(Owner) != None && Pawn(Owner).Health <= 0))
		{
			Owner.bShadowCast = False;
			Destroy();
		}
		else if (!Owner.bIsPawn && !Owner.IsA('Vehicle'))
		{
			if (Owner.bUnlit)
				Owner.ScaleGlow = LifeSpan * Owner.Default.ScaleGlow / Default.LifeSpan + 0.025;
			else
				Owner.ScaleGlow = LifeSpan * Owner.Default.ScaleGlow / Default.LifeSpan + 0.1;
		}
	}
}

simulated function Destroyed()
{
	if (Owner != None && (Owner.bIsPawn || Owner.IsA('Vehicle')))
		Owner.bShadowCast = False;
	
	if (StaticReplic != None)
		StaticReplic.Destroy();
	StaticReplic = None;
	
	Super.Destroyed();
}

defaultproperties
{
	Style=STY_Translucent
	Texture=TranslucInvis
	DrawType=DT_Sprite
	DrawScale=0.100000
	bNetTemporary=False
	
	Physics=PHYS_Trailer
	LifeSpan=5.000000
	
	AmbientSound=AmbFleshFlames
	SoundRadius=64
	SoundVolume=72
	
	LightType=LT_Steady
    LightEffect=LE_NonIncidence
    LightBrightness=50
    LightHue=0
    LightSaturation=0
    LightRadius=7
}
