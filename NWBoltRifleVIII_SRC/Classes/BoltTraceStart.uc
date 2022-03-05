//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltTraceStart expands BoltTrace;

#exec TEXTURE IMPORT NAME=Lightning1Start FILE=Effects\Lightning1Start.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=Lightning2Start FILE=Effects\Lightning2Start.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=Lightning3Start FILE=Effects\Lightning3Start.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=Lightning4Start FILE=Effects\Lightning4Start.bmp GROUP=Effects FLAGS=2

defaultproperties
{
	RandLightning(0)=Lightning1Start
	RandLightning(1)=Lightning2Start
	RandLightning(2)=Lightning3Start
	RandLightning(3)=Lightning4Start
	
	MultiSkins(1)=Lightning1Start
	MultiSkins(2)=Lightning2Start
	MultiSkins(3)=Lightning3Start
	MultiSkins(4)=Lightning4Start
}
