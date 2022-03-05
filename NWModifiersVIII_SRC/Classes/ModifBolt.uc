//////////////////////////////////////////////////////////////
//	Nali Weapons III modifier bolts/lightnings
//				Feralidragon (25-03-2010)
//
// NW3 MODIFIERS BUILD 1.00
//////////////////////////////////////////////////////////////

class ModifBolt expands NaliWEffects;

#exec TEXTURE IMPORT NAME=ModifLTrace FILE=Effects\ModifLTrace.bmp GROUP=Effects LODSET=2

//Front mesh 1
//------------------------------------------------------------
#exec MESH IMPORT MESH=ModifFrontBolt01 ANIVFILE=MODELS\ModifFrontBolt_a.3d DATAFILE=MODELS\ModifFrontBolt_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=ModifFrontBolt01 STRENGTH=0
#exec MESH ORIGIN MESH=ModifFrontBolt01 X=0 Y=0 Z=0 YAW=64

#exec MESH SEQUENCE MESH=ModifFrontBolt01 SEQ=All STARTFRAME=0 NUMFRAMES=10
#exec MESH SEQUENCE MESH=ModifFrontBolt01 SEQ=J00 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt01 SEQ=J01 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt01 SEQ=J02 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt01 SEQ=J03 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt01 SEQ=J04 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt01 SEQ=J05 STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt01 SEQ=J06 STARTFRAME=6 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt01 SEQ=J07 STARTFRAME=7 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt01 SEQ=J08 STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt01 SEQ=J09 STARTFRAME=9 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=ModifFrontBolt01 MESH=ModifFrontBolt01
#exec MESHMAP SCALE MESHMAP=ModifFrontBolt01 X=0.05 Y=0.05 Z=0.1

#exec MESHMAP SETTEXTURE MESHMAP=ModifFrontBolt01 NUM=1 TEXTURE=ModifLTrace
//------------------------------------------------------------

//Front mesh 2
//------------------------------------------------------------
#exec MESH IMPORT MESH=ModifFrontBolt02 ANIVFILE=MODELS\ModifFrontBolt_a.3d DATAFILE=MODELS\ModifFrontBolt_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=ModifFrontBolt02 STRENGTH=0
#exec MESH ORIGIN MESH=ModifFrontBolt02 X=0 Y=0 Z=0 YAW=-64

#exec MESH SEQUENCE MESH=ModifFrontBolt02 SEQ=All STARTFRAME=0 NUMFRAMES=10
#exec MESH SEQUENCE MESH=ModifFrontBolt02 SEQ=J00 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt02 SEQ=J01 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt02 SEQ=J02 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt02 SEQ=J03 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt02 SEQ=J04 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt02 SEQ=J05 STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt02 SEQ=J06 STARTFRAME=6 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt02 SEQ=J07 STARTFRAME=7 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt02 SEQ=J08 STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt02 SEQ=J09 STARTFRAME=9 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=ModifFrontBolt02 MESH=ModifFrontBolt02
#exec MESHMAP SCALE MESHMAP=ModifFrontBolt02 X=0.05 Y=0.05 Z=0.1

#exec MESHMAP SETTEXTURE MESHMAP=ModifFrontBolt02 NUM=1 TEXTURE=ModifLTrace
//------------------------------------------------------------

//Front mesh 3
//------------------------------------------------------------
#exec MESH IMPORT MESH=ModifFrontBolt03 ANIVFILE=MODELS\ModifFrontBolt_a.3d DATAFILE=MODELS\ModifFrontBolt_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=ModifFrontBolt03 STRENGTH=0
#exec MESH ORIGIN MESH=ModifFrontBolt03 X=0 Y=0 Z=0 YAW=64 ROLL=128

#exec MESH SEQUENCE MESH=ModifFrontBolt03 SEQ=All STARTFRAME=0 NUMFRAMES=10
#exec MESH SEQUENCE MESH=ModifFrontBolt03 SEQ=J00 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt03 SEQ=J01 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt03 SEQ=J02 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt03 SEQ=J03 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt03 SEQ=J04 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt03 SEQ=J05 STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt03 SEQ=J06 STARTFRAME=6 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt03 SEQ=J07 STARTFRAME=7 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt03 SEQ=J08 STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt03 SEQ=J09 STARTFRAME=9 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=ModifFrontBolt03 MESH=ModifFrontBolt03
#exec MESHMAP SCALE MESHMAP=ModifFrontBolt03 X=0.05 Y=0.05 Z=0.1

#exec MESHMAP SETTEXTURE MESHMAP=ModifFrontBolt03 NUM=1 TEXTURE=ModifLTrace
//------------------------------------------------------------

//Front mesh 4
//------------------------------------------------------------
#exec MESH IMPORT MESH=ModifFrontBolt04 ANIVFILE=MODELS\ModifFrontBolt_a.3d DATAFILE=MODELS\ModifFrontBolt_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=ModifFrontBolt04 STRENGTH=0
#exec MESH ORIGIN MESH=ModifFrontBolt04 X=0 Y=0 Z=0 YAW=-64 ROLL=128

#exec MESH SEQUENCE MESH=ModifFrontBolt04 SEQ=All STARTFRAME=0 NUMFRAMES=10
#exec MESH SEQUENCE MESH=ModifFrontBolt04 SEQ=J00 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt04 SEQ=J01 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt04 SEQ=J02 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt04 SEQ=J03 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt04 SEQ=J04 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt04 SEQ=J05 STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt04 SEQ=J06 STARTFRAME=6 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt04 SEQ=J07 STARTFRAME=7 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt04 SEQ=J08 STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifFrontBolt04 SEQ=J09 STARTFRAME=9 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=ModifFrontBolt04 MESH=ModifFrontBolt04
#exec MESHMAP SCALE MESHMAP=ModifFrontBolt04 X=0.05 Y=0.05 Z=0.1

#exec MESHMAP SETTEXTURE MESHMAP=ModifFrontBolt04 NUM=1 TEXTURE=ModifLTrace
//------------------------------------------------------------

//Side mesh 1
//------------------------------------------------------------
#exec MESH IMPORT MESH=ModifSideBolt01 ANIVFILE=MODELS\ModifSidesBolt_a.3d DATAFILE=MODELS\ModifSidesBolt_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=ModifSideBolt01 STRENGTH=0
#exec MESH ORIGIN MESH=ModifSideBolt01 X=0 Y=0 Z=0 YAW=64

#exec MESH SEQUENCE MESH=ModifSideBolt01 SEQ=All STARTFRAME=0 NUMFRAMES=10
#exec MESH SEQUENCE MESH=ModifSideBolt01 SEQ=J00 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt01 SEQ=J01 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt01 SEQ=J02 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt01 SEQ=J03 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt01 SEQ=J04 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt01 SEQ=J05 STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt01 SEQ=J06 STARTFRAME=6 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt01 SEQ=J07 STARTFRAME=7 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt01 SEQ=J08 STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt01 SEQ=J09 STARTFRAME=9 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=ModifSideBolt01 MESH=ModifSideBolt01
#exec MESHMAP SCALE MESHMAP=ModifSideBolt01 X=0.05 Y=0.05 Z=0.1

#exec MESHMAP SETTEXTURE MESHMAP=ModifSideBolt01 NUM=1 TEXTURE=ModifLTrace
//------------------------------------------------------------

//Side mesh 2
//------------------------------------------------------------
#exec MESH IMPORT MESH=ModifSideBolt02 ANIVFILE=MODELS\ModifSidesBolt_a.3d DATAFILE=MODELS\ModifSidesBolt_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=ModifSideBolt02 STRENGTH=0
#exec MESH ORIGIN MESH=ModifSideBolt02 X=0 Y=0 Z=0 YAW=-64

#exec MESH SEQUENCE MESH=ModifSideBolt02 SEQ=All STARTFRAME=0 NUMFRAMES=10
#exec MESH SEQUENCE MESH=ModifSideBolt02 SEQ=J00 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt02 SEQ=J01 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt02 SEQ=J02 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt02 SEQ=J03 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt02 SEQ=J04 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt02 SEQ=J05 STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt02 SEQ=J06 STARTFRAME=6 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt02 SEQ=J07 STARTFRAME=7 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt02 SEQ=J08 STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt02 SEQ=J09 STARTFRAME=9 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=ModifSideBolt02 MESH=ModifSideBolt02
#exec MESHMAP SCALE MESHMAP=ModifSideBolt02 X=0.05 Y=0.05 Z=0.1

#exec MESHMAP SETTEXTURE MESHMAP=ModifSideBolt02 NUM=1 TEXTURE=ModifLTrace
//------------------------------------------------------------

//Side mesh 3
//------------------------------------------------------------
#exec MESH IMPORT MESH=ModifSideBolt03 ANIVFILE=MODELS\ModifSidesBolt_a.3d DATAFILE=MODELS\ModifSidesBolt_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=ModifSideBolt03 STRENGTH=0
#exec MESH ORIGIN MESH=ModifSideBolt03 X=0 Y=0 Z=0 YAW=64 ROLL=128

#exec MESH SEQUENCE MESH=ModifSideBolt03 SEQ=All STARTFRAME=0 NUMFRAMES=10
#exec MESH SEQUENCE MESH=ModifSideBolt03 SEQ=J00 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt03 SEQ=J01 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt03 SEQ=J02 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt03 SEQ=J03 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt03 SEQ=J04 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt03 SEQ=J05 STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt03 SEQ=J06 STARTFRAME=6 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt03 SEQ=J07 STARTFRAME=7 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt03 SEQ=J08 STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt03 SEQ=J09 STARTFRAME=9 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=ModifSideBolt03 MESH=ModifSideBolt03
#exec MESHMAP SCALE MESHMAP=ModifSideBolt03 X=0.05 Y=0.05 Z=0.1

#exec MESHMAP SETTEXTURE MESHMAP=ModifSideBolt03 NUM=1 TEXTURE=ModifLTrace
//------------------------------------------------------------

//Side mesh 4
//------------------------------------------------------------
#exec MESH IMPORT MESH=ModifSideBolt04 ANIVFILE=MODELS\ModifSidesBolt_a.3d DATAFILE=MODELS\ModifSidesBolt_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=ModifSideBolt04 STRENGTH=0
#exec MESH ORIGIN MESH=ModifSideBolt04 X=0 Y=0 Z=0 YAW=-64 ROLL=128

#exec MESH SEQUENCE MESH=ModifSideBolt04 SEQ=All STARTFRAME=0 NUMFRAMES=10
#exec MESH SEQUENCE MESH=ModifSideBolt04 SEQ=J00 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt04 SEQ=J01 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt04 SEQ=J02 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt04 SEQ=J03 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt04 SEQ=J04 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt04 SEQ=J05 STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt04 SEQ=J06 STARTFRAME=6 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt04 SEQ=J07 STARTFRAME=7 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt04 SEQ=J08 STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSideBolt04 SEQ=J09 STARTFRAME=9 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=ModifSideBolt04 MESH=ModifSideBolt04
#exec MESHMAP SCALE MESHMAP=ModifSideBolt04 X=0.05 Y=0.05 Z=0.1

#exec MESHMAP SETTEXTURE MESHMAP=ModifSideBolt04 NUM=1 TEXTURE=ModifLTrace
//------------------------------------------------------------

//***********************************************************************

var() mesh FrontBolts[4], SideBolts[4];
var() float JitterTime, GlowDelta;
var() name JitterAnims[10];

var float CGlow, TCount;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		LODBias = FMax(1.0, Class'NWInfo'.default.PickupsDistDetail * Class'NWInfo'.default.MaxLODBias/255);
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		TCount += Delta;
		if (TCount >= JitterTime)
		{
			AnimSequence = JitterAnims[Rand(10)];
			CGlow = GlowDelta * 2 * FRand() - GlowDelta;
			TCount = 0;
		}
		
		ScaleGlow = FMax(0.0, (LifeSpan * default.ScaleGlow / default.LifeSpan) + CGlow);
	}
}

simulated function SetBoltMesh(byte n, bool bSide)
{
	if (n > 3)
		return;
		
	if (!bSide)
		Mesh = FrontBolts[n];
	else
		Mesh = SideBolts[n];
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=ModifFrontBolt01
	bNetTemporary=True
	Mass=0.000000
	CollisionHeight=0.000000
	CollisionRadius=0.000000
	Skin=None
	Style=STY_Translucent
	ScaleGlow=0.500000
	bUnlit=True
	Physics=PHYS_Trailer
	bTrailerSameRotation=True
	
	LifeSpan=2.000000
	JitterTime=0.010000
	GlowDelta=0.750000
	
	FrontBolts(0)=ModifFrontBolt01
	FrontBolts(1)=ModifFrontBolt02
	FrontBolts(2)=ModifFrontBolt03
	FrontBolts(3)=ModifFrontBolt04
	SideBolts(0)=ModifSideBolt01
	SideBolts(1)=ModifSideBolt02
	SideBolts(2)=ModifSideBolt03
	SideBolts(3)=ModifSideBolt04
	JitterAnims(0)=J00
	JitterAnims(1)=J01
	JitterAnims(2)=J02
	JitterAnims(3)=J03
	JitterAnims(4)=J04
	JitterAnims(5)=J05
	JitterAnims(6)=J06
	JitterAnims(7)=J07
	JitterAnims(8)=J08
	JitterAnims(9)=J09
}
