//////////////////////////////////////////////////////////////
//				Feralidragon (15-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybHomingTrailingRed expands NaliWEffects;

#exec MESH IMPORT MESH=CybHomingTrailingRed ANIVFILE=MODELS\CybHomingTrailingRed_a.3d DATAFILE=MODELS\CybHomingTrailingRed_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybHomingTrailingRed STRENGTH=0.35
#exec MESH ORIGIN MESH=CybHomingTrailingRed X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybHomingTrailingRed SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybHomingTrailingRed SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybHomingTrailingRed MESH=CybHomingTrailingRed
#exec MESHMAP SCALE MESHMAP=CybHomingTrailingRed X=0.3 Y=0.085 Z=0.17

#exec TEXTURE IMPORT NAME=CybTrailingRed FILE=Coronas\CybTrailingRed.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=CybHomingTrailingRed NUM=1 TEXTURE=CybTrailingRed

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybHomingTrailingRed
	bUnlit=True
	ScaleGlow=0.850000
	Style=STY_Translucent
	
	LifeSpan=0.150000
}
