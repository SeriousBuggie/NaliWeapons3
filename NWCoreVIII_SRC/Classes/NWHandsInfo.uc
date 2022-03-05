//////////////////////////////////////////////////////////////
//	Nali Weapons III hands customization info class
//				Feralidragon (11-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWHandsInfo expands Info config(NWConfig);

//Hands A (half finger gloves - team)
#exec TEXTURE IMPORT NAME=HandA FILE=CHANDS\HandA.bmp GROUP=CustomHands LODSET=2
#exec TEXTURE IMPORT NAME=HandAT_0 FILE=CHANDS\HandAT_0.bmp GROUP=CustomHands LODSET=2
#exec TEXTURE IMPORT NAME=HandAT_1 FILE=CHANDS\HandAT_1.bmp GROUP=CustomHands LODSET=2
#exec TEXTURE IMPORT NAME=HandAT_2 FILE=CHANDS\HandAT_2.bmp GROUP=CustomHands LODSET=2
#exec TEXTURE IMPORT NAME=HandAT_3 FILE=CHANDS\HandAT_3.bmp GROUP=CustomHands LODSET=2

//Hands B (bare hand - no team)
#exec TEXTURE IMPORT NAME=HandB FILE=CHANDS\HandB.bmp GROUP=CustomHands LODSET=2

//Nali Hands (team)
#exec TEXTURE IMPORT NAME=NaliHand FILE=CHANDS\NaliHand.bmp GROUP=CustomHands LODSET=2
#exec TEXTURE IMPORT NAME=NaliHandT_0 FILE=CHANDS\NaliHandT_0.bmp GROUP=CustomHands LODSET=2
#exec TEXTURE IMPORT NAME=NaliHandT_1 FILE=CHANDS\NaliHandT_1.bmp GROUP=CustomHands LODSET=2
#exec TEXTURE IMPORT NAME=NaliHandT_2 FILE=CHANDS\NaliHandT_2.bmp GROUP=CustomHands LODSET=2
#exec TEXTURE IMPORT NAME=NaliHandT_3 FILE=CHANDS\NaliHandT_3.bmp GROUP=CustomHands LODSET=2

//Skaarj Hands (non team)
#exec TEXTURE IMPORT NAME=SkaarjHand1 FILE=CHANDS\SkaarjHand1.bmp GROUP=CustomHands LODSET=2
#exec TEXTURE IMPORT NAME=SkaarjHand2 FILE=CHANDS\SkaarjHand2.bmp GROUP=CustomHands LODSET=2
#exec TEXTURE IMPORT NAME=SkaarjHand3 FILE=CHANDS\SkaarjHand3.bmp GROUP=CustomHands LODSET=2

//Mech Hands (team)
#exec TEXTURE IMPORT NAME=MechHand FILE=CHANDS\MechHand.bmp GROUP=CustomHands LODSET=2
#exec TEXTURE IMPORT NAME=MechHandT_0 FILE=CHANDS\MechHandT_0.bmp GROUP=CustomHands LODSET=2
#exec TEXTURE IMPORT NAME=MechHandT_1 FILE=CHANDS\MechHandT_1.bmp GROUP=CustomHands LODSET=2
#exec TEXTURE IMPORT NAME=MechHandT_2 FILE=CHANDS\MechHandT_2.bmp GROUP=CustomHands LODSET=2
#exec TEXTURE IMPORT NAME=MechHandT_3 FILE=CHANDS\MechHandT_3.bmp GROUP=CustomHands LODSET=2



var() name HandsInfoLogName;

struct HandsInfo
{
	var() string HandSkin;
	var() string MeshMatch;
	var() string SkinMatch;
	var() bool bTeam;
	var() byte MultiSkinMatch;
	var() byte Fat;
};

var(ClientConfig) globalconfig bool bUseClientConfig;
var(MixedConfig) globalconfig HandsInfo Hands[48];
var HandsInfo HandsServer[48];
var byte ServerHandsListSize, ClientHandsListSize;

struct HandsIndexing
{
	var() PlayerPawn PPlayer;
	var() mesh SavedMesh;
	var() texture SavedSkin;
	var() texture SavedHandTex;
	var() byte SavedMultiSkin;
	var() byte SavedFat;
};

var HandsIndexing HIndex;


replication
{
	reliable if (Role == ROLE_Authority)
		HandsServer, ServerHandsListSize;
}

simulated function PreBeginPlay()
{
local int i;

	if (Role == ROLE_Authority || default.bUseClientConfig)
	{
		if (Role == ROLE_Authority)
			ServerHandsListSize = ArrayCount(Hands);
		if (default.bUseClientConfig)
			ClientHandsListSize = ArrayCount(Hands);
		
		for (i = ArrayCount(Hands) - 1; i >= 0; i--)
		{
			if (Hands[i].HandSkin != "" && Class'NWUtils'.static.loadTexture(Hands[i].HandSkin) != None)
			{
				if (Role == ROLE_Authority)
					ServerHandsListSize = i + 1;
				if (default.bUseClientConfig)
					ClientHandsListSize = i + 1;
				break;
			}
		}
		
		if (Role == ROLE_Authority)
		{
			for (i = 0; i < ServerHandsListSize; i++)
				HandsServer[i] = Hands[i];
		}
	}
}

simulated function texture GetHandTexture(PlayerPawn PPawn, optional out byte Fat)
{
local int i, ListSize;
local HandsInfo HInfo;
local string handTexStr;
local texture handTex;

	if (PPawn == None)
	{
		Fat = 128;
		return None;
	}
	
	if (PPawn == HIndex.PPlayer && PPawn.Mesh == HIndex.SavedMesh && PPawn.MultiSkins[HIndex.SavedMultiSkin] == HIndex.SavedSkin)
	{
		Fat = HIndex.SavedFat;
		return HIndex.SavedHandTex;
	}

	if (!default.bUseClientConfig)
		ListSize = ServerHandsListSize;
	else
		ListSize = ClientHandsListSize;
	
	for (i = ListSize - 1; i >= 0; i--)
	{
		HInfo = getHInfo(i);
		if (HInfo.HandSkin != "" && HInfo.MultiSkinMatch < 8 && Class'NWUtils'.static.StrMatch(HInfo.MeshMatch, String(PPawn.Mesh))
		&& Class'NWUtils'.static.StrMatch(HInfo.SkinMatch, String(PPawn.MultiSkins[HInfo.MultiSkinMatch])))
		{
			handTexStr = HInfo.HandSkin;
			if (HInfo.bTeam && PPawn.PlayerReplicationInfo != None && PPawn.PlayerReplicationInfo.Team < 4)
				handTexStr = handTexStr$"T_"$PPawn.PlayerReplicationInfo.Team;
			handTex = Class'NWUtils'.static.loadTexture(handTexStr);
			if (handTex == None)
				log("Failed to load custom hand texture "$handTexStr, HandsInfoLogName);
			
			HIndex.PPlayer = PPawn;
			HIndex.SavedHandTex = handTex;
			HIndex.SavedMesh = PPawn.Mesh;
			HIndex.SavedSkin = PPawn.MultiSkins[HInfo.MultiSkinMatch];
			HIndex.SavedMultiSkin = HInfo.MultiSkinMatch;
			HIndex.SavedFat = HInfo.Fat;
			Fat = HInfo.Fat;
			return handTex;
		}
	}
	
	HIndex.PPlayer = PPawn;
	HIndex.SavedHandTex = None;
	HIndex.SavedMesh = PPawn.Mesh;
	HIndex.SavedSkin = PPawn.MultiSkins[1];
	HIndex.SavedMultiSkin = 1;
	HIndex.SavedFat = 128;
	Fat = 128;
	return None;
}

simulated function HandsInfo getHInfo(int i)
{
local HandsInfo h;

	if (i >= ArrayCount(Hands))
		return h;
	if (default.bUseClientConfig)
		return Hands[i];
	return HandsServer[i];
}


defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=True
	
	HandsInfoLogName=NWHandsInfo
	
	Hands(0)=(HandSkin="NWCoreVIII_SRC.HandA",MeshMatch="*",SkinMatch="*",bTeam=True,MultiSkinMatch=1,Fat=128)
	Hands(1)=(HandSkin="NWCoreVIII_SRC.NaliHand",MeshMatch="*.tnalimesh",SkinMatch="*",bTeam=True,MultiSkinMatch=1,Fat=128)
	Hands(2)=(HandSkin="NWCoreVIII_SRC.SkaarjHand1",MeshMatch="*.TSkM",SkinMatch="*.Meks*",bTeam=False,MultiSkinMatch=1,Fat=129)
	Hands(3)=(HandSkin="NWCoreVIII_SRC.SkaarjHand2",MeshMatch="*.TSkM",SkinMatch="*.Pitf*",bTeam=False,MultiSkinMatch=1,Fat=129)
	Hands(4)=(HandSkin="NWCoreVIII_SRC.SkaarjHand3",MeshMatch="*.TSkM",SkinMatch="*.Warr*",bTeam=False,MultiSkinMatch=1,Fat=129)
	Hands(5)=(HandSkin="NWCoreVIII_SRC.SkaarjHand2",MeshMatch="*.TCowMesh",SkinMatch="*.WarCow",bTeam=False,MultiSkinMatch=1,Fat=131)
	Hands(6)=(HandSkin="NWCoreVIII_SRC.SkaarjHand3",MeshMatch="*.TCowMesh",SkinMatch="*.AtomicCow",bTeam=False,MultiSkinMatch=1,Fat=131)
}