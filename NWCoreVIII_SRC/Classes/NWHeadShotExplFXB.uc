//////////////////////////////////////////////////////////////
//				Feralidragon (27-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWHeadShotExplFXB expands NWHeadShotExplFXA;

#exec AUDIO IMPORT NAME="NWHeadshot" FILE=SOUNDS\NWHeadshot.wav GROUP="Blood"

defaultproperties
{
	EffectSound1=NWHeadshot
	SndVol=100.000000
	SndRadius=2000.000000
	
	Style=STY_Modulated
	Texture=BloodExplModA01
	bSpawnPieces=True
}
