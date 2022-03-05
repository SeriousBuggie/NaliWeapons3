//////////////////////////////////////////////////////////////
//				Feralidragon (15-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyMBaseCloudElectric expands CyMBaseCloud;

#exec MESH IMPORT MESH=CyMBaseCloudElectric ANIVFILE=MODELS\CyMBaseCloudElectric_a.3d DATAFILE=MODELS\CyMBaseCloudElectric_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CyMBaseCloudElectric STRENGTH=0.1
#exec MESH ORIGIN MESH=CyMBaseCloudElectric X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CyMBaseCloudElectric SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=CyMBaseCloudElectric SEQ=PlayRevolve STARTFRAME=0 NUMFRAMES=41 RATE=40.0
#exec MESH SEQUENCE MESH=CyMBaseCloudElectric SEQ=LoopRevolve STARTFRAME=0 NUMFRAMES=40 RATE=39.0

#exec MESHMAP NEW MESHMAP=CyMBaseCloudElectric MESH=CyMBaseCloudElectric
#exec MESHMAP SCALE MESHMAP=CyMBaseCloudElectric X=0.3 Y=0.3 Z=0.6

#exec AUDIO IMPORT NAME="CyMAppear" FILE=SOUNDS\CyMAppear.wav GROUP="CyMaster"

#exec TEXTURE IMPORT NAME=CySpark01 FILE=EFFECTS\CySpark01.bmp GROUP=CySparks FLAGS=2
#exec TEXTURE IMPORT NAME=CySpark02 FILE=EFFECTS\CySpark02.bmp GROUP=CySparks FLAGS=2
#exec TEXTURE IMPORT NAME=CySpark03 FILE=EFFECTS\CySpark03.bmp GROUP=CySparks FLAGS=2
#exec TEXTURE IMPORT NAME=CySpark04 FILE=EFFECTS\CySpark04.bmp GROUP=CySparks FLAGS=2
#exec TEXTURE IMPORT NAME=CySpark05 FILE=EFFECTS\CySpark05.bmp GROUP=CySparks FLAGS=2
#exec TEXTURE IMPORT NAME=CySpark06 FILE=EFFECTS\CySpark06.bmp GROUP=CySparks FLAGS=2
#exec TEXTURE IMPORT NAME=CySpark07 FILE=EFFECTS\CySpark07.bmp GROUP=CySparks FLAGS=2
#exec TEXTURE IMPORT NAME=CySpark08 FILE=EFFECTS\CySpark08.bmp GROUP=CySparks FLAGS=2
#exec TEXTURE IMPORT NAME=CySpark09 FILE=EFFECTS\CySpark09.bmp GROUP=CySparks FLAGS=2
#exec TEXTURE IMPORT NAME=CySpark10 FILE=EFFECTS\CySpark10.bmp GROUP=CySparks FLAGS=2
#exec TEXTURE IMPORT NAME=CySpark11 FILE=EFFECTS\CySpark11.bmp GROUP=CySparks FLAGS=2
#exec TEXTURE IMPORT NAME=CySpark12 FILE=EFFECTS\CySpark12.bmp GROUP=CySparks FLAGS=2
#exec TEXTURE IMPORT NAME=CySpark13 FILE=EFFECTS\CySpark13.bmp GROUP=CySparks FLAGS=2
#exec TEXTURE IMPORT NAME=CySpark14 FILE=EFFECTS\CySpark14.bmp GROUP=CySparks FLAGS=2
#exec TEXTURE IMPORT NAME=CySpark15 FILE=EFFECTS\CySpark15.bmp GROUP=CySparks FLAGS=2
#exec TEXTURE IMPORT NAME=CySpark16 FILE=EFFECTS\CySpark16.bmp GROUP=CySparks FLAGS=2


var() float SparkOdds;
var() sound AppearSnd;


simulated function PostBeginPlay()
{
	if (AppearSnd != None && Level.NetMode != NM_DedicatedServer)
		PlaySound(AppearSnd,, 100,, 10000);
	Super.PostBeginPlay();
}

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
	Mesh=CyMBaseCloudElectric
	SparkOdds=0.050000
	ScaleGlow=2.000000
	
	SmkWhiteTex(0)=CySpark01
	SmkWhiteTex(1)=CySpark02
	SmkWhiteTex(2)=CySpark03
	SmkWhiteTex(3)=CySpark04
	SmkWhiteTex(4)=CySpark05
	SmkWhiteTex(5)=CySpark06
	SmkWhiteTex(6)=CySpark07
	SmkWhiteTex(7)=CySpark08
	SmkWhiteTex(8)=CySpark09
	SmkWhiteTex(9)=CySpark10
	SmkWhiteTex(10)=CySpark11
	SmkWhiteTex(11)=CySpark12
	SmkWhiteTex(12)=CySpark13
	SmkWhiteTex(13)=CySpark14
	SmkWhiteTex(14)=CySpark15
	SmkWhiteTex(15)=CySpark16
	SmkWhiteTex(16)=CySpark01
	SmkWhiteTex(17)=CySpark16
	SmkWhiteTex(18)=CySpark02
	SmkWhiteTex(19)=CySpark15
	SmkWhiteTex(20)=CySpark03
	SmkWhiteTex(21)=CySpark14
	SmkWhiteTex(22)=CySpark04
	SmkWhiteTex(23)=CySpark13
	
	AppearSnd=CyMAppear
}
