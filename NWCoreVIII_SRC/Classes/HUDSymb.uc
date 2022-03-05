//////////////////////////////////////////////////////////////
//	Nali Weapons III modifier HUD 3D Symbol
//				Feralidragon (07-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class HUDSymb expands NaliWEffects;

#exec MESH IMPORT MESH=HUDSymb ANIVFILE=MODELS\HUDSymb_a.3d DATAFILE=MODELS\HUDSymb_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=HUDSymb STRENGTH=0
#exec MESH ORIGIN MESH=HUDSymb X=0 Y=0 Z=0 YAW=64

#exec MESH SEQUENCE MESH=HUDSymb SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=HUDSymb SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=HUDSymb MESH=HUDSymb
#exec MESHMAP SCALE MESHMAP=HUDSymb X=0.01 Y=0.008 Z=0.02

var rotator CurRot;

simulated function Tick(float Delta)
{
	CurRot.Yaw += RotationRate.Yaw * Delta;
	CurRot.Pitch += RotationRate.Pitch * Delta;
	CurRot.Roll += RotationRate.Roll * Delta;
	CurRot = Normalize(CurRot);
}

simulated function ResetRot()
{
	CurRot = rot(0,0,0);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=HUDSymb
	bNetTemporary=False
	Mass=0.000000
	CollisionHeight=0.000000
	CollisionRadius=0.000000
	Skin=None
	Style=STY_Translucent
	ScaleGlow=1.350000
	bUnlit=True
	DrawScale=0.850000
	bHidden=True
	RotationRate=(Yaw=16384)
}
