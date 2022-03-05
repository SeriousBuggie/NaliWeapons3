//////////////////////////////////////////////////////////////
//				Feralidragon (07-08-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WRESoldIonWave expands WREIonWave;

#exec MESH IMPORT MESH=WRESoldIonWave ANIVFILE=MODELS\WREIonWave_a.3d DATAFILE=MODELS\WREIonWave_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=WRESoldIonWave X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=WRESoldIonWave SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WRESoldIonWave SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=WRESoldIonWave MESH=WRESoldIonWave
#exec MESHMAP SCALE MESHMAP=WRESoldIonWave X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=WREIonWave FILE=CORONAS\WREIonWave.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=WRESoldIonWave NUM=1 TEXTURE=WREIonWave

defaultproperties
{
	Mesh=WRESoldIonWave
	LifeSpan=1.000000
	DrawScale=50.000000
	MinDrawScale=3.500000
}
