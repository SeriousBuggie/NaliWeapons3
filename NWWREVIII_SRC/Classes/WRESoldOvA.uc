//////////////////////////////////////////////////////////////
//				Feralidragon (08-08-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WRESoldOvA expands NaliWEffects;

#exec MESH IMPORT MESH=WRESoldOvA ANIVFILE=MODELS\WRESoldOvA_a.3d DATAFILE=MODELS\WRESoldOvA_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WRESoldOvA STRENGTH=0
#exec MESH ORIGIN MESH=WRESoldOvA X=0 Y=0 Z=0 YAW=64

#exec MESH SEQUENCE MESH=WRESoldOvA SEQ=All STARTFRAME=0 NUMFRAMES=72
#exec MESH SEQUENCE MESH=WRESoldOvA SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WRESoldOvA SEQ=TweenStill STARTFRAME=71 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=WRESoldOvA SEQ=LookRight STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=WRESoldOvA SEQ=LookRightBack STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=WRESoldOvA SEQ=LookLeft STARTFRAME=20 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=WRESoldOvA SEQ=LookLeftBack STARTFRAME=30 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=WRESoldOvA SEQ=Fire01 STARTFRAME=40 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=WRESoldOvA SEQ=Fire02 STARTFRAME=50 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=WRESoldOvA SEQ=Fire03 STARTFRAME=60 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=WRESoldOvA SEQ=FireFull STARTFRAME=40 NUMFRAMES=31 RATE=30.0
#exec MESH SEQUENCE MESH=WRESoldOvA SEQ=FireLoop STARTFRAME=40 NUMFRAMES=30 RATE=29.0

#exec MESHMAP NEW MESHMAP=WRESoldOvA MESH=WRESoldOvA
#exec MESHMAP SCALE MESHMAP=WRESoldOvA X=1.0 Y=1.0 Z=2.0

#exec TEXTURE IMPORT NAME=WREnforcer_Sk02 FILE=SKINS\WREnforcer_Sk02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=WRESoldOvA NUM=1 TEXTURE=WREnforcer_Sk02

#exec TEXTURE IMPORT NAME=WREnforcer_Sk03 FILE=SKINS\WREnforcer_Sk03.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=WRESoldOvA NUM=2 TEXTURE=WREnforcer_Sk03


var() float FlickerMaxGlow, FlickerMinGlow;


simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = FRand()*(FlickerMaxGlow - FlickerMinGlow) + FlickerMinGlow;
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=WRESoldOvA
	bUnlit=True
	Scaleglow=1.500000
	Style=STY_Translucent
	DrawScale=1.000000
	
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	Physics=PHYS_Trailer
	bTrailerSameRotation=True
	bTrailerPrePivot=True
	bAnimByOwner=True
	LifeSpan=0.000000
	Mass=0.000000
	
	FlickerMinGlow=1.000000
	FlickerMaxGlow=2.000000
}
