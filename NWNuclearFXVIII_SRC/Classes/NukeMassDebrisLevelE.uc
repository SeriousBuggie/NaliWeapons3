//////////////////////////////////////////////////////////////
//				Feralidragon (08-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeMassDebrisLevelE expands NWWallFrag;

#exec MESH IMPORT MESH=NukeMassDebrisE01 ANIVFILE=MODELS\NukeMassDebrisE01_a.3d DATAFILE=MODELS\NukeMassDebrisE01_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NukeMassDebrisE01 STRENGTH=0.1
#exec MESH ORIGIN MESH=NukeMassDebrisE01 X=0 Y=0 Z=0 PITCH=-64
#exec MESH SEQUENCE MESH=NukeMassDebrisE01 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=NukeMassDebrisE01 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeMassDebrisE01 SEQ=Levitate01 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE01 SEQ=Levitate02 STARTFRAME=10 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE01 SEQ=Levitate03 STARTFRAME=20 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE01 SEQ=Levitate04 STARTFRAME=30 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE01 SEQ=Rise01A STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE01 SEQ=Rise01B STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE01 SEQ=Rise02A STARTFRAME=10 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE01 SEQ=Rise02B STARTFRAME=10 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE01 SEQ=Rise03A STARTFRAME=20 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE01 SEQ=Rise03B STARTFRAME=20 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE01 SEQ=Rise04A STARTFRAME=30 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE01 SEQ=Rise04B STARTFRAME=30 NUMFRAMES=6 RATE=5.0
#exec MESHMAP NEW MESHMAP=NukeMassDebrisE01 MESH=NukeMassDebrisE01
#exec MESHMAP SCALE MESHMAP=NukeMassDebrisE01 X=2.0 Y=2.0 Z=4.0
#exec MESHMAP SETTEXTURE MESHMAP=NukeMassDebrisE01 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=NukeMassDebrisE02 ANIVFILE=MODELS\NukeMassDebrisE02_a.3d DATAFILE=MODELS\NukeMassDebrisE02_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NukeMassDebrisE02 STRENGTH=0.1
#exec MESH ORIGIN MESH=NukeMassDebrisE02 X=0 Y=0 Z=0 PITCH=-64
#exec MESH SEQUENCE MESH=NukeMassDebrisE02 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=NukeMassDebrisE02 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeMassDebrisE02 SEQ=Levitate01 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE02 SEQ=Levitate02 STARTFRAME=10 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE02 SEQ=Levitate03 STARTFRAME=20 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE02 SEQ=Levitate04 STARTFRAME=30 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE02 SEQ=Rise01A STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE02 SEQ=Rise01B STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE02 SEQ=Rise02A STARTFRAME=10 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE02 SEQ=Rise02B STARTFRAME=10 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE02 SEQ=Rise03A STARTFRAME=20 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE02 SEQ=Rise03B STARTFRAME=20 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE02 SEQ=Rise04A STARTFRAME=30 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE02 SEQ=Rise04B STARTFRAME=30 NUMFRAMES=6 RATE=5.0
#exec MESHMAP NEW MESHMAP=NukeMassDebrisE02 MESH=NukeMassDebrisE02
#exec MESHMAP SCALE MESHMAP=NukeMassDebrisE02 X=2.0 Y=2.0 Z=4.0
#exec MESHMAP SETTEXTURE MESHMAP=NukeMassDebrisE02 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=NukeMassDebrisE03 ANIVFILE=MODELS\NukeMassDebrisE03_a.3d DATAFILE=MODELS\NukeMassDebrisE03_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NukeMassDebrisE03 STRENGTH=0.1
#exec MESH ORIGIN MESH=NukeMassDebrisE03 X=0 Y=0 Z=0 PITCH=-64
#exec MESH SEQUENCE MESH=NukeMassDebrisE03 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=NukeMassDebrisE03 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeMassDebrisE03 SEQ=Levitate01 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE03 SEQ=Levitate02 STARTFRAME=10 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE03 SEQ=Levitate03 STARTFRAME=20 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE03 SEQ=Levitate04 STARTFRAME=30 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE03 SEQ=Rise01A STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE03 SEQ=Rise01B STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE03 SEQ=Rise02A STARTFRAME=10 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE03 SEQ=Rise02B STARTFRAME=10 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE03 SEQ=Rise03A STARTFRAME=20 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE03 SEQ=Rise03B STARTFRAME=20 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE03 SEQ=Rise04A STARTFRAME=30 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE03 SEQ=Rise04B STARTFRAME=30 NUMFRAMES=6 RATE=5.0
#exec MESHMAP NEW MESHMAP=NukeMassDebrisE03 MESH=NukeMassDebrisE03
#exec MESHMAP SCALE MESHMAP=NukeMassDebrisE03 X=2.0 Y=2.0 Z=4.0
#exec MESHMAP SETTEXTURE MESHMAP=NukeMassDebrisE03 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=NukeMassDebrisE04 ANIVFILE=MODELS\NukeMassDebrisE04_a.3d DATAFILE=MODELS\NukeMassDebrisE04_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NukeMassDebrisE04 STRENGTH=0.1
#exec MESH ORIGIN MESH=NukeMassDebrisE04 X=0 Y=0 Z=0 PITCH=-64
#exec MESH SEQUENCE MESH=NukeMassDebrisE04 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=NukeMassDebrisE04 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeMassDebrisE04 SEQ=Levitate01 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE04 SEQ=Levitate02 STARTFRAME=10 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE04 SEQ=Levitate03 STARTFRAME=20 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE04 SEQ=Levitate04 STARTFRAME=30 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE04 SEQ=Rise01A STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE04 SEQ=Rise01B STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE04 SEQ=Rise02A STARTFRAME=10 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE04 SEQ=Rise02B STARTFRAME=10 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE04 SEQ=Rise03A STARTFRAME=20 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE04 SEQ=Rise03B STARTFRAME=20 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE04 SEQ=Rise04A STARTFRAME=30 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE04 SEQ=Rise04B STARTFRAME=30 NUMFRAMES=6 RATE=5.0
#exec MESHMAP NEW MESHMAP=NukeMassDebrisE04 MESH=NukeMassDebrisE04
#exec MESHMAP SCALE MESHMAP=NukeMassDebrisE04 X=2.0 Y=2.0 Z=4.0
#exec MESHMAP SETTEXTURE MESHMAP=NukeMassDebrisE04 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=NukeMassDebrisE05 ANIVFILE=MODELS\NukeMassDebrisE05_a.3d DATAFILE=MODELS\NukeMassDebrisE05_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NukeMassDebrisE05 STRENGTH=0.1
#exec MESH ORIGIN MESH=NukeMassDebrisE05 X=0 Y=0 Z=0 PITCH=-64
#exec MESH SEQUENCE MESH=NukeMassDebrisE05 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=NukeMassDebrisE05 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeMassDebrisE05 SEQ=Levitate01 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE05 SEQ=Levitate02 STARTFRAME=10 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE05 SEQ=Levitate03 STARTFRAME=20 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE05 SEQ=Levitate04 STARTFRAME=30 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE05 SEQ=Rise01A STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE05 SEQ=Rise01B STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE05 SEQ=Rise02A STARTFRAME=10 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE05 SEQ=Rise02B STARTFRAME=10 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE05 SEQ=Rise03A STARTFRAME=20 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE05 SEQ=Rise03B STARTFRAME=20 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE05 SEQ=Rise04A STARTFRAME=30 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE05 SEQ=Rise04B STARTFRAME=30 NUMFRAMES=6 RATE=5.0
#exec MESHMAP NEW MESHMAP=NukeMassDebrisE05 MESH=NukeMassDebrisE05
#exec MESHMAP SCALE MESHMAP=NukeMassDebrisE05 X=2.0 Y=2.0 Z=4.0
#exec MESHMAP SETTEXTURE MESHMAP=NukeMassDebrisE05 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=NukeMassDebrisE06 ANIVFILE=MODELS\NukeMassDebrisE06_a.3d DATAFILE=MODELS\NukeMassDebrisE06_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NukeMassDebrisE06 STRENGTH=0.1
#exec MESH ORIGIN MESH=NukeMassDebrisE06 X=0 Y=0 Z=0 PITCH=-64
#exec MESH SEQUENCE MESH=NukeMassDebrisE06 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=NukeMassDebrisE06 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeMassDebrisE06 SEQ=Levitate01 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE06 SEQ=Levitate02 STARTFRAME=10 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE06 SEQ=Levitate03 STARTFRAME=20 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE06 SEQ=Levitate04 STARTFRAME=30 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE06 SEQ=Rise01A STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE06 SEQ=Rise01B STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE06 SEQ=Rise02A STARTFRAME=10 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE06 SEQ=Rise02B STARTFRAME=10 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE06 SEQ=Rise03A STARTFRAME=20 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE06 SEQ=Rise03B STARTFRAME=20 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE06 SEQ=Rise04A STARTFRAME=30 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE06 SEQ=Rise04B STARTFRAME=30 NUMFRAMES=6 RATE=5.0
#exec MESHMAP NEW MESHMAP=NukeMassDebrisE06 MESH=NukeMassDebrisE06
#exec MESHMAP SCALE MESHMAP=NukeMassDebrisE06 X=2.0 Y=2.0 Z=4.0
#exec MESHMAP SETTEXTURE MESHMAP=NukeMassDebrisE06 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=NukeMassDebrisE07 ANIVFILE=MODELS\NukeMassDebrisE07_a.3d DATAFILE=MODELS\NukeMassDebrisE07_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NukeMassDebrisE07 STRENGTH=0.1
#exec MESH ORIGIN MESH=NukeMassDebrisE07 X=0 Y=0 Z=0 PITCH=-64
#exec MESH SEQUENCE MESH=NukeMassDebrisE07 SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=NukeMassDebrisE07 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeMassDebrisE07 SEQ=Levitate01 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE07 SEQ=Levitate02 STARTFRAME=10 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE07 SEQ=Levitate03 STARTFRAME=20 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE07 SEQ=Levitate04 STARTFRAME=30 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE07 SEQ=Rise01A STARTFRAME=0 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE07 SEQ=Rise01B STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE07 SEQ=Rise02A STARTFRAME=10 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE07 SEQ=Rise02B STARTFRAME=10 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE07 SEQ=Rise03A STARTFRAME=20 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE07 SEQ=Rise03B STARTFRAME=20 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE07 SEQ=Rise04A STARTFRAME=30 NUMFRAMES=3 RATE=2.0
#exec MESH SEQUENCE MESH=NukeMassDebrisE07 SEQ=Rise04B STARTFRAME=30 NUMFRAMES=6 RATE=5.0
#exec MESHMAP NEW MESHMAP=NukeMassDebrisE07 MESH=NukeMassDebrisE07
#exec MESHMAP SCALE MESHMAP=NukeMassDebrisE07 X=2.0 Y=2.0 Z=4.0
#exec MESHMAP SETTEXTURE MESHMAP=NukeMassDebrisE07 NUM=1 TEXTURE=DefaultTexture

var() float DieOutTime, LevitateSeqRate, RiseTime;
var() float SinkZ;
var() name LevitateSeq[4];
var vector FinalVel;
var float risingDelayCount;
var bool bRisen;
var float explFXRCount, explFXTCount;

simulated function SetForces(vector Dir, float Scaling)
{
	FinalVel = Normal(Dir) * ((InitMaxForce - InitMinForce)*FRand() + InitMinForce);
	DrawScale = Scaling * ((MaxDrawScale - MinDrawScale)*FRand() + MinDrawScale);
	PrePivot = -vector(Rotation) * SinkZ * DrawScale;
}

simulated function Tick(float Delta)
{
local rotator rRot;
local NukeMiscExpl expl;

	Super.Tick(Delta);
	
	if (!bRisen)
	{
		risingDelayCount += Delta;
		if (risingDelayCount >= RiseTime)
		{
			bRisen = True;
			SetPhysics(PHYS_Falling);
			Velocity = FinalVel;
			SetCollisionSize(DrawScale*MaxCoveredDebriRadius, DrawScale*MaxCoveredDebriRadius);
		}
		
		PrePivot = -vector(Rotation) * SinkZ * DrawScale * ((RiseTime - risingDelayCount)/RiseTime);
	}
	else if (Physics != PHYS_None && VSize(Velocity) > 0)
	{
		rRot.Pitch = -LevitateSeqRate * 60000 * Delta;
		SetRotation(Class'NWUtils'.static.rTurn(Rotation, rRot));
		
		if (Class'NuclearExplosionLevelE'.default.enableDebrisExplFX && explFXTCount < Class'NuclearExplosionLevelE'.default.debrisExplTime)
		{
			explFXTCount += Delta;
			explFXRCount -= Delta;
			if (explFXRCount <= 0)
			{
				explFXRCount = 1 / Class'NuclearExplosionLevelE'.default.debrisExplRate;
				expl = Spawn(Class'NukeMiscExplE');
				expl.SetScale(DrawScale);
			}
		}
	}
}

simulated function SpawnWaterSplash(bool inWater, ZoneInfo WZone)
{
	if (Class'NuclearExplosions'.default.enableNukeDebrisWaterFX)
		Super.SpawnWaterSplash(inWater, WZone);
}


auto state Flying
{
    simulated function BeginState()
    {
        Mesh = WallFragMeshes[Rand(ArrayCount(WallFragMeshes))];
		PlayAnim(LevitateSeq[Rand(ArrayCount(LevitateSeq))], LevitateSeqRate, 0.0);
		
        if ( Level.NetMode == NM_Standalone )
            LifeSpan = Default.LifeSpan + LifeSpanVariation*FRand();
        SetTimer(LifeSpan - DieOutTime,True);
    }
}

defaultproperties
{
    Mesh=NukeMassDebrisE01
	
	WallFragMeshes(0)=NukeMassDebrisE01
	WallFragMeshes(1)=NukeMassDebrisE02
	WallFragMeshes(2)=NukeMassDebrisE03
	WallFragMeshes(3)=NukeMassDebrisE04
	WallFragMeshes(4)=NukeMassDebrisE05
	WallFragMeshes(5)=NukeMassDebrisE06
	WallFragMeshes(6)=NukeMassDebrisE07
	WallFragMeshes(7)=NukeMassDebrisE01
	WallFragMeshes(8)=NukeMassDebrisE02
	WallFragMeshes(9)=NukeMassDebrisE03
	WallFragMeshes(10)=NukeMassDebrisE04
	WallFragMeshes(11)=NukeMassDebrisE05
	WallFragMeshes(12)=NukeMassDebrisE06
	WallFragMeshes(13)=NukeMassDebrisE07
	
	LifeSpan=6.000000
	LifeSpanVariation=2.000000
	DieOutTime=2.000000
	MaxCoveredDebriRadius=40.000000
	RiseTime=2.000000
	SinkZ=5.000000
	
	InitMaxForce=2400.000000
	InitMinForce=1600.000000
	MaxDrawScale=1.750000
	MinDrawScale=1.250000
	WaterFXDif=-2
	bAlwaysHeavy=True
	
	LevitateSeqRate=0.250000
	LevitateSeq(0)=Levitate01
	LevitateSeq(1)=Levitate02
	LevitateSeq(2)=Levitate03
	LevitateSeq(3)=Levitate04
	
	Physics=PHYS_None
}