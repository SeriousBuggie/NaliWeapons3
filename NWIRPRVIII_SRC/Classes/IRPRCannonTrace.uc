//////////////////////////////////////////////////////////////
//				Feralidragon (10-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCannonTrace expands NaliWEffects;

#exec MESH IMPORT MESH=IRPRCannonTrace ANIVFILE=MODELS\IRPRTrace_a.3d DATAFILE=MODELS\IRPRTrace_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IRPRCannonTrace STRENGTH=0.5
#exec MESH ORIGIN MESH=IRPRCannonTrace X=0 Y=0 Z=0 ROLL=64

#exec MESH SEQUENCE MESH=IRPRCannonTrace SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=IRPRCannonTrace SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRCannonTrace SEQ=Stretch STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IRPRCannonTrace SEQ=Shrink STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=IRPRCannonTrace MESH=IRPRCannonTrace
#exec MESHMAP SCALE MESHMAP=IRPRCannonTrace X=0.8 Y=0.2 Z=0.4

#exec TEXTURE IMPORT NAME=IRPRCLaserTrace FILE=CORONAS\IRPRCLaserTrace.bmp GROUP=Skins LODSET=0 MIPS=OFF
#exec MESHMAP SETTEXTURE MESHMAP=IRPRCannonTrace NUM=1 TEXTURE=IRPRCLaserTrace


var() float TraceLength;

simulated function SetupLength(float newLength)
{
	AnimFrame = (newLength/TraceLength) * 0.5;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=IRPRCannonTrace
	Style=STY_Translucent
	bUnlit=True
	AnimSequence=Stretch
	AnimFrame=0.500000
	
	LifeSpan=0.000000
	ScaleGlow=1.500000
	bNetTemporary=False
	
	TraceLength=511.150000
}
