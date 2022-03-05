//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2013)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SEMPSparksExpl expands NaliWEffects;

var() texture SEMPSparkTex[16];
var() mesh SEMPSparkMesh[4];
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
				MultiSkins[i] = SEMPSparkTex[Rand(ArrayCount(SEMPSparkTex))];
			else
				MultiSkins[i] = Texture'TranslucInvis';
		}
		
		DrawScale = (Default.LifeSpan - LifeSpan) * (MaxDrawScale - Default.DrawScale) / Default.LifeSpan + Default.DrawScale;
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan + FRand()*0.2;
	}
}

simulated function ChangeMesh(byte meshIndex)
{
	if (meshIndex < ArrayCount(SEMPSparkMesh))
		Mesh = SEMPSparkMesh[meshIndex];
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=SEMPSparks01
	
	bUnlit=True
	ScaleGlow=1.500000
	DrawScale=0.250000
	Style=STY_Translucent
	
	LifeSpan=0.350000
	MaxDrawScale=1.350000
	
	SEMPSparkTex(0)=SEMPSpark01
	SEMPSparkTex(1)=SEMPSpark02
	SEMPSparkTex(2)=SEMPSpark03
	SEMPSparkTex(3)=SEMPSpark04
	SEMPSparkTex(4)=SEMPSpark05
	SEMPSparkTex(5)=SEMPSpark06
	SEMPSparkTex(6)=SEMPSpark07
	SEMPSparkTex(7)=SEMPSpark08
	SEMPSparkTex(8)=SEMPSpark09
	SEMPSparkTex(9)=SEMPSpark10
	SEMPSparkTex(10)=SEMPSpark11
	SEMPSparkTex(11)=SEMPSpark12
	SEMPSparkTex(12)=SEMPSpark13
	SEMPSparkTex(13)=SEMPSpark14
	SEMPSparkTex(14)=SEMPSpark15
	SEMPSparkTex(15)=SEMPSpark16
	
	SEMPSparkMesh(0)=SEMPSparks01
	SEMPSparkMesh(1)=SEMPSparks02
	SEMPSparkMesh(2)=SEMPSparks03
	SEMPSparkMesh(3)=SEMPSparks04
	
	SparkOdds=0.550000
	
	Physics=PHYS_Rotating
	bFixedRotationDir=True
	RotationRate=(Pitch=500000,Yaw=500000)
}
