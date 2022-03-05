//////////////////////////////////////////////////////////////
//				Feralidragon (18-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTOutput expands NaliWEffects;

//FX OUTPUT Down Left
//*******************************************************

//1st person
#exec MESH IMPORT MESH=FOutputDownLeft ANIVFILE=MODELS\FOutputDownLeft_a.3d DATAFILE=MODELS\FOutputDownLeft_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FOutputDownLeft X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FOutputDownLeftR ANIVFILE=MODELS\FOutputDownLeft_a.3d DATAFILE=MODELS\FOutputDownLeft_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=FOutputDownLeftR X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FOutputDownLeft SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FOutputDownLeft SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FOutputDownLeft SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FOutputDownLeft SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FOutputDownLeft SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FOutputDownLeft SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FOutputDownLeft SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FOutputDownLeftR SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FOutputDownLeftR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FOutputDownLeftR SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FOutputDownLeftR SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FOutputDownLeftR SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FOutputDownLeftR SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FOutputDownLeftR SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FOutputDownLeft MESH=FOutputDownLeft
#exec MESHMAP SCALE MESHMAP=FOutputDownLeft X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FOutputDownLeftR MESH=FOutputDownLeftR
#exec MESHMAP SCALE MESHMAP=FOutputDownLeftR X=0.0255 Y=0.0255 Z=0.051

//===========================================================================

//FX OUTPUT Down Right
//*******************************************************

//1st person
#exec MESH IMPORT MESH=FOutputDownRight ANIVFILE=MODELS\FOutputDownRight_a.3d DATAFILE=MODELS\FOutputDownRight_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FOutputDownRight X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FOutputDownRightR ANIVFILE=MODELS\FOutputDownRight_a.3d DATAFILE=MODELS\FOutputDownRight_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=FOutputDownRightR X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FOutputDownRight SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FOutputDownRight SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FOutputDownRight SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FOutputDownRight SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FOutputDownRight SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FOutputDownRight SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FOutputDownRight SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FOutputDownRightR SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FOutputDownRightR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FOutputDownRightR SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FOutputDownRightR SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FOutputDownRightR SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FOutputDownRightR SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FOutputDownRightR SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FOutputDownRight MESH=FOutputDownRight
#exec MESHMAP SCALE MESHMAP=FOutputDownRight X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FOutputDownRightR MESH=FOutputDownRightR
#exec MESHMAP SCALE MESHMAP=FOutputDownRightR X=0.0255 Y=0.0255 Z=0.051

//===========================================================================

//FX OUTPUT Up Left 1
//*******************************************************

//1st person
#exec MESH IMPORT MESH=FOutputUpLeft01 ANIVFILE=MODELS\FOutputUpLeft01_a.3d DATAFILE=MODELS\FOutputUpLeft01_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FOutputUpLeft01 X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FOutputUpLeft01R ANIVFILE=MODELS\FOutputUpLeft01_a.3d DATAFILE=MODELS\FOutputUpLeft01_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=FOutputUpLeft01R X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FOutputUpLeft01 SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FOutputUpLeft01 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FOutputUpLeft01 SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FOutputUpLeft01 SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FOutputUpLeft01 SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FOutputUpLeft01 SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FOutputUpLeft01 SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FOutputUpLeft01R SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FOutputUpLeft01R SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FOutputUpLeft01R SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FOutputUpLeft01R SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FOutputUpLeft01R SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FOutputUpLeft01R SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FOutputUpLeft01R SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FOutputUpLeft01 MESH=FOutputUpLeft01
#exec MESHMAP SCALE MESHMAP=FOutputUpLeft01 X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FOutputUpLeft01R MESH=FOutputUpLeft01R
#exec MESHMAP SCALE MESHMAP=FOutputUpLeft01R X=0.0255 Y=0.0255 Z=0.051

//===========================================================================

//FX OUTPUT Up Left 2
//*******************************************************

//1st person
#exec MESH IMPORT MESH=FOutputUpLeft02 ANIVFILE=MODELS\FOutputUpLeft02_a.3d DATAFILE=MODELS\FOutputUpLeft02_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FOutputUpLeft02 X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FOutputUpLeft02R ANIVFILE=MODELS\FOutputUpLeft02_a.3d DATAFILE=MODELS\FOutputUpLeft02_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=FOutputUpLeft02R X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FOutputUpLeft02 SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FOutputUpLeft02 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FOutputUpLeft02 SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FOutputUpLeft02 SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FOutputUpLeft02 SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FOutputUpLeft02 SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FOutputUpLeft02 SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FOutputUpLeft02R SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FOutputUpLeft02R SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FOutputUpLeft02R SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FOutputUpLeft02R SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FOutputUpLeft02R SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FOutputUpLeft02R SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FOutputUpLeft02R SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FOutputUpLeft02 MESH=FOutputUpLeft02
#exec MESHMAP SCALE MESHMAP=FOutputUpLeft02 X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FOutputUpLeft02R MESH=FOutputUpLeft02R
#exec MESHMAP SCALE MESHMAP=FOutputUpLeft02R X=0.0255 Y=0.0255 Z=0.051

//===========================================================================

//FX OUTPUT Up Right 1
//*******************************************************

//1st person
#exec MESH IMPORT MESH=FOutputUpRight01 ANIVFILE=MODELS\FOutputUpRight01_a.3d DATAFILE=MODELS\FOutputUpRight01_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FOutputUpRight01 X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FOutputUpRight01R ANIVFILE=MODELS\FOutputUpRight01_a.3d DATAFILE=MODELS\FOutputUpRight01_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=FOutputUpRight01R X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FOutputUpRight01 SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FOutputUpRight01 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FOutputUpRight01 SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FOutputUpRight01 SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FOutputUpRight01 SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FOutputUpRight01 SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FOutputUpRight01 SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FOutputUpRight01R SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FOutputUpRight01R SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FOutputUpRight01R SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FOutputUpRight01R SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FOutputUpRight01R SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FOutputUpRight01R SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FOutputUpRight01R SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FOutputUpRight01 MESH=FOutputUpRight01
#exec MESHMAP SCALE MESHMAP=FOutputUpRight01 X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FOutputUpRight01R MESH=FOutputUpRight01R
#exec MESHMAP SCALE MESHMAP=FOutputUpRight01R X=0.0255 Y=0.0255 Z=0.051

//===========================================================================

//FX OUTPUT Up Right 2
//*******************************************************

//1st person
#exec MESH IMPORT MESH=FOutputUpRight02 ANIVFILE=MODELS\FOutputUpRight02_a.3d DATAFILE=MODELS\FOutputUpRight02_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FOutputUpRight02 X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FOutputUpRight02R ANIVFILE=MODELS\FOutputUpRight02_a.3d DATAFILE=MODELS\FOutputUpRight02_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=FOutputUpRight02R X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FOutputUpRight02 SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FOutputUpRight02 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FOutputUpRight02 SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FOutputUpRight02 SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FOutputUpRight02 SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FOutputUpRight02 SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FOutputUpRight02 SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FOutputUpRight02R SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FOutputUpRight02R SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FOutputUpRight02R SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FOutputUpRight02R SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FOutputUpRight02R SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FOutputUpRight02R SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FOutputUpRight02R SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FOutputUpRight02 MESH=FOutputUpRight02
#exec MESHMAP SCALE MESHMAP=FOutputUpRight02 X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FOutputUpRight02R MESH=FOutputUpRight02R
#exec MESHMAP SCALE MESHMAP=FOutputUpRight02R X=0.0255 Y=0.0255 Z=0.051

//===========================================================================

var() texture Flames[16], Smoke[4];
var() float MaxDrawScale;

simulated function RandomizeTexture( bool bSmoke)
{
	if (bSmoke)
		MultiSkins[Rand(3)] = Smoke[Rand(ArrayCount(Smoke))];
	else
		MultiSkins[Rand(3)] = Flames[Rand(ArrayCount(Flames))];
}

simulated function HandleMesh( bool bRightHand, bool bUp, bool bLeftSide, optional bool bFirst)
{
	if (bRightHand)
	{
		if (bUp)
		{
			if (bLeftSide)
			{
				if (bFirst)
					Mesh = Mesh'FOutputUpLeft01R';
				else
					Mesh = Mesh'FOutputUpLeft02R';
			}
			else
			{
				if (bFirst)
					Mesh = Mesh'FOutputUpRight01R';
				else
					Mesh = Mesh'FOutputUpRight02R';
			}
		}
		else
		{
			if (bLeftSide)
				Mesh = Mesh'FOutputDownLeftR';
			else
				Mesh = Mesh'FOutputDownRightR';
		}
	}
	else
	{
		if (bUp)
		{
			if (bLeftSide)
			{
				if (bFirst)
					Mesh = Mesh'FOutputUpLeft01';
				else
					Mesh = Mesh'FOutputUpLeft02';
			}
			else
			{
				if (bFirst)
					Mesh = Mesh'FOutputUpRight01';
				else
					Mesh = Mesh'FOutputUpRight02';
			}
		}
		else
		{
			if (bLeftSide)
				Mesh = Mesh'FOutputDownLeft';
			else
				Mesh = Mesh'FOutputDownRight';
		}
	}
}

simulated function SetSpeed( float speed, vector dir)
{
	Velocity = speed * dir;
}

simulated function Tick( float Delta)
{
	DrawScale = (Default.LifeSpan - LifeSpan) * (MaxDrawScale - Default.DrawScale) / Default.LifeSpan + Default.DrawScale;
	ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=FOutputDownLeft
	
	bHidden=True
	Style=STY_Translucent
	ScaleGlow=2.000000
	bUnlit=True
	bNetTemporary=False
	
	Physics=PHYS_Projectile
	bParticles=True
	bRandomFrame=True
	Texture=FireB01
	ScaleGlow=1.650000
	DrawScale=0.020000
	MaxDrawScale=0.100000
	LifeSpan=0.450000
	
	Flames(0)=FireB01
	Flames(1)=FireB02
	Flames(2)=FireB03
	Flames(3)=FireB04
	Flames(4)=FireB05
	Flames(5)=FireB06
	Flames(6)=FireB07
	Flames(7)=FireB08
	Flames(8)=FireB09
	Flames(9)=FireB10
	Flames(10)=FireB11
	Flames(11)=FireB12
	Flames(12)=FireB13
	Flames(13)=FireB14
	Flames(14)=FireB15
	Flames(15)=FireB16
	
	Smoke(0)=Texture'Botpack.utsmoke.us8_a00'
	Smoke(1)=Texture'Botpack.utsmoke.US3_A00'
	Smoke(2)=Texture'Botpack.utsmoke.us2_a00'
	Smoke(3)=Texture'Botpack.utsmoke.us1_a00'
}
