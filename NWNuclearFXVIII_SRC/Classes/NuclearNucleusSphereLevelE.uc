//////////////////////////////////////////////////////////////
//				Feralidragon (09-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearNucleusSphereLevelE expands NaliWEffects;

#exec MESH IMPORT MESH=NuclearNucleusSphereLevel05 ANIVFILE=MODELS\NuclearNucleusSphereLevel05_a.3d DATAFILE=MODELS\NuclearNucleusSphereLevel05_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NuclearNucleusSphereLevel05 STRENGTH=0.1
#exec MESH ORIGIN MESH=NuclearNucleusSphereLevel05 X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=NuclearNucleusSphereLevel05 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearNucleusSphereLevel05 SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NuclearNucleusSphereLevel05 MESH=NuclearNucleusSphereLevel05
#exec MESHMAP SCALE MESHMAP=NuclearNucleusSphereLevel05 X=1.0 Y=1.0 Z=2.0

#exec OBJ LOAD FILE=Textures\NuclearHeatFX.utx PACKAGE=NWNuclearFXVIII_SRC.NuclearHeatFX
#exec MESHMAP SETTEXTURE MESHMAP=NuclearNucleusSphereLevel05 NUM=1 TEXTURE=HotHeatFX

var() float MinDrawScale, FadeInTime, FadeOutTime;
var() float ScaleOutTime;

simulated function Tick( float DeltaTime)
{
local float ScaleMax;

	if (Level.NetMode != NM_DedicatedServer)
	{
		if (LifeSpan > ScaleOutTime)
			DrawScale = (Default.LifeSpan - LifeSpan) * (Default.DrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
		else
		{
			ScaleMax = (Default.LifeSpan - ScaleOutTime) * (Default.DrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
			DrawScale = LifeSpan * ScaleMax / ScaleOutTime;
		}
		
		if (Default.LifeSpan - LifeSpan <= FadeInTime && FadeInTime > 0)
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
    Mesh=NuclearNucleusSphereLevel05
	RemoteRole=ROLE_SimulatedProxy
	bUnlit=True
	bAlwaysRelevant=True
	
	MinDrawScale=0.980000
	FadeInTime=0.000000
	FadeOutTime=1.000000
	ScaleOutTime=1.000000
	LifeSpan=16.000000
	DrawScale=24.50000
	ScaleGlow=3.500000
}
