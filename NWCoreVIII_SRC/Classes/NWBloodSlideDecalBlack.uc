//////////////////////////////////////////////////////////////
//				Feralidragon (01-02-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBloodSlideDecalBlack expands NWBloodSlideDecal;

#exec TEXTURE IMPORT NAME=NWBldBlackSlideDecal01 FILE=EFFECTS\BLOOD\Slide\NWBldBlackSlideDecal01.bmp GROUP=Slide
#exec TEXTURE IMPORT NAME=NWBldBlackSlideDecal02 FILE=EFFECTS\BLOOD\Slide\NWBldBlackSlideDecal02.bmp GROUP=Slide
#exec TEXTURE IMPORT NAME=NWBldBlackSlideDecal03 FILE=EFFECTS\BLOOD\Slide\NWBldBlackSlideDecal03.bmp GROUP=Slide
#exec TEXTURE IMPORT NAME=NWBldBlackSlideDecal04 FILE=EFFECTS\BLOOD\Slide\NWBldBlackSlideDecal04.bmp GROUP=Slide

defaultproperties
{
	Texture=NWBldBlackSlideDecal01
	
	BloodTex(0)=NWBldBlackSlideDecal01
	BloodTex(1)=NWBldBlackSlideDecal02
	BloodTex(2)=NWBldBlackSlideDecal03
	BloodTex(3)=NWBldBlackSlideDecal04
	BloodTex(4)=NWBldBlackSlideDecal01
	BloodTex(5)=NWBldBlackSlideDecal02
	BloodTex(6)=NWBldBlackSlideDecal03
}
