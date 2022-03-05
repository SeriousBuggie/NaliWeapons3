//////////////////////////////////////////////////////////////
//	Nali Weapons III Shockwave Sphere (mapping -->)
//				Feralidragon (15-06-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class ShockSphere expands NaliWEffects;

#exec MESH IMPORT MESH=ShockSphere ANIVFILE=MODELS\ShockSphere_a.3d DATAFILE=MODELS\ShockSphere_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=ShockSphere STRENGTH=0.4
#exec MESH ORIGIN MESH=ShockSphere X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=ShockSphere SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ShockSphere SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=ShockSphere MESH=ShockSphere
#exec MESHMAP SCALE MESHMAP=ShockSphere X=0.4 Y=0.4 Z=0.8

const ShkMeshSize = 128.0;

var() float MinScale, MaxScale;		//Final scale is (DrawScale + MaxScaleInc)
var() bool bGrowing;			//Growing shock?
var() bool bFadeOut;			//Should fade out?

var(Damage) bool bDamage;		//Should this shock do any damage
var(Damage) int Damage;			//Damage instigated
var(Damage) bool bRangedDamage;		//Be damage taken relative to distance, but it only works if bFadeOut is True
var(Damage) name MyDamageType;
var(Damage) int Momentum;

var(SoundEffect) sound ShockSound;
var(SoundEffect) int ShockSVolume;
var(SoundEffect) int ShockSRange;


//internals
var float Count;
var int Kickback;
var float Splasher, MoreDamage;
var byte savedTeam;
var string ownerName;


function MakeSound()
{
	PlaySound(ShockSound,,ShockSVolume,,ShockSRange);
}

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
	if (ShockSound!=None)
		MakeSound();

	if (bGrowing)
		DrawScale = MinScale;
	else
		DrawScale = MaxScale;
	
	RunShockStart();
}


simulated function Destroyed()
{
	RunShockEnd();
	Super.Destroyed();
}


function RunShockEnd();		//End of life code
function RunShockStart();		//Start of life code
function RunShockProcess(float Delta);		//Running code


simulated function Tick( float DeltaTime)
{
	if (bGrowing)
		DrawScale = MinScale + ((MaxScale - MinScale) * (Default.LifeSpan - LifeSpan) / Default.LifeSpan);
	else
		DrawScale = MinScale + ((MaxScale - MinScale) * LifeSpan / Default.LifeSpan);

	if (bFadeOut)
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
	else
		ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / Default.LifeSpan;
	
	if (Role == ROLE_Authority)
	{
		Count += DeltaTime;
		if (Count >= 0.1)
		{
			Count = 0;
			if (bDamage)
				GiveDamage();
		}
	}
	
	RunShockProcess(DeltaTime);
}


function GiveDamage()
{
local Pawn P;
local Actor A;
local vector dir;
local int tempKick;

	ForEach VisibleCollidingActors(Class'Actor', A, DrawScale * ShkMeshSize * FMax(1.0, Splasher))
	{
		dir = Normal(A.Location - Location);
		if (isAllowedToKick(Instigator, Pawn(A)))
			tempKick = KickBack;
		else
			tempKick = 0;

		if (bRangedDamage)
			A.TakeDamage(Damage * FMax(1.0,MoreDamage) * (ScaleGlow/Default.ScaleGlow),  Instigator, A.Location - 0.5 * (A.CollisionHeight + A.CollisionRadius) * dir, dir * Momentum * FMax(1.0, tempKick) * (ScaleGlow/Default.ScaleGlow), MyDamageType);
		else
			A.TakeDamage(Damage * FMax(1.0,MoreDamage),  Instigator, A.Location - 0.5 * (A.CollisionHeight + A.CollisionRadius) * dir, dir * Momentum * FMax(1.0, tempKick), MyDamageType);
	}
}

function bool isAllowedToKick( Pawn Inst, Pawn P)
{
	return Class'NWUtils'.static.isAllowedToKick(Inst, P, Level, Kickback, savedTeam, ownerName, Self);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=ShockSphere
	bUnlit=True
	ScaleGlow=0.800000
	Style=STY_Translucent
	LifeSpan=5.000000
	bNetTemporary=False
}
