//////////////////////////////////////////////////////////////
//				Feralidragon (14-11-2010)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRTraceEnd expands IRPRTrace;

#exec TEXTURE IMPORT NAME=IRPRTraceEndRed FILE=Coronas\IRPRTraceEndRed.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=IRPRTraceEndBlue FILE=Coronas\IRPRTraceEndBlue.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=IRPRTraceEndGreen FILE=Coronas\IRPRTraceEndGreen.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=IRPRTraceEndYellow FILE=Coronas\IRPRTraceEndYellow.bmp GROUP=Effects FLAGS=2

defaultproperties
{
	MultiSkins(1)=IRPRTraceEndRed
	
	TeamTex(0)=IRPRTraceEndRed
	TeamTex(1)=IRPRTraceEndBlue
	TeamTex(2)=IRPRTraceEndGreen
	TeamTex(3)=IRPRTraceEndYellow
}
