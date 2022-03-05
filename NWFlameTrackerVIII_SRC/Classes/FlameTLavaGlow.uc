//////////////////////////////////////////////////////////////
//				Feralidragon (21-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTLavaGlow expands NaliTrail;

#exec TEXTURE IMPORT NAME=FlameTLavaGlow FILE=Coronas\FlameTLavaGlow.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
    DrawType=DT_Mesh
	Texture=FlameTLavaGlow
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=0.750000
	DrawScale=0.100000
	SpriteProjForward=0.000000
	bParticles=True
	bAnimByOwner=True
}
