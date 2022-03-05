//////////////////////////////////////////////////////////////
//				Feralidragon (20-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanSkyFireInitSmoke expands NWBaseCloud;

defaultproperties
{
	Mesh=LodMesh'Botpack.Smokebm'
	DrawScale=3.000000
	MinDrawScale=2.000000
	ScaleGlow=0.350000
	LifeSpan=3.200000
	FadeInTime=0.200000
	FadeOutTime=3.000000

	Style=STY_Translucent
	Texture=NukeWSmk01
	MultiSkins(0)=NukeWSmk01
	MultiSkins(1)=NukeWSmk02
	MultiSkins(2)=NukeWSmk03
	MultiSkins(3)=NukeWSmk04
	MultiSkins(4)=NukeWSmk05
	MultiSkins(5)=NukeWSmk06
	MultiSkins(6)=NukeWSmk07
	MultiSkins(7)=NukeWSmk08
	
	bNetTemporary=True
	bAnimByOwner=False
	bWhiteSmoke=True
}
