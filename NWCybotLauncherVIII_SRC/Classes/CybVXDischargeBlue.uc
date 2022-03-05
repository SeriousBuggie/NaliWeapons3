//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVXDischargeBlue expands CybVXDischargeRed;

#exec TEXTURE IMPORT NAME=VXElectricBlue01 FILE=CORONAS\VXElectricBlue01.bmp GROUP=ElecFX LODSET=2
#exec TEXTURE IMPORT NAME=VXElectricBlue02 FILE=CORONAS\VXElectricBlue02.bmp GROUP=ElecFX LODSET=2
#exec TEXTURE IMPORT NAME=VXElectricBlue03 FILE=CORONAS\VXElectricBlue03.bmp GROUP=ElecFX LODSET=2
#exec TEXTURE IMPORT NAME=VXElectricBlue04 FILE=CORONAS\VXElectricBlue04.bmp GROUP=ElecFX LODSET=2

defaultproperties
{
	MultiSkins(1)=VXElectricBlue01
	
	ElectricSeqTex(0)=VXElectricBlue01
	ElectricSeqTex(1)=VXElectricBlue02
	ElectricSeqTex(2)=VXElectricBlue03
	ElectricSeqTex(3)=VXElectricBlue04
}
