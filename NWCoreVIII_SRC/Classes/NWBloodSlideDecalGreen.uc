//////////////////////////////////////////////////////////////
//				Feralidragon (01-02-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBloodSlideDecalGreen expands NWBloodSlideDecal;

#exec TEXTURE IMPORT NAME=NWBldGreenSlideDecal01 FILE=EFFECTS\BLOOD\Slide\NWBldGreenSlideDecal01.bmp GROUP=Slide
#exec TEXTURE IMPORT NAME=NWBldGreenSlideDecal02 FILE=EFFECTS\BLOOD\Slide\NWBldGreenSlideDecal02.bmp GROUP=Slide
#exec TEXTURE IMPORT NAME=NWBldGreenSlideDecal03 FILE=EFFECTS\BLOOD\Slide\NWBldGreenSlideDecal03.bmp GROUP=Slide
#exec TEXTURE IMPORT NAME=NWBldGreenSlideDecal04 FILE=EFFECTS\BLOOD\Slide\NWBldGreenSlideDecal04.bmp GROUP=Slide

defaultproperties
{
	Texture=NWBldGreenSlideDecal01
	
	BloodTex(0)=NWBldGreenSlideDecal01
	BloodTex(1)=NWBldGreenSlideDecal02
	BloodTex(2)=NWBldGreenSlideDecal03
	BloodTex(3)=NWBldGreenSlideDecal04
	BloodTex(4)=NWBldGreenSlideDecal01
	BloodTex(5)=NWBldGreenSlideDecal02
	BloodTex(6)=NWBldGreenSlideDecal03
}
