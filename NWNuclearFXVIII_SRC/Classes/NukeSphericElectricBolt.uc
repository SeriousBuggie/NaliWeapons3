//////////////////////////////////////////////////////////////
//				Feralidragon (28-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeSphericElectricBolt expands NaliWEffects;

#exec MESH IMPORT MESH=NukeSphericElectricBolt ANIVFILE=MODELS\NukeSphericElectricBolt_a.3d DATAFILE=MODELS\NukeSphericElectricBolt_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NukeSphericElectricBolt STRENGTH=0.25
#exec MESH ORIGIN MESH=NukeSphericElectricBolt X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NukeSphericElectricBolt SEQ=All STARTFRAME=0 NUMFRAMES=6
#exec MESH SEQUENCE MESH=NukeSphericElectricBolt SEQ=ElectricPos01 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeSphericElectricBolt SEQ=ElectricPos02 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeSphericElectricBolt SEQ=ElectricPos03 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeSphericElectricBolt SEQ=ElectricPos04 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeSphericElectricBolt SEQ=ElectricPos05 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeSphericElectricBolt SEQ=ElectricPos06 STARTFRAME=5 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NukeSphericElectricBolt MESH=NukeSphericElectricBolt
#exec MESHMAP SCALE MESHMAP=NukeSphericElectricBolt X=1.0 Y=1.0 Z=2.0

#exec OBJ LOAD FILE=Textures\NuclearHeatFX.utx PACKAGE=NWNuclearFXVIII_SRC.NuclearHeatFX
#exec MESHMAP SETTEXTURE MESHMAP=NukeSphericElectricBolt NUM=1 TEXTURE=NukeElectricFX01


var() name ElecVariations[6];
var() float ElecRate;
var() texture FXElectric[4];
var() float fadeInTime;

var float scaleRate;

simulated function PostBeginPlay()
{
	AnimSequence = ElecVariations[Rand(ArrayCount(ElecVariations))];
	MultiSkins[1] = FXElectric[Rand(ArrayCount(FXElectric))];
	TweenAnim(ElecVariations[Rand(ArrayCount(ElecVariations))], 1/ElecRate);
	SpawnMyCor();
}

simulated function AnimEnd()
{
	TweenAnim(ElecVariations[Rand(ArrayCount(ElecVariations))], 1/ElecRate);
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (Default.LifeSpan - LifeSpan <= fadeInTime)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / fadeInTime;
		else
			ScaleGlow = LifeSpan * Default.ScaleGlow / (Default.LifeSpan - fadeInTime);
		
		if (scaleRate > 0)
			DrawScale += (scaleRate*Delta);
	}
}

simulated function SetScaleRate(float initScale, float rScale)
{
	DrawScale = initScale;
	scaleRate = rScale;
}

simulated function SpawnMyCor()
{
local NukeSphericElectricBoltCor c;

	if (Level.NetMode != NM_DedicatedServer)
	{
		c = Spawn(Class'NukeSphericElectricBoltCor', Self,, Location, Rotation);
		c.SetInitScale(DrawScale);
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=NukeSphericElectricBolt
	bUnlit=True
	Style=STY_Translucent
	LifeSpan=0.600000
	ScaleGlow=4.000000
	fadeInTime=0.100000
	
	FXElectric(0)=NukeElectricFX01
	FXElectric(1)=NukeElectricFX02
	FXElectric(2)=NukeElectricFX03
	FXElectric(3)=NukeElectricFX04
	
	ElecRate=5.000000
	ElecVariations(0)=ElectricPos01
	ElecVariations(1)=ElectricPos02
	ElecVariations(2)=ElectricPos03
	ElecVariations(3)=ElectricPos04
	ElecVariations(4)=ElectricPos05
	ElecVariations(5)=ElectricPos06
}
