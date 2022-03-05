//////////////////////////////////////////////////////////////
//				Feralidragon (09-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeMissileSmoke expands UTSmokeTrail;

#exec OBJ LOAD FILE=Textures\NukeBlackSmkA.utx PACKAGE=NWNuclearLauncherVIII_SRC.NukeBlackSmkA
#exec OBJ LOAD FILE=Textures\NukeBlackSmkB.utx PACKAGE=NWNuclearLauncherVIII_SRC.NukeBlackSmkB
#exec OBJ LOAD FILE=Textures\NukeBlackSmkC.utx PACKAGE=NWNuclearLauncherVIII_SRC.NukeBlackSmkC
#exec OBJ LOAD FILE=Textures\NukeBlackSmkH.utx PACKAGE=NWNuclearLauncherVIII_SRC.NukeBlackSmkH

function PostBeginPlay()
{
	Super(Effects).PostBeginPlay();
	
	SetTimer(2.8, false);
	if ( bRandomize && (FRand() < 0.4) )
		MultiSkins[5 + Rand(2)] = Texture'bsmkC01';
}

function Timer()
{
    if ( Curr >= 0 )
    {
        MultiSkins[Vert[Curr]] = None;
        Curr--;
        if ( Curr >= 0 )
            SetTimer(0.05, false);
    }
}

defaultproperties
{
	DrawScale=2.500000
	ScaleGlow=1.000000

	Style=STY_Modulated
	Texture=bsmkA01
	MultiSkins(0)=bsmkH01
	MultiSkins(1)=bsmkC01
	MultiSkins(2)=bsmkH01
	MultiSkins(3)=bsmkB01
	MultiSkins(4)=bsmkA01
	MultiSkins(5)=bsmkB01
	MultiSkins(6)=bsmkA01
	MultiSkins(7)=bsmkH01
	
	LifeSpan=3.200000
}
