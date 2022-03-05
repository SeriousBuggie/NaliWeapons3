//////////////////////////////////////////////////////////////
//				Feralidragon (26-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarNeblSmkB expands UltimaSolarNeblSmkW;

var() float ElectricSparkOdds;

simulated function Tick(float Delta)
{
local UltimaSolarNeblSmkE uSNS;

	Super.Tick(Delta);
	if (Level.NetMode != NM_DedicatedServer && FRand() <= ElectricSparkOdds)
	{
		uSNS = Spawn(Class'UltimaSolarNeblSmkE');
		uSNS.DrawScale = DrawScale;
	}
}

defaultproperties
{
    ScaleGlow=0.500000
	Texture=NWBlackHSmk01
	bWhiteSmoke=False
	Style=STY_Modulated
	
	ElectricSparkOdds=0.005000
}
