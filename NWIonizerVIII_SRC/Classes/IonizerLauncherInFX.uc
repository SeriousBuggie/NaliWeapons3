//////////////////////////////////////////////////////////////
//				Feralidragon (20-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerLauncherInFX expands NaliWActor;

#exec OBJ LOAD FILE=Textures\IonLauncherInFX.utx PACKAGE=NWIonizerVIII_SRC.IonLauncherInFX
#exec AUDIO IMPORT NAME="IonLauncherBuild" FILE=SOUNDS\IonLauncherBuild.wav GROUP="IonizerLauncher"

var() texture IonLauncherTex[65];
var() class<IonizerLauncherEdgeFXRed> IonLauncherEdgeFXClasses[4];
var() float AppearTime;
var() sound BuildSnd;
var() bool bGrowing;
var float tCount;
var byte curTex, myTeam;

var Ionizer IonizerOwner;

replication
{
	reliable if (Role == ROLE_Authority)
		myTeam;
}

simulated function PostBeginPlay()
{
	SetTimer(AppearTime, False);
	if (bGrowing && BuildSnd != None)
		PlaySound(BuildSnd,, 1000,, 5000);
	Super.PostBeginPlay();
}

simulated function PostNetBeginPlay()
{
	SpawnEdgeFX();
}

function SetTeam(byte team, optional Ionizer IOwner)
{
	if (team > 3)
		team = 0;
	
	myTeam = team;
	IonizerOwner = IOwner;
	if (Level.NetMode == NM_StandAlone)
		SpawnEdgeFX();
}

simulated function SpawnEdgeFX()
{
local IonizerLauncherEdgeFXRed ileFX;

	if (Level.NetMode != NM_DedicatedServer)
	{
		ileFX = Spawn(IonLauncherEdgeFXClasses[myTeam]);
		ileFX.Mesh = Mesh;
		ileFX.AnimSequence = AnimSequence;
		ileFX.AnimFrame = AnimFrame;
		ileFX.setOrder(bGrowing);
	}
}

simulated function Timer()
{
local IonizerLauncher IL;
	
	if (bGrowing && Role == ROLE_Authority)
	{
		IL = Spawn(Class'IonizerLauncher', Owner);
		IL.SetTeamLights(myTeam, IonizerOwner);
	}
	Destroy();
}

simulated function Tick(float Delta)
{
local float panProgress;
local byte maxTex;

	if (Level.NetMode != NM_DedicatedServer && AppearTime > 0)
	{	
		tCount += Delta;
		if (!bGrowing)
		{
			panProgress = (AppearTime - tCount) / AppearTime;
			maxTex = ArrayCount(IonLauncherTex);
		}
		else
		{
			panProgress = tCount / AppearTime;
			maxTex = ArrayCount(IonLauncherTex) - 1;
		}
		
		curTex = Byte(panProgress * maxTex);
		if (curTex >= ArrayCount(IonLauncherTex))
			curTex = ArrayCount(IonLauncherTex) - 1;

		MultiSkins[1] = IonLauncherTex[curTex];
		MultiSkins[2] = IonLauncherTex[curTex];
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonizerLauncherCanvas
	RemoteRole=ROLE_SimulatedProxy
	bGameRelevant=True
	bAlwaysRelevant=True
	bNetTemporary=True
	bUnlit=True
	Style=STY_Masked
	ScaleGlow=0.000000
	
	MultiSkins(1)=IonLauncherInFX01
	MultiSkins(2)=IonLauncherInFX01
	Texture=IonLauncherInFX01
	
	AppearTime=4.000000
	BuildSnd=IonLauncherBuild
	bGrowing=True
	
	IonLauncherTex(0)=IonLauncherInFX01
	IonLauncherTex(1)=IonLauncherInFX02
	IonLauncherTex(2)=IonLauncherInFX03
	IonLauncherTex(3)=IonLauncherInFX04
	IonLauncherTex(4)=IonLauncherInFX05
	IonLauncherTex(5)=IonLauncherInFX06
	IonLauncherTex(6)=IonLauncherInFX07
	IonLauncherTex(7)=IonLauncherInFX08
	IonLauncherTex(8)=IonLauncherInFX09
	IonLauncherTex(9)=IonLauncherInFX10
	IonLauncherTex(10)=IonLauncherInFX11
	IonLauncherTex(11)=IonLauncherInFX12
	IonLauncherTex(12)=IonLauncherInFX13
	IonLauncherTex(13)=IonLauncherInFX14
	IonLauncherTex(14)=IonLauncherInFX15
	IonLauncherTex(15)=IonLauncherInFX16
	IonLauncherTex(16)=IonLauncherInFX17
	IonLauncherTex(17)=IonLauncherInFX18
	IonLauncherTex(18)=IonLauncherInFX19
	IonLauncherTex(19)=IonLauncherInFX20
	IonLauncherTex(20)=IonLauncherInFX21
	IonLauncherTex(21)=IonLauncherInFX22
	IonLauncherTex(22)=IonLauncherInFX23
	IonLauncherTex(23)=IonLauncherInFX24
	IonLauncherTex(24)=IonLauncherInFX25
	IonLauncherTex(25)=IonLauncherInFX26
	IonLauncherTex(26)=IonLauncherInFX27
	IonLauncherTex(27)=IonLauncherInFX28
	IonLauncherTex(28)=IonLauncherInFX29
	IonLauncherTex(29)=IonLauncherInFX30
	IonLauncherTex(30)=IonLauncherInFX31
	IonLauncherTex(31)=IonLauncherInFX32
	IonLauncherTex(32)=IonLauncherInFX33
	IonLauncherTex(33)=IonLauncherInFX34
	IonLauncherTex(34)=IonLauncherInFX35
	IonLauncherTex(35)=IonLauncherInFX36
	IonLauncherTex(36)=IonLauncherInFX37
	IonLauncherTex(37)=IonLauncherInFX38
	IonLauncherTex(38)=IonLauncherInFX39
	IonLauncherTex(39)=IonLauncherInFX40
	IonLauncherTex(40)=IonLauncherInFX41
	IonLauncherTex(41)=IonLauncherInFX42
	IonLauncherTex(42)=IonLauncherInFX43
	IonLauncherTex(43)=IonLauncherInFX44
	IonLauncherTex(44)=IonLauncherInFX45
	IonLauncherTex(45)=IonLauncherInFX46
	IonLauncherTex(46)=IonLauncherInFX47
	IonLauncherTex(47)=IonLauncherInFX48
	IonLauncherTex(48)=IonLauncherInFX49
	IonLauncherTex(49)=IonLauncherInFX50
	IonLauncherTex(50)=IonLauncherInFX51
	IonLauncherTex(51)=IonLauncherInFX52
	IonLauncherTex(52)=IonLauncherInFX53
	IonLauncherTex(53)=IonLauncherInFX54
	IonLauncherTex(54)=IonLauncherInFX55
	IonLauncherTex(55)=IonLauncherInFX56
	IonLauncherTex(56)=IonLauncherInFX57
	IonLauncherTex(57)=IonLauncherInFX58
	IonLauncherTex(58)=IonLauncherInFX59
	IonLauncherTex(59)=IonLauncherInFX60
	IonLauncherTex(60)=IonLauncherInFX61
	IonLauncherTex(61)=IonLauncherInFX62
	IonLauncherTex(62)=IonLauncherInFX63
	IonLauncherTex(63)=IonLauncherInFX64
	IonLauncherTex(64)=IonLauncherInFX65
	
	IonLauncherEdgeFXClasses(0)=Class'IonizerLauncherEdgeFXRed'
	IonLauncherEdgeFXClasses(1)=Class'IonizerLauncherEdgeFXBlue'
	IonLauncherEdgeFXClasses(2)=Class'IonizerLauncherEdgeFXGreen'
	IonLauncherEdgeFXClasses(3)=Class'IonizerLauncherEdgeFXYellow'
}
