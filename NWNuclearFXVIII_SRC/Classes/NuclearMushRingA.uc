//////////////////////////////////////////////////////////////
//				Feralidragon (26-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearMushRingA expands NaliWEffects;

#exec MESH IMPORT MESH=NuclearMushRingA ANIVFILE=MODELS\NuclearMushRingA_a.3d DATAFILE=MODELS\NuclearMushRingA_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=NuclearMushRingA X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=NuclearMushRingA SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NuclearMushRingA SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NuclearMushRingA MESH=NuclearMushRingA
#exec MESHMAP SCALE MESHMAP=NuclearMushRingA X=0.5 Y=0.5 Z=1.0

#exec TEXTURE IMPORT NAME=NuclearRingA FILE=CORONAS\NuclearRingA.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=NuclearMushRingA NUM=1 TEXTURE=NuclearRingA

var() float MinDrawScale, FadeInTime, FadeOutTime;

simulated function Tick( float DeltaTime)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * (Default.DrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
		if (Default.LifeSpan - LifeSpan <= FadeInTime)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / FadeInTime;
		else if (FadeOutTime > 0 && LifeSpan <= FadeOutTime)
			ScaleGlow = LifeSpan * Default.ScaleGlow / FadeOutTime;
		else if (FadeOutTime == 0)
			ScaleGlow = LifeSpan * Default.ScaleGlow / (Default.LifeSpan - FadeInTime);
	}
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NuclearMushRingA
	Style=STY_Translucent
	RemoteRole=ROLE_SimulatedProxy
	bUnlit=True
	MultiSkins(1)=NuclearRingA
	
	MinDrawScale=3.000000
	FadeInTime=2.000000
	FadeOutTime=4.000000
	LifeSpan=6.000000
	DrawScale=35.000000
	ScaleGlow=3.500000
}
