//////////////////////////////////////////////////////////////
//				Feralidragon (03-01-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonNukeRing expands NaliFullMeshFX;

#exec MESH IMPORT MESH=IonNukeRing ANIVFILE=MODELS\IonNukeRing_a.3d DATAFILE=MODELS\IonNukeRing_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonNukeRing STRENGTH=0
#exec MESH ORIGIN MESH=IonNukeRing X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IonNukeRing SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonNukeRing SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonNukeRing MESH=IonNukeRing
#exec MESHMAP SCALE MESHMAP=IonNukeRing X=2.0 Y=2.0 Z=4.0

#exec TEXTURE IMPORT NAME=IonRingShockwave01 FILE=CORONAS\IonRingShockwave01.bmp GROUP=IonRing LODSET=2
#exec TEXTURE IMPORT NAME=IonRingShockwave02 FILE=CORONAS\IonRingShockwave02.bmp GROUP=IonRing LODSET=2
#exec TEXTURE IMPORT NAME=IonRingShockwave03 FILE=CORONAS\IonRingShockwave03.bmp GROUP=IonRing LODSET=2
#exec TEXTURE IMPORT NAME=IonRingShockwave04 FILE=CORONAS\IonRingShockwave04.bmp GROUP=IonRing LODSET=2
#exec TEXTURE IMPORT NAME=IonRingShockwave05 FILE=CORONAS\IonRingShockwave05.bmp GROUP=IonRing LODSET=2
#exec TEXTURE IMPORT NAME=IonRingShockwave06 FILE=CORONAS\IonRingShockwave06.bmp GROUP=IonRing LODSET=2
#exec TEXTURE IMPORT NAME=IonRingShockwave07 FILE=CORONAS\IonRingShockwave07.bmp GROUP=IonRing LODSET=2
#exec TEXTURE IMPORT NAME=IonRingShockwave08 FILE=CORONAS\IonRingShockwave08.bmp GROUP=IonRing LODSET=2
#exec TEXTURE IMPORT NAME=IonRingShockwave09 FILE=CORONAS\IonRingShockwave09.bmp GROUP=IonRing LODSET=2
#exec TEXTURE IMPORT NAME=IonRingShockwave10 FILE=CORONAS\IonRingShockwave10.bmp GROUP=IonRing LODSET=2
#exec TEXTURE IMPORT NAME=IonRingShockwave11 FILE=CORONAS\IonRingShockwave11.bmp GROUP=IonRing LODSET=2
#exec TEXTURE IMPORT NAME=IonRingShockwave12 FILE=CORONAS\IonRingShockwave12.bmp GROUP=IonRing LODSET=2
#exec TEXTURE IMPORT NAME=IonRingShockwave13 FILE=CORONAS\IonRingShockwave13.bmp GROUP=IonRing LODSET=2
#exec TEXTURE IMPORT NAME=IonRingShockwave14 FILE=CORONAS\IonRingShockwave14.bmp GROUP=IonRing LODSET=2
#exec TEXTURE IMPORT NAME=IonRingShockwave15 FILE=CORONAS\IonRingShockwave15.bmp GROUP=IonRing LODSET=2
#exec TEXTURE IMPORT NAME=IonRingShockwave16 FILE=CORONAS\IonRingShockwave16.bmp GROUP=IonRing LODSET=2

#exec MESHMAP SETTEXTURE MESHMAP=IonNukeRing NUM=1 TEXTURE=IonRingShockwave01


var() texture IonRingTex[16];
var() float IonRingRate;
var() float MinDScale, FadeInTime;

var float IonCount;
var byte curTex;

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		IonCount += Delta;
		if (IonCount >= 1/IonRingRate)
		{
			IonCount -= (1/IonRingRate);
			curTex++;
			if (curTex >= ArrayCount(IonRingTex))
				curTex = 0;
			MultiSkins[1] = IonRingTex[curTex];
		}
		
		DrawScale = (Default.LifeSpan - LifeSpan)*(Default.DrawScale - MinDScale)/Default.LifeSpan + MinDScale;
		
		if ((Default.LifeSpan - LifeSpan) <= FadeInTime)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / FadeInTime;
		else
			ScaleGlow = LifeSpan * Default.ScaleGlow / (Default.LifeSpan - FadeInTime);
	}
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonNukeRing
	Style=STY_Translucent
	bUnlit=True
	bAlwaysRelevant=True
	
	ScaleGlow=3.000000
	DrawScale=50.000000
	LifeSpan=4.500000
	
	IonRingRate=25.000000
	MinDScale=0.500000
	FadeInTime=0.350000
	
	IonRingTex(0)=IonRingShockwave01
	IonRingTex(1)=IonRingShockwave02
	IonRingTex(2)=IonRingShockwave03
	IonRingTex(3)=IonRingShockwave04
	IonRingTex(4)=IonRingShockwave05
	IonRingTex(5)=IonRingShockwave06
	IonRingTex(6)=IonRingShockwave07
	IonRingTex(7)=IonRingShockwave08
	IonRingTex(8)=IonRingShockwave09
	IonRingTex(9)=IonRingShockwave10
	IonRingTex(10)=IonRingShockwave11
	IonRingTex(11)=IonRingShockwave12
	IonRingTex(12)=IonRingShockwave13
	IonRingTex(13)=IonRingShockwave14
	IonRingTex(14)=IonRingShockwave15
	IonRingTex(15)=IonRingShockwave16
	
	bEnableFullMeshView=True
	RadiusView=480.000000
	bAffectByDrawScale=True
	bDirectionalMesh=False
}
