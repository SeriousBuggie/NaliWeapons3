//////////////////////////////////////////////////////////////
//				Feralidragon (29-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltWaterShock expands NaliZPEffects;

#exec MESH IMPORT MESH=BoltWaterShock ANIVFILE=MODELS\BoltWaterShock_a.3d DATAFILE=MODELS\BoltWaterShock_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=BoltWaterShock X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltWaterShock SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltWaterShock SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=BoltWaterShock MESH=BoltWaterShock
#exec MESHMAP SCALE MESHMAP=BoltWaterShock X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=WaterShock FILE=CORONAS\WaterShock.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=BoltWaterShock NUM=1 TEXTURE=WaterShock

#exec OBJ LOAD FILE=..\Sounds\AmbOutside.uax

var int Kickback;
var float Splasher, MoreDamage;
var bool HealthGiver;
var bool bSpawnedExtraFX;


simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	SetTimer(0.1, False);
}

simulated function Tick( float DeltaTime)
{
	Super.Tick(DeltaTime);
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (!bSpawnedExtraFX)
		{
			if (Level.NetMode == NM_StandAlone || !isZPDiscarded())
			{
				ClientFlashes(1024*FMax(1.0,Splasher));
				Spawn(Class'WaterBoltLight');
			}
			bSpawnedExtraFX = True;
		}
	
		DrawScale = (Default.LifeSpan - LifeSpan) * Default.DrawScale / Default.LifeSpan;
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
	}
}

simulated function MakeSound()
{
	PlaySound(Sound'AmbOutside.OneShot.lightn12', SLOT_Interface, 255.0, True, 50000.0);
	PlaySound(Sound'AmbOutside.OneShot.lightn12', SLOT_None, 255.0, True, 50000.0);
	PlaySound(Sound'AmbOutside.OneShot.lightn12', SLOT_Misc, 255.0, True, 50000.0);
	PlaySound(Sound'AmbOutside.OneShot.lightn12', SLOT_Talk, 255.0, True, 50000.0);
}

function Timer()
{
local float eRadius;
local int eDamage;
	
	eRadius = 420;
	if (Class'BoltRifle'.default.WaterElectrocutionRadius > 0)
		eRadius = Class'BoltRifle'.default.WaterElectrocutionRadius;
		
	eDamage = 800;
	if (Class'BoltRifle'.default.WaterElectrocutionDamage > 0)
		eDamage = Class'BoltRifle'.default.WaterElectrocutionDamage;

	ElectrocutePawns(eRadius*FMax(1.0,Splasher), eDamage*FMax(1.0,MoreDamage), 70000*FMax(1.0,Kickback));
}

function ElectrocutePawns(float Radius, float Damage, float Momentum)
{
local Pawn P;
local bool bWetFoot, bWet, bWetHead, bSameZone;
local float dmgScale;
local name dmgType;
local vector dir, hitLoc;

	P = Level.PawnList;
	while (P != None)
	{
		bSameZone = (P.FootRegion.Zone == Region.Zone) || (P.Region.Zone == Region.Zone) || (P.HeadRegion.Zone == Region.Zone);
		dmgType = 'Electrified';
		
		if (bSameZone && VSize(Location - P.Location) <= Radius)
		{
			bWetFoot = P.FootRegion.Zone.bWaterZone;
			bWet = P.Region.Zone.bWaterZone;
			bWetHead = P.HeadRegion.Zone.bWaterZone;
		
			if (bWetHead && !bWet && !bWetFoot)
			{
				dmgType = 'Decapitated';
				hitLoc = P.Location + P.CollisionHeight*vect(0,0,0.65);
			}
			else if (!bWetHead && !bWet && bWetFoot)
				hitLoc = P.Location + P.CollisionHeight*vect(0,0,-0.15);
			else
				hitLoc = P.Location;
			
			dmgScale = 1 - (VSize(Location - P.Location) / Radius);
			dir = Normal(P.Location - Location);
			
			if (!HealthGiver || Class'NWUtils'.static.processFiredHealth(0, P, Instigator, True))
				P.TakeDamage(dmgScale*Damage, Instigator, hitLoc, (dmgScale*Momentum*dir), dmgType);
			
			if (!bWetHead && !bWet && bWetFoot)
				Spawn(Class'EMPFlamesCarcasses',,, P.Location);
		}
		
		P = P.nextPawn;
	}
}

simulated function ClientFlashes( float Radius)
{
local Vector EndFlashFog;
local bool bSameZone;
local PlayerPawn PP;
local Pawn P;
local float fogScale;


	//Out of water
	EndFlashFog.X=0; EndFlashFog.Y=0.8; EndFlashFog.Z=0.8;
	
	ForEach VisibleCollidingActors( class'PlayerPawn', PP, 600)
	{
		bSameZone = (PP.FootRegion.Zone == Region.Zone) || (PP.Region.Zone == Region.Zone) || (PP.HeadRegion.Zone == Region.Zone);
		fogScale = 1 - (VSize(Location - PP.Location) / Radius);
		
		if (!bSameZone)
			PP.ClientFlash( 2, 1000*EndFlashFog*fogScale);
	}
	
	
	//In the water
	EndFlashFog.X=0; EndFlashFog.Y=3; EndFlashFog.Z=3;
	
	P = Level.PawnList;
	while (P != None)
	{
		PP = PlayerPawn(P);
		
		if (PP != None)
		{
			bSameZone = (PP.FootRegion.Zone == Region.Zone) || (PP.Region.Zone == Region.Zone) || (PP.HeadRegion.Zone == Region.Zone);
			fogScale = 1 - (VSize(Location - PP.Location) / Radius);
			
			if (bSameZone)
				PP.ClientFlash( 2, 1000*EndFlashFog*fogScale);
		}
		
		P = P.nextPawn;
	}
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=BoltWaterShock
	Style=STY_Translucent
	ScaleGlow=5.000000
	LifeSpan=0.500000
	DrawScale=8.500000
	RemoteRole=ROLE_SimulatedProxy
	bUnlit=True
	MultiSkins(1)=WaterShock
	bNetTemporary=False
	
	enableMakeSound=True
}
