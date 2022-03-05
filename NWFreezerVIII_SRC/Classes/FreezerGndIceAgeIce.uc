//////////////////////////////////////////////////////////////
//				Feralidragon (14-09-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerGndIceAgeIce expands NaliWEffects;

#exec MESH IMPORT MESH=FreezerGndIceAgeIce ANIVFILE=MODELS\FreezerGndIceAgeIce_a.3d DATAFILE=MODELS\FreezerGndIceAgeIce_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FreezerGndIceAgeIce STRENGTH=0
#exec MESH ORIGIN MESH=FreezerGndIceAgeIce X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=FreezerGndIceAgeIce SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FreezerGndIceAgeIce SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerGndIceAgeIce SEQ=Pressurize STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=FreezerGndIceAgeIce SEQ=BreakThrough STARTFRAME=9 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=FreezerGndIceAgeIce SEQ=Explode STARTFRAME=19 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=FreezerGndIceAgeIce SEQ=Crater STARTFRAME=31 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FreezerGndIceAgeIce MESH=FreezerGndIceAgeIce
#exec MESHMAP SCALE MESHMAP=FreezerGndIceAgeIce X=0.4 Y=0.4 Z=0.8

#exec TEXTURE IMPORT NAME=Ice FILE=Skins\Ice.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=FreezerGndIceAgeIce NUM=1 TEXTURE=Ice

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=FreezerGndIceAgeIce
	bAnimByOwner=True
	bUnlit=True
	ScaleGlow=2.000000
}
