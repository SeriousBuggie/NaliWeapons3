//////////////////////////////////////////////////////////////
//				Feralidragon (14-11-2010)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRTraceStart expands IRPRTrace;

#exec TEXTURE IMPORT NAME=IRPRTraceStartRed FILE=Coronas\IRPRTraceStartRed.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=IRPRTraceStartBlue FILE=Coronas\IRPRTraceStartBlue.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=IRPRTraceStartGreen FILE=Coronas\IRPRTraceStartGreen.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=IRPRTraceStartYellow FILE=Coronas\IRPRTraceStartYellow.bmp GROUP=Effects FLAGS=2

defaultproperties
{
	MultiSkins(1)=IRPRTraceStartRed
	
	TeamTex(0)=IRPRTraceStartRed
	TeamTex(1)=IRPRTraceStartBlue
	TeamTex(2)=IRPRTraceStartGreen
	TeamTex(3)=IRPRTraceStartYellow
}
