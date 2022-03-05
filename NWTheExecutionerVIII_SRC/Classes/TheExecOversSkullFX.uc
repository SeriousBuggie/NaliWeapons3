//////////////////////////////////////////////////////////////
//				Feralidragon (30-06-2013)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecOversSkullFX expands TheOversColoredFX;

#exec MESH IMPORT MESH=TheExecOversSkullFX ANIVFILE=MODELS\TheExecOversSkullFX_a.3d DATAFILE=MODELS\TheExecOversSkullFX_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheExecOversSkullFX STRENGTH=0
#exec MESH ORIGIN MESH=TheExecOversSkullFX X=0 Y=0 Z=0 YAW=-64

#exec MESH SEQUENCE MESH=TheExecOversSkullFX SEQ=All STARTFRAME=0 NUMFRAMES=19
#exec MESH SEQUENCE MESH=TheExecOversSkullFX SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecOversSkullFX SEQ=Open STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecOversSkullFX SEQ=Close STARTFRAME=9 NUMFRAMES=10 RATE=9.0

#exec MESHMAP NEW MESHMAP=TheExecOversSkullFX MESH=TheExecOversSkullFX
#exec MESHMAP SCALE MESHMAP=TheExecOversSkullFX X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=TheExecutionerRedMetal FILE=SKINS\TheExecutionerRedMetal.bmp GROUP=Skins LODSET=2


var bool bAnimatedSkull;
var() float AnimDelay;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && !bAnimatedSkull)
	{
		AnimDelay -= Delta;
		if (AnimDelay <= 0)
		{
			PlayAnim('Open', 1/(default.LifeSpan - default.AnimDelay), 0.0);
			bAnimatedSkull = True;
		}
	}
	Super.Tick(Delta);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=TheExecOversSkullFX
	Style=STY_Translucent
	Texture=TheExecutionerRedMetal
	bMeshEnviromap=True
	
	renderOnTop=True
	DrawScale=0.250000
	ScaleGlow=1.000000
	LifeSpan=6.000000

	fadeInTime=0.150000
	fadeOutTime=0.200000
	
	enableRot=True
	StartingRot=(Pitch=2700)
	RRate1=(Pitch=-1500)
	RRate2=(Yaw=0)
	
	AnimDelay=3.000000
}
