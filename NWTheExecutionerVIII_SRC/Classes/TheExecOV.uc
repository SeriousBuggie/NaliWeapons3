//////////////////////////////////////////////////////////////
//				Feralidragon (29-01-2012)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecOV expands NaliWEffects;

// OVERLAY RIGHT
//*******************************************************

//1st person
#exec MESH IMPORT MESH=TheExecutionerOVRL ANIVFILE=MODELS\TheExecutionerOVR_a.3d DATAFILE=MODELS\TheExecutionerOVR_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheExecutionerOVRL STRENGTH=0
#exec MESH ORIGIN MESH=TheExecutionerOVRL X=0 Y=0 Z=0 Yaw=128

//1st person right
#exec MESH IMPORT MESH=TheExecutionerOVRR ANIVFILE=MODELS\TheExecutionerOVR_a.3d DATAFILE=MODELS\TheExecutionerOVR_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=TheExecutionerOVRR STRENGTH=0
#exec MESH ORIGIN MESH=TheExecutionerOVRR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=All STARTFRAME=0 NUMFRAMES=190
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=SingleAttack1 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=SingleRecoil1 STARTFRAME=9 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=SingleAttack2 STARTFRAME=18 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=SingleRecoil2 STARTFRAME=27 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=SingleAttack3 STARTFRAME=36 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=SingleRecoil3 STARTFRAME=45 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=SingleAttack4 STARTFRAME=54 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=SingleRecoil4 STARTFRAME=63 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=DoubleAttack1 STARTFRAME=72 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=DoubleRecoil1 STARTFRAME=81 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=DoubleAttack2 STARTFRAME=90 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=DoubleRecoil2 STARTFRAME=99 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=DoubleAttack3 STARTFRAME=108 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=DoubleRecoil3 STARTFRAME=117 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=DoubleAttack4 STARTFRAME=126 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=DoubleRecoil4 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=SuperCharge1 STARTFRAME=126 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=SuperAttack1 STARTFRAME=132 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=SuperAttackTween1 STARTFRAME=132 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=SuperRecoil1 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=SuperCharge2 STARTFRAME=144 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=SuperAttack2 STARTFRAME=153 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=SuperAttackTween2 STARTFRAME=153 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=SuperRecoil2 STARTFRAME=162 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=Select STARTFRAME=180 NUMFRAMES=10 RATE=20.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheExecutionerOVRL SEQ=Down STARTFRAME=171 NUMFRAMES=10 RATE=40.0

#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=All STARTFRAME=0 NUMFRAMES=190
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=SingleAttack1 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=SingleRecoil1 STARTFRAME=9 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=SingleAttack2 STARTFRAME=18 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=SingleRecoil2 STARTFRAME=27 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=SingleAttack3 STARTFRAME=36 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=SingleRecoil3 STARTFRAME=45 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=SingleAttack4 STARTFRAME=54 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=SingleRecoil4 STARTFRAME=63 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=DoubleAttack1 STARTFRAME=72 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=DoubleRecoil1 STARTFRAME=81 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=DoubleAttack2 STARTFRAME=90 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=DoubleRecoil2 STARTFRAME=99 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=DoubleAttack3 STARTFRAME=108 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=DoubleRecoil3 STARTFRAME=117 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=DoubleAttack4 STARTFRAME=126 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=DoubleRecoil4 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=SuperCharge1 STARTFRAME=126 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=SuperAttack1 STARTFRAME=132 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=SuperAttackTween1 STARTFRAME=132 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=SuperRecoil1 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=SuperCharge2 STARTFRAME=144 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=SuperAttack2 STARTFRAME=153 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=SuperAttackTween2 STARTFRAME=153 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=SuperRecoil2 STARTFRAME=162 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=Select STARTFRAME=180 NUMFRAMES=10 RATE=20.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheExecutionerOVRR SEQ=Down STARTFRAME=171 NUMFRAMES=10 RATE=40.0

//Scale
#exec MESHMAP NEW MESHMAP=TheExecutionerOVRL MESH=TheExecutionerOVRL
#exec MESHMAP SCALE MESHMAP=TheExecutionerOVRL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=TheExecutionerOVRR MESH=TheExecutionerOVRR
#exec MESHMAP SCALE MESHMAP=TheExecutionerOVRR X=0.03 Y=0.03 Z=0.06


// OVERLAY LEFT
//*******************************************************

//1st person
#exec MESH IMPORT MESH=TheExecutionerOVLL ANIVFILE=MODELS\TheExecutionerOVL_a.3d DATAFILE=MODELS\TheExecutionerOVL_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheExecutionerOVLL STRENGTH=0
#exec MESH ORIGIN MESH=TheExecutionerOVLL X=0 Y=0 Z=0 Yaw=128

//1st person right
#exec MESH IMPORT MESH=TheExecutionerOVLR ANIVFILE=MODELS\TheExecutionerOVL_a.3d DATAFILE=MODELS\TheExecutionerOVL_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=TheExecutionerOVLR STRENGTH=0
#exec MESH ORIGIN MESH=TheExecutionerOVLR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=All STARTFRAME=0 NUMFRAMES=190
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=SingleAttack1 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=SingleRecoil1 STARTFRAME=9 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=SingleAttack2 STARTFRAME=18 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=SingleRecoil2 STARTFRAME=27 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=SingleAttack3 STARTFRAME=36 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=SingleRecoil3 STARTFRAME=45 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=SingleAttack4 STARTFRAME=54 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=SingleRecoil4 STARTFRAME=63 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=DoubleAttack1 STARTFRAME=72 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=DoubleRecoil1 STARTFRAME=81 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=DoubleAttack2 STARTFRAME=90 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=DoubleRecoil2 STARTFRAME=99 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=DoubleAttack3 STARTFRAME=108 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=DoubleRecoil3 STARTFRAME=117 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=DoubleAttack4 STARTFRAME=126 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=DoubleRecoil4 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=SuperCharge1 STARTFRAME=126 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=SuperAttack1 STARTFRAME=132 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=SuperAttackTween1 STARTFRAME=132 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=SuperRecoil1 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=SuperCharge2 STARTFRAME=144 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=SuperAttack2 STARTFRAME=153 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=SuperAttackTween2 STARTFRAME=153 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=SuperRecoil2 STARTFRAME=162 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=Select STARTFRAME=180 NUMFRAMES=10 RATE=20.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheExecutionerOVLL SEQ=Down STARTFRAME=171 NUMFRAMES=10 RATE=40.0

#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=All STARTFRAME=0 NUMFRAMES=190
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=SingleAttack1 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=SingleRecoil1 STARTFRAME=9 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=SingleAttack2 STARTFRAME=18 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=SingleRecoil2 STARTFRAME=27 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=SingleAttack3 STARTFRAME=36 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=SingleRecoil3 STARTFRAME=45 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=SingleAttack4 STARTFRAME=54 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=SingleRecoil4 STARTFRAME=63 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=DoubleAttack1 STARTFRAME=72 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=DoubleRecoil1 STARTFRAME=81 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=DoubleAttack2 STARTFRAME=90 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=DoubleRecoil2 STARTFRAME=99 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=DoubleAttack3 STARTFRAME=108 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=DoubleRecoil3 STARTFRAME=117 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=DoubleAttack4 STARTFRAME=126 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=DoubleRecoil4 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=SuperCharge1 STARTFRAME=126 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=SuperAttack1 STARTFRAME=132 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=SuperAttackTween1 STARTFRAME=132 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=SuperRecoil1 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=SuperCharge2 STARTFRAME=144 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=SuperAttack2 STARTFRAME=153 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=SuperAttackTween2 STARTFRAME=153 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=SuperRecoil2 STARTFRAME=162 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=Select STARTFRAME=180 NUMFRAMES=10 RATE=20.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheExecutionerOVLR SEQ=Down STARTFRAME=171 NUMFRAMES=10 RATE=40.0

//Scale
#exec MESHMAP NEW MESHMAP=TheExecutionerOVLL MESH=TheExecutionerOVLL
#exec MESHMAP SCALE MESHMAP=TheExecutionerOVLL X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=TheExecutionerOVLR MESH=TheExecutionerOVLR
#exec MESHMAP SCALE MESHMAP=TheExecutionerOVLR X=0.03 Y=0.03 Z=0.06

// Blood textures import
//*********************************************************************
#exec TEXTURE IMPORT NAME=HighBloodRed01 FILE=FXBlood\HighBloodRed01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodRed02 FILE=FXBlood\HighBloodRed02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodRed03 FILE=FXBlood\HighBloodRed03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodRed01 FILE=FXBlood\LowBloodRed01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodRed02 FILE=FXBlood\LowBloodRed02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodRed03 FILE=FXBlood\LowBloodRed03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodBlue01 FILE=FXBlood\HighBloodBlue01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodBlue02 FILE=FXBlood\HighBloodBlue02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodBlue03 FILE=FXBlood\HighBloodBlue03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodBlue01 FILE=FXBlood\LowBloodBlue01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodBlue02 FILE=FXBlood\LowBloodBlue02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodBlue03 FILE=FXBlood\LowBloodBlue03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodGreen01 FILE=FXBlood\HighBloodGreen01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodGreen02 FILE=FXBlood\HighBloodGreen02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodGreen03 FILE=FXBlood\HighBloodGreen03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodGreen01 FILE=FXBlood\LowBloodGreen01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodGreen02 FILE=FXBlood\LowBloodGreen02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodGreen03 FILE=FXBlood\LowBloodGreen03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodYellow01 FILE=FXBlood\HighBloodYellow01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodYellow02 FILE=FXBlood\HighBloodYellow02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodYellow03 FILE=FXBlood\HighBloodYellow03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodYellow01 FILE=FXBlood\LowBloodYellow01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodYellow02 FILE=FXBlood\LowBloodYellow02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodYellow03 FILE=FXBlood\LowBloodYellow03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodBlack01 FILE=FXBlood\HighBloodBlack01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodBlack02 FILE=FXBlood\HighBloodBlack02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=HighBloodBlack03 FILE=FXBlood\HighBloodBlack03.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodBlack01 FILE=FXBlood\LowBloodBlack01.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodBlack02 FILE=FXBlood\LowBloodBlack02.bmp GROUP=Blood
#exec TEXTURE IMPORT NAME=LowBloodBlack03 FILE=FXBlood\LowBloodBlack03.bmp GROUP=Blood


var() mesh BladeRL, BladeRR, BladeLL, BladeLR;
var() texture LowBlood_Red[3], HighBlood_Red[3];
var() texture LowBlood_Blue[3], HighBlood_Blue[3];
var() texture LowBlood_Green[3], HighBlood_Green[3];
var() texture LowBlood_Yellow[3], HighBlood_Yellow[3];
var() texture LowBlood_Black[3], HighBlood_Black[3];


simulated function SetHandedness(int Hand, bool bRightSide)
{
	if (Hand > 0)
	{
		if (bRightSide)
			Mesh = BladeRL;
		else
			Mesh = BladeLL;
	}
	else
	{
		if (bRightSide)
			Mesh = BladeRR;
		else
			Mesh = BladeLR;
	}
}

static function texture GetBloodTexture(bool bHighBlood, byte type, byte n)
{
	if (type == 0)
	{
		if (bHighBlood)
			return default.HighBlood_Red[n];
		else
			return default.LowBlood_Red[n];
	}
	else if (type == 1)
	{
		if (bHighBlood)
			return default.HighBlood_Blue[n];
		else
			return default.LowBlood_Blue[n];
	}
	else if (type == 2)
	{
		if (bHighBlood)
			return default.HighBlood_Green[n];
		else
			return default.LowBlood_Green[n];
	}
	else if (type == 3)
	{
		if (bHighBlood)
			return default.HighBlood_Yellow[n];
		else
			return default.LowBlood_Yellow[n];
	}
	else if (type == 4)
	{
		if (bHighBlood)
			return default.HighBlood_Black[n];
		else
			return default.LowBlood_Black[n];
	}
	
	return None;
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=TheExecutionerOVRL
	bHidden=True
	bUnlit=False
	ScaleGlow=1.000000
	Style=STY_Modulated
	bNetTemporary=False
	
	BladeRL=TheExecutionerOVRL
	BladeRR=TheExecutionerOVRR
	BladeLL=TheExecutionerOVLL
	BladeLR=TheExecutionerOVLR
	
	LowBlood_Red(0)=LowBloodRed01
	LowBlood_Red(1)=LowBloodRed02
	LowBlood_Red(2)=LowBloodRed03
	HighBlood_Red(0)=HighBloodRed01
	HighBlood_Red(1)=HighBloodRed02
	HighBlood_Red(2)=HighBloodRed03
	LowBlood_Blue(0)=LowBloodBlue01
	LowBlood_Blue(1)=LowBloodBlue02
	LowBlood_Blue(2)=LowBloodBlue03
	HighBlood_Blue(0)=HighBloodBlue01
	HighBlood_Blue(1)=HighBloodBlue02
	HighBlood_Blue(2)=HighBloodBlue03
	LowBlood_Green(0)=LowBloodGreen01
	LowBlood_Green(1)=LowBloodGreen02
	LowBlood_Green(2)=LowBloodGreen03
	HighBlood_Green(0)=HighBloodGreen01
	HighBlood_Green(1)=HighBloodGreen02
	HighBlood_Green(2)=HighBloodGreen03
	LowBlood_Yellow(0)=LowBloodYellow01
	LowBlood_Yellow(1)=LowBloodYellow02
	LowBlood_Yellow(2)=LowBloodYellow03
	HighBlood_Yellow(0)=HighBloodYellow01
	HighBlood_Yellow(1)=HighBloodYellow02
	HighBlood_Yellow(2)=HighBloodYellow03
	LowBlood_Black(0)=LowBloodBlack01
	LowBlood_Black(1)=LowBloodBlack02
	LowBlood_Black(2)=LowBloodBlack03
	HighBlood_Black(0)=HighBloodBlack01
	HighBlood_Black(1)=HighBloodBlack02
	HighBlood_Black(2)=HighBloodBlack03
}
