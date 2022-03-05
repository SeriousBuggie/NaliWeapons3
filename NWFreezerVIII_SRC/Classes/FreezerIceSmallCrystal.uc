//////////////////////////////////////////////////////////////
//				Feralidragon (14-09-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerIceSmallCrystal expands FreezerIceCrystal;

#exec MESH IMPORT MESH=FreezerIceSmallCrystal ANIVFILE=MODELS\FreezerIceCrystal_a.3d DATAFILE=MODELS\FreezerIceCrystal_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FreezerIceSmallCrystal STRENGTH=0
#exec MESH ORIGIN MESH=FreezerIceSmallCrystal X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=FreezerIceSmallCrystal SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceSmallCrystal SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FreezerIceSmallCrystal MESH=FreezerIceSmallCrystal
#exec MESHMAP SCALE MESHMAP=FreezerIceSmallCrystal X=2.0 Y=2.0 Z=4.0

simulated function SetScale(float s)
{
	DrawScale *= s;
	MinDrawScale *= s;
	MaxDrawScale *= s;
	SetupCorona(FrCor);
}

defaultproperties
{
	Mesh=FreezerIceSmallCrystal
	
	DrawScale=1.500000
	MinDrawScale=0.500000
	MaxDrawScale=1.500000
	BaseHeight=768.000000
	CoolSmkRate=2.000000
	RisingCoolSmkRate=7.000000
	
	FrCorClass=Class'FreezerIceCrystSmallCor'
	CoolSmkSize=12.000000
}
