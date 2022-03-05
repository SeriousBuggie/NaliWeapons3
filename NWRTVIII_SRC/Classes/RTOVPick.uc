//////////////////////////////////////////////////////////////
//				Feralidragon (17-03-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTOVPick expands NWOverPickupFX;

//===========================================================================

//OV TOP
//*******************************************************

//Pickup
#exec MESH IMPORT MESH=RTOVPickTop ANIVFILE=MODELS\RTOVFirstTop_a.3d DATAFILE=MODELS\RTOVFirstTop_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTOVPickTop STRENGTH=0
#exec MESH ORIGIN MESH=RTOVPickTop X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTOVPickTop SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTop SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTop SEQ=ChangeToRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTop SEQ=ChangeToNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTop SEQ=Fire STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTop SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTop SEQ=StillNormal STARTFRAME=38 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTop SEQ=StillRazor STARTFRAME=40 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTop SEQ=SelectNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTop SEQ=DownNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTop SEQ=SelectRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTop SEQ=DownRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTop SEQ=SelectEmpty STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTop SEQ=DownEmpty STARTFRAME=17 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=RTOVPickTop MESH=RTOVPickTop
#exec MESHMAP SCALE MESHMAP=RTOVPickTop X=0.1 Y=0.1 Z=0.2

//OV TOP A
//*******************************************************

//Pickup
#exec MESH IMPORT MESH=RTOVPickTopA ANIVFILE=MODELS\RTOVFirstTopA_a.3d DATAFILE=MODELS\RTOVFirstTopA_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTOVPickTopA STRENGTH=0
#exec MESH ORIGIN MESH=RTOVPickTopA X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTOVPickTopA SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopA SEQ=ChangeToRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopA SEQ=ChangeToNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopA SEQ=Fire STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopA SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopA SEQ=StillNormal STARTFRAME=38 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopA SEQ=StillRazor STARTFRAME=40 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopA SEQ=SelectNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopA SEQ=DownNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopA SEQ=SelectRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopA SEQ=DownRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopA SEQ=SelectEmpty STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopA SEQ=DownEmpty STARTFRAME=17 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=RTOVPickTopA MESH=RTOVPickTopA
#exec MESHMAP SCALE MESHMAP=RTOVPickTopA X=0.1 Y=0.1 Z=0.2

//OV TOP B
//*******************************************************

//Pickup
#exec MESH IMPORT MESH=RTOVPickTopB ANIVFILE=MODELS\RTOVFirstTopB_a.3d DATAFILE=MODELS\RTOVFirstTopB_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTOVPickTopB STRENGTH=0
#exec MESH ORIGIN MESH=RTOVPickTopB X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTOVPickTopB SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopB SEQ=ChangeToRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopB SEQ=ChangeToNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopB SEQ=Fire STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopB SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopB SEQ=StillNormal STARTFRAME=38 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopB SEQ=StillRazor STARTFRAME=40 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopB SEQ=SelectNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopB SEQ=DownNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopB SEQ=SelectRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopB SEQ=DownRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopB SEQ=SelectEmpty STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopB SEQ=DownEmpty STARTFRAME=17 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=RTOVPickTopB MESH=RTOVPickTopB
#exec MESHMAP SCALE MESHMAP=RTOVPickTopB X=0.1 Y=0.1 Z=0.2

//OV TOP C
//*******************************************************

//Pickup
#exec MESH IMPORT MESH=RTOVPickTopC ANIVFILE=MODELS\RTOVFirstTopC_a.3d DATAFILE=MODELS\RTOVFirstTopC_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTOVPickTopC STRENGTH=0
#exec MESH ORIGIN MESH=RTOVPickTopC X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTOVPickTopC SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopC SEQ=ChangeToRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopC SEQ=ChangeToNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopC SEQ=Fire STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopC SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopC SEQ=StillNormal STARTFRAME=38 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopC SEQ=StillRazor STARTFRAME=40 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopC SEQ=SelectNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopC SEQ=DownNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopC SEQ=SelectRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopC SEQ=DownRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopC SEQ=SelectEmpty STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopC SEQ=DownEmpty STARTFRAME=17 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=RTOVPickTopC MESH=RTOVPickTopC
#exec MESHMAP SCALE MESHMAP=RTOVPickTopC X=0.1 Y=0.1 Z=0.2

//OV TOP D
//*******************************************************

//Pickup
#exec MESH IMPORT MESH=RTOVPickTopD ANIVFILE=MODELS\RTOVFirstTopD_a.3d DATAFILE=MODELS\RTOVFirstTopD_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTOVPickTopD STRENGTH=0
#exec MESH ORIGIN MESH=RTOVPickTopD X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTOVPickTopD SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopD SEQ=ChangeToRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopD SEQ=ChangeToNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopD SEQ=Fire STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopD SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopD SEQ=StillNormal STARTFRAME=38 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopD SEQ=StillRazor STARTFRAME=40 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopD SEQ=SelectNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopD SEQ=DownNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopD SEQ=SelectRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopD SEQ=DownRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopD SEQ=SelectEmpty STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopD SEQ=DownEmpty STARTFRAME=17 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=RTOVPickTopD MESH=RTOVPickTopD
#exec MESHMAP SCALE MESHMAP=RTOVPickTopD X=0.1 Y=0.1 Z=0.2

//OV TOP E
//*******************************************************

//Pickup
#exec MESH IMPORT MESH=RTOVPickTopE ANIVFILE=MODELS\RTOVFirstTopE_a.3d DATAFILE=MODELS\RTOVFirstTopE_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTOVPickTopE STRENGTH=0
#exec MESH ORIGIN MESH=RTOVPickTopE X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTOVPickTopE SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopE SEQ=ChangeToRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopE SEQ=ChangeToNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopE SEQ=Fire STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopE SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopE SEQ=StillNormal STARTFRAME=38 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopE SEQ=StillRazor STARTFRAME=40 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopE SEQ=SelectNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopE SEQ=DownNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopE SEQ=SelectRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopE SEQ=DownRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopE SEQ=SelectEmpty STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopE SEQ=DownEmpty STARTFRAME=17 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=RTOVPickTopE MESH=RTOVPickTopE
#exec MESHMAP SCALE MESHMAP=RTOVPickTopE X=0.1 Y=0.1 Z=0.2

//OV TOP F
//*******************************************************

//Pickup
#exec MESH IMPORT MESH=RTOVPickTopF ANIVFILE=MODELS\RTOVFirstTopF_a.3d DATAFILE=MODELS\RTOVFirstTopF_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTOVPickTopF STRENGTH=0
#exec MESH ORIGIN MESH=RTOVPickTopF X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTOVPickTopF SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopF SEQ=ChangeToRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopF SEQ=ChangeToNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopF SEQ=Fire STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopF SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopF SEQ=StillNormal STARTFRAME=38 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopF SEQ=StillRazor STARTFRAME=40 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopF SEQ=SelectNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopF SEQ=DownNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopF SEQ=SelectRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopF SEQ=DownRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopF SEQ=SelectEmpty STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickTopF SEQ=DownEmpty STARTFRAME=17 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=RTOVPickTopF MESH=RTOVPickTopF
#exec MESHMAP SCALE MESHMAP=RTOVPickTopF X=0.1 Y=0.1 Z=0.2

//===========================================================================



//OV BOTTOM
//*******************************************************

//Pickup
#exec MESH IMPORT MESH=RTOVPickBottom ANIVFILE=MODELS\RTOVFirstBottom_a.3d DATAFILE=MODELS\RTOVFirstBottom_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTOVPickBottom STRENGTH=0
#exec MESH ORIGIN MESH=RTOVPickBottom X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTOVPickBottom SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottom SEQ=ChangeToRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottom SEQ=ChangeToNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottom SEQ=Fire STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottom SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottom SEQ=StillNormal STARTFRAME=38 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottom SEQ=StillRazor STARTFRAME=40 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottom SEQ=SelectNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottom SEQ=DownNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottom SEQ=SelectRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottom SEQ=DownRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottom SEQ=SelectEmpty STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottom SEQ=DownEmpty STARTFRAME=17 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=RTOVPickBottom MESH=RTOVPickBottom
#exec MESHMAP SCALE MESHMAP=RTOVPickBottom X=0.1 Y=0.1 Z=0.2

//OV BOTTOM A
//*******************************************************

//Pickup
#exec MESH IMPORT MESH=RTOVPickBottomA ANIVFILE=MODELS\RTOVFirstBottomA_a.3d DATAFILE=MODELS\RTOVFirstBottomA_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTOVPickBottomA STRENGTH=0
#exec MESH ORIGIN MESH=RTOVPickBottomA X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTOVPickBottomA SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomA SEQ=ChangeToRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomA SEQ=ChangeToNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomA SEQ=Fire STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomA SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomA SEQ=StillNormal STARTFRAME=38 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomA SEQ=StillRazor STARTFRAME=40 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomA SEQ=SelectNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomA SEQ=DownNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomA SEQ=SelectRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomA SEQ=DownRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomA SEQ=SelectEmpty STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomA SEQ=DownEmpty STARTFRAME=17 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=RTOVPickBottomA MESH=RTOVPickBottomA
#exec MESHMAP SCALE MESHMAP=RTOVPickBottomA X=0.1 Y=0.1 Z=0.2

//OV BOTTOM B
//*******************************************************

//Pickup
#exec MESH IMPORT MESH=RTOVPickBottomB ANIVFILE=MODELS\RTOVFirstBottomB_a.3d DATAFILE=MODELS\RTOVFirstBottomB_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTOVPickBottomB STRENGTH=0
#exec MESH ORIGIN MESH=RTOVPickBottomB X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTOVPickBottomB SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomB SEQ=ChangeToRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomB SEQ=ChangeToNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomB SEQ=Fire STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomB SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomB SEQ=StillNormal STARTFRAME=38 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomB SEQ=StillRazor STARTFRAME=40 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomB SEQ=SelectNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomB SEQ=DownNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomB SEQ=SelectRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomB SEQ=DownRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomB SEQ=SelectEmpty STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomB SEQ=DownEmpty STARTFRAME=17 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=RTOVPickBottomB MESH=RTOVPickBottomB
#exec MESHMAP SCALE MESHMAP=RTOVPickBottomB X=0.1 Y=0.1 Z=0.2

//OV BOTTOM C
//*******************************************************

//Pickup
#exec MESH IMPORT MESH=RTOVPickBottomC ANIVFILE=MODELS\RTOVFirstBottomC_a.3d DATAFILE=MODELS\RTOVFirstBottomC_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTOVPickBottomC STRENGTH=0
#exec MESH ORIGIN MESH=RTOVPickBottomC X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTOVPickBottomC SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomC SEQ=ChangeToRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomC SEQ=ChangeToNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomC SEQ=Fire STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomC SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomC SEQ=StillNormal STARTFRAME=38 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomC SEQ=StillRazor STARTFRAME=40 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomC SEQ=SelectNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomC SEQ=DownNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomC SEQ=SelectRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomC SEQ=DownRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomC SEQ=SelectEmpty STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomC SEQ=DownEmpty STARTFRAME=17 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=RTOVPickBottomC MESH=RTOVPickBottomC
#exec MESHMAP SCALE MESHMAP=RTOVPickBottomC X=0.1 Y=0.1 Z=0.2

//OV BOTTOM D
//*******************************************************

//Pickup
#exec MESH IMPORT MESH=RTOVPickBottomD ANIVFILE=MODELS\RTOVFirstBottomD_a.3d DATAFILE=MODELS\RTOVFirstBottomD_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTOVPickBottomD STRENGTH=0
#exec MESH ORIGIN MESH=RTOVPickBottomD X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTOVPickBottomD SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomD SEQ=ChangeToRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomD SEQ=ChangeToNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomD SEQ=Fire STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomD SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomD SEQ=StillNormal STARTFRAME=38 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomD SEQ=StillRazor STARTFRAME=40 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomD SEQ=SelectNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomD SEQ=DownNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomD SEQ=SelectRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomD SEQ=DownRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomD SEQ=SelectEmpty STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomD SEQ=DownEmpty STARTFRAME=17 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=RTOVPickBottomD MESH=RTOVPickBottomD
#exec MESHMAP SCALE MESHMAP=RTOVPickBottomD X=0.1 Y=0.1 Z=0.2

//OV BOTTOM E
//*******************************************************

//Pickup
#exec MESH IMPORT MESH=RTOVPickBottomE ANIVFILE=MODELS\RTOVFirstBottomE_a.3d DATAFILE=MODELS\RTOVFirstBottomE_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTOVPickBottomE STRENGTH=0
#exec MESH ORIGIN MESH=RTOVPickBottomE X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTOVPickBottomE SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomE SEQ=ChangeToRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomE SEQ=ChangeToNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomE SEQ=Fire STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomE SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomE SEQ=StillNormal STARTFRAME=38 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomE SEQ=StillRazor STARTFRAME=40 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomE SEQ=SelectNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomE SEQ=DownNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomE SEQ=SelectRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomE SEQ=DownRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomE SEQ=SelectEmpty STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomE SEQ=DownEmpty STARTFRAME=17 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=RTOVPickBottomE MESH=RTOVPickBottomE
#exec MESHMAP SCALE MESHMAP=RTOVPickBottomE X=0.1 Y=0.1 Z=0.2

//OV BOTTOM F
//*******************************************************

//Pickup
#exec MESH IMPORT MESH=RTOVPickBottomF ANIVFILE=MODELS\RTOVFirstBottomF_a.3d DATAFILE=MODELS\RTOVFirstBottomF_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTOVPickBottomF STRENGTH=0
#exec MESH ORIGIN MESH=RTOVPickBottomF X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTOVPickBottomF SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomF SEQ=ChangeToRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomF SEQ=ChangeToNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomF SEQ=Fire STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomF SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomF SEQ=StillNormal STARTFRAME=38 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomF SEQ=StillRazor STARTFRAME=40 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomF SEQ=SelectNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomF SEQ=DownNormal STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomF SEQ=SelectRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomF SEQ=DownRazor STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomF SEQ=SelectEmpty STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTOVPickBottomF SEQ=DownEmpty STARTFRAME=17 NUMFRAMES=1

//Scale
#exec MESHMAP NEW MESHMAP=RTOVPickBottomF MESH=RTOVPickBottomF
#exec MESHMAP SCALE MESHMAP=RTOVPickBottomF X=0.1 Y=0.1 Z=0.2

//===========================================================================

//FX Skins
#exec TEXTURE IMPORT NAME=RTOV_Red FILE=SKINS\RTOV_Red.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=RTOV_Blue FILE=SKINS\RTOV_Blue.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=RTOV_Green FILE=SKINS\RTOV_Green.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=RTOV_Yellow FILE=SKINS\RTOV_Yellow.bmp GROUP=Skins LODSET=2

#exec MESHMAP SETTEXTURE MESHMAP=RTOVPickTop NUM=1 TEXTURE=RTOV_Red
#exec MESHMAP SETTEXTURE MESHMAP=RTOVPickTopA NUM=1 TEXTURE=RTOV_Red
#exec MESHMAP SETTEXTURE MESHMAP=RTOVPickTopB NUM=1 TEXTURE=RTOV_Red
#exec MESHMAP SETTEXTURE MESHMAP=RTOVPickTopC NUM=1 TEXTURE=RTOV_Red
#exec MESHMAP SETTEXTURE MESHMAP=RTOVPickTopD NUM=1 TEXTURE=RTOV_Red
#exec MESHMAP SETTEXTURE MESHMAP=RTOVPickTopE NUM=1 TEXTURE=RTOV_Red
#exec MESHMAP SETTEXTURE MESHMAP=RTOVPickTopF NUM=1 TEXTURE=RTOV_Red
#exec MESHMAP SETTEXTURE MESHMAP=RTOVPickBottom NUM=1 TEXTURE=RTOV_Red
#exec MESHMAP SETTEXTURE MESHMAP=RTOVPickBottomA NUM=1 TEXTURE=RTOV_Red
#exec MESHMAP SETTEXTURE MESHMAP=RTOVPickBottomB NUM=1 TEXTURE=RTOV_Red
#exec MESHMAP SETTEXTURE MESHMAP=RTOVPickBottomC NUM=1 TEXTURE=RTOV_Red
#exec MESHMAP SETTEXTURE MESHMAP=RTOVPickBottomD NUM=1 TEXTURE=RTOV_Red
#exec MESHMAP SETTEXTURE MESHMAP=RTOVPickBottomE NUM=1 TEXTURE=RTOV_Red
#exec MESHMAP SETTEXTURE MESHMAP=RTOVPickBottomF NUM=1 TEXTURE=RTOV_Red

//===========================================================================


var() mesh MeshTop[6], MeshBottom[6];
var() mesh MeshMainTop, MeshMainBottom;
var() texture GlowTex[4];
var() float MaxGlow;

var byte ovID, glowID, curStatus;
var float curRadOffset, timeCycle, tCount;
var bool bMain, bTop;
var bool forceBHidden;

replication
{
	reliable if (Role == ROLE_Authority)
		glowID, timeCycle, tCount;
}

function setOV(byte id, bool isTop, optional bool isMain)
{
	if (id >= ArrayCount(MeshTop))
		id = 0;
	ovID = id;
	bMain = isMain;
	bTop = isTop;

	if (isMain)
	{
		if (isTop)
			Mesh = MeshMainTop;
		else
			Mesh = MeshMainBottom;
	}
	else if (isTop)
		Mesh = MeshTop[id];
	else
		Mesh = MeshBottom[id];
}

function setTeam(byte team)
{
	if (team < 4)
		MultiSkins[1] = GlowTex[team];
}

function setOVAngleOffset(float rad)
{
	curRadOffset = rad;
	tCount = rad/(2*PI) * timeCycle;
}

function setOVTimeCycle(float tmc, optional bool adjustAngleOffset)
{
	timeCycle = tmc;
	if (adjustAngleOffset)
		setOVAngleOffset(curRadOffset);
}

function setGlowType(byte t)
{
	glowID = t;
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && !bHidden)
	{
		tCount += Delta;
		if (tCount > timeCycle)
			tCount -= timeCycle;
		
		if (glowID == 0)
		{
			if (tCount < timeCycle/2)
				ScaleGlow = (Sin(tCount/timeCycle*4*PI - PI/2) + 1)/2 * MaxGlow;
			else
				ScaleGlow = 0.0;
		}
		else if (glowID == 1)
			ScaleGlow = (Sin(tCount/timeCycle*2*PI) + 1)/2 * MaxGlow;
		else if (glowID == 2)
		{
			if (tCount < timeCycle/4)
				ScaleGlow = (Sin(tCount/timeCycle*4*PI - PI/2) + 1)/2 * MaxGlow;
			else
				ScaleGlow = (Cos((tCount - (timeCycle/4))/(timeCycle/4*3)*PI) + 1)/2 * MaxGlow;
		}
	}
	
	if (Role == ROLE_Authority && RT(Owner) != None)
	{
		bHidden = (Owner.bHidden || Pawn(Owner.Owner) != None || forceBHidden);
		if (RT(Owner).TransStatus != curStatus)
		{
			RT(Owner).UpdatePickupOVStatus(ovID, bTop, bMain);
			if (Pawn(Owner.Owner) != None && Pawn(Owner.Owner).PlayerReplicationInfo != None)
				setTeam(Pawn(Owner.Owner).PlayerReplicationInfo.Team);
			curStatus = RT(Owner).TransStatus;
		}
	}
}


defaultproperties
{
	Mesh=RTOVPickTop
	Style=STY_Translucent
	ScaleGlow=0.000000
	bUnlit=True
	timeCycle=1.000000
	MaxGlow=1.750000
	
	GlowTex(0)=RTOV_Red
	GlowTex(1)=RTOV_Blue
	GlowTex(2)=RTOV_Green
	GlowTex(3)=RTOV_Yellow

	MeshMainTop=RTOVPickTop
	MeshMainBottom=RTOVPickBottom
	MeshTop(0)=RTOVPickTopA
	MeshTop(1)=RTOVPickTopB
	MeshTop(2)=RTOVPickTopC
	MeshTop(3)=RTOVPickTopD
	MeshTop(4)=RTOVPickTopE
	MeshTop(5)=RTOVPickTopF
	MeshBottom(0)=RTOVPickBottomA
	MeshBottom(1)=RTOVPickBottomB
	MeshBottom(2)=RTOVPickBottomC
	MeshBottom(3)=RTOVPickBottomD
	MeshBottom(4)=RTOVPickBottomE
	MeshBottom(5)=RTOVPickBottomF
}