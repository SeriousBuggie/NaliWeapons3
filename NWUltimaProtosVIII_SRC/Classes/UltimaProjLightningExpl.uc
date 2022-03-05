//////////////////////////////////////////////////////////////
//				Feralidragon (05-10-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProjLightningExpl expands NukeElectricExpl;

var() sound RndSnd[3];

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	PlaySound(RndSnd[Rand(ArrayCount(RndSnd))],, 5.0,, 600.0);
}

defaultproperties
{
	Skin=Texture'UnrealShare.Effects.BlueLightPal3'
	
	RndSnd(0)=Sound'NukeElectricExplSnd01'
	RndSnd(1)=Sound'NukeElectricExplSnd02'
	RndSnd(2)=Sound'NukeElectricExplSnd03'
}
