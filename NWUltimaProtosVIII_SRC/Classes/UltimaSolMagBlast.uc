//////////////////////////////////////////////////////////////
//				Feralidragon (19-01-2014)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolMagBlast expands NaliWEffects;

#exec AUDIO IMPORT NAME="UltimaMagSnd1" FILE=SOUNDS\UltimaMagSnd1.wav GROUP="UltimaSolFX"
#exec AUDIO IMPORT NAME="UltimaMagSnd2" FILE=SOUNDS\UltimaMagSnd2.wav GROUP="UltimaSolFX"
#exec AUDIO IMPORT NAME="UltimaMagSnd3" FILE=SOUNDS\UltimaMagSnd3.wav GROUP="UltimaSolFX"
#exec AUDIO IMPORT NAME="UltimaMagSnd4" FILE=SOUNDS\UltimaMagSnd4.wav GROUP="UltimaSolFX"

var() class<UltimaSolarBirthSolarFlr> FlrClass;
var() int MinSolarFlrs, MaxSolarFlrs;
var() float MagSndOdds, MagSndVol, MagSndRadius;
var() sound MagSnd[4];

simulated function initMagBlast(float LTime, vector MBSpeed, float StartDScale, float EndDScale, float BGlow, optional bool bMuteFX)
{
local int i, n;
local UltimaSolarBirthSolarFlr USBSf;
local float f, fr;

	n = int(RandRange(MinSolarFlrs, MaxSolarFlrs));
	for (i = 0; i < n; i++)
	{
		f = ((i+1.f) / n);
		fr = FRand()*0.5 + 0.5;
		USBSf = Spawn(FlrClass);
		USBSf.initFlare(fr*LTime, f*MBSpeed, f*StartDScale, f*EndDScale, BGlow);
	}
	if (!bMuteFX && FRand() <= MagSndOdds)
		PlaySound(MagSnd[Rand(ArrayCount(MagSnd))],, MagSndVol,, MagSndRadius);
	Destroy();
}

defaultproperties
{
	DrawType=DT_Sprite
	Texture=BirthSolarFlr01
	DrawScale=0.100000
	ScaleGlow=0.000000
	Physics=PHYS_None
	LifeSpan=1.000000
	bUnlit=True
	Style=STY_Translucent
	
	FlrClass=Class'UltimaSolarMatureSolarFlr'
	MinSolarFlrs=6
	MaxSolarFlrs=12
	
	MagSndOdds=0.700000
	MagSndVol=1.000000
	MagSndRadius=25000.000000
	MagSnd(0)=UltimaMagSnd1
	MagSnd(1)=UltimaMagSnd2
	MagSnd(2)=UltimaMagSnd3
	MagSnd(3)=UltimaMagSnd4
}
