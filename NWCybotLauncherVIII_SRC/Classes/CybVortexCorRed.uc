//////////////////////////////////////////////////////////////
//				Feralidragon (27-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVortexCorRed expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=CybLensARed FILE=Coronas\CybLensARed.bmp GROUP=LensFlare FLAGS=2
#exec TEXTURE IMPORT NAME=CybLensBRed FILE=Coronas\CybLensBRed.bmp GROUP=LensFlare FLAGS=2
#exec TEXTURE IMPORT NAME=CybLensCRed FILE=Coronas\CybLensCRed.bmp GROUP=LensFlare FLAGS=2

defaultproperties
{
	MaxDistance=20000.000000
	FadeInTime=0.500000
	FadeOutTime=0.000000
	CoronaSprite=CybKamikazeChargeCorRed
	MaxCoronaSize=40.000000
	MinCoronaSize=0.500000
	CGlow=1.8500000
	StartScaleTime=0.500000
	StartScaleCoef=1.000000
	EndScaleTime=0.000000
	EndScaleCoef=1.000000
	
	enableLensFlare=True
	BackHeadTrace=128.000000
	TransitionDiv=8.000000
	bFixedOverAbsRayLength=True
	AbsRayLength=1024.000000
	LensFlareParts(0)=(bEnableLens=True,DistanceCoefCutOff=0.950000,LensSprite=Texture'CybLensCRed',MaxLensSize=1.000000,MinLensSize=0.500000,bAffectByCorona=True,LensGlow=0.150000)
	LensFlareParts(1)=(bEnableLens=True,DistanceCoefCutOff=0.900000,LensSprite=Texture'CybLensARed',MaxLensSize=1.000000,MinLensSize=0.500000,bAffectByCorona=True,LensGlow=0.250000)
	LensFlareParts(2)=(bEnableLens=True,DistanceCoefCutOff=0.850000,LensSprite=Texture'CybLensBRed',MaxLensSize=0.750000,MinLensSize=0.300000,bAffectByCorona=True,LensGlow=0.350000)
	LensFlareParts(3)=(bEnableLens=True,DistanceCoefCutOff=0.650000,LensSprite=Texture'CybProjCorRed',MaxLensSize=0.750000,MinLensSize=0.300000,bAffectByCorona=True,LensGlow=0.500000)
	LensFlareParts(4)=(bEnableLens=True,DistanceCoefCutOff=0.800000,LensSprite=Texture'CybProjCorRed',MaxLensSize=1.000000,MinLensSize=0.500000,bAffectByCorona=True,LensGlow=0.500000)
	LensFlareParts(5)=(bEnableLens=True,DistanceCoefCutOff=0.550000,LensSprite=Texture'CybLensARed',MaxLensSize=1.500000,MinLensSize=0.500000,bAffectByCorona=True,LensGlow=0.300000)
	LensFlareParts(6)=(bEnableLens=True,DistanceCoefCutOff=0.350000,LensSprite=Texture'CybProjCorRed',MaxLensSize=1.500000,MinLensSize=0.750000,bAffectByCorona=True,LensGlow=0.500000)
	LensFlareParts(7)=(bEnableLens=True,DistanceCoefCutOff=0.600000,LensSprite=Texture'CybLensBRed',MaxLensSize=2.500000,MinLensSize=0.950000,bAffectByCorona=True,LensGlow=0.150000)
	LensFlareParts(8)=(bEnableLens=True,DistanceCoefCutOff=0.925000,LensSprite=Texture'CybProjCorRed',MaxLensSize=0.950000,MinLensSize=0.450000,bAffectByCorona=True,LensGlow=0.450000)
	
	LifeSpan=0.000000
	bNetTemporary=False
}
