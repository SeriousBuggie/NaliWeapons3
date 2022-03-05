//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SBoltTraceStart expands SBoltTrace;

#exec TEXTURE IMPORT NAME=SLightning1Start FILE=Effects\SLightning1Start.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=SLightning2Start FILE=Effects\SLightning2Start.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=SLightning3Start FILE=Effects\SLightning3Start.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=SLightning4Start FILE=Effects\SLightning4Start.bmp GROUP=Effects FLAGS=2

defaultproperties
{
	RandLightning(0)=SLightning1Start
	RandLightning(1)=SLightning2Start
	RandLightning(2)=SLightning3Start
	RandLightning(3)=SLightning4Start
	
	MultiSkins(1)=SLightning1Start
	MultiSkins(2)=SLightning2Start
	MultiSkins(3)=SLightning3Start
	MultiSkins(4)=SLightning4Start
}
