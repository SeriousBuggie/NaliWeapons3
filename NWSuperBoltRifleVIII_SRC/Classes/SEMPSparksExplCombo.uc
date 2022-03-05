//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2013)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SEMPSparksExplCombo expands SEMPSparksExpl;

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=SEMPSparks01
	
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
