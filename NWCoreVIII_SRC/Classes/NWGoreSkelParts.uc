//////////////////////////////////////////////////////////////
//				Feralidragon (24-02-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWGoreSkelParts expands NWBodyPiece;

//Skel Part 00a
#exec MESH IMPORT MESH=GoreSkelPart00a ANIVFILE=MODELS\GoreSkelPart00_a.3d DATAFILE=MODELS\GoreSkelPart00_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GoreSkelPart00a STRENGTH=0.75
#exec MESH ORIGIN MESH=GoreSkelPart00a X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GoreSkelPart00a SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelPart00a SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GoreSkelPart00a MESH=GoreSkelPart00a
#exec MESHMAP SCALE MESHMAP=GoreSkelPart00a X=0.04 Y=0.04 Z=0.08

//Skel Part 00b
#exec MESH IMPORT MESH=GoreSkelPart00b ANIVFILE=MODELS\GoreSkelPart00_a.3d DATAFILE=MODELS\GoreSkelPart00_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=GoreSkelPart00b STRENGTH=0.75
#exec MESH ORIGIN MESH=GoreSkelPart00b X=0 Y=0 Z=0 Yaw=128

#exec MESH SEQUENCE MESH=GoreSkelPart00b SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelPart00b SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GoreSkelPart00b MESH=GoreSkelPart00b
#exec MESHMAP SCALE MESHMAP=GoreSkelPart00b X=0.04 Y=0.04 Z=0.08

//Skel Part 01a
#exec MESH IMPORT MESH=GoreSkelPart01a ANIVFILE=MODELS\GoreSkelPart01_a.3d DATAFILE=MODELS\GoreSkelPart01_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GoreSkelPart01a STRENGTH=0.75
#exec MESH ORIGIN MESH=GoreSkelPart01a X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GoreSkelPart01a SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelPart01a SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GoreSkelPart01a MESH=GoreSkelPart01a
#exec MESHMAP SCALE MESHMAP=GoreSkelPart01a X=0.04 Y=0.04 Z=0.08

//Skel Part 01b
#exec MESH IMPORT MESH=GoreSkelPart01b ANIVFILE=MODELS\GoreSkelPart01_a.3d DATAFILE=MODELS\GoreSkelPart01_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=GoreSkelPart01b STRENGTH=0.75
#exec MESH ORIGIN MESH=GoreSkelPart01b X=0 Y=0 Z=0 Yaw=128

#exec MESH SEQUENCE MESH=GoreSkelPart01b SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelPart01b SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GoreSkelPart01b MESH=GoreSkelPart01b
#exec MESHMAP SCALE MESHMAP=GoreSkelPart01b X=0.04 Y=0.04 Z=0.08

//Skel Part 02a
#exec MESH IMPORT MESH=GoreSkelPart02a ANIVFILE=MODELS\GoreSkelPart02_a.3d DATAFILE=MODELS\GoreSkelPart02_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GoreSkelPart02a STRENGTH=0.75
#exec MESH ORIGIN MESH=GoreSkelPart02a X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GoreSkelPart02a SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelPart02a SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GoreSkelPart02a MESH=GoreSkelPart02a
#exec MESHMAP SCALE MESHMAP=GoreSkelPart02a X=0.04 Y=0.04 Z=0.08

//Skel Part 02b
#exec MESH IMPORT MESH=GoreSkelPart02b ANIVFILE=MODELS\GoreSkelPart02_a.3d DATAFILE=MODELS\GoreSkelPart02_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=GoreSkelPart02b STRENGTH=0.75
#exec MESH ORIGIN MESH=GoreSkelPart02b X=0 Y=0 Z=0 Yaw=128

#exec MESH SEQUENCE MESH=GoreSkelPart02b SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelPart02b SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GoreSkelPart02b MESH=GoreSkelPart02b
#exec MESHMAP SCALE MESHMAP=GoreSkelPart02b X=0.04 Y=0.04 Z=0.08

//Skel Part 03a
#exec MESH IMPORT MESH=GoreSkelPart03a ANIVFILE=MODELS\GoreSkelPart03_a.3d DATAFILE=MODELS\GoreSkelPart03_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GoreSkelPart03a STRENGTH=0.75
#exec MESH ORIGIN MESH=GoreSkelPart03a X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GoreSkelPart03a SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelPart03a SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GoreSkelPart03a MESH=GoreSkelPart03a
#exec MESHMAP SCALE MESHMAP=GoreSkelPart03a X=0.04 Y=0.04 Z=0.08

//Skel Part 03b
#exec MESH IMPORT MESH=GoreSkelPart03b ANIVFILE=MODELS\GoreSkelPart03_a.3d DATAFILE=MODELS\GoreSkelPart03_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=GoreSkelPart03b STRENGTH=0.75
#exec MESH ORIGIN MESH=GoreSkelPart03b X=0 Y=0 Z=0 Yaw=128

#exec MESH SEQUENCE MESH=GoreSkelPart03b SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelPart03b SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GoreSkelPart03b MESH=GoreSkelPart03b
#exec MESHMAP SCALE MESHMAP=GoreSkelPart03b X=0.04 Y=0.04 Z=0.08

//Skel Part 04a
#exec MESH IMPORT MESH=GoreSkelPart04a ANIVFILE=MODELS\GoreSkelPart04_a.3d DATAFILE=MODELS\GoreSkelPart04_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GoreSkelPart04a STRENGTH=0.75
#exec MESH ORIGIN MESH=GoreSkelPart04a X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GoreSkelPart04a SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelPart04a SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GoreSkelPart04a MESH=GoreSkelPart04a
#exec MESHMAP SCALE MESHMAP=GoreSkelPart04a X=0.04 Y=0.04 Z=0.08

//Skel Part 04b
#exec MESH IMPORT MESH=GoreSkelPart04b ANIVFILE=MODELS\GoreSkelPart04_a.3d DATAFILE=MODELS\GoreSkelPart04_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=GoreSkelPart04b STRENGTH=0.75
#exec MESH ORIGIN MESH=GoreSkelPart04b X=0 Y=0 Z=0 Yaw=128

#exec MESH SEQUENCE MESH=GoreSkelPart04b SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelPart04b SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GoreSkelPart04b MESH=GoreSkelPart04b
#exec MESHMAP SCALE MESHMAP=GoreSkelPart04b X=0.04 Y=0.04 Z=0.08

//Skel Part 05a
#exec MESH IMPORT MESH=GoreSkelPart05a ANIVFILE=MODELS\GoreSkelPart05_a.3d DATAFILE=MODELS\GoreSkelPart05_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GoreSkelPart05a STRENGTH=0.75
#exec MESH ORIGIN MESH=GoreSkelPart05a X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GoreSkelPart05a SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelPart05a SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GoreSkelPart05a MESH=GoreSkelPart05a
#exec MESHMAP SCALE MESHMAP=GoreSkelPart05a X=0.04 Y=0.04 Z=0.08

//Skel Part 05b
#exec MESH IMPORT MESH=GoreSkelPart05b ANIVFILE=MODELS\GoreSkelPart05_a.3d DATAFILE=MODELS\GoreSkelPart05_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=GoreSkelPart05b STRENGTH=0.75
#exec MESH ORIGIN MESH=GoreSkelPart05b X=0 Y=0 Z=0 Yaw=128

#exec MESH SEQUENCE MESH=GoreSkelPart05b SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelPart05b SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GoreSkelPart05b MESH=GoreSkelPart05b
#exec MESHMAP SCALE MESHMAP=GoreSkelPart05b X=0.04 Y=0.04 Z=0.08

//Skel Part 06a
#exec MESH IMPORT MESH=GoreSkelPart06a ANIVFILE=MODELS\GoreSkelPart06_a.3d DATAFILE=MODELS\GoreSkelPart06_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GoreSkelPart06a STRENGTH=0.75
#exec MESH ORIGIN MESH=GoreSkelPart06a X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GoreSkelPart06a SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelPart06a SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GoreSkelPart06a MESH=GoreSkelPart06a
#exec MESHMAP SCALE MESHMAP=GoreSkelPart06a X=0.04 Y=0.04 Z=0.08

//Skel Part 06b
#exec MESH IMPORT MESH=GoreSkelPart06b ANIVFILE=MODELS\GoreSkelPart06_a.3d DATAFILE=MODELS\GoreSkelPart06_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=GoreSkelPart06b STRENGTH=0.75
#exec MESH ORIGIN MESH=GoreSkelPart06b X=0 Y=0 Z=0 Yaw=128

#exec MESH SEQUENCE MESH=GoreSkelPart06b SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelPart06b SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GoreSkelPart06b MESH=GoreSkelPart06b
#exec MESHMAP SCALE MESHMAP=GoreSkelPart06b X=0.04 Y=0.04 Z=0.08

//Skel Part 07
#exec MESH IMPORT MESH=GoreSkelPart07 ANIVFILE=MODELS\GoreSkelPart07_a.3d DATAFILE=MODELS\GoreSkelPart07_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GoreSkelPart07 STRENGTH=0.75
#exec MESH ORIGIN MESH=GoreSkelPart07 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GoreSkelPart07 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelPart07 SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=GoreSkelPart07 MESH=GoreSkelPart07
#exec MESHMAP SCALE MESHMAP=GoreSkelPart07 X=0.04 Y=0.04 Z=0.08


struct SkPart
{
	var() mesh SkMesh;
	var() vector RelOffset;
};
var() SkPart SkelParts[16];

simulated function SetGoreType(class<NWGoreCBoard> newGoreBoardClass)
{
	Super.SetGoreType(newGoreBoardClass);
	if (newGoreBoardClass != None)
		MultiSkins[1] = newGoreBoardClass.static.GetBoneTexture();
}

simulated function InitPartN(int n, float partScale)
{
	if (n >= default.FixedNumberOfParts)
		return;
	Mesh = SkelParts[n].SkMesh;
	VelAdd = ((Normal(Normal(SkelParts[n].RelOffset) + VRand()/2) * 500) >> Rotation);
}

simulated static function vector getRelOffset(int n)
{
	if (n < default.FixedNumberOfParts)
		return (default.RelOffset + default.SkelParts[n].RelOffset);
	return default.RelOffset;
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=GoreSkelPart00a
	MultiSkins(1)=BoneSk
	DrawScale=2.000000
	
	MinLifeSpan=10.000000
	MaxLifeSpan=20.000000
	bBloodTrail=False
	bBloodBurst=False

	bSticky=False
	bStickToFloor=False
	bSpawnDecal=False
	bSpawnSlideDecal=False

	WallHitDumping=0.600000
	WallHitSoundOdds=0.000000
	WallHitSounds(0)=None
	WallHitSounds(1)=None
	WallHitSounds(2)=None
	WallHitSounds(3)=None
	
	bRelOffset=True
	bRelOffsetFromVictim=True
	RelOffset=(Z=0.000000)
	bDirectionalPart=True
	bCannotMultiplyAmount=True
	FixedNumberOfParts=16
	VelMultiplier=(X=0.000000,Y=0.000000,Z=0.000000)
	SpinRateMin=25000.000000
	SpinRateMax=100000.000000
	
	SkelParts(0)=(SkMesh=Mesh'GoreSkelPart00a',RelOffset=(X=-5.235000,Y=-3.700000,Z=8.250000))
	SkelParts(1)=(SkMesh=Mesh'GoreSkelPart00b',RelOffset=(X=-5.235000,Y=3.700000,Z=8.250000))
	SkelParts(2)=(SkMesh=Mesh'GoreSkelPart01a',RelOffset=(X=-4.750000,Y=-7.450000,Z=32.000000))
	SkelParts(3)=(SkMesh=Mesh'GoreSkelPart01b',RelOffset=(X=-4.750000,Y=7.450000,Z=32.000000))
	SkelParts(4)=(SkMesh=Mesh'GoreSkelPart02a',RelOffset=(X=-2.950000,Y=-12.275000,Z=5.000000))
	SkelParts(5)=(SkMesh=Mesh'GoreSkelPart02b',RelOffset=(X=-2.950000,Y=12.275000,Z=5.000000))
	SkelParts(6)=(SkMesh=Mesh'GoreSkelPart03a',RelOffset=(X=-4.000000,Y=-11.000000,Z=25.000000))
	SkelParts(7)=(SkMesh=Mesh'GoreSkelPart03b',RelOffset=(X=-4.000000,Y=11.000000,Z=25.000000))
	SkelParts(8)=(SkMesh=Mesh'GoreSkelPart04a',RelOffset=(X=-3.500000,Y=-6.950000,Z=-2.200000))
	SkelParts(9)=(SkMesh=Mesh'GoreSkelPart04b',RelOffset=(X=-3.500000,Y=6.950000,Z=-2.200000))
	SkelParts(10)=(SkMesh=Mesh'GoreSkelPart05a',RelOffset=(X=-2.550000,Y=-4.670000,Z=23.200000))
	SkelParts(11)=(SkMesh=Mesh'GoreSkelPart05b',RelOffset=(X=-2.550000,Y=4.670000,Z=23.200000))
	SkelParts(12)=(SkMesh=Mesh'GoreSkelPart06a',RelOffset=(X=-2.820000,Y=-4.300000,Z=28.810000))
	SkelParts(13)=(SkMesh=Mesh'GoreSkelPart06b',RelOffset=(X=-2.820000,Y=4.300000,Z=28.810000))
	SkelParts(14)=(SkMesh=Mesh'GoreSkelPart07',RelOffset=(X=-0.200000,Y=0.000000,Z=41.000000))
	SkelParts(15)=(SkMesh=Mesh'GoreSkullPart00',RelOffset=(X=1.000000,Y=0.000000,Z=38.650000))
}
