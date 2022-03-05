//////////////////////////////////////////////////////////////
//				Feralidragon (22-09-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IceImpale expands NaliWEffects;

#exec MESH IMPORT MESH=IceImpale ANIVFILE=MODELS\IceImpale_a.3d DATAFILE=MODELS\IceImpale_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IceImpale STRENGTH=0
#exec MESH ORIGIN MESH=IceImpale X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=IceImpale SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=IceImpale SEQ=Shrink STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IceImpale SEQ=Grow STARTFRAME=1 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=IceImpale MESH=IceImpale
#exec MESHMAP SCALE MESHMAP=IceImpale X=1.0 Y=1.0 Z=4.0


var() float BaseHeight, MinDrawScale, MaxDrawScale;
var() float GrowTime, ShrinkTime;
var int rPitch, rYaw, rRoll;
var bool bFadingOut, bRepl, bProcessedRepl;

replication
{
	reliable if (Role == ROLE_Authority && bNetInitial)
		MinDrawScale, MaxDrawScale, bRepl, rPitch, rYaw, rRoll;
}

function SetServerRot(rotator R)
{
	rPitch = R.Pitch;
	rYaw = R.Yaw;
	rRoll = R.Roll;
	bRepl = True;
}

simulated function PostBeginPlay()
{
	PlayAnim('Grow', 1/GrowTime, 0.0);
	Super.PostBeginPlay();
}

simulated function SetScale(float s)
{
	MinDrawScale = s * default.MinDrawScale;
	MaxDrawScale = s * default.MaxDrawScale;
}

simulated function SetHeight(float h)
{
	MinDrawScale = (h/BaseHeight) * default.MinDrawScale;
	MaxDrawScale = (h/BaseHeight) * default.MaxDrawScale;
}

simulated function Tick(float Delta)
{
local rotator R;

	if (Level.NetMode != NM_DedicatedServer)
	{
		if (!bProcessedRepl && bRepl)
		{
			R.Pitch = rPitch;
			R.Yaw = rYaw;
			R.Roll = rRoll;
			SetRotation(R);
			bProcessedRepl = True;
		}
		
		if ((default.LifeSpan - LifeSpan) <= GrowTime)
			DrawScale = ((default.LifeSpan - LifeSpan)/GrowTime) * (MaxDrawScale - MinDrawScale) + MinDrawScale;
		else if (LifeSpan <= ShrinkTime)
		{
			DrawScale = (LifeSpan/ShrinkTime) * (MaxDrawScale - MinDrawScale) + MinDrawScale;
			ScaleGlow = (LifeSpan/ShrinkTime) * default.ScaleGlow;
			if (!bFadingOut)
			{
				bFadingOut = True;
				Style = STY_Translucent;
				PlayAnim('Shrink', 1/ShrinkTime, 0.0);
			}
		}
		else
			DrawScale = MaxDrawScale;
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IceImpale
	Texture=Ice
	bMeshEnviroMap=True
	Style=STY_Normal
	bUnlit=True
	ScaleGlow=2.000000
	bNetTemporary=True
	DrawScale=1.000000
	
	EffectSound1=FreezeRemainHit
	SndVol=25.000000
	SndRadius=3000.000000
	
	BaseHeight=1920.000000
	GrowTime=0.250000
	ShrinkTime=3.500000
	LifeSpan=28.000000
	MinDrawScale=0.250000
	MaxDrawScale=1.000000
}
