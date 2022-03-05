//////////////////////////////////////////////////////////////
//				Feralidragon (05-05-2011)
//
// NW3 CORE FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearHitSmokeFX expands NaliWEffects;

//White smoke import
//---------------------------------------------------------------------------------------------------------
#exec TEXTURE IMPORT NAME=NukeWSmk01 FILE=EFFECTS\NukeWSmk01.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk02 FILE=EFFECTS\NukeWSmk02.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk03 FILE=EFFECTS\NukeWSmk03.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk04 FILE=EFFECTS\NukeWSmk04.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk05 FILE=EFFECTS\NukeWSmk05.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk06 FILE=EFFECTS\NukeWSmk06.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk07 FILE=EFFECTS\NukeWSmk07.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk08 FILE=EFFECTS\NukeWSmk08.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk09 FILE=EFFECTS\NukeWSmk09.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk10 FILE=EFFECTS\NukeWSmk10.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk11 FILE=EFFECTS\NukeWSmk11.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk12 FILE=EFFECTS\NukeWSmk12.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk13 FILE=EFFECTS\NukeWSmk13.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk14 FILE=EFFECTS\NukeWSmk14.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk15 FILE=EFFECTS\NukeWSmk15.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk16 FILE=EFFECTS\NukeWSmk16.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk17 FILE=EFFECTS\NukeWSmk17.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk18 FILE=EFFECTS\NukeWSmk18.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk19 FILE=EFFECTS\NukeWSmk19.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk20 FILE=EFFECTS\NukeWSmk20.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk21 FILE=EFFECTS\NukeWSmk21.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk22 FILE=EFFECTS\NukeWSmk22.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk23 FILE=EFFECTS\NukeWSmk23.bmp GROUP=NukeWSmk FLAGS=2
#exec TEXTURE IMPORT NAME=NukeWSmk24 FILE=EFFECTS\NukeWSmk24.bmp GROUP=NukeWSmk FLAGS=2
//---------------------------------------------------------------------------------------------------------

var() float MinDrawScale, MaxDrawScale, FadeInTime, FadeOutTime;
var() float RisingSpeed;
var() texture SmkRand[24];

replication
{
	unreliable if (Role == ROLE_Authority)
		MinDrawScale, MaxDrawScale;
}

simulated function PostBeginPlay()
{
	Texture = SmkRand[Rand(ArrayCount(SmkRand))];
}

simulated function Tick( float DeltaTime)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * (MaxDrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
		if (Default.LifeSpan - LifeSpan <= FadeInTime)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / FadeInTime;
		else if (FadeOutTime > 0 && LifeSpan <= FadeOutTime)
			ScaleGlow = LifeSpan * Default.ScaleGlow / FadeOutTime;
		else if (FadeOutTime == 0)
			ScaleGlow = LifeSpan * Default.ScaleGlow / (Default.LifeSpan - FadeInTime);
	}
}

simulated function HitWall(vector HitNormal, actor Wall)
{
	Velocity = MirrorVectorByNormal(Velocity, HitNormal);
}

simulated function SetSmkProperties(vector Vel, float minScale, float maxScale, optional bool bMultScale)
{
	Velocity = Vel;
	Velocity.Z += RisingSpeed;
	
	if (bMultScale)
	{
		MinDrawScale *= minScale;
		MaxDrawScale *= maxScale;
	}
	else
	{
		MinDrawScale = minScale;
		MaxDrawScale = maxScale;
	}
}

function ServerSetSmkProperties(vector Vel, float minScale, float maxScale, optional bool bMultScale)
{
	if (Role == ROLE_Authority)
		SetSmkProperties(Vel, minScale, maxScale, bMultScale);
}

simulated function ClientSetSmkProperties(vector Vel, float minScale, float maxScale, optional bool bMultScale)
{
	if (Level.NetMode != NM_DedicatedServer)
		SetSmkProperties(Vel, minScale, maxScale, bMultScale);
}


defaultproperties
{
	DrawType=DT_Sprite
	Style=STY_Translucent
	RemoteRole=ROLE_SimulatedProxy
	Physics=PHYS_Projectile
	bNetTemporary=True
	bCollideWorld=True
	bUnlit=True
	Texture=NukeWSmk01
	
	MinDrawScale=5.500000
	MaxDrawScale=15.000000
	FadeInTime=0.500000
	FadeOutTime=2.000000
	LifeSpan=3.000000
	DrawScale=1.000000
	RisingSpeed=20.000000
	ScaleGlow=0.500000
	
	SmkRand(0)=NukeWSmk01
	SmkRand(1)=NukeWSmk02
	SmkRand(2)=NukeWSmk03
	SmkRand(3)=NukeWSmk04
	SmkRand(4)=NukeWSmk05
	SmkRand(5)=NukeWSmk06
	SmkRand(6)=NukeWSmk07
	SmkRand(7)=NukeWSmk08
	SmkRand(8)=NukeWSmk09
	SmkRand(9)=NukeWSmk10
	SmkRand(10)=NukeWSmk11
	SmkRand(11)=NukeWSmk12
	SmkRand(12)=NukeWSmk13
	SmkRand(13)=NukeWSmk14
	SmkRand(14)=NukeWSmk15
	SmkRand(15)=NukeWSmk16
	SmkRand(16)=NukeWSmk17
	SmkRand(17)=NukeWSmk18
	SmkRand(18)=NukeWSmk19
	SmkRand(19)=NukeWSmk20
	SmkRand(20)=NukeWSmk21
	SmkRand(21)=NukeWSmk22
	SmkRand(22)=NukeWSmk23
	SmkRand(23)=NukeWSmk24
}
