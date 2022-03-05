//////////////////////////////////////////////////////////////
//				Feralidragon (20-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanSkyFireMegaProjSmokeB expands VulcanSkyFireMegaProjSmoke;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		Spawn(Class'VulcanSkyFireMegaProjSmoke');
	Super.PostBeginPlay();
}

defaultproperties
{
	Style=STY_Modulated
	Texture=NWBlackASmk01
	MultiSkins(0)=NWBlackASmk01
	MultiSkins(1)=NWBlackASmk02
	MultiSkins(2)=NWBlackASmk03
	MultiSkins(3)=NWBlackASmk04
	MultiSkins(4)=NWBlackASmk05
	MultiSkins(5)=NWBlackASmk06
	MultiSkins(6)=NWBlackASmk07
	MultiSkins(7)=NWBlackASmk08

	ScaleGlow=1.000000
	bWhiteSmoke=False
}
