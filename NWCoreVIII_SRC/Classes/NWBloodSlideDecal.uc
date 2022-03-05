//////////////////////////////////////////////////////////////
//				Feralidragon (01-02-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBloodSlideDecal expands NWBloodDecal;

#exec TEXTURE IMPORT NAME=NWBldRedSlideDecal01 FILE=EFFECTS\BLOOD\Slide\NWBldRedSlideDecal01.bmp GROUP=Slide
#exec TEXTURE IMPORT NAME=NWBldRedSlideDecal02 FILE=EFFECTS\BLOOD\Slide\NWBldRedSlideDecal02.bmp GROUP=Slide
#exec TEXTURE IMPORT NAME=NWBldRedSlideDecal03 FILE=EFFECTS\BLOOD\Slide\NWBldRedSlideDecal03.bmp GROUP=Slide
#exec TEXTURE IMPORT NAME=NWBldRedSlideDecal04 FILE=EFFECTS\BLOOD\Slide\NWBldRedSlideDecal04.bmp GROUP=Slide

defaultproperties
{
	Texture=NWBldRedSlideDecal01
	DrawScale=1.000000
	MinDrawScale=1.000000
	MaxDrawScale=1.000000
	
	DecalWidth=16.000000
	DecalHeight=32.000000
	
	BloodTex(0)=NWBldRedSlideDecal01
	BloodTex(1)=NWBldRedSlideDecal02
	BloodTex(2)=NWBldRedSlideDecal03
	BloodTex(3)=NWBldRedSlideDecal04
	BloodTex(4)=NWBldRedSlideDecal01
	BloodTex(5)=NWBldRedSlideDecal02
	BloodTex(6)=NWBldRedSlideDecal03
}
