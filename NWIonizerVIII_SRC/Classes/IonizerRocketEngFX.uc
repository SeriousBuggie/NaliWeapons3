//////////////////////////////////////////////////////////////
//				Feralidragon (26-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerRocketEngFX expands NaliWEffects;

#exec MESH IMPORT MESH=IonizerRocketEngFX ANIVFILE=MODELS\IonizerRocketEngFX_a.3d DATAFILE=MODELS\IonizerRocketEngFX_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonizerRocketEngFX STRENGTH=0.0
#exec MESH ORIGIN MESH=IonizerRocketEngFX X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=IonizerRocketEngFX SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerRocketEngFX SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonizerRocketEngFX MESH=IonizerRocketEngFX
#exec MESHMAP SCALE MESHMAP=IonizerRocketEngFX X=0.6 Y=0.6 Z=1.2

#exec TEXTURE IMPORT NAME=Sk_IonizerRocketEngFX FILE=SKINS\Sk_IonizerRocketEngFX.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IonizerRocketEngFX NUM=1 TEXTURE=Sk_IonizerRocketEngFX

var() bool bFadeIn;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (bFadeIn)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / Default.LifeSpan;
		else
			ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonizerRocketEngFX
	bNetTemporary=True
	bUnlit=True
	Style=STY_Translucent
	bAlwaysRelevant=True
	
	bFadeIn=True
	LifeSpan=3.000000
	ScaleGlow=2.000000
}
