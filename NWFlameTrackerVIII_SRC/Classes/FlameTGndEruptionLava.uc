//////////////////////////////////////////////////////////////
//				Feralidragon (11-08-2013)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTGndEruptionLava expands NaliWEffects;

#exec MESH IMPORT MESH=FlameTGndEruptionLava ANIVFILE=MODELS\FlameTGndEruptionLava_a.3d DATAFILE=MODELS\FlameTGndEruptionLava_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FlameTGndEruptionLava STRENGTH=0
#exec MESH ORIGIN MESH=FlameTGndEruptionLava X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=FlameTGndEruptionLava SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTGndEruptionLava SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTGndEruptionLava SEQ=Pressurize STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=FlameTGndEruptionLava SEQ=BreakThrough STARTFRAME=9 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=FlameTGndEruptionLava SEQ=Explode STARTFRAME=19 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=FlameTGndEruptionLava SEQ=Crater STARTFRAME=31 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FlameTGndEruptionLava MESH=FlameTGndEruptionLava
#exec MESHMAP SCALE MESHMAP=FlameTGndEruptionLava X=0.4 Y=0.4 Z=0.8

#exec OBJ LOAD FILE=Textures\FlameTLavaFX.utx PACKAGE=NWFlameTrackerVIII_SRC.LavaFX
#exec MESHMAP SETTEXTURE MESHMAP=FlameTGndEruptionLava NUM=1 TEXTURE=FlameTGndLavaFX

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=FlameTGndEruptionLava
	bAnimByOwner=True
	bUnlit=True
	ScaleGlow=2.000000
}
