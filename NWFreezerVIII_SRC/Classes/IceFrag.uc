//////////////////////////////////////////////////////////////
//				Feralidragon (04-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IceFrag expands NWWallFrag;

#exec TEXTURE IMPORT NAME=IceFragSk FILE=Skins\IceFragSk.bmp GROUP=Coronas FLAGS=2

#exec MESH IMPORT MESH=IceFrag01 ANIVFILE=MODELS\IceFrag01_a.3d DATAFILE=MODELS\IceFrag01_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IceFrag01 STRENGTH=0.20
#exec MESH ORIGIN MESH=IceFrag01 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=IceFrag01 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IceFrag01 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=IceFrag01 MESH=IceFrag01
#exec MESHMAP SCALE MESHMAP=IceFrag01 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=IceFrag01 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=IceFrag02 ANIVFILE=MODELS\IceFrag02_a.3d DATAFILE=MODELS\IceFrag02_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IceFrag02 STRENGTH=0.20
#exec MESH ORIGIN MESH=IceFrag02 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=IceFrag02 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IceFrag02 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=IceFrag02 MESH=IceFrag02
#exec MESHMAP SCALE MESHMAP=IceFrag02 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=IceFrag02 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=IceFrag03 ANIVFILE=MODELS\IceFrag03_a.3d DATAFILE=MODELS\IceFrag03_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IceFrag03 STRENGTH=0.20
#exec MESH ORIGIN MESH=IceFrag03 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=IceFrag03 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IceFrag03 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=IceFrag03 MESH=IceFrag03
#exec MESHMAP SCALE MESHMAP=IceFrag03 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=IceFrag03 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=IceFrag04 ANIVFILE=MODELS\IceFrag04_a.3d DATAFILE=MODELS\IceFrag04_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IceFrag04 STRENGTH=0.20
#exec MESH ORIGIN MESH=IceFrag04 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=IceFrag04 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IceFrag04 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=IceFrag04 MESH=IceFrag04
#exec MESHMAP SCALE MESHMAP=IceFrag04 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=IceFrag04 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=IceFrag05 ANIVFILE=MODELS\IceFrag05_a.3d DATAFILE=MODELS\IceFrag05_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IceFrag05 STRENGTH=0.20
#exec MESH ORIGIN MESH=IceFrag05 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=IceFrag05 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IceFrag05 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=IceFrag05 MESH=IceFrag05
#exec MESHMAP SCALE MESHMAP=IceFrag05 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=IceFrag05 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=IceFrag06 ANIVFILE=MODELS\IceFrag06_a.3d DATAFILE=MODELS\IceFrag06_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IceFrag06 STRENGTH=0.20
#exec MESH ORIGIN MESH=IceFrag06 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=IceFrag06 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IceFrag06 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=IceFrag06 MESH=IceFrag06
#exec MESHMAP SCALE MESHMAP=IceFrag06 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=IceFrag06 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=IceFrag07 ANIVFILE=MODELS\IceFrag07_a.3d DATAFILE=MODELS\IceFrag07_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IceFrag07 STRENGTH=0.20
#exec MESH ORIGIN MESH=IceFrag07 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=IceFrag07 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IceFrag07 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=IceFrag07 MESH=IceFrag07
#exec MESHMAP SCALE MESHMAP=IceFrag07 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=IceFrag07 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=IceFrag08 ANIVFILE=MODELS\IceFrag08_a.3d DATAFILE=MODELS\IceFrag08_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IceFrag08 STRENGTH=0.20
#exec MESH ORIGIN MESH=IceFrag08 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=IceFrag08 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IceFrag08 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=IceFrag08 MESH=IceFrag08
#exec MESHMAP SCALE MESHMAP=IceFrag08 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=IceFrag08 NUM=1 TEXTURE=DefaultTexture


simulated function CalcVelocity(vector Momentum, float ExplosionSize)
{
    Velocity = VRand()*(ExplosionSize+FRand()*50.0 + VSize(Momentum)/600); 
}

simulated function GiveDrawScale( float col)
{
	DrawScale = (FRand()*col/3 + col) / 50 + 0.1;
}

simulated function HitWall (vector HitNormal, actor HitWall)
{
	If (VSize(Velocity) > 50)
	{
		if (DrawScale > 1.5)
			PlaySound(HeavyFragHitSound[Rand(ArrayCount(HeavyFragHitSound))],, FMax(0.5,DrawScale),, FMax(0.25,DrawScale)*500);
		else
			PlaySound(FragHitSound[Rand(ArrayCount(FragHitSound))],, FMax(0.5,DrawScale),, FMax(0.25,DrawScale)*500);
	}
	
    Velocity = 0.3*(( Velocity dot HitNormal ) * HitNormal * (-2.0) + Velocity);   // Reflect off Wall w/damping
    speed = VSize(Velocity);    
	
    if (bFirstHit && speed<150) 
    {
        bFirstHit=False;
        bRotatetoDesired=True;
        bFixedRotationDir=False;
        DesiredRotation.Pitch=0;    
        DesiredRotation.Yaw=FRand()*65536;
        DesiredRotation.roll=0;
    }
    RotationRate.Yaw = RotationRate.Yaw*0.5;
    RotationRate.Roll = RotationRate.Roll*0.5;
    RotationRate.Pitch = RotationRate.Pitch*0.5;
    if ( (speed < 60) && (HitNormal.Z > 0.7) )
    {
        SetPhysics(PHYS_none);
        bBounce = false;
        GoToState('Dying');
    }
}

auto state Flying
{
    simulated singular function ZoneChange( ZoneInfo NewZone )
    {
        if (NewZone.IsA('LavaZone') || NewZone.DamageType == 'Burned')
			Destroy();
		else
			Super.ZoneChange(NewZone);
    }
	
	simulated function BeginState()
    {
		Super.BeginState();
        RandSpin(10000);     
    }
}

defaultproperties
{
    Mesh=IceFrag01
	
    bNetTemporary=True
    LifeSpan=7.000000
	
	InitMinForce=150.000000
	InitMaxForce=500.000000
	
	MinDrawScale=0.150000
	MaxDrawScale=0.550000
	
	WallFragMeshes(0)=IceFrag01
	WallFragMeshes(1)=IceFrag02
	WallFragMeshes(2)=IceFrag03
	WallFragMeshes(3)=IceFrag04
	WallFragMeshes(4)=IceFrag05
	WallFragMeshes(5)=IceFrag06
	WallFragMeshes(6)=IceFrag07
	WallFragMeshes(7)=IceFrag08
	WallFragMeshes(8)=IceFrag01
	WallFragMeshes(9)=IceFrag03
	WallFragMeshes(10)=IceFrag05
	WallFragMeshes(11)=IceFrag07
	WallFragMeshes(12)=IceFrag02
	WallFragMeshes(13)=IceFrag04
	
	bMeshEnviroMap=True
	Texture=IceFragSk
	ScaleGlow=1.750000
	Style=STY_Normal
	bUnlit=True
	
	Buoyancy=180.000000
}
