//////////////////////////////////////////////////////////////
//				Feralidragon (24-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerRocketFuelBody expands NaliWEffects;

#exec MESH IMPORT MESH=IonizerRocketFuelBody ANIVFILE=MODELS\IonizerRocketFuelBody_a.3d DATAFILE=MODELS\IonizerRocketFuelBody_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonizerRocketFuelBody STRENGTH=0.0
#exec MESH ORIGIN MESH=IonizerRocketFuelBody X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=IonizerRocketFuelBody SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerRocketFuelBody SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonizerRocketFuelBody MESH=IonizerRocketFuelBody
#exec MESHMAP SCALE MESHMAP=IonizerRocketFuelBody X=0.6 Y=0.6 Z=1.2

#exec TEXTURE IMPORT NAME=Sk_IonizerRocket FILE=SKINS\Sk_IonizerRocket.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IonizerRocketFuelBody NUM=1 TEXTURE=Sk_IonizerRocket

#exec AUDIO IMPORT NAME="IonRocketEngFinish" FILE=SOUNDS\IonRocketEngFinish.wav GROUP="IonizerRocket"


var() float MaxRotRate;
var() texture IonOutFX[65];

var IonizerRocketEngFXOut IonFXFade;

simulated function PostBeginPlay()
{
	RotationRate.Yaw = Int((FRand()*MaxRotRate*2) - MaxRotRate);
	RotationRate.Pitch = Int((FRand()*MaxRotRate*2) - MaxRotRate);
	PlaySound(EffectSound1,,SndVol,,SndRadius);
}

simulated function BeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		IonFXFade = Spawn(Class'IonizerRocketEngFXOut', Self);
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (LifeSpan >= 4.0)
			ScaleGlow = (6 - LifeSpan) * Default.ScaleGlow / 2 + Default.ScaleGlow;
		if (LifeSpan >= 2.0 && LifeSpan < 4.0)
		{
			if (!bUnlit)
				bUnlit = True;
			ScaleGlow = (LifeSpan - 2) * (Default.ScaleGlow) / 4;
		}
		else if (LifeSpan < 2.0)
		{
			if (Style != STY_Masked)
			{
				Style = STY_Masked;
				ScaleGlow = 0.0;
			}
			MultiSkins[1] = IonOutFX[Byte(LifeSpan/2*ArrayCount(IonOutFX))];
		}
	}
}

simulated function Destroyed()
{
	if (IonFXFade != None)
		IonFXFade.Destroy();
	IonFXFade = None;
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonizerRocketFuelBody
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=True
	LifeSpan=6.000000
	Physics=PHYS_Falling
	bFixedRotationDir=True
	
	EffectSound1=IonRocketEngFinish
	SndVol=1000.000000
	SndRadius=5000.000000
	
	MaxRotRate=2500
	
	IonOutFX(0)=IonLauncherInFX01
	IonOutFX(1)=IonLauncherInFX02
	IonOutFX(2)=IonLauncherInFX03
	IonOutFX(3)=IonLauncherInFX04
	IonOutFX(4)=IonLauncherInFX05
	IonOutFX(5)=IonLauncherInFX06
	IonOutFX(6)=IonLauncherInFX07
	IonOutFX(7)=IonLauncherInFX08
	IonOutFX(8)=IonLauncherInFX09
	IonOutFX(9)=IonLauncherInFX10
	IonOutFX(10)=IonLauncherInFX11
	IonOutFX(11)=IonLauncherInFX12
	IonOutFX(12)=IonLauncherInFX13
	IonOutFX(13)=IonLauncherInFX14
	IonOutFX(14)=IonLauncherInFX15
	IonOutFX(15)=IonLauncherInFX16
	IonOutFX(16)=IonLauncherInFX17
	IonOutFX(17)=IonLauncherInFX18
	IonOutFX(18)=IonLauncherInFX19
	IonOutFX(19)=IonLauncherInFX20
	IonOutFX(20)=IonLauncherInFX21
	IonOutFX(21)=IonLauncherInFX22
	IonOutFX(22)=IonLauncherInFX23
	IonOutFX(23)=IonLauncherInFX24
	IonOutFX(24)=IonLauncherInFX25
	IonOutFX(25)=IonLauncherInFX26
	IonOutFX(26)=IonLauncherInFX27
	IonOutFX(27)=IonLauncherInFX28
	IonOutFX(28)=IonLauncherInFX29
	IonOutFX(29)=IonLauncherInFX30
	IonOutFX(30)=IonLauncherInFX31
	IonOutFX(31)=IonLauncherInFX32
	IonOutFX(32)=IonLauncherInFX33
	IonOutFX(33)=IonLauncherInFX34
	IonOutFX(34)=IonLauncherInFX35
	IonOutFX(35)=IonLauncherInFX36
	IonOutFX(36)=IonLauncherInFX37
	IonOutFX(37)=IonLauncherInFX38
	IonOutFX(38)=IonLauncherInFX39
	IonOutFX(39)=IonLauncherInFX40
	IonOutFX(40)=IonLauncherInFX41
	IonOutFX(41)=IonLauncherInFX42
	IonOutFX(42)=IonLauncherInFX43
	IonOutFX(43)=IonLauncherInFX44
	IonOutFX(44)=IonLauncherInFX45
	IonOutFX(45)=IonLauncherInFX46
	IonOutFX(46)=IonLauncherInFX47
	IonOutFX(47)=IonLauncherInFX48
	IonOutFX(48)=IonLauncherInFX49
	IonOutFX(49)=IonLauncherInFX50
	IonOutFX(50)=IonLauncherInFX51
	IonOutFX(51)=IonLauncherInFX52
	IonOutFX(52)=IonLauncherInFX53
	IonOutFX(53)=IonLauncherInFX54
	IonOutFX(54)=IonLauncherInFX55
	IonOutFX(55)=IonLauncherInFX56
	IonOutFX(56)=IonLauncherInFX57
	IonOutFX(57)=IonLauncherInFX58
	IonOutFX(58)=IonLauncherInFX59
	IonOutFX(59)=IonLauncherInFX60
	IonOutFX(60)=IonLauncherInFX61
	IonOutFX(61)=IonLauncherInFX62
	IonOutFX(62)=IonLauncherInFX63
	IonOutFX(63)=IonLauncherInFX64
	IonOutFX(64)=IonLauncherInFX65
}
