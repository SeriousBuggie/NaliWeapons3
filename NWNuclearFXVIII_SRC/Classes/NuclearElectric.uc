//////////////////////////////////////////////////////////////
//				Feralidragon (21-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearElectric expands NaliWEffects;

#exec MESH IMPORT MESH=NuclearElectric ANIVFILE=MODELS\NuclearElectric_a.3d DATAFILE=MODELS\NuclearElectric_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NuclearElectric STRENGTH=0.25
#exec MESH ORIGIN MESH=NuclearElectric X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NuclearElectric SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos01 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos02 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos03 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos04 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos05 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos06 STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos07 STARTFRAME=6 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos08 STARTFRAME=7 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos09 STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos10 STARTFRAME=9 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos11 STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos12 STARTFRAME=11 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos13 STARTFRAME=12 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos14 STARTFRAME=13 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos15 STARTFRAME=14 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos16 STARTFRAME=15 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos17 STARTFRAME=16 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos18 STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos19 STARTFRAME=18 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos20 STARTFRAME=19 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearElectric SEQ=ElectricPos21 STARTFRAME=20 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NuclearElectric MESH=NuclearElectric
#exec MESHMAP SCALE MESHMAP=NuclearElectric X=0.25 Y=0.25 Z=0.5

#exec OBJ LOAD FILE=Textures\NuclearHeatFX.utx PACKAGE=NWNuclearFXVIII_SRC.NuclearHeatFX
#exec MESHMAP SETTEXTURE MESHMAP=NuclearElectric NUM=1 TEXTURE=NukeElectricFX01

#exec AUDIO IMPORT NAME="NukeThunder01" FILE=SOUNDS\NukeThunder01.wav GROUP="NuclearThunders"
#exec AUDIO IMPORT NAME="NukeThunder02" FILE=SOUNDS\NukeThunder02.wav GROUP="NuclearThunders"
#exec AUDIO IMPORT NAME="NukeThunder03" FILE=SOUNDS\NukeThunder03.wav GROUP="NuclearThunders"
#exec AUDIO IMPORT NAME="NukeThunder04" FILE=SOUNDS\NukeThunder04.wav GROUP="NuclearThunders"
#exec AUDIO IMPORT NAME="NukeThunder05" FILE=SOUNDS\NukeThunder05.wav GROUP="NuclearThunders"
#exec AUDIO IMPORT NAME="NukeThunder06" FILE=SOUNDS\NukeThunder06.wav GROUP="NuclearThunders"
#exec AUDIO IMPORT NAME="NukeThunder07" FILE=SOUNDS\NukeThunder07.wav GROUP="NuclearThunders"
#exec AUDIO IMPORT NAME="NukeThunder08" FILE=SOUNDS\NukeThunder08.wav GROUP="NuclearThunders"
#exec AUDIO IMPORT NAME="NukeThunder09" FILE=SOUNDS\NukeThunder09.wav GROUP="NuclearThunders"


var() float MaxElecDist;
var() name ElecVariations[21];
var() float ElecRate;
var() sound ThunderSnds[9];

var() texture FXElectric[4];
var() float fadeInTime;
var() float MaxSoundDist;

simulated function PostBeginPlay()
{
	AnimSequence = ElecVariations[Rand(ArrayCount(ElecVariations))];
	MultiSkins[1] = FXElectric[Rand(ArrayCount(FXElectric))];
	TweenAnim(ElecVariations[Rand(ArrayCount(ElecVariations))], 1/ElecRate);
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
	}
}

simulated function SetElectricDistance(float Dist)
{
	DrawScale = Dist / MaxElecDist;
	MakeThunderSound(Dist);
}

function MakeThunderSound(float Dist)
{
	PlaySound(ThunderSnds[Rand(ArrayCount(ThunderSnds))],, 25.0,, FMin(Dist * 5.0,MaxSoundDist));
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=NuclearElectric
	bUnlit=True
	Style=STY_Translucent
	LifeSpan=0.600000
	ScaleGlow=4.000000
	fadeInTime=0.100000
	MaxSoundDist=20000.000000
	
	MaxElecDist=160.000000
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
	ElecVariations(6)=ElectricPos07
	ElecVariations(7)=ElectricPos08
	ElecVariations(8)=ElectricPos09
	ElecVariations(9)=ElectricPos10
	ElecVariations(10)=ElectricPos11
	ElecVariations(11)=ElectricPos12
	ElecVariations(12)=ElectricPos13
	ElecVariations(13)=ElectricPos14
	ElecVariations(14)=ElectricPos15
	ElecVariations(15)=ElectricPos16
	ElecVariations(16)=ElectricPos17
	ElecVariations(17)=ElectricPos18
	ElecVariations(18)=ElectricPos19
	ElecVariations(19)=ElectricPos20
	ElecVariations(20)=ElectricPos21
	
	ThunderSnds(0)=NukeThunder01
	ThunderSnds(1)=NukeThunder02
	ThunderSnds(2)=NukeThunder03
	ThunderSnds(3)=NukeThunder04
	ThunderSnds(4)=NukeThunder05
	ThunderSnds(5)=NukeThunder06
	ThunderSnds(6)=NukeThunder07
	ThunderSnds(7)=NukeThunder08
	ThunderSnds(8)=NukeThunder09
}
