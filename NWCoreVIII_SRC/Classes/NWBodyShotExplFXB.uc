//////////////////////////////////////////////////////////////
//				Feralidragon (27-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBodyShotExplFXB expands NWBodyShotExplFXA;

#exec AUDIO IMPORT NAME="NWBodyshot" FILE=SOUNDS\NWBodyshot.wav GROUP="Blood"

defaultproperties
{
	EffectSound1=NWBodyshot
	SndVol=200.000000
	SndRadius=2500.000000
	
	Style=STY_Modulated
	Texture=BloodExplModA01
	bSpawnPieces=True
}
