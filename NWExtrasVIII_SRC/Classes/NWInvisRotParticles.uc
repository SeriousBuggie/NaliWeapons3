//////////////////////////////////////////////////////////////
//				Feralidragon (18-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWInvisRotParticles expands NaliWEffects;

#exec MESH IMPORT MESH=NWInvisRotParticles ANIVFILE=MODELS\NWInvisRotParticles_a.3d DATAFILE=MODELS\NWInvisRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWInvisRotParticles STRENGTH=0.0
#exec MESH ORIGIN MESH=NWInvisRotParticles X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NWInvisRotParticles SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=NWInvisRotParticles SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWInvisRotParticles SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=NWInvisRotParticles SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=NWInvisRotParticles MESH=NWInvisRotParticles
#exec MESHMAP SCALE MESHMAP=NWInvisRotParticles X=0.04 Y=0.04 Z=0.08

#exec TEXTURE IMPORT NAME=NWInvisRorCor01 FILE=Coronas\NWInvisRorCor01.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=NWInvisRorCor02 FILE=Coronas\NWInvisRorCor02.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=NWInvisRorCor03 FILE=Coronas\NWInvisRorCor03.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=NWInvisRorCor04 FILE=Coronas\NWInvisRorCor04.bmp GROUP=Coronas FLAGS=2


var() rotator InclinationRot;
var() float RotRate;

simulated function PostBeginPlay()
{
	SetRotation(InclinationRot);
	if (RotRate > 0)
		LoopAnim('RotateLoop', RotRate);
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (Owner != None)
		{
			bHidden = Owner.bHidden;
			SetLocation(Owner.Location);
		}
		if (bHidden)
			return;
		
		DrawScale = Default.DrawScale * (FRand()*0.2+0.9);
		ScaleGlow = Default.ScaleGlow * (FRand()*0.4+0.8);
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWInvisRotParticles
	bNetTemporary=False
	bUnlit=True
	bParticles=True
	bRandomFrame=True
	Texture=TranslucInvis
	Style=STY_Translucent
	ScaleGlow=1.500000
	DrawScale=0.025000
	
	InclinationRot=(Yaw=0,Pitch=0,Roll=0)
	RotRate=0.100000
	MultiSkins(0)=NWInvisRorCor01
}
