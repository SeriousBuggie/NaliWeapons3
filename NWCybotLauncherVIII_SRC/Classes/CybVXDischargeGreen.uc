//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVXDischargeGreen expands CybVXDischargeRed;

#exec TEXTURE IMPORT NAME=VXElectricGreen01 FILE=CORONAS\VXElectricGreen01.bmp GROUP=ElecFX LODSET=2
#exec TEXTURE IMPORT NAME=VXElectricGreen02 FILE=CORONAS\VXElectricGreen02.bmp GROUP=ElecFX LODSET=2
#exec TEXTURE IMPORT NAME=VXElectricGreen03 FILE=CORONAS\VXElectricGreen03.bmp GROUP=ElecFX LODSET=2
#exec TEXTURE IMPORT NAME=VXElectricGreen04 FILE=CORONAS\VXElectricGreen04.bmp GROUP=ElecFX LODSET=2

defaultproperties
{
	MultiSkins(1)=VXElectricGreen01
	
	ElectricSeqTex(0)=VXElectricGreen01
	ElectricSeqTex(1)=VXElectricGreen02
	ElectricSeqTex(2)=VXElectricGreen03
	ElectricSeqTex(3)=VXElectricGreen04
}
