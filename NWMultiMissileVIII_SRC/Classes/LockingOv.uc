//////////////////////////////////////////////////////////////
//	Nali Weapons III MultiMissile Launcher locking overlayer
//				Feralidragon (10-06-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class LockingOv expands NaliWEffects;

#exec TEXTURE IMPORT NAME=LockGridFX01 FILE=GridRedFX\LockGridFX01.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX02 FILE=GridRedFX\LockGridFX02.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX03 FILE=GridRedFX\LockGridFX03.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX04 FILE=GridRedFX\LockGridFX04.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX05 FILE=GridRedFX\LockGridFX05.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX06 FILE=GridRedFX\LockGridFX06.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX07 FILE=GridRedFX\LockGridFX07.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX08 FILE=GridRedFX\LockGridFX08.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX09 FILE=GridRedFX\LockGridFX09.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX10 FILE=GridRedFX\LockGridFX10.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX11 FILE=GridRedFX\LockGridFX11.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX12 FILE=GridRedFX\LockGridFX12.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX13 FILE=GridRedFX\LockGridFX13.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX14 FILE=GridRedFX\LockGridFX14.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX15 FILE=GridRedFX\LockGridFX15.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX16 FILE=GridRedFX\LockGridFX16.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX17 FILE=GridRedFX\LockGridFX17.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX18 FILE=GridRedFX\LockGridFX18.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX19 FILE=GridRedFX\LockGridFX19.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX20 FILE=GridRedFX\LockGridFX20.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX21 FILE=GridRedFX\LockGridFX21.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX22 FILE=GridRedFX\LockGridFX22.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX23 FILE=GridRedFX\LockGridFX23.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX24 FILE=GridRedFX\LockGridFX24.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX25 FILE=GridRedFX\LockGridFX25.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX26 FILE=GridRedFX\LockGridFX26.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX27 FILE=GridRedFX\LockGridFX27.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX28 FILE=GridRedFX\LockGridFX28.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX29 FILE=GridRedFX\LockGridFX29.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX30 FILE=GridRedFX\LockGridFX30.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX31 FILE=GridRedFX\LockGridFX31.bmp GROUP=LockGrid LODSET=2
#exec TEXTURE IMPORT NAME=LockGridFX32 FILE=GridRedFX\LockGridFX32.bmp GROUP=LockGrid LODSET=2

defaultproperties
{
    DrawType=DT_Mesh
	bHidden=True
	bUnlit=True
	ScaleGlow=1.500000
	Style=STY_Translucent
	bNetTemporary=False
	LODBias=8.000000
}
