//////////////////////////////////////////////////////////////
//				Feralidragon (21-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameLavaDecal expands NWDecal;

#exec TEXTURE IMPORT NAME=FLavaSplat01 FILE=DECALS\FLavaSplat01.bmp GROUP=Decals
#exec TEXTURE IMPORT NAME=FLavaSplat02 FILE=DECALS\FLavaSplat02.bmp GROUP=Decals

var() texture FDecalTex[2];

simulated function BeginPlay()
{
	if (FRand() > 0.5)
		Texture = FDecalTex[0];
	else
		Texture = FDecalTex[1];
	
	Super.BeginPlay();
}

defaultproperties
{
	Texture=FLavaSplat01
	DrawScale=0.650000
	FDecalTex(0)=FLavaSplat01
	FDecalTex(1)=FLavaSplat02
}
