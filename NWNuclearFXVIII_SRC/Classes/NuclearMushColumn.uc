//////////////////////////////////////////////////////////////
//				Feralidragon (24-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearMushColumn expands NuclearMushFX;

#exec MESH IMPORT MESH=NuclearMushColumn ANIVFILE=MODELS\NuclearMushColumn_a.3d DATAFILE=MODELS\NuclearMushColumn_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NuclearMushColumn STRENGTH=0.1
#exec MESH ORIGIN MESH=NuclearMushColumn X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NuclearMushColumn SEQ=All STARTFRAME=0 NUMFRAMES=14
#exec MESH SEQUENCE MESH=NuclearMushColumn SEQ=Grow STARTFRAME=0 NUMFRAMES=14 RATE=13.0

#exec MESHMAP NEW MESHMAP=NuclearMushColumn MESH=NuclearMushColumn
#exec MESHMAP SCALE MESHMAP=NuclearMushColumn X=1.875 Y=1.875 Z=12.0

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	PlayAnim('Grow', 0.05, 0.0);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=NuclearMushColumn
	
	ScaleGlow=8.000000
	MinLifeSpan=6.000000
	MaxLifeSpan=8.000000
	FXMode=0
	FadeInTime=0.500000
	FadeOutTime=3.000000
	bSpawnNext=True
	
	ClassMode1=Class'NuclearMushColumnMa'
	ClassMode2=Class'NuclearMushColumnMb'
	ClassMode3=Class'NuclearMushColumnMc'
}
