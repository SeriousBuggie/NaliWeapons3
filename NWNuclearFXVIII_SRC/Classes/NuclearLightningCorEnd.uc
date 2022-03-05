//////////////////////////////////////////////////////////////
//				Feralidragon (21-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearLightningCorEnd expands NuclearLightningCor;

#exec TEXTURE IMPORT NAME=ElectricPallete FILE=PALLETES\ElectricPallete.bmp GROUP=Coronas LODSET=2

#exec AUDIO IMPORT NAME="NukeElectricExplSnd01" FILE=SOUNDS\NukeElectricExplSnd01.wav GROUP="NuclearElectic"
#exec AUDIO IMPORT NAME="NukeElectricExplSnd02" FILE=SOUNDS\NukeElectricExplSnd02.wav GROUP="NuclearElectic"
#exec AUDIO IMPORT NAME="NukeElectricExplSnd03" FILE=SOUNDS\NukeElectricExplSnd03.wav GROUP="NuclearElectic"

var() sound NkElectricSnd[3];

function MakeSound()
{
	if (NuclearExplosionLevelE(Owner) != None)
		PlaySound(NkElectricSnd[Rand(ArrayCount(NkElectricSnd))],, 200.0,, VSize(Location - NuclearExplosionLevelE(Owner).Location)/8.0);
}

defaultproperties
{	
	NkElectricSnd(0)=NukeElectricExplSnd01
	NkElectricSnd(1)=NukeElectricExplSnd02
	NkElectricSnd(2)=NukeElectricExplSnd03
	
	// Skin=ElectricPallete
	// LightBrightness=75
	// LightType=LT_TexturePaletteOnce
	// LightEffect=LE_NonIncidence
	// LightHue=32
	// LightSaturation=79
	// LightRadius=14
}
