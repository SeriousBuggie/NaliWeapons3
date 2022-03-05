//////////////////////////////////////////////////////////////
//				Feralidragon (16-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPROversFXB expands TheOversColoredFX;

#exec MESH IMPORT MESH=IRPROversFXB ANIVFILE=MODELS\IRPROversFXB_a.3d DATAFILE=MODELS\IRPROversFXB_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IRPROversFXB STRENGTH=0.0
#exec MESH ORIGIN MESH=IRPROversFXB X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IRPROversFXB SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=IRPROversFXB SEQ=Shrink STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IRPROversFXB SEQ=Grow STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IRPROversFXB SEQ=Grown STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPROversFXB SEQ=Shrunk STARTFRAME=1 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IRPROversFXB MESH=IRPROversFXB
#exec MESHMAP SCALE MESHMAP=IRPROversFXB X=0.7 Y=0.7 Z=1.4

#exec TEXTURE IMPORT NAME=IRPROverFX_Sk FILE=SKINS\IRPROverFX_Sk.bmp GROUP=Skins LODSET=0 MIPS=OFF
#exec MESHMAP SETTEXTURE MESHMAP=IRPROversFXB NUM=1 TEXTURE=IRPROverFX_Sk


var IRPROversFXBLaser IRPROFXLaser;
var IRPROversFXBLights IRPROFXLights;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		IRPROFXLaser = Spawn(Class'IRPROversFXBLaser', Self);
		IRPROFXLights = Spawn(Class'IRPROversFXBLights', Self);
	}
	StartingRot = RotRand(True);
	RRate1.Pitch = int((FRand()*2-1) * 15000);
	RRate1.Yaw = int((FRand()*2-1) * 15000);
	RRate1.Roll = int((FRand()*2-1) * 15000);
	RRate2.Pitch = int((FRand()*2-1) * 15000);
	RRate2.Yaw = int((FRand()*2-1) * 15000);
	RRate2.Roll = int((FRand()*2-1) * 15000);
	PlayAnim('Grow', 0.35 + FRand()*2.f, 0.0);
	Super.PostBeginPlay();
}

simulated function renderOnCanvas(canvas Canvas)
{
	Super.renderOnCanvas(Canvas);
	if (IRPROFXLaser != None)
		Canvas.DrawActor(IRPROFXLaser, False, IRPROFXLaser.renderOnTop);
	if (IRPROFXLights != None)
		Canvas.DrawActor(IRPROFXLights, False, IRPROFXLights.renderOnTop);
}

simulated function UpdateCoords(vector newLoc, rotator newRot)
{
	Super.UpdateCoords(newLoc, newRot);
	if (!updateCoordsOnServer && Level.NetMode == NM_DedicatedServer)
		return;

	if (IRPROFXLaser != None)
	{
		IRPROFXLaser.SetLocation(newLoc);
		IRPROFXLaser.SetRotation(newRot);
	}
	if (IRPROFXLights != None)
	{
		IRPROFXLights.SetLocation(newLoc);
		IRPROFXLights.SetRotation(newRot);
	}
}

simulated function Destroyed()
{
	if (IRPROFXLaser != None)
		IRPROFXLaser.Destroy();
	if (IRPROFXLights != None)
		IRPROFXLights.Destroy();
	
	IRPROFXLaser = None;
	IRPROFXLights = None;
	
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IRPROversFXB
	bUnlit=False
	Style=STY_Normal
	AnimSequence=Shrunk
	
	renderOnTop=False
	DrawScale=0.025000
	ScaleGlow=1.500000
	LifeSpan=6.000000
	
	enableRot=True
	StartingRot=(Pitch=0,Roll=0)
	RRate1=(Pitch=0)
	RRate2=(Yaw=0)
}
