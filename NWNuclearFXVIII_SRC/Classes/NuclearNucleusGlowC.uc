//////////////////////////////////////////////////////////////
//				Feralidragon (04-06-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearNucleusGlowC expands NuclearNucleusGlowE;

#exec TEXTURE IMPORT NAME=NucleusCore03 FILE=CORONAS\NucleusCore03.bmp GROUP=Coronas

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	if (Level.NetMode != NM_DedicatedServer && LifeSpan < 0.5)
		DrawScale += (DrawScale*(0.5-LifeSpan)*20);
}

defaultproperties
{
	MultiSkins(1)=NucleusCore03
	
	MinDrawScale=0.250000
	FadeInTime=0.250000
	FadeOutTime=2.50000
	LifeSpan=4.000000
	DrawScale=6.000000
	ScaleGlow=3.500000
}
