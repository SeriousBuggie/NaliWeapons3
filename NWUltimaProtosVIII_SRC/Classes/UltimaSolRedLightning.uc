//////////////////////////////////////////////////////////////
//				Feralidragon (15-01-2014)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolRedLightning expands UltimaSolLightning;

#exec AUDIO IMPORT NAME="UltimaSolRedLightnSnd01" FILE=SOUNDS\UltimaSolRedLightnSnd01.wav GROUP="UltimaSolFX"
#exec AUDIO IMPORT NAME="UltimaSolRedLightnSnd02" FILE=SOUNDS\UltimaSolRedLightnSnd02.wav GROUP="UltimaSolFX"
#exec AUDIO IMPORT NAME="UltimaSolRedLightnSnd03" FILE=SOUNDS\UltimaSolRedLightnSnd03.wav GROUP="UltimaSolFX"
#exec AUDIO IMPORT NAME="UltimaSolRedLightnSnd04" FILE=SOUNDS\UltimaSolRedLightnSnd04.wav GROUP="UltimaSolFX"
#exec AUDIO IMPORT NAME="UltimaSolRedLightnSnd05" FILE=SOUNDS\UltimaSolRedLightnSnd05.wav GROUP="UltimaSolFX"

#exec OBJ LOAD FILE=Textures\UltimaSolEnergyRedFX.utx PACKAGE=NWUltimaProtosVIII_SRC.UltimaSolEnergyRedFX


defaultproperties
{
	bUnlit=True
	LifeSpan=0.300000
	DrawScale=1.00000
	ScaleGlow=2.000000
	Style=STY_Translucent
	
	MultiSkins(1)=UltimaSolRedLightnFX01
	
	FadeInTime=0.050000
	FadeOutTime=0.000000
	ElectricalTransTime=0.100000
	
	RandElectricTex(0)=UltimaSolRedLightnFX01
	RandElectricTex(1)=UltimaSolRedLightnFX02
	RandElectricTex(2)=UltimaSolRedLightnFX03
	RandElectricTex(3)=UltimaSolRedLightnFX04
	RandElectricTex(4)=UltimaSolRedLightnFX05
	RandElectricTex(5)=UltimaSolRedLightnFX06
	RandElectricTex(6)=UltimaSolRedLightnFX07
	RandElectricTex(7)=UltimaSolRedLightnFX08
	
	ElectricSnd(0)=UltimaSolRedLightnSnd01
	ElectricSnd(1)=UltimaSolRedLightnSnd02
	ElectricSnd(2)=UltimaSolRedLightnSnd03
	ElectricSnd(3)=UltimaSolRedLightnSnd04
	ElectricSnd(4)=UltimaSolRedLightnSnd05
	
	ElectricSndOdds=0.100000
	ElectricSndVol=0.350000
	ElectricSndRadius=30000.000000
	GlowMaxCoef=1.000000
	GlowMinCoef=0.200000
}
