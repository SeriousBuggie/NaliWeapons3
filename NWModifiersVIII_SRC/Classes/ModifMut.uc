//////////////////////////////////////////////////////////////
//	Nali Weapons III Modifiers mutator class
//				Feralidragon (15-10-2012)
//
// NW3 MODIFIERS BUILD 1.00
//////////////////////////////////////////////////////////////

class ModifMut expands Mutator config(NWExtrasCfg);

var() config float PlayerSpawnsModifiersDensity;
var() config float LevelModifiersDensity;
var() config bool bUniqueSequence;

var() class<MHPickups> ModifierClasses[6];
var() float SpawnHeight;
var bool bSpawnModifOnNext;
var byte SeqModifIndexes[6], SeqModifPointer;


function BeginPlay()
{
local PlayerStart PS;
local PathNode PN;
local byte i, j, c, n[6];

	PlayerSpawnsModifiersDensity = FClamp(PlayerSpawnsModifiersDensity, 0.0, 1.0);
	LevelModifiersDensity = FClamp(LevelModifiersDensity, 0.0, 1.0);
	
	if (bUniqueSequence)
	{
		for (i = 0; i < ArrayCount(n); i++)
			n[i] = i;
		for (i = 0; i < ArrayCount(SeqModifIndexes); i++)
		{
			c = Rand(ArrayCount(n)-i);
			SeqModifIndexes[i] = n[c];
			for (j = c; j < (ArrayCount(n)-i-1); j++)
				n[j] = n[j+1];
		}
	}

	bSpawnModifOnNext = False;
	if (PlayerSpawnsModifiersDensity > 0.0)
	{
		ForEach AllActors(Class'PlayerStart', PS)
		{
			if (bSpawnModifOnNext || FRand() < PlayerSpawnsModifiersDensity)
				SpawnModifier(PS.Location);
		}
	}
	
	bSpawnModifOnNext = False;
	if (LevelModifiersDensity > 0.0)
	{
		ForEach AllActors(Class'PathNode', PN)
		{
			if (bSpawnModifOnNext || FRand() < LevelModifiersDensity)
				SpawnModifier(PN.Location);
		}
	}
}

function SpawnModifier(vector Loc)
{
local vector HitLoc, HitNorm;
local byte modifSelect;

	if (Trace(HitLoc, HitNorm, Loc - vect(0,0,3)*SpawnHeight, Loc, False) != None && HitNorm.Z > 0.35)
	{
		if (bUniqueSequence)
		{
			modifSelect = SeqModifIndexes[SeqModifPointer++];
			if (SeqModifPointer >= ArrayCount(SeqModifIndexes))
				SeqModifPointer = 0;
		}
		else
			modifSelect = Rand(ArrayCount(ModifierClasses));
		
		Spawn(ModifierClasses[modifSelect],,, HitLoc + HitNorm*SpawnHeight, Rand(16384)*4*rot(0,1,0));
		bSpawnModifOnNext = False;
	}
	else
		bSpawnModifOnNext = True;
}


defaultproperties
{
	SpawnHeight=40.000000
	ModifierClasses(0)=Class'DamageN'
	ModifierClasses(1)=Class'Fast'
	ModifierClasses(2)=Class'HealthN'
	ModifierClasses(3)=Class'Infinity'
	ModifierClasses(4)=Class'Kick'
	ModifierClasses(5)=Class'Splasher'
	
	PlayerSpawnsModifiersDensity=0.350000
	LevelModifiersDensity=0.100000
	bUniqueSequence=True
}