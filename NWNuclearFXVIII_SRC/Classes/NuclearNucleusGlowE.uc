//////////////////////////////////////////////////////////////
//				Feralidragon (11-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearNucleusGlowE expands NaliFullMeshFX;

#exec MESH IMPORT MESH=NuclearNucleusGlow05 ANIVFILE=MODELS\NuclearNucleusGlow05_a.3d DATAFILE=MODELS\NuclearNucleusGlow05_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NuclearNucleusGlow05 STRENGTH=0.1
#exec MESH ORIGIN MESH=NuclearNucleusGlow05 X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NuclearNucleusGlow05 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearNucleusGlow05 SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NuclearNucleusGlow05 MESH=NuclearNucleusGlow05
#exec MESHMAP SCALE MESHMAP=NuclearNucleusGlow05 X=1.0 Y=1.0 Z=2.0

#exec TEXTURE IMPORT NAME=NucleusCore05 FILE=CORONAS\NucleusCore05.bmp GROUP=Coronas
#exec MESHMAP SETTEXTURE MESHMAP=NuclearNucleusGlow05 NUM=1 TEXTURE=NucleusCore05

var() float MinDrawScale, FadeInTime, FadeOutTime;
var() float BaseRadius;

simulated function Tick( float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer && localPlayer != None)
	{
		//If has an updater
		if (localUpdater != None && Delta != 0.5)
			return;
	
		DrawScale = (Default.LifeSpan - LifeSpan) * (Default.DrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
		if (Default.LifeSpan - LifeSpan <= FadeInTime)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / FadeInTime;
		else if (FadeOutTime > 0 && LifeSpan <= FadeOutTime)
			ScaleGlow = LifeSpan * Default.ScaleGlow / FadeOutTime;
		else if (FadeOutTime == 0)
			ScaleGlow = LifeSpan * Default.ScaleGlow / (Default.LifeSpan - FadeInTime);
	}
}

defaultproperties
{
	DrawType=DT_Mesh
    Mesh=NuclearNucleusGlow05
	bDirectionalMesh=True
	bEnableFullMeshView=False
	bAlwaysRelevant=True
	
	bUnlit=True
	Style=STY_Translucent
	
	MinDrawScale=1.000000
	FadeInTime=1.000000
	FadeOutTime=1.000000
	LifeSpan=16.000000
	DrawScale=25.000000
	ScaleGlow=3.500000
	
	BaseRadius=160.000000
}
