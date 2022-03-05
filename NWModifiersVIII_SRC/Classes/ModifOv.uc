//////////////////////////////////////////////////////////////
//				Feralidragon (21-03-2010)
//
// NW3 MODIFIERS BUILD 1.00
//////////////////////////////////////////////////////////////

class ModifOv expands NWOverPickupFX;

#exec MESH IMPORT MESH=ModifOv ANIVFILE=MODELS\ModifOv_a.3d DATAFILE=MODELS\ModifOv_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=ModifOv STRENGTH=0
#exec MESH ORIGIN MESH=ModifOv X=0 Y=0 Z=0 YAW=64

#exec MESH SEQUENCE MESH=ModifOv SEQ=All STARTFRAME=0 NUMFRAMES=7
#exec MESH SEQUENCE MESH=ModifOv SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifOv SEQ=Openned STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifOv SEQ=Close STARTFRAME=1 NUMFRAMES=6 RATE=1.0

#exec MESHMAP NEW MESHMAP=ModifOv MESH=ModifOv
#exec MESHMAP SCALE MESHMAP=ModifOv X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=ModifierLightOv FILE=Skins\ModifierLightOv.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=ModifOv NUM=1 TEXTURE=ModifierLightOv

var float FadeInCount, TotalTime;
var bool bOldNoChange;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		LODBias = FMax(1.0, Class'NWInfo'.default.PickupsDistDetail * Class'NWInfo'.default.MaxLODBias/255);
}

simulated function Tick(float Delta)
{
	if (FadeInCount > 0)
	{
		if (bOldNoChange)
		{
			TotalTime = FadeInCount;
			bOldNoChange = False;
		}
		
		FadeInCount -= Delta;
		ScaleGlow = (TotalTime - FadeInCount) * Default.ScaleGlow / TotalTime;
	}
	else if (!bOldNoChange)
		bOldNoChange = True;
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=ModifOv
	bUnlit=True
	ScaleGlow=2.000000
	Style=STY_Translucent
	bAnimByOwner=True
}
