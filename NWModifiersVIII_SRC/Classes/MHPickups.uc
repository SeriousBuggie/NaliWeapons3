//////////////////////////////////////////////////////////////
//	Nali Weapons III Modifiers core
//				Feralidragon (21-03-2010)
//
// NW3 MODIFIERS BUILD 1.00
//////////////////////////////////////////////////////////////

class MHPickups expands Pickup
abstract;

#exec MESH IMPORT MESH=ModifSphere ANIVFILE=MODELS\ModifSphere_a.3d DATAFILE=MODELS\ModifSphere_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=ModifSphere STRENGTH=0
#exec MESH ORIGIN MESH=ModifSphere X=0 Y=0 Z=0 YAW=64

#exec MESH SEQUENCE MESH=ModifSphere SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSphere SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=ModifSphere MESH=ModifSphere
#exec MESHMAP SCALE MESHMAP=ModifSphere X=0.05 Y=0.05 Z=0.1

#exec AUDIO IMPORT NAME="MH_Pickup" FILE=SOUNDS\MH_Pickup.wav GROUP="Pickups"
#exec AUDIO IMPORT NAME="MHPickups_Amb" FILE=SOUNDS\MHPickups_Amb.wav GROUP="Pickups"
#exec AUDIO IMPORT NAME="MHPickClose" FILE=SOUNDS\MHPickClose.wav GROUP="Pickups"
#exec AUDIO IMPORT NAME="MHPickChargeUp" FILE=SOUNDS\MHPickChargeUp.wav GROUP="Pickups"


var() texture ModSymbolTex, SphereGlowTex, LightsOverlayer, BoltsTextures[3];
var() float MachineCloseRate, RessurectionTime, EnergyUpTime;
var ModifMachine MM;
var ModifOv MMOver;
var ModifGlow MGlow;
var ModifSymb MSymb;
var NRessurectFX ResFX;
var ModifSphere MSphere;
var ModifCharger MCharger;
var float LightTime;

//Team variables
//******************************
var byte PTeam;
var ControlPoint CPTeam;
var PlayerStart PSTeam;
var FortStandard FSTeam;
var byte bHaveFort;
//******************************

var() sound RessurectSound1, RessurectSound2;
var() sound CloseSnd, ChargeUpSnd;

var() texture ChargerOvLightTex;
var bool bInitModif;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();

	if (Role == ROLE_Authority)
	{
		if (!Class'NWInfo'.default.bPickupsDynLight)
			LightType = LT_None;
		if (Class'NWInfo'.default.enable_ModRessurectFX)
			ReSpawnTime = FMax(0.1, Class'NWInfo'.default.ModifiersRespawnTimeSec - 5/MachineCloseRate - RessurectionTime - EnergyUpTime);
		else
			ReSpawnTime = Class'NWInfo'.default.ModifiersRespawnTimeSec;
	}

	//LODBias = FMax(1.0, Class'NWInfo'.default.PickupsDistDetail * Class'NWInfo'.default.MaxLODBias/255);
	PTeam = Class'NWUtils'.static.IdentifyTeam(Level, Self, CPTeam, PSTeam, FSTeam, bHaveFort);
}

function ResetThisModif()
{
	AmbientSound = None;
	LightType = LT_None;
	DrawType = DT_None;
}

function SpawnModifMachine()
{
	MM = Spawn(Class'ModifMachine', Self);
	MM.bFixedRotationDir = bRotatingPickup;
	MM.RotationRate = RotationRate;
	
	MMOver = Spawn(Class'ModifOv', MM,, MM.Location, MM.Rotation);
	MMOver.MultiSkins[1] = LightsOverlayer;
}

function SpawnGlows(Actor ref)
{
	MGlow = Spawn(Class'ModifGlow', Self);
	MGlow.Texture = SphereGlowTex;
	
	MSymb = Spawn(Class'ModifSymb', ref,, ref.Location, ref.Rotation);
	MSymb.MultiSkins[1] = ModSymbolTex;
	
	if (ref != Self)
	{
		MSphere = Spawn(Class'ModifSphere', ref,, ref.Location, ref.Rotation);
		MSphere.Texture = Texture;
		MSphere.AmbientSound = AmbientSound;
		MSphere.SoundRadius = SoundRadius;
		MSphere.SoundVolume = SoundVolume;
		MSphere.SoundPitch = SoundPitch;
		MSphere.LightBrightness = LightBrightness;
		MSphere.LightHue = LightHue;
		MSphere.LightSaturation = LightSaturation;
		MSphere.LightRadius = LightRadius;
		MSphere.LightType = LightType;
		MSphere.bFixedRotationDir = bRotatingPickup;
		MSphere.RotationRate = RotationRate;
	}
}

function SpawnCharger()
{
local vector HitNormal, HitLocation;

	Trace (HitLocation, HitNormal, Location + vect(0,0,-2000), Location, False);
	
	if (Class'NWInfo'.default.bModifChargers && Level.Game.ShouldRespawn(self))
	{
		Trace (HitLocation, HitNormal, Location + vect(0,0,-2000), Location, False);
		MCharger = Spawn(Class'ModifCharger',,, HitLocation, rotator(HitNormal));
		MCharger.SetOverlayering( ChargerOvLightTex);
	}
	
	SetLocation(HitLocation + 40 * HitNormal);
	if (Abs(Normalize(Rotation).Pitch) < 15000 && Abs(Normalize(Rotation).Roll) < 15000)
		SetRotation(rot(0,0,0));
}


function PlayPickupMessage(Pawn Other)
{
    Other.ReceiveLocalizedMessage( class'PickupMessagePlus', 0, None, None, Self.Class );
}

simulated function float PlayClosing()
{
	ResFX = None;
	
	PlayExtraSound(True);
	
	if (MM != None)
		MM.PlayAnim('Close', MachineCloseRate, 0.0);
	
	if (MMOver != None)
	{
		MMOver.bHidden = False;
		MMOver.FadeInCount = 5/MachineCloseRate;
	}
	
	return (5/MachineCloseRate);
}

function PlayExtraSound(bool bClose)
{
	if (bClose)
		PlaySound( CloseSnd);
	else
		PlaySound( ChargeUpSnd);
}

function PlayResSound(bool bBirth)
{
	if (bBirth)
		PlaySound( RessurectSound1);
	else
		PlaySound( RessurectSound2);
}

simulated function float PlayEnergyUp()
{
local ModifBolt mb;
local byte i;

	LightTime = EnergyUpTime;
	PlayExtraSound(False);
	
	if (MM != None)
	{
		for (i = 0; i < 4; i++)
		{
			mb = Spawn(Class'ModifBolt', MM,, MM.Location, MM.Rotation);
			mb.SetBoltMesh(i, False);
			mb.MultiSkins[1] = BoltsTextures[Rand(3)];
			
			mb = Spawn(Class'ModifBolt', MM,, MM.Location, MM.Rotation);
			mb.SetBoltMesh(i, True);
			mb.MultiSkins[1] = BoltsTextures[Rand(3)];
		}
	}
	
	return EnergyUpTime;
}

simulated function float PlayRessurection()
{
	if (MM != None)
	{
		ResFX = Spawn(Class'NRessurectFX', MM,, MM.Location, MM.Rotation);
		ResFX.Mesh = MM.Mesh;
		if (Level.NetMode != NM_DedicatedServer)
			ResFX.LODBias = MM.LODBias;
		ResFX.DrawScale = MM.DrawScale;
		ResFX.SetLifeTime(RessurectionTime);
		ResFX.LifeCount = RessurectionTime;
		ResFX.StartFraming(RessurectionTime/3*2);
		Class'NWUtils'.static.InitializeRes(ResFX, Self, Level, Class'NWInfo'.default.enable_ModResTeamBasedColor, 
			Class'NWInfo'.default.ModResFXColor, PTeam, CPTeam, PSTeam, FSTeam, bHaveFort);
		
		MM.bHidden = False;
		MM.ScaleGlow = 0.0;
		MM.bMeshEnviroMap = True;
		MM.Texture = ResFX.InvisTex;
		MM.Style = STY_Masked;
	}
	
	PlayResSound(True);
	return RessurectionTime/3*2;
}

simulated function Tick(float Delta)
{
	if (Class'NWInfo'.default.enableSmartPerformancePickup && Level.NetMode != NM_DedicatedServer)
		LODBias = Class'NWUtils'.static.getFrameRateBasedLODBias(Level, Delta, LODBias);
		
	if (Role == ROLE_Authority && !bInitModif)
	{
		bInitModif = True;
		if (Physics != PHYS_Falling && RespawnTime > 0.0 && !bHeldItem)
		{
			SpawnCharger();
			SpawnModifMachine();
			SpawnGlows(MM);
			ResetThisModif();
		}
		else
			SpawnGlows(Self);
	}
		
	if (LightTime > 0)
	{
		LightTime -= Delta;
		if (MSphere != None)
		{
			MSphere.LightBrightness = Byte((EnergyUpTime - LightTime) * default.LightBrightness / EnergyUpTime);
			MSphere.ScaleGlow = (EnergyUpTime - LightTime) * default.ScaleGlow / EnergyUpTime;
			MSphere.DrawScale = (EnergyUpTime - LightTime) * default.DrawScale / EnergyUpTime;
		}
		
		if (MGlow != None)
			MGlow.DrawScale = (EnergyUpTime - LightTime) * MGlow.default.DrawScale / EnergyUpTime;
		
		if (MSymb != None && LightTime <= EnergyUpTime/2)
			MSymb.ScaleGlow = (EnergyUpTime/2 - LightTime) * MSymb.default.ScaleGlow / (EnergyUpTime/2);
			
		if (MSymb.bHidden && LightTime <= EnergyUpTime/2)
			MSymb.bHidden = False;
		
		if (bHidden)
		{
			bHidden = False;
			if (MGlow != None)
				MGlow.bHidden = False;
			if (MSphere != None)
				MSphere.bHidden = False;
		}
	}
}

simulated function Destroyed()
{
	if (MM != None)
		MM.Destroy();
	if (MMOver != None)
		MMOver.Destroy();
	if (MGlow != None)
		MGlow.Destroy();
	if (MSymb != None)
		MSymb.Destroy();
	if (ResFX != None)
		ResFX.Destroy();
	if (MSphere != None)
		MSphere.Destroy();
	if (MCharger != None)
		MCharger.Destroy();
		
	MM = None;
	MMOver = None;
	MGlow = None;
	MSymb = None;
	ResFX = None;
	MSphere = None;
	MCharger = None;
	
	Super.Destroyed();
}

simulated function goOpenned()
{
	if (MM != None)
		MM.TweenAnim('Openned', 0.1);
}

function SpawnRegularEffects()
{
	if (MSymb != None)
		MSymb.bHidden = False;
	
	if (MSphere != None)
	{
		MSphere.LightBrightness = default.LightBrightness;
		MSphere.bHidden = False;
	}
	
	if (MMOver != None)
		MMOver.bHidden = False;
	if (MGlow != None)
		MGlow.bHidden = False;
		
	MM.bHidden = False;
}

event float BotDesireability(Pawn Bot)
{
local NaliWeapons NWeap;
local byte PowerCount;
	
	if (Bot != None)
	{
		if (NaliWeapons(Bot.Weapon) != None && !NaliWeapons(Bot.Weapon).bMegaWeapon)
		{
			NWeap = NaliWeapons(Bot.Weapon);
			if (NWeap.bInfinity)
				PowerCount++;
			if (NWeap.KickBack > 0)
				PowerCount++;
			if (NWeap.HealthGiver)
				PowerCount++;
			if (NWeap.Splasher > 0)
				PowerCount++;
			if (NWeap.FireRateChange > 1)
				PowerCount++;
			if (NWeap.MoreDamage > 0)
				PowerCount++;
			
			if ((NWeap.bTheOne && PowerCount > 2) || (!NWeap.bTheOne && PowerCount > 0))
				return -1;
			else
				return MaxDesireability;
		}
		else
			return -1;
	}
	
	return -1;
}

state Sleeping
{
    ignores Touch;

    function BeginState()
    {
        BecomePickup();
		
		if (MM != None)
			MM.bHidden = True;
		if (MMOver != None)
			MMOver.bHidden = True;
		if (MGlow != None)
			MGlow.bHidden = True;
		if (MSymb != None)
			MSymb.bHidden = True;
		if (MSphere != None)
		{
			MSphere.LightBrightness = 0;
			MSphere.bHidden = True;
		}
		
		if (MCharger != None)
			MCharger.SetRespawn(ReSpawnTime);
		
        bHidden = true;
		
		if (MSphere != None)
			MSphere.SoundVolume = 0;
    }
	
    function EndState()
    {
        local int i;

		LightTime = 0;
        bSleepTouch = false;
		if (MSphere != None)
			MSphere.SoundVolume = default.SoundVolume;
        for ( i=0; i<4; i++ )
            if ( (Touching[i] != None) && Touching[i].IsA('Pawn') )
                bSleepTouch = true;
    }
	
Begin:
	if (Class'NWInfo'.default.enable_ModRessurectFX)
	{
		goOpenned();
		Sleep( ReSpawnTime );
		Sleep( PlayRessurection());
		PlayResSound(False);
		Sleep( RessurectionTime/3);
		Sleep( PlayClosing() );
		Sleep( PlayEnergyUp() );
	}
	else
	{
		Sleep( ReSpawnTime );
		PlaySound( RespawnSound ); 
		SpawnRegularEffects();
		Sleep( Level.Game.PlaySpawnEffect(Self));
	}
	
    GoToState( 'Pickup' );
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=ModifSphere
	PickupViewMesh=ModifSphere
	Style=STY_Translucent
	PickupSound=MH_Pickup
	bCollideActors=True
	bMeshEnviroMap=True
	ScaleGlow=1.800000
	bUnlit=True
	bRotatingPickup=True
	MaxDesireability=0.750000
	RespawnTime=30.000000
	RemoteRole=ROLE_DumbProxy
	CollisionRadius=8.000000
	CollisionHeight=8.000000
	SoundVolume=185
	SoundRadius=40
	AmbientSound=MHPickups_Amb
	MachineCloseRate=3.000000
	EnergyUpTime=2.000000
	RessurectionTime=3.000000
	LODBias=8.000000
	
	RessurectSound1=RessurectSnd
	RessurectSound2=RessurectFinSnd
	CloseSnd=MHPickClose
	ChargeUpSnd=MHPickChargeUp
}
