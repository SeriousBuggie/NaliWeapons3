//////////////////////////////////////////////////////////////
//				Feralidragon (14-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltCrystalSparks expands NaliWEffects;

var() texture EMPSparkTex[16];
var() mesh EMPSparkMesh[4];
var() float SparkOdds;

simulated function Tick(float Delta)
{
local byte i;

	if (Level.NetMode != NM_DedicatedServer)
	{
		for (i = 1; i < 8; i++)
		{
			if (FRand() < SparkOdds)
				MultiSkins[i] = EMPSparkTex[Rand(ArrayCount(EMPSparkTex))];
			else
				MultiSkins[i] = Texture'TranslucInvis';
		}
	}
	ScaleGlow = FRand()*default.ScaleGlow;
}

simulated function ChangeMesh(byte meshIndex)
{
	if (meshIndex < ArrayCount(EMPSparkMesh))
		Mesh = EMPSparkMesh[meshIndex];
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=EMPSparks01
	bUnlit=True
	ScaleGlow=2.500000
	DrawScale=1.250000
	Style=STY_Translucent
	LifeSpan=0.000000
	
	EMPSparkTex(0)=EMPSpark01
	EMPSparkTex(1)=EMPSpark02
	EMPSparkTex(2)=EMPSpark03
	EMPSparkTex(3)=EMPSpark04
	EMPSparkTex(4)=EMPSpark05
	EMPSparkTex(5)=EMPSpark06
	EMPSparkTex(6)=EMPSpark07
	EMPSparkTex(7)=EMPSpark08
	EMPSparkTex(8)=EMPSpark09
	EMPSparkTex(9)=EMPSpark10
	EMPSparkTex(10)=EMPSpark11
	EMPSparkTex(11)=EMPSpark12
	EMPSparkTex(12)=EMPSpark13
	EMPSparkTex(13)=EMPSpark14
	EMPSparkTex(14)=EMPSpark15
	EMPSparkTex(15)=EMPSpark16
	
	EMPSparkMesh(0)=EMPSparks01
	EMPSparkMesh(1)=EMPSparks02
	EMPSparkMesh(2)=EMPSparks03
	EMPSparkMesh(3)=EMPSparks04
	
	SparkOdds=0.550000
	
	Physics=PHYS_Rotating
	bFixedRotationDir=True
	RotationRate=(Pitch=500000,Yaw=500000)
}
