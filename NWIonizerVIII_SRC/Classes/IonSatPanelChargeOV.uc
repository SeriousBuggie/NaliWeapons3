//////////////////////////////////////////////////////////////
//				Feralidragon (18-12-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonSatPanelChargeOV expands IonSatMainChargeOV;

#exec TEXTURE IMPORT NAME=IonizerSatellite01_OV FILE=SKINS\IonizerSatellite01_OV.bmp GROUP=Skins LODSET=2

//--- Panel 0 ---
//-----------------------------------------------------------------------------------------
#exec MESH IMPORT MESH=IonSatPanelChargeOV ANIVFILE=MODELS\IonSatPanelChargeOV_a.3d DATAFILE=MODELS\IonSatPanelChargeOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatPanelChargeOV STRENGTH=0.0
#exec MESH ORIGIN MESH=IonSatPanelChargeOV X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatPanelChargeOV SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=IonSatPanelChargeOV SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanelChargeOV SEQ=Openning STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=IonSatPanelChargeOV SEQ=Closed STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanelChargeOV SEQ=Closing STARTFRAME=0 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=IonSatPanelChargeOV MESH=IonSatPanelChargeOV
#exec MESHMAP SCALE MESHMAP=IonSatPanelChargeOV X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=IonSatPanelChargeOV NUM=1 TEXTURE=IonizerSatellite01_OV

//--- Panel 1 ---
//-----------------------------------------------------------------------------------------
#exec MESH IMPORT MESH=IonSatPanel1 ANIVFILE=MODELS\IonSatPanel1_a.3d DATAFILE=MODELS\IonSatPanel1_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatPanel1 STRENGTH=0.0
#exec MESH ORIGIN MESH=IonSatPanel1 X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatPanel1 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=IonSatPanel1 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel1 SEQ=Openning STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=IonSatPanel1 SEQ=Closed STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel1 SEQ=Closing STARTFRAME=0 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=IonSatPanel1 MESH=IonSatPanel1
#exec MESHMAP SCALE MESHMAP=IonSatPanel1 X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=IonSatPanel1 NUM=1 TEXTURE=IonizerSatellite01_OV

//--- Panel 2 ---
//-----------------------------------------------------------------------------------------
#exec MESH IMPORT MESH=IonSatPanel2 ANIVFILE=MODELS\IonSatPanel2_a.3d DATAFILE=MODELS\IonSatPanel2_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatPanel2 STRENGTH=0.0
#exec MESH ORIGIN MESH=IonSatPanel2 X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatPanel2 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=IonSatPanel2 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel2 SEQ=Openning STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=IonSatPanel2 SEQ=Closed STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel2 SEQ=Closing STARTFRAME=0 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=IonSatPanel2 MESH=IonSatPanel2
#exec MESHMAP SCALE MESHMAP=IonSatPanel2 X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=IonSatPanel2 NUM=1 TEXTURE=IonizerSatellite01_OV

//--- Panel 3 ---
//-----------------------------------------------------------------------------------------
#exec MESH IMPORT MESH=IonSatPanel3 ANIVFILE=MODELS\IonSatPanel3_a.3d DATAFILE=MODELS\IonSatPanel3_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatPanel3 STRENGTH=0.0
#exec MESH ORIGIN MESH=IonSatPanel3 X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatPanel3 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=IonSatPanel3 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel3 SEQ=Openning STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=IonSatPanel3 SEQ=Closed STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel3 SEQ=Closing STARTFRAME=0 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=IonSatPanel3 MESH=IonSatPanel3
#exec MESHMAP SCALE MESHMAP=IonSatPanel3 X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=IonSatPanel3 NUM=1 TEXTURE=IonizerSatellite01_OV

//--- Panel 4 ---
//-----------------------------------------------------------------------------------------
#exec MESH IMPORT MESH=IonSatPanel4 ANIVFILE=MODELS\IonSatPanel4_a.3d DATAFILE=MODELS\IonSatPanel4_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatPanel4 STRENGTH=0.0
#exec MESH ORIGIN MESH=IonSatPanel4 X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatPanel4 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=IonSatPanel4 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel4 SEQ=Openning STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=IonSatPanel4 SEQ=Closed STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel4 SEQ=Closing STARTFRAME=0 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=IonSatPanel4 MESH=IonSatPanel4
#exec MESHMAP SCALE MESHMAP=IonSatPanel4 X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=IonSatPanel4 NUM=1 TEXTURE=IonizerSatellite01_OV

//--- Panel 5 ---
//-----------------------------------------------------------------------------------------
#exec MESH IMPORT MESH=IonSatPanel5 ANIVFILE=MODELS\IonSatPanel5_a.3d DATAFILE=MODELS\IonSatPanel5_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatPanel5 STRENGTH=0.0
#exec MESH ORIGIN MESH=IonSatPanel5 X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatPanel5 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=IonSatPanel5 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel5 SEQ=Openning STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=IonSatPanel5 SEQ=Closed STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel5 SEQ=Closing STARTFRAME=0 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=IonSatPanel5 MESH=IonSatPanel5
#exec MESHMAP SCALE MESHMAP=IonSatPanel5 X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=IonSatPanel5 NUM=1 TEXTURE=IonizerSatellite01_OV

//--- Panel 6 ---
//-----------------------------------------------------------------------------------------
#exec MESH IMPORT MESH=IonSatPanel6 ANIVFILE=MODELS\IonSatPanel6_a.3d DATAFILE=MODELS\IonSatPanel6_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatPanel6 STRENGTH=0.0
#exec MESH ORIGIN MESH=IonSatPanel6 X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatPanel6 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=IonSatPanel6 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel6 SEQ=Openning STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=IonSatPanel6 SEQ=Closed STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel6 SEQ=Closing STARTFRAME=0 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=IonSatPanel6 MESH=IonSatPanel6
#exec MESHMAP SCALE MESHMAP=IonSatPanel6 X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=IonSatPanel6 NUM=1 TEXTURE=IonizerSatellite01_OV

//--- Panel 7 ---
//-----------------------------------------------------------------------------------------
#exec MESH IMPORT MESH=IonSatPanel7 ANIVFILE=MODELS\IonSatPanel7_a.3d DATAFILE=MODELS\IonSatPanel7_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatPanel7 STRENGTH=0.0
#exec MESH ORIGIN MESH=IonSatPanel7 X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatPanel7 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=IonSatPanel7 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel7 SEQ=Openning STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=IonSatPanel7 SEQ=Closed STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel7 SEQ=Closing STARTFRAME=0 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=IonSatPanel7 MESH=IonSatPanel7
#exec MESHMAP SCALE MESHMAP=IonSatPanel7 X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=IonSatPanel7 NUM=1 TEXTURE=IonizerSatellite01_OV

//--- Panel 8 ---
//-----------------------------------------------------------------------------------------
#exec MESH IMPORT MESH=IonSatPanel8 ANIVFILE=MODELS\IonSatPanel8_a.3d DATAFILE=MODELS\IonSatPanel8_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatPanel8 STRENGTH=0.0
#exec MESH ORIGIN MESH=IonSatPanel8 X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatPanel8 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=IonSatPanel8 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel8 SEQ=Openning STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=IonSatPanel8 SEQ=Closed STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel8 SEQ=Closing STARTFRAME=0 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=IonSatPanel8 MESH=IonSatPanel8
#exec MESHMAP SCALE MESHMAP=IonSatPanel8 X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=IonSatPanel8 NUM=1 TEXTURE=IonizerSatellite01_OV

//--- Panel 9 ---
//-----------------------------------------------------------------------------------------
#exec MESH IMPORT MESH=IonSatPanel9 ANIVFILE=MODELS\IonSatPanel9_a.3d DATAFILE=MODELS\IonSatPanel9_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatPanel9 STRENGTH=0.0
#exec MESH ORIGIN MESH=IonSatPanel9 X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatPanel9 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=IonSatPanel9 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel9 SEQ=Openning STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=IonSatPanel9 SEQ=Closed STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatPanel9 SEQ=Closing STARTFRAME=0 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=IonSatPanel9 MESH=IonSatPanel9
#exec MESHMAP SCALE MESHMAP=IonSatPanel9 X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=IonSatPanel9 NUM=1 TEXTURE=IonizerSatellite01_OV


var() mesh Panels[10];

function SetPanel(byte n, float fadeIn, float lifeTime)
{
	TimeAlive = lifeTime;
	TimeToFadeIn = fadeIn;
	Mesh = Panels[Min(ArrayCount(Panels)-1, n)];
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonSatPanelChargeOV
	bAnimByOwner=True
	Style=STY_Translucent
	bUnlit=True
	ScaleGlow=2.000000
	
	TimeToFadeIn=50.000000
	TimeAlive=50.000000
	
	FadeOutTime=2.000000
	GlowNoise=0.250000
	
	Panels(0)=IonSatPanelChargeOV
	Panels(1)=IonSatPanel1
	Panels(2)=IonSatPanel2
	Panels(3)=IonSatPanel3
	Panels(4)=IonSatPanel4
	Panels(5)=IonSatPanel5
	Panels(6)=IonSatPanel6
	Panels(7)=IonSatPanel7
	Panels(8)=IonSatPanel8
	Panels(9)=IonSatPanel9
}
