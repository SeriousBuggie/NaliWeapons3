//////////////////////////////////////////////////////////////
//				Feralidragon (04-02-2012)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecChargeOV expands NaliWEffects;

//1st person
#exec MESH IMPORT MESH=TheExecutionerChargeOV ANIVFILE=MODELS\TheExecutionerChargeOV_a.3d DATAFILE=MODELS\TheExecutionerChargeOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheExecutionerChargeOV STRENGTH=0
#exec MESH ORIGIN MESH=TheExecutionerChargeOV X=0 Y=0 Z=0 Yaw=128

//1st person right
#exec MESH IMPORT MESH=TheExecutionerChargeOVR ANIVFILE=MODELS\TheExecutionerChargeOV_a.3d DATAFILE=MODELS\TheExecutionerChargeOV_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=TheExecutionerChargeOVR STRENGTH=0
#exec MESH ORIGIN MESH=TheExecutionerChargeOVR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=All STARTFRAME=0 NUMFRAMES=190
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=SingleAttack1 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=SingleRecoil1 STARTFRAME=9 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=SingleAttack2 STARTFRAME=18 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=SingleRecoil2 STARTFRAME=27 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=SingleAttack3 STARTFRAME=36 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=SingleRecoil3 STARTFRAME=45 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=SingleAttack4 STARTFRAME=54 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=SingleRecoil4 STARTFRAME=63 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=DoubleAttack1 STARTFRAME=72 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=DoubleRecoil1 STARTFRAME=81 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=DoubleAttack2 STARTFRAME=90 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=DoubleRecoil2 STARTFRAME=99 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=DoubleAttack3 STARTFRAME=108 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=DoubleRecoil3 STARTFRAME=117 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=DoubleAttack4 STARTFRAME=126 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=DoubleRecoil4 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=SuperCharge1 STARTFRAME=126 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=SuperAttack1 STARTFRAME=132 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=SuperAttackTween1 STARTFRAME=132 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=SuperRecoil1 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=SuperCharge2 STARTFRAME=144 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=SuperAttack2 STARTFRAME=153 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=SuperAttackTween2 STARTFRAME=153 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=SuperRecoil2 STARTFRAME=162 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=Select STARTFRAME=180 NUMFRAMES=10 RATE=20.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheExecutionerChargeOV SEQ=Down STARTFRAME=171 NUMFRAMES=10 RATE=40.0

#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=All STARTFRAME=0 NUMFRAMES=190
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=SingleAttack1 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=SingleRecoil1 STARTFRAME=9 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=SingleAttack2 STARTFRAME=18 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=SingleRecoil2 STARTFRAME=27 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=SingleAttack3 STARTFRAME=36 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=SingleRecoil3 STARTFRAME=45 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=SingleAttack4 STARTFRAME=54 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=SingleRecoil4 STARTFRAME=63 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=DoubleAttack1 STARTFRAME=72 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=DoubleRecoil1 STARTFRAME=81 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=DoubleAttack2 STARTFRAME=90 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=DoubleRecoil2 STARTFRAME=99 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=DoubleAttack3 STARTFRAME=108 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=DoubleRecoil3 STARTFRAME=117 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=DoubleAttack4 STARTFRAME=126 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=DoubleRecoil4 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=SuperCharge1 STARTFRAME=126 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=SuperAttack1 STARTFRAME=132 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=SuperAttackTween1 STARTFRAME=132 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=SuperRecoil1 STARTFRAME=135 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=SuperCharge2 STARTFRAME=144 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=SuperAttack2 STARTFRAME=153 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=SuperAttackTween2 STARTFRAME=153 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=SuperRecoil2 STARTFRAME=162 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=Select STARTFRAME=180 NUMFRAMES=10 RATE=20.0 GROUP=Select
#exec MESH SEQUENCE MESH=TheExecutionerChargeOVR SEQ=Down STARTFRAME=171 NUMFRAMES=10 RATE=40.0

//Scale
#exec MESHMAP NEW MESHMAP=TheExecutionerChargeOV MESH=TheExecutionerChargeOV
#exec MESHMAP SCALE MESHMAP=TheExecutionerChargeOV X=0.03 Y=0.03 Z=0.06

#exec MESHMAP NEW MESHMAP=TheExecutionerChargeOVR MESH=TheExecutionerChargeOVR
#exec MESHMAP SCALE MESHMAP=TheExecutionerChargeOVR X=0.03 Y=0.03 Z=0.06

//Skin (overlay)
#exec TEXTURE IMPORT NAME=TheExecutionerOVCharge FILE=SKINS\TheExecutionerOVCharge.bmp GROUP=Overlays
#exec MESHMAP SETTEXTURE MESHMAP=TheExecutionerChargeOV NUM=1 TEXTURE=TheExecutionerOVCharge
#exec MESHMAP SETTEXTURE MESHMAP=TheExecutionerChargeOV NUM=2 TEXTURE=TheExecutionerOVCharge
#exec MESHMAP SETTEXTURE MESHMAP=TheExecutionerChargeOVR NUM=1 TEXTURE=TheExecutionerOVCharge
#exec MESHMAP SETTEXTURE MESHMAP=TheExecutionerChargeOVR NUM=2 TEXTURE=TheExecutionerOVCharge


var() Mesh OVMesh[2];
var() float GlowFlicker;

var float fadeOutGlowOrigin, fadeOutTime, fadeOutC, curGlow;

simulated function SetHandedness(int Hand)
{
	if (Hand > 0)
		Mesh = OVMesh[0];
	else
		Mesh = OVMesh[1];
}

simulated function SetCharge(float chargeAmount)
{
	curGlow = chargeAmount * default.ScaleGlow;
	ScaleGlow = curGlow + (FRand()*2-1)*(curGlow/default.ScaleGlow)*GlowFlicker;
}

simulated function SetFadeOut(float time)
{
	fadeOutGlowOrigin = curGlow;
	fadeOutTime = time;
	fadeOutC = fadeOutTime;
}

simulated function Tick(float Delta)
{
	if (fadeOutC > 0.0)
	{
		fadeOutC -= Delta;
		if (fadeOutC < 0.0)
			fadeOutC = 0.0;
		ScaleGlow = fadeOutC * fadeOutGlowOrigin / fadeOutTime;
	}
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=TheExecutionerChargeOV
	bHidden=True
	bUnlit=True
	ScaleGlow=2.000000
	Style=STY_Translucent
	bNetTemporary=False
	
	GlowFlicker=0.550000
	OVMesh(0)=TheExecutionerChargeOV
	OVMesh(1)=TheExecutionerChargeOVR
}
