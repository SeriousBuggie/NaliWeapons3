//////////////////////////////////////////////////////////////
//				Feralidragon (27-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarBirthCloudElectric expands UltimaSolarBirthCloud;

#exec MESH IMPORT MESH=UltimaSolarBirthCloudElectric ANIVFILE=MODELS\UltimaSolarBirthCloudElectric_a.3d DATAFILE=MODELS\UltimaSolarBirthCloudElectric_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=UltimaSolarBirthCloudElectric STRENGTH=0.1
#exec MESH ORIGIN MESH=UltimaSolarBirthCloudElectric X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=UltimaSolarBirthCloudElectric SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=UltimaSolarBirthCloudElectric SEQ=PlayRevolve STARTFRAME=0 NUMFRAMES=41 RATE=40.0
#exec MESH SEQUENCE MESH=UltimaSolarBirthCloudElectric SEQ=LoopRevolve STARTFRAME=0 NUMFRAMES=40 RATE=39.0

#exec MESHMAP NEW MESHMAP=UltimaSolarBirthCloudElectric MESH=UltimaSolarBirthCloudElectric
#exec MESHMAP SCALE MESHMAP=UltimaSolarBirthCloudElectric X=0.3 Y=0.3 Z=0.6

var() float SparkOdds;

simulated function Tick(float Delta)
{
local byte i;

	if (Level.NetMode != NM_DedicatedServer)
	{
		for (i = 0; i < 8; i++)
		{
			if (FRand() < SparkOdds)
				MultiSkins[i] = SmkWhiteTex[Rand(ArrayCount(SmkWhiteTex))];
			else
				MultiSkins[i] = None;
		}
	}
	Super.Tick(Delta);
}

defaultproperties
{
	Mesh=UltimaSolarBirthCloudElectric
	SparkOdds=0.035000
	ScaleGlow=2.000000
	
	SmkWhiteTex(0)=ElectricSpark01
	SmkWhiteTex(1)=ElectricSpark02
	SmkWhiteTex(2)=ElectricSpark03
	SmkWhiteTex(3)=ElectricSpark04
	SmkWhiteTex(4)=ElectricSpark05
	SmkWhiteTex(5)=ElectricSpark06
	SmkWhiteTex(6)=ElectricSpark07
	SmkWhiteTex(7)=ElectricSpark08
	SmkWhiteTex(8)=ElectricSpark09
	SmkWhiteTex(9)=ElectricSpark10
	SmkWhiteTex(10)=ElectricSpark11
	SmkWhiteTex(11)=ElectricSpark12
	SmkWhiteTex(12)=ElectricSpark13
	SmkWhiteTex(13)=ElectricSpark14
	SmkWhiteTex(14)=ElectricSpark15
	SmkWhiteTex(15)=ElectricSpark16
	SmkWhiteTex(16)=ElectricSpark01
	SmkWhiteTex(17)=ElectricSpark16
	SmkWhiteTex(18)=ElectricSpark02
	SmkWhiteTex(19)=ElectricSpark15
	SmkWhiteTex(20)=ElectricSpark03
	SmkWhiteTex(21)=ElectricSpark14
	SmkWhiteTex(22)=ElectricSpark04
	SmkWhiteTex(23)=ElectricSpark13
}
