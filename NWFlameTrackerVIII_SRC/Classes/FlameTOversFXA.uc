//////////////////////////////////////////////////////////////
//				Feralidragon (13-08-2013)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTOversFXA expands TheOversColoredFX;

#exec MESH IMPORT MESH=FlameTOversFXA ANIVFILE=MODELS\FlameTOversFXA_a.3d DATAFILE=MODELS\FlameTOversFXA_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FlameTOversFXA STRENGTH=0
#exec MESH ORIGIN MESH=FlameTOversFXA X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=FlameTOversFXA SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=FlameTOversFXA SEQ=Fluid STARTFRAME=0 NUMFRAMES=20 RATE=19.0

#exec MESHMAP NEW MESHMAP=FlameTOversFXA MESH=FlameTOversFXA
#exec MESHMAP SCALE MESHMAP=FlameTOversFXA X=0.1 Y=0.1 Z=0.2


simulated function PostBeginPlay()
{
	LoopAnim('Fluid', 5.0);
	Super.PostBeginPlay();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=FlameTOversFXA
	bUnlit=True
	MultiSkins(1)=FlameTGndLavaBFX
	Style=STY_Normal
	
	renderOnTop=False
	DrawScale=0.075000
	ScaleGlow=2.000000
	LifeSpan=6.000000

	fadeInTime=0.000000
	fadeOutTime=0.000000
	
	enableScaling=True
	scaleInTime=0.200000
	scaleOutTime=0.100000
	
	enableRot=True
	StartingRot=(Pitch=0)
	RRate1=(Pitch=0)
	RRate2=(Yaw=7000)
}
