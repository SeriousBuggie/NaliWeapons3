//////////////////////////////////////////////////////////////
//				Feralidragon (26-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class EMPSparksExpl expands NaliWEffects;

var() texture EMPSparkTex[16];
var() mesh EMPSparkMesh[4];
var() float SparkOdds;

var() float MaxDrawScale;

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
		
		DrawScale = (Default.LifeSpan - LifeSpan) * (MaxDrawScale - Default.DrawScale) / Default.LifeSpan + Default.DrawScale;
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan + FRand()*0.2;
	}
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
	ScaleGlow=1.500000
	DrawScale=0.250000
	Style=STY_Translucent
	
	LifeSpan=0.350000
	MaxDrawScale=1.350000
	
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
