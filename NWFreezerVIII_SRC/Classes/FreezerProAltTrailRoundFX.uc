//////////////////////////////////////////////////////////////
//				Feralidragon (03-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerProAltTrailRoundFX expands FreezerProjTrailRoundFX;

#exec MESH IMPORT MESH=FreezerProAltTrailRoundFX ANIVFILE=MODELS\FreezerProjTrailRoundFX_a.3d DATAFILE=MODELS\FreezerProjTrailRoundFX_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=FreezerProAltTrailRoundFX STRENGTH=0.5
#exec MESH ORIGIN MESH=FreezerProAltTrailRoundFX X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=FreezerProAltTrailRoundFX SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerProAltTrailRoundFX SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FreezerProAltTrailRoundFX MESH=FreezerProAltTrailRoundFX
#exec MESHMAP SCALE MESHMAP=FreezerProAltTrailRoundFX X=1.4 Y=0.35 Z=0.7

#exec TEXTURE IMPORT NAME=FreezerTrailRotFXWaterLine FILE=Coronas\FreezerTrailRotFXWaterLine.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	Mesh=FreezerProAltTrailRoundFX
	
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=0.750000
	MultiSkins(1)=FreezerTrailRotFXWaterLine
	MultiSkins(2)=FreezerTrailRotFXWaterLine
	MultiSkins(3)=FreezerTrailRotFXWaterLine
	DrawScale=0.500000
}
