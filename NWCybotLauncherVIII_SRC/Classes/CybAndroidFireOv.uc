//////////////////////////////////////////////////////////////
//				Feralidragon (16-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybAndroidFireOv expands NaliWEffects;

#exec MESH IMPORT MESH=CybAndroidFireOv ANIVFILE=MODELS\CybAndroidFireOv_a.3d DATAFILE=MODELS\CybAndroidFireOv_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=CybAndroidFireOv X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=All STARTFRAME=0 NUMFRAMES=288
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=Still STARTFRAME=136 NUMFRAMES=1

//Transform
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=Transform STARTFRAME=0 NUMFRAMES=20 RATE=19.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=UnTransform STARTFRAME=20 NUMFRAMES=21 RATE=20.0

//Movement
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=LookLeft STARTFRAME=40 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=LookLeftBck STARTFRAME=45 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=LookRight STARTFRAME=50 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=LookRightBck STARTFRAME=55 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=LookMoreLeft STARTFRAME=60 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=LookMoreLeftBck STARTFRAME=65 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=LookMoreRight STARTFRAME=70 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=LookMoreRightBck STARTFRAME=75 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=LandDown STARTFRAME=90 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=LandUp STARTFRAME=95 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=JumpDown STARTFRAME=184 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=JumpUp STARTFRAME=181 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=WalkForward STARTFRAME=137 NUMFRAMES=12 RATE=11.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=WalkBackward STARTFRAME=149 NUMFRAMES=12 RATE=11.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=Run STARTFRAME=162 NUMFRAMES=18 RATE=17.0

//Gun
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=StanceON STARTFRAME=80 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=StanceOFF STARTFRAME=85 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=FireN STARTFRAME=101 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=FireUp1 STARTFRAME=108 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=FireUp2 STARTFRAME=115 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=FireDown1 STARTFRAME=122 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=FireDown2 STARTFRAME=129 NUMFRAMES=7 RATE=6.0

//Blade
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=HeadJump STARTFRAME=232 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=HeadCut STARTFRAME=238 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=HeadBck STARTFRAME=244 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=StraightCut STARTFRAME=206 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=StraightBck STARTFRAME=226 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=UpDownCut STARTFRAME=187 NUMFRAMES=13 RATE=12.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=UpDownBck STARTFRAME=199 NUMFRAMES=8 RATE=7.0

//Dodge
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=DodgeLeft STARTFRAME=274 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=DodgeLeftBck STARTFRAME=280 NUMFRAMES=8 RATE=7.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=DodgeRight STARTFRAME=262 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=DodgeRightBck STARTFRAME=268 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=DodgeBack STARTFRAME=250 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroidFireOv SEQ=DodgeBackBck STARTFRAME=256 NUMFRAMES=7 RATE=6.0

//------------------------- Animations End ---------------------------------
//**************************************************************************

#exec MESHMAP NEW MESHMAP=CybAndroidFireOv MESH=CybAndroidFireOv
#exec MESHMAP SCALE MESHMAP=CybAndroidFireOv X=0.05 Y=0.05 Z=0.1

var() texture TexFX[4];

simulated function SetTeam(byte team, optional Actor aOwner)
{
	if (team > 3) team = 0;
	
	Texture = TexFX[team];
	MultiSkins[1] = TexFX[team];
	if (aOwner != None)
		DrawScale = aOwner.DrawScale;
}

simulated function Tick(float DeltaTime)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybAndroidFireOv
	bParticles=True
	bRandomFrame=True
	bUnlit=True
	Scaleglow=1.500000
	Style=STY_Translucent
	DrawScale=1.000000
	
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=True
	Physics=PHYS_Trailer
	bTrailerSameRotation=True
	bTrailerPrePivot=True
	bAnimByOwner=True
	LifeSpan=0.100000
	Mass=0.000000
	
	Texture=CoreCenterRed
	MultiSkins(1)=CoreCenterRed
	
	TexFX(0)=CoreCenterRed
	TexFX(1)=CoreCenterBlue
	TexFX(2)=CoreCenterGreen
	TexFX(3)=CoreCenterYellow
}
