//////////////////////////////////////////////////////////////
//				Feralidragon (26-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class EMPSparksExplCombo expands EMPSparksExpl;

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=EMPSparks01
	
	bUnlit=True
	ScaleGlow=5.000000
	DrawScale=0.250000
	Style=STY_Translucent
	
	LifeSpan=0.750000
	MaxDrawScale=2.500000
	
	SparkOdds=0.750000
	
	Physics=PHYS_Rotating
	bFixedRotationDir=True
	RotationRate=(Pitch=500000,Yaw=500000)
}
