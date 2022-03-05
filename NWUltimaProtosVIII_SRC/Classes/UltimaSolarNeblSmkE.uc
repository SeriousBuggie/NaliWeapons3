//////////////////////////////////////////////////////////////
//				Feralidragon (26-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarNeblSmkE expands NaliWEffects;

#exec TEXTURE IMPORT NAME=ElectricSpark01 FILE=Effects\ElectricSpark01.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=ElectricSpark02 FILE=Effects\ElectricSpark02.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=ElectricSpark03 FILE=Effects\ElectricSpark03.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=ElectricSpark04 FILE=Effects\ElectricSpark04.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=ElectricSpark05 FILE=Effects\ElectricSpark05.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=ElectricSpark06 FILE=Effects\ElectricSpark06.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=ElectricSpark07 FILE=Effects\ElectricSpark07.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=ElectricSpark08 FILE=Effects\ElectricSpark08.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=ElectricSpark09 FILE=Effects\ElectricSpark09.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=ElectricSpark10 FILE=Effects\ElectricSpark10.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=ElectricSpark11 FILE=Effects\ElectricSpark11.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=ElectricSpark12 FILE=Effects\ElectricSpark12.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=ElectricSpark13 FILE=Effects\ElectricSpark13.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=ElectricSpark14 FILE=Effects\ElectricSpark14.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=ElectricSpark15 FILE=Effects\ElectricSpark15.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=ElectricSpark16 FILE=Effects\ElectricSpark16.bmp GROUP=Effects FLAGS=2


var() texture ETex[16];

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		Texture = ETex[Rand(ArrayCount(ETex))];
}

defaultproperties
{
    DrawType=DT_Sprite
	Texture=NukeWSmk01
	Style=STY_Translucent
	bUnlit=True
	bNetTemporary=True
	DrawScale=1.000000
	ScaleGlow=1.000000
	LifeSpan=0.100000
	
	ETex(0)=ElectricSpark01
	ETex(1)=ElectricSpark02
	ETex(2)=ElectricSpark03
	ETex(3)=ElectricSpark04
	ETex(4)=ElectricSpark05
	ETex(5)=ElectricSpark06
	ETex(6)=ElectricSpark07
	ETex(7)=ElectricSpark08
	ETex(8)=ElectricSpark09
	ETex(9)=ElectricSpark10
	ETex(10)=ElectricSpark11
	ETex(11)=ElectricSpark12
	ETex(12)=ElectricSpark13
	ETex(13)=ElectricSpark14
	ETex(14)=ElectricSpark15
	ETex(15)=ElectricSpark16
}
