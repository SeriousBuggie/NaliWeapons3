//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SBoltTraceEnd expands SBoltTrace;

#exec TEXTURE IMPORT NAME=SLightning1End FILE=Effects\SLightning1End.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=SLightning2End FILE=Effects\SLightning2End.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=SLightning3End FILE=Effects\SLightning3End.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=SLightning4End FILE=Effects\SLightning4End.bmp GROUP=Effects FLAGS=2

defaultproperties
{
	RandLightning(0)=SLightning1End
	RandLightning(1)=SLightning2End
	RandLightning(2)=SLightning3End
	RandLightning(3)=SLightning4End
	
	MultiSkins(1)=SLightning1End
	MultiSkins(2)=SLightning2End
	MultiSkins(3)=SLightning3End
	MultiSkins(4)=SLightning4End
}
