//////////////////////////////////////////////////////////////
//				Feralidragon (05-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezeProjRemainLava expands FreezeProjRemain;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && LifeSpan <= 1.0)
		Style = STY_Translucent;
	Super.Tick(Delta);
}

defaultproperties
{
	Style=STY_Normal
	ScaleGlow=2.500000
	bMeshEnviroMap=False
	MultiSkins(1)=IceFlamesBaseSk
}
