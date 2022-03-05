//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltTraceEnd expands BoltTrace;

#exec TEXTURE IMPORT NAME=Lightning1End FILE=Effects\Lightning1End.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=Lightning2End FILE=Effects\Lightning2End.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=Lightning3End FILE=Effects\Lightning3End.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=Lightning4End FILE=Effects\Lightning4End.bmp GROUP=Effects FLAGS=2

defaultproperties
{
	RandLightning(0)=Lightning1End
	RandLightning(1)=Lightning2End
	RandLightning(2)=Lightning3End
	RandLightning(3)=Lightning4End
	
	MultiSkins(1)=Lightning1End
	MultiSkins(2)=Lightning2End
	MultiSkins(3)=Lightning3End
	MultiSkins(4)=Lightning4End
}
