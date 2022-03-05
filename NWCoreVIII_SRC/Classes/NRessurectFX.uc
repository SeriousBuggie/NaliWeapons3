//////////////////////////////////////////////////////////////
//	Nali Weapons III pickups "Ressurect" effect (for custom respawns)
//				Feralidragon (24-03-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NRessurectFX expands NWeaponOverFX;

#exec TEXTURE IMPORT NAME=MaskInvis FILE=Skins\MaskInvis.bmp GROUP=Skins LODSET=2

#exec TEXTURE IMPORT NAME=RessurectFX01 FILE=RessurectionFX\RessurectFX01.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX02 FILE=RessurectionFX\RessurectFX02.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX03 FILE=RessurectionFX\RessurectFX03.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX04 FILE=RessurectionFX\RessurectFX04.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX05 FILE=RessurectionFX\RessurectFX05.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX06 FILE=RessurectionFX\RessurectFX06.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX07 FILE=RessurectionFX\RessurectFX07.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX08 FILE=RessurectionFX\RessurectFX08.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX09 FILE=RessurectionFX\RessurectFX09.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX10 FILE=RessurectionFX\RessurectFX10.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX11 FILE=RessurectionFX\RessurectFX11.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX12 FILE=RessurectionFX\RessurectFX12.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX13 FILE=RessurectionFX\RessurectFX13.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX14 FILE=RessurectionFX\RessurectFX14.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX15 FILE=RessurectionFX\RessurectFX15.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX16 FILE=RessurectionFX\RessurectFX16.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX17 FILE=RessurectionFX\RessurectFX17.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX18 FILE=RessurectionFX\RessurectFX18.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX19 FILE=RessurectionFX\RessurectFX19.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX20 FILE=RessurectionFX\RessurectFX20.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX21 FILE=RessurectionFX\RessurectFX21.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX22 FILE=RessurectionFX\RessurectFX22.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX23 FILE=RessurectionFX\RessurectFX23.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX24 FILE=RessurectionFX\RessurectFX24.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX25 FILE=RessurectionFX\RessurectFX25.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX26 FILE=RessurectionFX\RessurectFX26.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX27 FILE=RessurectionFX\RessurectFX27.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX28 FILE=RessurectionFX\RessurectFX28.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX29 FILE=RessurectionFX\RessurectFX29.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX30 FILE=RessurectionFX\RessurectFX30.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX31 FILE=RessurectionFX\RessurectFX31.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX32 FILE=RessurectionFX\RessurectFX32.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX33 FILE=RessurectionFX\RessurectFX33.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX34 FILE=RessurectionFX\RessurectFX34.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX35 FILE=RessurectionFX\RessurectFX35.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX36 FILE=RessurectionFX\RessurectFX36.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX37 FILE=RessurectionFX\RessurectFX37.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX38 FILE=RessurectionFX\RessurectFX38.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX39 FILE=RessurectionFX\RessurectFX39.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX40 FILE=RessurectionFX\RessurectFX40.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX41 FILE=RessurectionFX\RessurectFX41.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX42 FILE=RessurectionFX\RessurectFX42.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX43 FILE=RessurectionFX\RessurectFX43.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX44 FILE=RessurectionFX\RessurectFX44.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX45 FILE=RessurectionFX\RessurectFX45.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX46 FILE=RessurectionFX\RessurectFX46.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX47 FILE=RessurectionFX\RessurectFX47.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX48 FILE=RessurectionFX\RessurectFX48.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX49 FILE=RessurectionFX\RessurectFX49.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX50 FILE=RessurectionFX\RessurectFX50.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX51 FILE=RessurectionFX\RessurectFX51.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX52 FILE=RessurectionFX\RessurectFX52.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX53 FILE=RessurectionFX\RessurectFX53.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX54 FILE=RessurectionFX\RessurectFX54.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX55 FILE=RessurectionFX\RessurectFX55.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX56 FILE=RessurectionFX\RessurectFX56.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX57 FILE=RessurectionFX\RessurectFX57.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX58 FILE=RessurectionFX\RessurectFX58.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX59 FILE=RessurectionFX\RessurectFX59.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX60 FILE=RessurectionFX\RessurectFX60.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX61 FILE=RessurectionFX\RessurectFX61.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX62 FILE=RessurectionFX\RessurectFX62.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX63 FILE=RessurectionFX\RessurectFX63.bmp GROUP=RessurectN LODSET=2
#exec TEXTURE IMPORT NAME=RessurectFX64 FILE=RessurectionFX\RessurectFX64.bmp GROUP=RessurectN LODSET=2

#exec TEXTURE IMPORT NAME=RessurectRFX01 FILE=RessurectionRedFX\RessurectRFX01.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX02 FILE=RessurectionRedFX\RessurectRFX02.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX03 FILE=RessurectionRedFX\RessurectRFX03.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX04 FILE=RessurectionRedFX\RessurectRFX04.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX05 FILE=RessurectionRedFX\RessurectRFX05.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX06 FILE=RessurectionRedFX\RessurectRFX06.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX07 FILE=RessurectionRedFX\RessurectRFX07.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX08 FILE=RessurectionRedFX\RessurectRFX08.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX09 FILE=RessurectionRedFX\RessurectRFX09.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX10 FILE=RessurectionRedFX\RessurectRFX10.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX11 FILE=RessurectionRedFX\RessurectRFX11.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX12 FILE=RessurectionRedFX\RessurectRFX12.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX13 FILE=RessurectionRedFX\RessurectRFX13.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX14 FILE=RessurectionRedFX\RessurectRFX14.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX15 FILE=RessurectionRedFX\RessurectRFX15.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX16 FILE=RessurectionRedFX\RessurectRFX16.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX17 FILE=RessurectionRedFX\RessurectRFX17.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX18 FILE=RessurectionRedFX\RessurectRFX18.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX19 FILE=RessurectionRedFX\RessurectRFX19.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX20 FILE=RessurectionRedFX\RessurectRFX20.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX21 FILE=RessurectionRedFX\RessurectRFX21.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX22 FILE=RessurectionRedFX\RessurectRFX22.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX23 FILE=RessurectionRedFX\RessurectRFX23.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX24 FILE=RessurectionRedFX\RessurectRFX24.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX25 FILE=RessurectionRedFX\RessurectRFX25.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX26 FILE=RessurectionRedFX\RessurectRFX26.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX27 FILE=RessurectionRedFX\RessurectRFX27.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX28 FILE=RessurectionRedFX\RessurectRFX28.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX29 FILE=RessurectionRedFX\RessurectRFX29.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX30 FILE=RessurectionRedFX\RessurectRFX30.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX31 FILE=RessurectionRedFX\RessurectRFX31.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX32 FILE=RessurectionRedFX\RessurectRFX32.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX33 FILE=RessurectionRedFX\RessurectRFX33.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX34 FILE=RessurectionRedFX\RessurectRFX34.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX35 FILE=RessurectionRedFX\RessurectRFX35.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX36 FILE=RessurectionRedFX\RessurectRFX36.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX37 FILE=RessurectionRedFX\RessurectRFX37.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX38 FILE=RessurectionRedFX\RessurectRFX38.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX39 FILE=RessurectionRedFX\RessurectRFX39.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX40 FILE=RessurectionRedFX\RessurectRFX40.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX41 FILE=RessurectionRedFX\RessurectRFX41.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX42 FILE=RessurectionRedFX\RessurectRFX42.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX43 FILE=RessurectionRedFX\RessurectRFX43.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX44 FILE=RessurectionRedFX\RessurectRFX44.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX45 FILE=RessurectionRedFX\RessurectRFX45.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX46 FILE=RessurectionRedFX\RessurectRFX46.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX47 FILE=RessurectionRedFX\RessurectRFX47.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX48 FILE=RessurectionRedFX\RessurectRFX48.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX49 FILE=RessurectionRedFX\RessurectRFX49.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX50 FILE=RessurectionRedFX\RessurectRFX50.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX51 FILE=RessurectionRedFX\RessurectRFX51.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX52 FILE=RessurectionRedFX\RessurectRFX52.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX53 FILE=RessurectionRedFX\RessurectRFX53.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX54 FILE=RessurectionRedFX\RessurectRFX54.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX55 FILE=RessurectionRedFX\RessurectRFX55.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX56 FILE=RessurectionRedFX\RessurectRFX56.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX57 FILE=RessurectionRedFX\RessurectRFX57.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX58 FILE=RessurectionRedFX\RessurectRFX58.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX59 FILE=RessurectionRedFX\RessurectRFX59.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX60 FILE=RessurectionRedFX\RessurectRFX60.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX61 FILE=RessurectionRedFX\RessurectRFX61.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX62 FILE=RessurectionRedFX\RessurectRFX62.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX63 FILE=RessurectionRedFX\RessurectRFX63.bmp GROUP=RessurectRed LODSET=2
#exec TEXTURE IMPORT NAME=RessurectRFX64 FILE=RessurectionRedFX\RessurectRFX64.bmp GROUP=RessurectRed LODSET=2

#exec TEXTURE IMPORT NAME=RessurectBFX01 FILE=RessurectionBlueFX\RessurectBFX01.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX02 FILE=RessurectionBlueFX\RessurectBFX02.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX03 FILE=RessurectionBlueFX\RessurectBFX03.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX04 FILE=RessurectionBlueFX\RessurectBFX04.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX05 FILE=RessurectionBlueFX\RessurectBFX05.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX06 FILE=RessurectionBlueFX\RessurectBFX06.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX07 FILE=RessurectionBlueFX\RessurectBFX07.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX08 FILE=RessurectionBlueFX\RessurectBFX08.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX09 FILE=RessurectionBlueFX\RessurectBFX09.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX10 FILE=RessurectionBlueFX\RessurectBFX10.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX11 FILE=RessurectionBlueFX\RessurectBFX11.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX12 FILE=RessurectionBlueFX\RessurectBFX12.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX13 FILE=RessurectionBlueFX\RessurectBFX13.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX14 FILE=RessurectionBlueFX\RessurectBFX14.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX15 FILE=RessurectionBlueFX\RessurectBFX15.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX16 FILE=RessurectionBlueFX\RessurectBFX16.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX17 FILE=RessurectionBlueFX\RessurectBFX17.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX18 FILE=RessurectionBlueFX\RessurectBFX18.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX19 FILE=RessurectionBlueFX\RessurectBFX19.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX20 FILE=RessurectionBlueFX\RessurectBFX20.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX21 FILE=RessurectionBlueFX\RessurectBFX21.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX22 FILE=RessurectionBlueFX\RessurectBFX22.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX23 FILE=RessurectionBlueFX\RessurectBFX23.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX24 FILE=RessurectionBlueFX\RessurectBFX24.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX25 FILE=RessurectionBlueFX\RessurectBFX25.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX26 FILE=RessurectionBlueFX\RessurectBFX26.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX27 FILE=RessurectionBlueFX\RessurectBFX27.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX28 FILE=RessurectionBlueFX\RessurectBFX28.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX29 FILE=RessurectionBlueFX\RessurectBFX29.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX30 FILE=RessurectionBlueFX\RessurectBFX30.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX31 FILE=RessurectionBlueFX\RessurectBFX31.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX32 FILE=RessurectionBlueFX\RessurectBFX32.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX33 FILE=RessurectionBlueFX\RessurectBFX33.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX34 FILE=RessurectionBlueFX\RessurectBFX34.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX35 FILE=RessurectionBlueFX\RessurectBFX35.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX36 FILE=RessurectionBlueFX\RessurectBFX36.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX37 FILE=RessurectionBlueFX\RessurectBFX37.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX38 FILE=RessurectionBlueFX\RessurectBFX38.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX39 FILE=RessurectionBlueFX\RessurectBFX39.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX40 FILE=RessurectionBlueFX\RessurectBFX40.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX41 FILE=RessurectionBlueFX\RessurectBFX41.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX42 FILE=RessurectionBlueFX\RessurectBFX42.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX43 FILE=RessurectionBlueFX\RessurectBFX43.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX44 FILE=RessurectionBlueFX\RessurectBFX44.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX45 FILE=RessurectionBlueFX\RessurectBFX45.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX46 FILE=RessurectionBlueFX\RessurectBFX46.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX47 FILE=RessurectionBlueFX\RessurectBFX47.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX48 FILE=RessurectionBlueFX\RessurectBFX48.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX49 FILE=RessurectionBlueFX\RessurectBFX49.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX50 FILE=RessurectionBlueFX\RessurectBFX50.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX51 FILE=RessurectionBlueFX\RessurectBFX51.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX52 FILE=RessurectionBlueFX\RessurectBFX52.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX53 FILE=RessurectionBlueFX\RessurectBFX53.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX54 FILE=RessurectionBlueFX\RessurectBFX54.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX55 FILE=RessurectionBlueFX\RessurectBFX55.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX56 FILE=RessurectionBlueFX\RessurectBFX56.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX57 FILE=RessurectionBlueFX\RessurectBFX57.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX58 FILE=RessurectionBlueFX\RessurectBFX58.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX59 FILE=RessurectionBlueFX\RessurectBFX59.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX60 FILE=RessurectionBlueFX\RessurectBFX60.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX61 FILE=RessurectionBlueFX\RessurectBFX61.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX62 FILE=RessurectionBlueFX\RessurectBFX62.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX63 FILE=RessurectionBlueFX\RessurectBFX63.bmp GROUP=RessurectBlue LODSET=2
#exec TEXTURE IMPORT NAME=RessurectBFX64 FILE=RessurectionBlueFX\RessurectBFX64.bmp GROUP=RessurectBlue LODSET=2

#exec TEXTURE IMPORT NAME=RessurectGFX01 FILE=RessurectionGreenFX\RessurectGFX01.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX02 FILE=RessurectionGreenFX\RessurectGFX02.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX03 FILE=RessurectionGreenFX\RessurectGFX03.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX04 FILE=RessurectionGreenFX\RessurectGFX04.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX05 FILE=RessurectionGreenFX\RessurectGFX05.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX06 FILE=RessurectionGreenFX\RessurectGFX06.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX07 FILE=RessurectionGreenFX\RessurectGFX07.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX08 FILE=RessurectionGreenFX\RessurectGFX08.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX09 FILE=RessurectionGreenFX\RessurectGFX09.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX10 FILE=RessurectionGreenFX\RessurectGFX10.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX11 FILE=RessurectionGreenFX\RessurectGFX11.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX12 FILE=RessurectionGreenFX\RessurectGFX12.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX13 FILE=RessurectionGreenFX\RessurectGFX13.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX14 FILE=RessurectionGreenFX\RessurectGFX14.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX15 FILE=RessurectionGreenFX\RessurectGFX15.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX16 FILE=RessurectionGreenFX\RessurectGFX16.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX17 FILE=RessurectionGreenFX\RessurectGFX17.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX18 FILE=RessurectionGreenFX\RessurectGFX18.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX19 FILE=RessurectionGreenFX\RessurectGFX19.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX20 FILE=RessurectionGreenFX\RessurectGFX20.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX21 FILE=RessurectionGreenFX\RessurectGFX21.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX22 FILE=RessurectionGreenFX\RessurectGFX22.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX23 FILE=RessurectionGreenFX\RessurectGFX23.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX24 FILE=RessurectionGreenFX\RessurectGFX24.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX25 FILE=RessurectionGreenFX\RessurectGFX25.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX26 FILE=RessurectionGreenFX\RessurectGFX26.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX27 FILE=RessurectionGreenFX\RessurectGFX27.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX28 FILE=RessurectionGreenFX\RessurectGFX28.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX29 FILE=RessurectionGreenFX\RessurectGFX29.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX30 FILE=RessurectionGreenFX\RessurectGFX30.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX31 FILE=RessurectionGreenFX\RessurectGFX31.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX32 FILE=RessurectionGreenFX\RessurectGFX32.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX33 FILE=RessurectionGreenFX\RessurectGFX33.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX34 FILE=RessurectionGreenFX\RessurectGFX34.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX35 FILE=RessurectionGreenFX\RessurectGFX35.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX36 FILE=RessurectionGreenFX\RessurectGFX36.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX37 FILE=RessurectionGreenFX\RessurectGFX37.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX38 FILE=RessurectionGreenFX\RessurectGFX38.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX39 FILE=RessurectionGreenFX\RessurectGFX39.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX40 FILE=RessurectionGreenFX\RessurectGFX40.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX41 FILE=RessurectionGreenFX\RessurectGFX41.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX42 FILE=RessurectionGreenFX\RessurectGFX42.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX43 FILE=RessurectionGreenFX\RessurectGFX43.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX44 FILE=RessurectionGreenFX\RessurectGFX44.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX45 FILE=RessurectionGreenFX\RessurectGFX45.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX46 FILE=RessurectionGreenFX\RessurectGFX46.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX47 FILE=RessurectionGreenFX\RessurectGFX47.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX48 FILE=RessurectionGreenFX\RessurectGFX48.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX49 FILE=RessurectionGreenFX\RessurectGFX49.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX50 FILE=RessurectionGreenFX\RessurectGFX50.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX51 FILE=RessurectionGreenFX\RessurectGFX51.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX52 FILE=RessurectionGreenFX\RessurectGFX52.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX53 FILE=RessurectionGreenFX\RessurectGFX53.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX54 FILE=RessurectionGreenFX\RessurectGFX54.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX55 FILE=RessurectionGreenFX\RessurectGFX55.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX56 FILE=RessurectionGreenFX\RessurectGFX56.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX57 FILE=RessurectionGreenFX\RessurectGFX57.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX58 FILE=RessurectionGreenFX\RessurectGFX58.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX59 FILE=RessurectionGreenFX\RessurectGFX59.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX60 FILE=RessurectionGreenFX\RessurectGFX60.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX61 FILE=RessurectionGreenFX\RessurectGFX61.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX62 FILE=RessurectionGreenFX\RessurectGFX62.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX63 FILE=RessurectionGreenFX\RessurectGFX63.bmp GROUP=RessurectGreen LODSET=2
#exec TEXTURE IMPORT NAME=RessurectGFX64 FILE=RessurectionGreenFX\RessurectGFX64.bmp GROUP=RessurectGreen LODSET=2

#exec TEXTURE IMPORT NAME=RessurectYFX01 FILE=RessurectionYellowFX\RessurectYFX01.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX02 FILE=RessurectionYellowFX\RessurectYFX02.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX03 FILE=RessurectionYellowFX\RessurectYFX03.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX04 FILE=RessurectionYellowFX\RessurectYFX04.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX05 FILE=RessurectionYellowFX\RessurectYFX05.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX06 FILE=RessurectionYellowFX\RessurectYFX06.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX07 FILE=RessurectionYellowFX\RessurectYFX07.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX08 FILE=RessurectionYellowFX\RessurectYFX08.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX09 FILE=RessurectionYellowFX\RessurectYFX09.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX10 FILE=RessurectionYellowFX\RessurectYFX10.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX11 FILE=RessurectionYellowFX\RessurectYFX11.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX12 FILE=RessurectionYellowFX\RessurectYFX12.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX13 FILE=RessurectionYellowFX\RessurectYFX13.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX14 FILE=RessurectionYellowFX\RessurectYFX14.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX15 FILE=RessurectionYellowFX\RessurectYFX15.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX16 FILE=RessurectionYellowFX\RessurectYFX16.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX17 FILE=RessurectionYellowFX\RessurectYFX17.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX18 FILE=RessurectionYellowFX\RessurectYFX18.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX19 FILE=RessurectionYellowFX\RessurectYFX19.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX20 FILE=RessurectionYellowFX\RessurectYFX20.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX21 FILE=RessurectionYellowFX\RessurectYFX21.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX22 FILE=RessurectionYellowFX\RessurectYFX22.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX23 FILE=RessurectionYellowFX\RessurectYFX23.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX24 FILE=RessurectionYellowFX\RessurectYFX24.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX25 FILE=RessurectionYellowFX\RessurectYFX25.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX26 FILE=RessurectionYellowFX\RessurectYFX26.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX27 FILE=RessurectionYellowFX\RessurectYFX27.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX28 FILE=RessurectionYellowFX\RessurectYFX28.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX29 FILE=RessurectionYellowFX\RessurectYFX29.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX30 FILE=RessurectionYellowFX\RessurectYFX30.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX31 FILE=RessurectionYellowFX\RessurectYFX31.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX32 FILE=RessurectionYellowFX\RessurectYFX32.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX33 FILE=RessurectionYellowFX\RessurectYFX33.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX34 FILE=RessurectionYellowFX\RessurectYFX34.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX35 FILE=RessurectionYellowFX\RessurectYFX35.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX36 FILE=RessurectionYellowFX\RessurectYFX36.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX37 FILE=RessurectionYellowFX\RessurectYFX37.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX38 FILE=RessurectionYellowFX\RessurectYFX38.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX39 FILE=RessurectionYellowFX\RessurectYFX39.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX40 FILE=RessurectionYellowFX\RessurectYFX40.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX41 FILE=RessurectionYellowFX\RessurectYFX41.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX42 FILE=RessurectionYellowFX\RessurectYFX42.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX43 FILE=RessurectionYellowFX\RessurectYFX43.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX44 FILE=RessurectionYellowFX\RessurectYFX44.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX45 FILE=RessurectionYellowFX\RessurectYFX45.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX46 FILE=RessurectionYellowFX\RessurectYFX46.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX47 FILE=RessurectionYellowFX\RessurectYFX47.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX48 FILE=RessurectionYellowFX\RessurectYFX48.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX49 FILE=RessurectionYellowFX\RessurectYFX49.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX50 FILE=RessurectionYellowFX\RessurectYFX50.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX51 FILE=RessurectionYellowFX\RessurectYFX51.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX52 FILE=RessurectionYellowFX\RessurectYFX52.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX53 FILE=RessurectionYellowFX\RessurectYFX53.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX54 FILE=RessurectionYellowFX\RessurectYFX54.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX55 FILE=RessurectionYellowFX\RessurectYFX55.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX56 FILE=RessurectionYellowFX\RessurectYFX56.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX57 FILE=RessurectionYellowFX\RessurectYFX57.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX58 FILE=RessurectionYellowFX\RessurectYFX58.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX59 FILE=RessurectionYellowFX\RessurectYFX59.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX60 FILE=RessurectionYellowFX\RessurectYFX60.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX61 FILE=RessurectionYellowFX\RessurectYFX61.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX62 FILE=RessurectionYellowFX\RessurectYFX62.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX63 FILE=RessurectionYellowFX\RessurectYFX63.bmp GROUP=RessurectYellow LODSET=2
#exec TEXTURE IMPORT NAME=RessurectYFX64 FILE=RessurectionYellowFX\RessurectYFX64.bmp GROUP=RessurectYellow LODSET=2


var() texture NeutralRes[64], RedRes[64], BlueRes[64], GreenRes[64], YellowRes[64];
var() texture InvisTex;
var byte CurFrame;
var float LifeTime, LifeCount, FrameReg, FrameCount;

var bool bReady, bSecondHalf;
var byte ResColor, SkipFrame;

replication
{
	unreliable if (Role == ROLE_Authority)
		ResColor, FrameReg, bReady, LifeTime;
}

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		LODBias = FMax(1.0, Class'NWInfo'.default.PickupsDistDetail * Class'NWInfo'.default.MaxLODBias/255);
	SkipFrame = Class'NWInfo'.default.RessurectSkip;
}

simulated function InitRessurectionTex(optional byte InitTeam, optional bool bNoTeam)
{
	if (Role == ROLE_Authority)
	{
		if (!bNoTeam)
		{
			if (InitTeam > 3)
				ResColor = 0;
			else
				ResColor = InitTeam + 1;
		}
		else
		{
			if (InitTeam <= 4)
				ResColor = InitTeam;
			else
				ResColor = 0;
		}
	}
	
	CurFrame = ArrayCount(NeutralRes) - (ArrayCount(NeutralRes)-1)/(SkipFrame+1)*(SkipFrame+1) - 1;
	Framerise(CurFrame);
}

simulated function Framerise(optional byte FrameN)
{
local byte i;

	if (FrameN >= ArrayCount(RedRes))
		return;

	if (ResColor == 1)
	{
		Texture = RedRes[FrameN];
		for (i = 0; i < 8; i++)
			MultiSkins[i] = RedRes[FrameN];
	}
	else if (ResColor == 2)
	{
		Texture = BlueRes[FrameN];
		for (i = 0; i < 8; i++)
			MultiSkins[i] = BlueRes[FrameN];
	}
	else if (ResColor == 3)
	{
		Texture = GreenRes[FrameN];
		for (i = 0; i < 8; i++)
			MultiSkins[i] = GreenRes[FrameN];
	}
	else if (ResColor == 4)
	{
		Texture = YellowRes[FrameN];
		for (i = 0; i < 8; i++)
			MultiSkins[i] = YellowRes[FrameN];
	}
	else
	{
		Texture = NeutralRes[FrameN];
		for (i = 0; i < 8; i++)
			MultiSkins[i] = NeutralRes[FrameN];
	}
}

function StartFraming(float FTime)
{
	FrameReg = FTime/ArrayCount(NeutralRes)*(SkipFrame+1);
	bReady = True;
}

function SetLifeTime(float FTime){	LifeTime = FTime;}

simulated function Tick(float Delta)
{
local byte i;

	if (LifeCount > LifeTime)
		LifeCount = LifeTime;
	
	if (FrameReg > 0)
	{
		FrameCount += Delta;
		if (FrameCount >= FrameReg)
		{
			if (CurFrame < ArrayCount(NeutralRes)-1)
			{
				CurFrame += (SkipFrame + Int(FrameCount/FrameReg));
				
				if (Level.NetMode != NM_DedicatedServer)
					Framerise(CurFrame);
			}
			else
			{
				bSecondHalf = True;
				LifeTime = LifeCount;
						
				if (Owner != None)
				{
					if (Owner.IsA('WResReplace') && Owner.Owner != None)
					{
						Owner.Style = Owner.Owner.default.Style;
						Owner.Texture = Owner.Owner.default.Texture;
						Owner.bMeshEnviroMap = Owner.Owner.default.bMeshEnviroMap;
					}
					else
					{
						Owner.Style = Owner.default.Style;
						Owner.Texture = Owner.default.Texture;
						Owner.bMeshEnviroMap = Owner.default.bMeshEnviroMap;
					}
				}
						
				Style = STY_Translucent;
				FrameReg = -1;
			}
			
			FrameCount = 0.0;
		}
	}
	
	if (Owner != None && bReady)
	{
		if (bSecondHalf)
		{
			if (LifeCount > 0)
			{
				Owner.ScaleGlow = (LifeTime - LifeCount) * Owner.default.ScaleGlow / LifeTime;
				ScaleGlow = LifeCount * default.ScaleGlow / LifeTime;
			}
			else
			{
				bReady = False;
				Destroy();
			}
		}
		
		LifeCount -= Delta;
	}
	else if (bReady)
	{
		bReady = False;
		Destroy();
	}
}

defaultproperties
{
	Physics=PHYS_Trailer
	bTrailerPrePivot=True
	bTrailerSameRotation=True
	bHidden=False
	LifeTime=10.000000
	LifeCount=10.000000
	bUnlit=True
	Style=STY_Masked
	ScaleGlow=2.000000
	InvisTex=MaskInvis
	
	Texture=RessurectFX01
	MultiSkins(0)=RessurectFX01
	MultiSkins(1)=RessurectFX01
	MultiSkins(2)=RessurectFX01
	MultiSkins(3)=RessurectFX01
	MultiSkins(4)=RessurectFX01
	MultiSkins(5)=RessurectFX01
	MultiSkins(6)=RessurectFX01
	MultiSkins(7)=RessurectFX01
	
	NeutralRes(0)=RessurectFX01
	NeutralRes(1)=RessurectFX02
	NeutralRes(2)=RessurectFX03
	NeutralRes(3)=RessurectFX04
	NeutralRes(4)=RessurectFX05
	NeutralRes(5)=RessurectFX06
	NeutralRes(6)=RessurectFX07
	NeutralRes(7)=RessurectFX08
	NeutralRes(8)=RessurectFX09
	NeutralRes(9)=RessurectFX10
	NeutralRes(10)=RessurectFX11
	NeutralRes(11)=RessurectFX12
	NeutralRes(12)=RessurectFX13
	NeutralRes(13)=RessurectFX14
	NeutralRes(14)=RessurectFX15
	NeutralRes(15)=RessurectFX16
	NeutralRes(16)=RessurectFX17
	NeutralRes(17)=RessurectFX18
	NeutralRes(18)=RessurectFX19
	NeutralRes(19)=RessurectFX20
	NeutralRes(20)=RessurectFX21
	NeutralRes(21)=RessurectFX22
	NeutralRes(22)=RessurectFX23
	NeutralRes(23)=RessurectFX24
	NeutralRes(24)=RessurectFX25
	NeutralRes(25)=RessurectFX26
	NeutralRes(26)=RessurectFX27
	NeutralRes(27)=RessurectFX28
	NeutralRes(28)=RessurectFX29
	NeutralRes(29)=RessurectFX30
	NeutralRes(30)=RessurectFX31
	NeutralRes(31)=RessurectFX32
	NeutralRes(32)=RessurectFX33
	NeutralRes(33)=RessurectFX34
	NeutralRes(34)=RessurectFX35
	NeutralRes(35)=RessurectFX36
	NeutralRes(36)=RessurectFX37
	NeutralRes(37)=RessurectFX38
	NeutralRes(38)=RessurectFX39
	NeutralRes(39)=RessurectFX40
	NeutralRes(40)=RessurectFX41
	NeutralRes(41)=RessurectFX42
	NeutralRes(42)=RessurectFX43
	NeutralRes(43)=RessurectFX44
	NeutralRes(44)=RessurectFX45
	NeutralRes(45)=RessurectFX46
	NeutralRes(46)=RessurectFX47
	NeutralRes(47)=RessurectFX48
	NeutralRes(48)=RessurectFX49
	NeutralRes(49)=RessurectFX50
	NeutralRes(50)=RessurectFX51
	NeutralRes(51)=RessurectFX52
	NeutralRes(52)=RessurectFX53
	NeutralRes(53)=RessurectFX54
	NeutralRes(54)=RessurectFX55
	NeutralRes(55)=RessurectFX56
	NeutralRes(56)=RessurectFX57
	NeutralRes(57)=RessurectFX58
	NeutralRes(58)=RessurectFX59
	NeutralRes(59)=RessurectFX60
	NeutralRes(60)=RessurectFX61
	NeutralRes(61)=RessurectFX62
	NeutralRes(62)=RessurectFX63
	NeutralRes(63)=RessurectFX64
	
	RedRes(0)=RessurectRFX01
	RedRes(1)=RessurectRFX02
	RedRes(2)=RessurectRFX03
	RedRes(3)=RessurectRFX04
	RedRes(4)=RessurectRFX05
	RedRes(5)=RessurectRFX06
	RedRes(6)=RessurectRFX07
	RedRes(7)=RessurectRFX08
	RedRes(8)=RessurectRFX09
	RedRes(9)=RessurectRFX10
	RedRes(10)=RessurectRFX11
	RedRes(11)=RessurectRFX12
	RedRes(12)=RessurectRFX13
	RedRes(13)=RessurectRFX14
	RedRes(14)=RessurectRFX15
	RedRes(15)=RessurectRFX16
	RedRes(16)=RessurectRFX17
	RedRes(17)=RessurectRFX18
	RedRes(18)=RessurectRFX19
	RedRes(19)=RessurectRFX20
	RedRes(20)=RessurectRFX21
	RedRes(21)=RessurectRFX22
	RedRes(22)=RessurectRFX23
	RedRes(23)=RessurectRFX24
	RedRes(24)=RessurectRFX25
	RedRes(25)=RessurectRFX26
	RedRes(26)=RessurectRFX27
	RedRes(27)=RessurectRFX28
	RedRes(28)=RessurectRFX29
	RedRes(29)=RessurectRFX30
	RedRes(30)=RessurectRFX31
	RedRes(31)=RessurectRFX32
	RedRes(32)=RessurectRFX33
	RedRes(33)=RessurectRFX34
	RedRes(34)=RessurectRFX35
	RedRes(35)=RessurectRFX36
	RedRes(36)=RessurectRFX37
	RedRes(37)=RessurectRFX38
	RedRes(38)=RessurectRFX39
	RedRes(39)=RessurectRFX40
	RedRes(40)=RessurectRFX41
	RedRes(41)=RessurectRFX42
	RedRes(42)=RessurectRFX43
	RedRes(43)=RessurectRFX44
	RedRes(44)=RessurectRFX45
	RedRes(45)=RessurectRFX46
	RedRes(46)=RessurectRFX47
	RedRes(47)=RessurectRFX48
	RedRes(48)=RessurectRFX49
	RedRes(49)=RessurectRFX50
	RedRes(50)=RessurectRFX51
	RedRes(51)=RessurectRFX52
	RedRes(52)=RessurectRFX53
	RedRes(53)=RessurectRFX54
	RedRes(54)=RessurectRFX55
	RedRes(55)=RessurectRFX56
	RedRes(56)=RessurectRFX57
	RedRes(57)=RessurectRFX58
	RedRes(58)=RessurectRFX59
	RedRes(59)=RessurectRFX60
	RedRes(60)=RessurectRFX61
	RedRes(61)=RessurectRFX62
	RedRes(62)=RessurectRFX63
	RedRes(63)=RessurectRFX64
	
	BlueRes(0)=RessurectBFX01
	BlueRes(1)=RessurectBFX02
	BlueRes(2)=RessurectBFX03
	BlueRes(3)=RessurectBFX04
	BlueRes(4)=RessurectBFX05
	BlueRes(5)=RessurectBFX06
	BlueRes(6)=RessurectBFX07
	BlueRes(7)=RessurectBFX08
	BlueRes(8)=RessurectBFX09
	BlueRes(9)=RessurectBFX10
	BlueRes(10)=RessurectBFX11
	BlueRes(11)=RessurectBFX12
	BlueRes(12)=RessurectBFX13
	BlueRes(13)=RessurectBFX14
	BlueRes(14)=RessurectBFX15
	BlueRes(15)=RessurectBFX16
	BlueRes(16)=RessurectBFX17
	BlueRes(17)=RessurectBFX18
	BlueRes(18)=RessurectBFX19
	BlueRes(19)=RessurectBFX20
	BlueRes(20)=RessurectBFX21
	BlueRes(21)=RessurectBFX22
	BlueRes(22)=RessurectBFX23
	BlueRes(23)=RessurectBFX24
	BlueRes(24)=RessurectBFX25
	BlueRes(25)=RessurectBFX26
	BlueRes(26)=RessurectBFX27
	BlueRes(27)=RessurectBFX28
	BlueRes(28)=RessurectBFX29
	BlueRes(29)=RessurectBFX30
	BlueRes(30)=RessurectBFX31
	BlueRes(31)=RessurectBFX32
	BlueRes(32)=RessurectBFX33
	BlueRes(33)=RessurectBFX34
	BlueRes(34)=RessurectBFX35
	BlueRes(35)=RessurectBFX36
	BlueRes(36)=RessurectBFX37
	BlueRes(37)=RessurectBFX38
	BlueRes(38)=RessurectBFX39
	BlueRes(39)=RessurectBFX40
	BlueRes(40)=RessurectBFX41
	BlueRes(41)=RessurectBFX42
	BlueRes(42)=RessurectBFX43
	BlueRes(43)=RessurectBFX44
	BlueRes(44)=RessurectBFX45
	BlueRes(45)=RessurectBFX46
	BlueRes(46)=RessurectBFX47
	BlueRes(47)=RessurectBFX48
	BlueRes(48)=RessurectBFX49
	BlueRes(49)=RessurectBFX50
	BlueRes(50)=RessurectBFX51
	BlueRes(51)=RessurectBFX52
	BlueRes(52)=RessurectBFX53
	BlueRes(53)=RessurectBFX54
	BlueRes(54)=RessurectBFX55
	BlueRes(55)=RessurectBFX56
	BlueRes(56)=RessurectBFX57
	BlueRes(57)=RessurectBFX58
	BlueRes(58)=RessurectBFX59
	BlueRes(59)=RessurectBFX60
	BlueRes(60)=RessurectBFX61
	BlueRes(61)=RessurectBFX62
	BlueRes(62)=RessurectBFX63
	BlueRes(63)=RessurectBFX64
	
	GreenRes(0)=RessurectGFX01
	GreenRes(1)=RessurectGFX02
	GreenRes(2)=RessurectGFX03
	GreenRes(3)=RessurectGFX04
	GreenRes(4)=RessurectGFX05
	GreenRes(5)=RessurectGFX06
	GreenRes(6)=RessurectGFX07
	GreenRes(7)=RessurectGFX08
	GreenRes(8)=RessurectGFX09
	GreenRes(9)=RessurectGFX10
	GreenRes(10)=RessurectGFX11
	GreenRes(11)=RessurectGFX12
	GreenRes(12)=RessurectGFX13
	GreenRes(13)=RessurectGFX14
	GreenRes(14)=RessurectGFX15
	GreenRes(15)=RessurectGFX16
	GreenRes(16)=RessurectGFX17
	GreenRes(17)=RessurectGFX18
	GreenRes(18)=RessurectGFX19
	GreenRes(19)=RessurectGFX20
	GreenRes(20)=RessurectGFX21
	GreenRes(21)=RessurectGFX22
	GreenRes(22)=RessurectGFX23
	GreenRes(23)=RessurectGFX24
	GreenRes(24)=RessurectGFX25
	GreenRes(25)=RessurectGFX26
	GreenRes(26)=RessurectGFX27
	GreenRes(27)=RessurectGFX28
	GreenRes(28)=RessurectGFX29
	GreenRes(29)=RessurectGFX30
	GreenRes(30)=RessurectGFX31
	GreenRes(31)=RessurectGFX32
	GreenRes(32)=RessurectGFX33
	GreenRes(33)=RessurectGFX34
	GreenRes(34)=RessurectGFX35
	GreenRes(35)=RessurectGFX36
	GreenRes(36)=RessurectGFX37
	GreenRes(37)=RessurectGFX38
	GreenRes(38)=RessurectGFX39
	GreenRes(39)=RessurectGFX40
	GreenRes(40)=RessurectGFX41
	GreenRes(41)=RessurectGFX42
	GreenRes(42)=RessurectGFX43
	GreenRes(43)=RessurectGFX44
	GreenRes(44)=RessurectGFX45
	GreenRes(45)=RessurectGFX46
	GreenRes(46)=RessurectGFX47
	GreenRes(47)=RessurectGFX48
	GreenRes(48)=RessurectGFX49
	GreenRes(49)=RessurectGFX50
	GreenRes(50)=RessurectGFX51
	GreenRes(51)=RessurectGFX52
	GreenRes(52)=RessurectGFX53
	GreenRes(53)=RessurectGFX54
	GreenRes(54)=RessurectGFX55
	GreenRes(55)=RessurectGFX56
	GreenRes(56)=RessurectGFX57
	GreenRes(57)=RessurectGFX58
	GreenRes(58)=RessurectGFX59
	GreenRes(59)=RessurectGFX60
	GreenRes(60)=RessurectGFX61
	GreenRes(61)=RessurectGFX62
	GreenRes(62)=RessurectGFX63
	GreenRes(63)=RessurectGFX64
	
	YellowRes(0)=RessurectYFX01
	YellowRes(1)=RessurectYFX02
	YellowRes(2)=RessurectYFX03
	YellowRes(3)=RessurectYFX04
	YellowRes(4)=RessurectYFX05
	YellowRes(5)=RessurectYFX06
	YellowRes(6)=RessurectYFX07
	YellowRes(7)=RessurectYFX08
	YellowRes(8)=RessurectYFX09
	YellowRes(9)=RessurectYFX10
	YellowRes(10)=RessurectYFX11
	YellowRes(11)=RessurectYFX12
	YellowRes(12)=RessurectYFX13
	YellowRes(13)=RessurectYFX14
	YellowRes(14)=RessurectYFX15
	YellowRes(15)=RessurectYFX16
	YellowRes(16)=RessurectYFX17
	YellowRes(17)=RessurectYFX18
	YellowRes(18)=RessurectYFX19
	YellowRes(19)=RessurectYFX20
	YellowRes(20)=RessurectYFX21
	YellowRes(21)=RessurectYFX22
	YellowRes(22)=RessurectYFX23
	YellowRes(23)=RessurectYFX24
	YellowRes(24)=RessurectYFX25
	YellowRes(25)=RessurectYFX26
	YellowRes(26)=RessurectYFX27
	YellowRes(27)=RessurectYFX28
	YellowRes(28)=RessurectYFX29
	YellowRes(29)=RessurectYFX30
	YellowRes(30)=RessurectYFX31
	YellowRes(31)=RessurectYFX32
	YellowRes(32)=RessurectYFX33
	YellowRes(33)=RessurectYFX34
	YellowRes(34)=RessurectYFX35
	YellowRes(35)=RessurectYFX36
	YellowRes(36)=RessurectYFX37
	YellowRes(37)=RessurectYFX38
	YellowRes(38)=RessurectYFX39
	YellowRes(39)=RessurectYFX40
	YellowRes(40)=RessurectYFX41
	YellowRes(41)=RessurectYFX42
	YellowRes(42)=RessurectYFX43
	YellowRes(43)=RessurectYFX44
	YellowRes(44)=RessurectYFX45
	YellowRes(45)=RessurectYFX46
	YellowRes(46)=RessurectYFX47
	YellowRes(47)=RessurectYFX48
	YellowRes(48)=RessurectYFX49
	YellowRes(49)=RessurectYFX50
	YellowRes(50)=RessurectYFX51
	YellowRes(51)=RessurectYFX52
	YellowRes(52)=RessurectYFX53
	YellowRes(53)=RessurectYFX54
	YellowRes(54)=RessurectYFX55
	YellowRes(55)=RessurectYFX56
	YellowRes(56)=RessurectYFX57
	YellowRes(57)=RessurectYFX58
	YellowRes(58)=RessurectYFX59
	YellowRes(59)=RessurectYFX60
	YellowRes(60)=RessurectYFX61
	YellowRes(61)=RessurectYFX62
	YellowRes(62)=RessurectYFX63
	YellowRes(63)=RessurectYFX64
}
