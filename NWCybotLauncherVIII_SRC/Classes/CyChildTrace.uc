//////////////////////////////////////////////////////////////
//				Feralidragon (15-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyChildTrace expands NaliWEffects;

#exec MESH IMPORT MESH=CyChildTrace ANIVFILE=MODELS\CyChildTrace_a.3d DATAFILE=MODELS\CyChildTrace_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CyChildTrace STRENGTH=0.5
#exec MESH ORIGIN MESH=CyChildTrace X=0 Y=0 Z=0 ROLL=64

#exec MESH SEQUENCE MESH=CyChildTrace SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=CyChildTrace SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CyChildTrace SEQ=Stretch STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=CyChildTrace SEQ=Shrink STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=CyChildTrace MESH=CyChildTrace
#exec MESHMAP SCALE MESHMAP=CyChildTrace X=0.4 Y=0.05 Z=0.10

#exec TEXTURE IMPORT NAME=CyChildLaserTrace FILE=Coronas\CyChildLaserTrace.bmp GROUP=Effects FLAGS=2

#exec MESHMAP SETTEXTURE MESHMAP=CyChildTrace NUM=1 TEXTURE=CyChildLaserTrace


var() float TraceLength;
var bool bRotated;
var float RotPitch, RotYaw, RotRoll, Size;

replication
{
	unreliable if (ROLE == Role_Authority)
		RotPitch, RotYaw, RotRoll, Size;
}

function SetupTrace(float RPitch, float RYaw, float RRoll, float newSize)
{
	RotPitch = RPitch;
	RotYaw = RYaw;
	RotRoll = RRoll;
	Size = newSize;
}

simulated function Tick(float Delta)
{
local rotator R;

	Super.Tick(Delta);
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (!bRotated && (RotPitch != 0 || RotYaw != 0 || RotRoll != 0))
		{
			R.Pitch = RotPitch;
			R.Yaw = RotYaw;
			R.Roll = RotRoll;
			SetRotation(R);
			bRotated = True;
			if (Size > 0.0 && Size < 1.0)
			{
				AnimSequence = 'Stretch';
				AnimFrame = Size / 2;
			}
		}
	
		if (LifeSpan >= (2 * Default.LifeSpan / 3))
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / (Default.LifeSpan/3);
		else
			ScaleGlow = LifeSpan * Default.ScaleGlow / (2 * Default.LifeSpan / 3);
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CyChildTrace
	Style=STY_Translucent
	bUnlit=True
	
	LightBrightness=75
	LightHue=0
	LightSaturation=0
	LightRadius=6
	LightType=LT_Steady
	
	LifeSpan=0.350000
	ScaleGlow=3.000000
	bNetTemporary=False
	
	TraceLength=255.550000
}
