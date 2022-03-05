//////////////////////////////////////////////////////////////
//				Feralidragon (01-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybAndroidCoronas expands CybCoronas;

#exec MESH IMPORT MESH=CybAndroidCoronas ANIVFILE=MODELS\CybAndroidCoronas_a.3d DATAFILE=MODELS\CybAndroidCoronas_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=CybAndroidCoronas X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=All STARTFRAME=0 NUMFRAMES=288
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=Still STARTFRAME=136 NUMFRAMES=1

//Transform
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=Transform STARTFRAME=0 NUMFRAMES=20 RATE=19.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=UnTransform STARTFRAME=20 NUMFRAMES=21 RATE=20.0

//Movement
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=LookLeft STARTFRAME=40 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=LookLeftBck STARTFRAME=45 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=LookRight STARTFRAME=50 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=LookRightBck STARTFRAME=55 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=LookMoreLeft STARTFRAME=60 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=LookMoreLeftBck STARTFRAME=65 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=LookMoreRight STARTFRAME=70 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=LookMoreRightBck STARTFRAME=75 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=LandDown STARTFRAME=90 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=LandUp STARTFRAME=95 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=JumpDown STARTFRAME=184 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=JumpUp STARTFRAME=181 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=WalkForward STARTFRAME=137 NUMFRAMES=12 RATE=11.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=WalkBackward STARTFRAME=149 NUMFRAMES=12 RATE=11.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=Run STARTFRAME=162 NUMFRAMES=18 RATE=17.0

//Gun
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=StanceON STARTFRAME=80 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=StanceOFF STARTFRAME=85 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=FireN STARTFRAME=101 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=FireUp1 STARTFRAME=108 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=FireUp2 STARTFRAME=115 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=FireDown1 STARTFRAME=122 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=FireDown2 STARTFRAME=129 NUMFRAMES=7 RATE=6.0

//Blade
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=HeadJump STARTFRAME=232 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=HeadCut STARTFRAME=238 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=HeadBck STARTFRAME=244 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=StraightCut STARTFRAME=206 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=StraightBck STARTFRAME=226 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=UpDownCut STARTFRAME=187 NUMFRAMES=13 RATE=12.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=UpDownBck STARTFRAME=199 NUMFRAMES=8 RATE=7.0

//Dodge
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=DodgeLeft STARTFRAME=274 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=DodgeLeftBck STARTFRAME=280 NUMFRAMES=8 RATE=7.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=DodgeRight STARTFRAME=262 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=DodgeRightBck STARTFRAME=268 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=DodgeBack STARTFRAME=250 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidCoronas SEQ=DodgeBackBck STARTFRAME=256 NUMFRAMES=7 RATE=6.0


//------------------------- Animations End ---------------------------------
//**************************************************************************

#exec MESHMAP NEW MESHMAP=CybAndroidCoronas MESH=CybAndroidCoronas
#exec MESHMAP SCALE MESHMAP=CybAndroidCoronas X=0.05 Y=0.05 Z=0.1

simulated function SetTeamExtras(byte team, optional byte texFlags, optional Actor aOwner, optional bool flicker)
{
	if (team > 3) team = 0;
	
	MultiSkins[2] = Eyes[team];
	MultiSkins[3] = Eyes[team];
}

defaultproperties
{
    Mesh=CybAndroidCoronas
	CoreCenterVertex=1
	CoreRingVertex=0
}
