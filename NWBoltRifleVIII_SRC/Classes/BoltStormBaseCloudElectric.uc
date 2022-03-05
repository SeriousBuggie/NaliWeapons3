//////////////////////////////////////////////////////////////
//				Feralidragon (14-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltStormBaseCloudElectric expands BoltStormBaseCloud;


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
	Mesh=BoltBaseCloudElectric
	SparkOdds=0.015000
	ScaleGlow=2.000000
	
	SmkWhiteTex(0)=EMPSpark01
	SmkWhiteTex(1)=EMPSpark02
	SmkWhiteTex(2)=EMPSpark03
	SmkWhiteTex(3)=EMPSpark04
	SmkWhiteTex(4)=EMPSpark05
	SmkWhiteTex(5)=EMPSpark06
	SmkWhiteTex(6)=EMPSpark07
	SmkWhiteTex(7)=EMPSpark08
	SmkWhiteTex(8)=EMPSpark09
	SmkWhiteTex(9)=EMPSpark10
	SmkWhiteTex(10)=EMPSpark11
	SmkWhiteTex(11)=EMPSpark12
	SmkWhiteTex(12)=EMPSpark13
	SmkWhiteTex(13)=EMPSpark14
	SmkWhiteTex(14)=EMPSpark15
	SmkWhiteTex(15)=EMPSpark16
	SmkWhiteTex(16)=EMPSpark01
	SmkWhiteTex(17)=EMPSpark16
	SmkWhiteTex(18)=EMPSpark02
	SmkWhiteTex(19)=EMPSpark15
	SmkWhiteTex(20)=EMPSpark03
	SmkWhiteTex(21)=EMPSpark14
	SmkWhiteTex(22)=EMPSpark04
	SmkWhiteTex(23)=EMPSpark13
}
