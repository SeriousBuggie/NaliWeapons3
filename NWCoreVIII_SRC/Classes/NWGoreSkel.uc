//////////////////////////////////////////////////////////////
//				Feralidragon (24-02-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWGoreSkel expands NWBodyPiece;

#exec MESH IMPORT MESH=GoreSkel ANIVFILE=MODELS\GoreSkel_a.3d DATAFILE=MODELS\GoreSkel_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GoreSkel STRENGTH=0.75
#exec MESH ORIGIN MESH=GoreSkel X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GoreSkel SEQ=All STARTFRAME=0 NUMFRAMES=26
#exec MESH SEQUENCE MESH=GoreSkel SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkel SEQ=StillAlt STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkel SEQ=Fall STARTFRAME=0 NUMFRAMES=26 RATE=25.0

#exec MESHMAP NEW MESHMAP=GoreSkel MESH=GoreSkel
#exec MESHMAP SCALE MESHMAP=GoreSkel X=0.08 Y=0.08 Z=0.16


var() float SmkRate, SmkTime;
var float SmkCount, SmkCountTotal;

simulated function SetGoreType(class<NWGoreCBoard> newGoreBoardClass)
{
	Super.SetGoreType(newGoreBoardClass);
	if (newGoreBoardClass != None)
	{
		MultiSkins[1] = newGoreBoardClass.static.GetBoneTexture();
		MultiSkins[2] = newGoreBoardClass.static.GetBoneTexture();
		MultiSkins[3] = newGoreBoardClass.static.GetBoneTexture();
	}
}

simulated function SetWall(vector HitNormal, optional Actor Wall, optional float Delta)
{
	Super.SetWall(HitNormal, Wall, Delta);
	if ((-HitNormal dot Normal(Region.Zone.ZoneGravity)) > WallHitStopCoef)
	{
		bCollideWorld = False;
		TweenAnim('StillAlt', 0.45);
		
	}
}

simulated function AnimEnd()
{
	if (AnimSequence == 'StillAlt')
		PlayAnim('Fall', 1.0);
}

simulated function Tick(float Delta)
{
local NWGoreSkelSmk nwSmkFX, nwSmkFXMaster;

	if (SmkCountTotal < SmkTime && SmkRate > 0.0)
	{
		SmkCount += Delta;
		SmkCountTotal += Delta;
		if (SmkCount >= 1/SmkRate)
		{
			nwSmkFXMaster = Spawn(Class'NWGoreSkelSmkMaster');
			nwSmkFXMaster.AnimSequence = AnimSequence;
			nwSmkFXMaster.AnimFrame = AnimFrame;
			nwSmkFX = Spawn(Class'NWGoreSkelSmk', nwSmkFXMaster);
			nwSmkFX.DrawScale = DrawScale / 4;
			nwSmkFX.PrePivot = Normal(Region.Zone.ZoneVelocity) * 2.5;
			SmkCount = 0.0;
		}
	}
	Super.Tick(Delta);
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=GoreSkel
	MultiSkins(1)=BoneSk
	MultiSkins(2)=BoneSk
	MultiSkins(3)=BoneSk
	DrawScale=1.250000
	CollisionHeight=51.000000
	AnimSequence=Still
	
	MinLifeSpan=15.000000
	MaxLifeSpan=35.000000
	bBloodTrail=False
	bBloodBurst=False

	bSticky=False
	bStickToFloor=False
	bSpawnDecal=False
	bSpawnSlideDecal=False

	WallHitDumping=0.000000
	WallHitSoundOdds=0.000000
	WallHitSounds(0)=None
	WallHitSounds(1)=None
	WallHitSounds(2)=None
	WallHitSounds(3)=None
	
	bRelOffset=True
	bRelOffsetFromVictim=True
	RelOffset=(Z=0.000000)
	bDirectionalPart=True
	bCannotMultiplyScale=True
	bCannotMultiplyAmount=True
	FixedNumberOfParts=1
	VelMultiplier=(X=0.000000,Y=0.000000,Z=0.000000)
	bTraceFloorOnSpawn=True
	
	SmkRate=5.000000
	SmkTime=5.500000
	bWaterFX=False
}
