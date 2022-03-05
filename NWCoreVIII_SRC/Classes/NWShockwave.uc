//////////////////////////////////////////////////////////////
//				Feralidragon (09-07-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWShockwave expands NaliFullMeshFX;

#exec MESH IMPORT MESH=NWShockwave ANIVFILE=MODELS\NWShockwave_a.3d DATAFILE=MODELS\NWShockwave_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWShockwave STRENGTH=0.0
#exec MESH ORIGIN MESH=NWShockwave X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NWShockwave SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWShockwave SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWShockwave MESH=NWShockwave
#exec MESHMAP SCALE MESHMAP=NWShockwave X=1.0 Y=1.0 Z=2.0

#exec TEXTURE IMPORT NAME=NWShockwave FILE=CORONAS\NWShockwave.bmp GROUP=Coronas
#exec MESHMAP SETTEXTURE MESHMAP=NWShockwave NUM=1 TEXTURE=NWShockwave

var() float ShockRadius;
var float RadiusMax, RadiusMin, LifeTime, curLifeCount;

replication
{
	reliable if (Role == ROLE_Authority)
		RadiusMax, RadiusMin, LifeTime;
	reliable if (Role == ROLE_Authority && bNetInitial)
		curLifeCount;
}

function Init(float minRadius, float maxRadius, float Time)
{
	RadiusMin = minRadius;
	RadiusMax = maxRadius;
	LifeTime = Time;
	curLifeCount = LifeTime;
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer && localPlayer != None && LifeTime > 0)
	{
		//If has an updater
		if (localUpdater != None && Delta != 0.5)
		{
			updateDelta = Delta;
			return;
		}
		else if (Delta == 0.5)
			Delta = updateDelta;
		
		curLifeCount -= Delta;
		RadiusView = (LifeTime - curLifeCount) * (RadiusMax - RadiusMin) / LifeTime + RadiusMin;
		DrawScale = RadiusView / ShockRadius;
		ScaleGlow = curLifeCount * Default.ScaleGlow / LifeTime;
	}
	else if (Role == ROLE_Authority)
		curLifeCount -= Delta;
	
	if (LifeTime > 0 && curLifeCount < 0)
		Destroy();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWShockwave
	bDirectionalMesh=True
	bEnableFullMeshView=True
	bAlwaysRelevant=True
	
	bUnlit=True
	Style=STY_Translucent
	LifeSpan=0.000000
	DrawScale=1.000000
	ScaleGlow=0.500000
	
	ShockRadius=170.000000
}
