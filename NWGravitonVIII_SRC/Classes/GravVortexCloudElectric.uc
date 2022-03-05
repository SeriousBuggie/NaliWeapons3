//////////////////////////////////////////////////////////////
//				Feralidragon (24-08-2013)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravVortexCloudElectric expands GravVortexCloud;

#exec TEXTURE IMPORT NAME=GravSpark01 FILE=Effects\GravSpark01.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=GravSpark02 FILE=Effects\GravSpark02.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=GravSpark03 FILE=Effects\GravSpark03.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=GravSpark04 FILE=Effects\GravSpark04.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=GravSpark05 FILE=Effects\GravSpark05.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=GravSpark06 FILE=Effects\GravSpark06.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=GravSpark07 FILE=Effects\GravSpark07.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=GravSpark08 FILE=Effects\GravSpark08.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=GravSpark09 FILE=Effects\GravSpark09.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=GravSpark10 FILE=Effects\GravSpark10.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=GravSpark11 FILE=Effects\GravSpark11.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=GravSpark12 FILE=Effects\GravSpark12.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=GravSpark13 FILE=Effects\GravSpark13.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=GravSpark14 FILE=Effects\GravSpark14.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=GravSpark15 FILE=Effects\GravSpark15.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=GravSpark16 FILE=Effects\GravSpark16.bmp GROUP=Effects FLAGS=2


var() float SparkOdds;
var float SparkTCount;

simulated function Tick(float Delta)
{
local byte i;

	if (Level.NetMode != NM_DedicatedServer)
	{
		SparkTCount += Delta;
		if (SparkTCount >= 0.05)
		{
			SparkTCount = 0.0;
			for (i = 0; i < 8; i++)
			{
				if (FRand() < SparkOdds)
					MultiSkins[i] = SmkWhiteTex[Rand(ArrayCount(SmkWhiteTex))];
				else
					MultiSkins[i] = None;
			}
		}
	}
	Super.Tick(Delta);
}

defaultproperties
{
	SparkOdds=0.010000
	ScaleGlow=2.000000
	
	SmkWhiteTex(0)=GravSpark01
	SmkWhiteTex(1)=GravSpark02
	SmkWhiteTex(2)=GravSpark03
	SmkWhiteTex(3)=GravSpark04
	SmkWhiteTex(4)=GravSpark05
	SmkWhiteTex(5)=GravSpark06
	SmkWhiteTex(6)=GravSpark07
	SmkWhiteTex(7)=GravSpark08
	SmkWhiteTex(8)=GravSpark09
	SmkWhiteTex(9)=GravSpark10
	SmkWhiteTex(10)=GravSpark11
	SmkWhiteTex(11)=GravSpark12
	SmkWhiteTex(12)=GravSpark13
	SmkWhiteTex(13)=GravSpark14
	SmkWhiteTex(14)=GravSpark15
	SmkWhiteTex(15)=GravSpark16
	SmkWhiteTex(16)=GravSpark01
	SmkWhiteTex(17)=GravSpark16
	SmkWhiteTex(18)=GravSpark02
	SmkWhiteTex(19)=GravSpark15
	SmkWhiteTex(20)=GravSpark03
	SmkWhiteTex(21)=GravSpark14
	SmkWhiteTex(22)=GravSpark04
	SmkWhiteTex(23)=GravSpark13
}
