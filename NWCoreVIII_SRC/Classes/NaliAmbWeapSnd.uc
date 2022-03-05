//////////////////////////////////////////////////////////////
//	Nali Weapons III Ambient Sound on weapons base class
//				Feralidragon (24-07-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NaliAmbWeapSnd expands Effects;

defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	Physics=PHYS_Trailer
	bTrailerSameRotation=True
	LifeSpan=0.000000
	Mass=0.000000
	
	DrawType=DT_Sprite
	Style=STY_Translucent
	bHidden=False
	Texture=TranslucInvis
	DrawScale=0.100000
}