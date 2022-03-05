//////////////////////////////////////////////////////////////
//				Feralidragon (04-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MBoxMissileCorLine expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=MBoxMissileCorLine FILE=Coronas\MBoxMissileCorLine.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=20000.000000
	CoronaSprite=MBoxMissileCorLine
	MaxCoronaSize=2.500000
	MinCoronaSize=2.000000
	CGlow=1.500000
	LifeSpan=0.000000
	
	CGlowMax=1.500000
	CGlowMin=0.550000
	DScaleCoefMax=1.250000
	DScaleCoefMin=0.650000
	
	Physics=PHYS_Trailer
	bTrailerPrePivot=True
}
