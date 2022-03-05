//////////////////////////////////////////////////////////////
//				Feralidragon (09-01-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonNukeSphereGlow expands NaliFullMeshFX;

#exec MESH IMPORT MESH=IonNukeSphereGlow ANIVFILE=MODELS\IonNukeSphereGlow_a.3d DATAFILE=MODELS\IonNukeSphereGlow_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonNukeSphereGlow STRENGTH=0.0
#exec MESH ORIGIN MESH=IonNukeSphereGlow X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IonNukeSphereGlow SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonNukeSphereGlow SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonNukeSphereGlow MESH=IonNukeSphereGlow
#exec MESHMAP SCALE MESHMAP=IonNukeSphereGlow X=1.0 Y=1.0 Z=2.0

#exec TEXTURE IMPORT NAME=IonNukeGlow FILE=CORONAS\IonNukeGlow.bmp GROUP=Coronas
#exec MESHMAP SETTEXTURE MESHMAP=IonNukeSphereGlow NUM=1 TEXTURE=IonNukeGlow


var() float FadeInTime, FadeOutTime;
var() float DrawScaleMin, DrawScaleMax;

simulated function Tick( float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer && localPlayer != None)
	{
		//If has an updater
		if (localUpdater != None && Delta != 0.5)
		{
			updateDelta = Delta;
			return;
		}
		else if (Delta == 0.5)
			Delta = updateDelta;
	
		if ((Default.LifeSpan - LifeSpan) <= FadeInTime)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / FadeInTime;
		else if (LifeSpan <= FadeOutTime)
			ScaleGlow = LifeSpan * Default.ScaleGlow / FadeOutTime;
			
		DrawScale = (Default.LifeSpan - LifeSpan) * (DrawScaleMax-DrawScaleMin) / Default.LifeSpan + DrawScaleMin;
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonNukeSphereGlow
	bDirectionalMesh=True
	bEnableFullMeshView=False
	bUnlit=True
	Style=STY_Translucent
	
	DrawScale=6.000000
	LifeSpan=7.500000
	ScaleGlow=3.500000
	
	FadeInTime=0.150000
	FadeOutTime=3.000000
	DrawScaleMin=3.000000
	DrawScaleMax=6.000000
}
