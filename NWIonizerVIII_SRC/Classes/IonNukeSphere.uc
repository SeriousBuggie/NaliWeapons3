//////////////////////////////////////////////////////////////
//				Feralidragon (08-01-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonNukeSphere expands NaliWEffects;

#exec MESH IMPORT MESH=IonNukeSphere ANIVFILE=MODELS\IonNukeSphere_a.3d DATAFILE=MODELS\IonNukeSphere_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonNukeSphere STRENGTH=0.0
#exec MESH ORIGIN MESH=IonNukeSphere X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IonNukeSphere SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonNukeSphere SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonNukeSphere MESH=IonNukeSphere
#exec MESHMAP SCALE MESHMAP=IonNukeSphere X=1.0 Y=1.0 Z=2.0

#exec OBJ LOAD FILE=Textures\IonEnergy.utx PACKAGE=NWIonizerVIII_SRC.IonEnergy

#exec MESHMAP SETTEXTURE MESHMAP=IonNukeSphere NUM=1 TEXTURE=IonEnergyPanFX


var() float FadeInTime, FadeOutTime;
var() float DrawScaleMin, DrawScaleMax;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * (DrawScaleMax-DrawScaleMin) / Default.LifeSpan + DrawScaleMin;
		if ((Default.LifeSpan - LifeSpan) <= FadeInTime)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / FadeInTime;
		else if (LifeSpan <= FadeOutTime)
			ScaleGlow = LifeSpan * Default.ScaleGlow / FadeOutTime;
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonNukeSphere
	bAlwaysRelevant=True
	bNetTemporary=False
	
	DrawScale=6.000000
	LifeSpan=7.500000
	MultiSkins(1)=IonEnergyPanFX
	ScaleGlow=2.000000
	Style=STY_Translucent
	bUnlit=True
	
	FadeInTime=0.150000
	FadeOutTime=3.000000
	DrawScaleMin=3.000000
	DrawScaleMax=6.000000
}
