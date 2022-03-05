//////////////////////////////////////////////////////////////
//				Feralidragon (03-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerProjTrailRoundFX expands FreezerProjTrail;

#exec MESH IMPORT MESH=FreezerProjTrailRoundFX ANIVFILE=MODELS\FreezerProjTrailRoundFX_a.3d DATAFILE=MODELS\FreezerProjTrailRoundFX_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=FreezerProjTrailRoundFX STRENGTH=0.5
#exec MESH ORIGIN MESH=FreezerProjTrailRoundFX X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=FreezerProjTrailRoundFX SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerProjTrailRoundFX SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FreezerProjTrailRoundFX MESH=FreezerProjTrailRoundFX
#exec MESHMAP SCALE MESHMAP=FreezerProjTrailRoundFX X=0.7 Y=0.35 Z=0.7

#exec TEXTURE IMPORT NAME=FreezerTrailRotFXLine FILE=Coronas\FreezerTrailRotFXLine.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=FreezerProjTrailRoundFX
	
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=1.500000
	MultiSkins(1)=FreezerTrailRotFXLine
	MultiSkins(2)=FreezerTrailRotFXLine
	MultiSkins(3)=FreezerTrailRotFXLine
	DrawScale=0.350000
}
