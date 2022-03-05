//////////////////////////////////////////////////////////////
//				Feralidragon (17-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltOversFXBCloudElectric expands BoltOversFXBCloud;

#exec MESH IMPORT MESH=BoltOversFXBCloudElectric ANIVFILE=MODELS\BoltBaseCloudElectric_a.3d DATAFILE=MODELS\BoltBaseCloudElectric_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltOversFXBCloudElectric STRENGTH=0.1
#exec MESH ORIGIN MESH=BoltOversFXBCloudElectric X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltOversFXBCloudElectric SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=BoltOversFXBCloudElectric SEQ=PlayRevolve STARTFRAME=0 NUMFRAMES=41 RATE=40.0
#exec MESH SEQUENCE MESH=BoltOversFXBCloudElectric SEQ=LoopRevolve STARTFRAME=0 NUMFRAMES=40 RATE=39.0

#exec MESHMAP NEW MESHMAP=BoltOversFXBCloudElectric MESH=BoltOversFXBCloudElectric
#exec MESHMAP SCALE MESHMAP=BoltOversFXBCloudElectric X=0.02 Y=0.02 Z=0.04


var() texture ElectricTex[16];
var() float SparkOdds;

simulated function Tick(float Delta)
{
local byte i;

	if (Level.NetMode != NM_DedicatedServer)
	{
		for (i = 0; i < 8; i++)
		{
			if (FRand() < SparkOdds)
				MultiSkins[i] = ElectricTex[Rand(ArrayCount(ElectricTex))];
			else
				MultiSkins[i] = None;
		}
	}
	Super.Tick(Delta);
}

defaultproperties
{
	Mesh=BoltOversFXBCloudElectric
	ScaleGlow=2.000000
	Texture=EMPSpark01
	SparkOdds=0.050000
	
	ElectricTex(0)=EMPSpark01
	ElectricTex(1)=EMPSpark02
	ElectricTex(2)=EMPSpark03
	ElectricTex(3)=EMPSpark04
	ElectricTex(4)=EMPSpark05
	ElectricTex(5)=EMPSpark06
	ElectricTex(6)=EMPSpark07
	ElectricTex(7)=EMPSpark08
	ElectricTex(8)=EMPSpark09
	ElectricTex(9)=EMPSpark10
	ElectricTex(10)=EMPSpark11
	ElectricTex(11)=EMPSpark12
	ElectricTex(12)=EMPSpark13
	ElectricTex(13)=EMPSpark14
	ElectricTex(14)=EMPSpark15
	ElectricTex(15)=EMPSpark16
}
