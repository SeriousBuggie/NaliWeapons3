//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVXDischargeYellow expands CybVXDischargeRed;

#exec TEXTURE IMPORT NAME=VXElectricYellow01 FILE=CORONAS\VXElectricYellow01.bmp GROUP=ElecFX LODSET=2
#exec TEXTURE IMPORT NAME=VXElectricYellow02 FILE=CORONAS\VXElectricYellow02.bmp GROUP=ElecFX LODSET=2
#exec TEXTURE IMPORT NAME=VXElectricYellow03 FILE=CORONAS\VXElectricYellow03.bmp GROUP=ElecFX LODSET=2
#exec TEXTURE IMPORT NAME=VXElectricYellow04 FILE=CORONAS\VXElectricYellow04.bmp GROUP=ElecFX LODSET=2

defaultproperties
{
	MultiSkins(1)=VXElectricYellow01
	
	ElectricSeqTex(0)=VXElectricYellow01
	ElectricSeqTex(1)=VXElectricYellow02
	ElectricSeqTex(2)=VXElectricYellow03
	ElectricSeqTex(3)=VXElectricYellow04
}
