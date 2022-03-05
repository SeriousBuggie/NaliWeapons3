//////////////////////////////////////////////////////////////
//	Nali Weapons III nuclear warning mutator HUD class
//				Feralidragon (24-06-2011)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWNuclearWarningMut expands Mutator config(NWExtrasCfg);

#exec TEXTURE IMPORT NAME=NuclearIconMod FILE=ICONS\NuclearIconMod.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearIconTrans FILE=ICONS\NuclearIconTrans.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearIconGlow FILE=ICONS\NuclearIconGlow.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearIconN0 FILE=ICONS\NuclearIconN0.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearIconN1 FILE=ICONS\NuclearIconN1.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearIconN2 FILE=ICONS\NuclearIconN2.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearIconN3 FILE=ICONS\NuclearIconN3.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearIconN4 FILE=ICONS\NuclearIconN4.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NuclearIconN5 FILE=ICONS\NuclearIconN5.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec AUDIO IMPORT NAME="nukeWarn" FILE=SOUNDS\nukeWarn.wav GROUP="NuclearMsgs"

#exec new TrueTypeFontFactory Name=NukeWarnFontA FontName="PF Ronda Seven Bold" Height=8 AntiAlias=TRUE
#exec new TrueTypeFontFactory Name=NukeWarnFontB FontName="PF Ronda Seven Bold" Height=10 AntiAlias=TRUE
#exec new TrueTypeFontFactory Name=NukeWarnFontC FontName="PF Ronda Seven Bold" Height=12 AntiAlias=TRUE
#exec new TrueTypeFontFactory Name=NukeWarnFontD FontName="PF Ronda Seven Bold" Height=14 AntiAlias=TRUE
#exec new TrueTypeFontFactory Name=NukeWarnFontE FontName="PF Ronda Seven Bold" Height=16 AntiAlias=TRUE
#exec new TrueTypeFontFactory Name=NukeWarnFontF FontName="PF Ronda Seven Bold" Height=18 AntiAlias=TRUE


var() texture NuclearWarnSignTex[2], NuclearGlowTex, NuclearLevelTex[6];
var() color TeamColors[5];
var() float ListItemHeight, ListItemWidth, ListItemPadding, NukeIconScale, MainMsgIconScale;
var() float itemFadeOutTime, nukeGlowRate, MainIconFadeOutTime, MainIconStayTime;
var() float NuclearLevelTexListOffsetX, NuclearLevelTexListOffsetY, NuclearLevelTexListScale;
var() Font itemFontTop[6], itemFontBottom[6];
var() localized sound newWarnSnd;

var(MixedConfig) config float ListStartPosX, ListStartPosY;
var(MixedConfig) config bool bHorizontalListing;
var(ClientConfig) config bool letClientDecideListStart;
var(ServerConfig) config color WarnColors[6];
var(ServerConfig) config float WarningUpdateTime;
var(ServerConfig) config bool bWarnTeamMates, bWarnInstigator;
var(ServerConfig) config bool enableWarnBacksound;
var(ServerConfig) config bool enableWarningDetails, enableWarningPlayerName;

var float listPosX, listPosY;
var bool bHorizontal, bWarnDetails, bWarnPlayerName;
var color repWarnColors[6];
var float sinTimeCount, curNukeGlow;
var float mainIconCountdown;
var byte lastWarnLevel;

struct warnL
{
	var bool hasNuke;
	var NaliNuclearProjectile nukeP;
	var class<NaliNuclearProjectile> nukeClass;
	var float nukedDelay;
	var color OwnerColor;
	var string OwnerName;
	var byte nukeLevel;
};

var warnL WarnList[8];


replication
{
	reliable if (Role == ROLE_Authority)
		listPosX, listPosY, bHorizontal, repWarnColors, WarnList, lastWarnLevel, bWarnDetails, bWarnPlayerName;
	unreliable if (Role == ROLE_Authority)
		mainIconCountdown;
}

function BeginPlay()
{
local byte i;

	listPosX = default.ListStartPosX;
	listPosY = default.ListStartPosY;
	bHorizontal = default.bHorizontalListing;
	bWarnDetails = default.enableWarningDetails;
	bWarnPlayerName = default.enableWarningPlayerName;
	
	for (i = 0; i < ArrayCount(WarnColors); i++)
		repWarnColors[i] = default.WarnColors[i];

	SetTimer(default.WarningUpdateTime, True);
}

function Timer()
{
local NaliNuclearProjectile nukeP, newNuke;
local Pawn P;
local int zoneNuke;

	if (isListFull())
		return;

	ForEach AllActors(Class'NaliNuclearProjectile', nukeP)
	{
		if (!nukeP.bAlwaysRelevant && !nukeP.denyNuclearWarning)
		{
			nukeP.bAlwaysRelevant = True;
			nukeP.InitNukeWarn();
			newNuke = nukeP;
			AddToList(nukeP);
		}
	}
	
	if (newNuke != None)
	{
		for (P = Level.PawnList; P != None; P = P.NextPawn)
		{
			if (PlayerPawn(P) != None && default.enableWarnBacksound)
				PlayerPawn(P).ClientPlaySound(newWarnSnd,, true);
			
			if (PlayerPawn(P) != None && shouldWarnThisPawn(P, newNuke))
			{
				zoneNuke = newNuke.getImpactArea(P);
				if (zoneNuke == 0)
					PlayerPawn(P).ReceiveLocalizedMessage(Class'NukeCriticalZoneMsg');
				else if (zoneNuke == 1)
					PlayerPawn(P).ReceiveLocalizedMessage(Class'NukeDeathZoneMsg');
				else if (zoneNuke == 2)
					PlayerPawn(P).ReceiveLocalizedMessage(Class'NukeDangerZoneMsg');
				else if (zoneNuke == 3)
					PlayerPawn(P).ReceiveLocalizedMessage(Class'NukeSafeZoneMsg');
				
				PlayerPawn(P).ReceiveLocalizedMessage(Class'NukeLevelMsg', newNuke.NuclearLevel);
				lastWarnLevel = newNuke.NuclearLevel;
				mainIconCountdown = MainIconFadeOutTime;
			}
		}
	}
}

function bool shouldWarnThisPawn(Pawn P, NaliNuclearProjectile N)
{
	if (PlayerPawn(P) == None || N == None)
		return False;
	return Class'NWUtils'.static.isFriend(P, Level, N.Instigator,, default.bWarnTeamMates, default.bWarnInstigator);
}

function AddToList(NaliNuclearProjectile N)
{
local byte i;

	for (i = 0; i < ArrayCount(WarnList); i++)
	{
		if (!WarnList[i].hasNuke)
		{
			WarnList[i].hasNuke = True;
			WarnList[i].nukeP = N;
			WarnList[i].nukedDelay = itemFadeOutTime;
			WarnList[i].OwnerColor = getPawnColor(N.Instigator, N);
			WarnList[i].OwnerName = getPawnName(N.Instigator);
			WarnList[i].nukeLevel = N.NuclearLevel;
			WarnList[i].nukeClass = N.Class;
			return;
		}
	}
}

function CopyListItem(byte fromIndex, byte toIndex, optional bool bDeleteOld)
{
	if (fromIndex >= ArrayCount(WarnList) || toIndex >= ArrayCount(WarnList))
		return;
	
	WarnList[toIndex].hasNuke = WarnList[fromIndex].hasNuke;
	WarnList[toIndex].nukeP = WarnList[fromIndex].nukeP;
	WarnList[toIndex].nukedDelay = WarnList[fromIndex].nukedDelay;
	WarnList[toIndex].OwnerColor = WarnList[fromIndex].OwnerColor;
	WarnList[toIndex].OwnerName = WarnList[fromIndex].OwnerName;
	WarnList[toIndex].nukeLevel = WarnList[fromIndex].nukeLevel;
	WarnList[toIndex].nukeClass = WarnList[fromIndex].nukeClass;
			
	if (bDeleteOld)
		RemoveFromList(fromIndex);
}

function color getPawnColor(Pawn P, optional NaliNuclearProjectile N)
{
	if (P == None || N == None || Class'NWUtils'.static.isMonsterGame(Level) 
	|| P.PlayerReplicationInfo == None || !Level.Game.bTeamGame || P.PlayerReplicationInfo.Team >= 4)
		return TeamColors[4];
	return TeamColors[P.PlayerReplicationInfo.Team];
}

function string getPawnName(Pawn P)
{
	if (P == None)
		return "";
		
	if (P.PlayerReplicationInfo != None)
		return P.PlayerReplicationInfo.PlayerName;
	return P.MenuName;
}

function bool isListFull()
{
local byte i;

	for (i = 0; i < ArrayCount(WarnList); i++)
	{
		if (!WarnList[i].hasNuke)
			return False;
	}
	
	return True;
}

function bool isListEmpty()
{
local byte i;

	for (i = 0; i < ArrayCount(WarnList); i++)
	{
		if (WarnList[i].hasNuke)
			return False;
	}
	
	return True;
}

function RemoveFromList(byte index, optional bool bReSort)
{
	if (index < ArrayCount(WarnList))
	{
		WarnList[index].hasNuke = False;
		if (bReSort)
			ReGroupList(index);
	}
}

function ReGroupList(byte indexStart)
{
local byte iTo, i;

	iTo = indexStart;
	for (i = indexStart+1; i < ArrayCount(WarnList); i++)
	{
		if (WarnList[i].hasNuke)
		{
			CopyListItem(i, iTo, True);
			iTo++;
		}
	}
}

simulated function Tick(float Delta)
{
local byte i;

	if (!bHUDMutator && Level.NetMode != NM_DedicatedServer )
		RegisterHUDMutator();
	
	if (!isListEmpty())
	{
		for (i = 0; i < ArrayCount(WarnList); i++)
		{
			if (WarnList[i].hasNuke && (WarnList[i].nukeP == None || WarnList[i].nukeP.bDeleteMe))
			{
				WarnList[i].nukedDelay -= Delta;
				if (WarnList[i].nukedDelay <= 0.0)
					RemoveFromList(i, True);
			}
		}
		
		sinTimeCount += Delta;
		curNukeGlow = FMin(Abs(Sin(sinTimeCount*(2*PI)*nukeGlowRate)+1)/2, 1.0);
		if (sinTimeCount >= 1/nukeGlowRate)
			sinTimeCount -= 1/nukeGlowRate;
		
		if (mainIconCountdown > 0)
			mainIconCountdown -= Delta;
	}
}
 
simulated function PostRender(canvas Canvas)
{
local float CntX, CntY;
local float listX, listY;
local float itemX, itemY;
local float headerX, headerY;
local float Scale, outFactor;
local byte i, resFont;
local color infoColor;
local string infoText;
local bool bHor;
local float posX, posY;

	if (isListEmpty())
	{
		if (NextHUDMutator != None)
			NextHUDMutator.PostRender(Canvas);
		return;
	}

	//Generic properties
	Canvas.Reset();
	CntX = Canvas.ClipX/2;
	CntY = Canvas.ClipY/2;
	Scale = Canvas.ClipY/480;
	Canvas.bNoSmooth = False;
	
	//Main Icon render
	if (mainIconCountdown > 0)
	{
		if (mainIconCountdown < Abs(MainIconFadeOutTime - MainIconStayTime))
			outFactor = mainIconCountdown / Abs(MainIconFadeOutTime - MainIconStayTime);
		else
			outFactor = 1.0;
			
		headerX = CntX - Scale*MainMsgIconScale*NuclearWarnSignTex[0].USize/2;
		headerY = Scale*(1-MainMsgIconScale)*NuclearWarnSignTex[0].VSize/2;
		Canvas.DrawColor = outFactor*getColor(255,255,255);
		
		Canvas.Style = ERenderStyle.STY_Modulated;
		Canvas.SetPos(headerX, headerY);
		Canvas.DrawIcon(NuclearWarnSignTex[0], Scale*MainMsgIconScale);
		
		Canvas.Style = ERenderStyle.STY_Translucent;
		Canvas.SetPos(headerX, headerY);
		Canvas.DrawIcon(NuclearWarnSignTex[1], Scale*MainMsgIconScale);
		
		Canvas.DrawColor = outFactor*repWarnColors[lastWarnLevel]*curNukeGlow;
		Canvas.SetPos(headerX, headerY);
		Canvas.DrawIcon(NuclearGlowTex, Scale*MainMsgIconScale);
		
		posX = headerX + Scale*MainMsgIconScale*(NuclearWarnSignTex[0].USize-NuclearLevelTex[lastWarnLevel].USize);
		posY = headerY + Scale*MainMsgIconScale*(NuclearWarnSignTex[0].VSize-NuclearLevelTex[lastWarnLevel].VSize);
		Canvas.DrawColor = outFactor*repWarnColors[lastWarnLevel];
		Canvas.SetPos(posX, posY);
		Canvas.DrawIcon(NuclearLevelTex[lastWarnLevel], Scale*MainMsgIconScale);
	}
	
	if (default.letClientDecideListStart)
	{
		listX = default.ListStartPosX;
		listY = default.ListStartPosY;
		bHor = default.bHorizontalListing;
	}
	else
	{
		listX = listPosX;
		listY = listPosY;
		bHor = bHorizontal;
	}
	
	listX *= Canvas.ClipX;
	listY *= Canvas.ClipY;
	
	for (i = 0; i < ArrayCount(WarnList); i++)
	{
		if (WarnList[i].hasNuke && WarnList[i].nukedDelay > 0)
		{
			if (bHor)
			{
				if (i < ArrayCount(WarnList)/2)
				{
					itemX = listX + i*ListItemWidth*Scale;
					itemY = listY;
				}
				else
				{
					itemX = listX + (i-4)*ListItemWidth*Scale;
					itemY = listY + ListItemHeight*Scale;
				}
			}
			else
			{
				itemX = listX;
				itemY = listY + i*ListItemHeight*Scale;
			}
			
			
			outFactor = WarnList[i].nukedDelay / itemFadeOutTime;
			
			posX = itemX + Scale*NukeIconScale*NuclearWarnSignTex[0].USize*(1-outFactor)/2;
			posY = itemY + Scale*NukeIconScale*NuclearWarnSignTex[0].VSize*(1-outFactor)/2;
			Canvas.DrawColor = outFactor*getColor(255,255,255);
			
			Canvas.Style = ERenderStyle.STY_Modulated;
			Canvas.SetPos(posX, posY);
			Canvas.DrawIcon(NuclearWarnSignTex[0], Scale*NukeIconScale*outFactor);
			
			Canvas.Style = ERenderStyle.STY_Translucent;
			Canvas.SetPos(posX, posY);
			Canvas.DrawIcon(NuclearWarnSignTex[1], Scale*NukeIconScale*outFactor);
			
			Canvas.SetPos(posX, posY);
			Canvas.DrawColor = outFactor*repWarnColors[WarnList[i].nukeLevel]*curNukeGlow;
			Canvas.DrawIcon(NuclearGlowTex, Scale*NukeIconScale*outFactor);
			
			posX += (Scale*NukeIconScale*outFactor*(NuclearWarnSignTex[0].USize-NuclearLevelTex[WarnList[i].nukeLevel].USize+NuclearLevelTexListOffsetX));
			posY += (Scale*NukeIconScale*outFactor*(NuclearWarnSignTex[0].VSize-NuclearLevelTex[WarnList[i].nukeLevel].VSize+NuclearLevelTexListOffsetY));
			Canvas.DrawColor = outFactor*repWarnColors[WarnList[i].nukeLevel];
			Canvas.SetPos(posX, posY);
			Canvas.DrawIcon(NuclearLevelTex[WarnList[i].nukeLevel], Scale*NukeIconScale*outFactor*NuclearLevelTexListScale);
			
			if (WarnList[i].nukedDelay == itemFadeOutTime && WarnList[i].nukeP != None && !WarnList[i].nukeP.bDeleteMe)
			{
				infoColor = WarnList[i].nukeP.getNukeInfoColor();
				infoText = WarnList[i].nukeP.getNukeInfoText();
			}
			else
			{
				infoColor = WarnList[i].nukeClass.default.defaultInfoColor;
				infoText = WarnList[i].nukeClass.default.defaultInfoText;
			}
			
			resFont = Class'NWUtils'.static.getResolutionFontCoef(Canvas);
			
			if (bWarnDetails)
			{
				Canvas.SetPos(itemX + Scale*(NukeIconScale*NuclearWarnSignTex[0].USize + ListItemPadding), itemY);
				Canvas.DrawColor = outFactor*infoColor;
				if (itemFontTop[resFont] != None)
					Canvas.Font = itemFontTop[resFont];
				else
					Canvas.Font = Class'FontInfo'.static.GetStaticSmallFont(Canvas.ClipX);
				Canvas.DrawText(infoText);
			}
			
			if (bWarnPlayerName)
			{
				Canvas.SetPos(itemX + Scale*(NukeIconScale*NuclearWarnSignTex[0].USize + ListItemPadding), itemY + Scale*NukeIconScale*NuclearWarnSignTex[0].VSize/2);
				Canvas.DrawColor = outFactor*WarnList[i].OwnerColor;
				if (itemFontBottom[resFont] != None)
					Canvas.Font = itemFontBottom[resFont];
				else
					Canvas.Font = Class'FontInfo'.static.GetStaticSmallFont(Canvas.ClipX);
				Canvas.DrawText(WarnList[i].OwnerName);
			}
		}
	}

	if (NextHUDMutator != None)
		NextHUDMutator.PostRender(Canvas);
}

simulated function color getColor(byte R, byte G, byte B)
{
local color C;

	C.R = R;
	C.G = G;
	C.B = B;
	
	return C;
}
 
defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=True
	
	NuclearWarnSignTex(0)=NuclearIconMod
	NuclearWarnSignTex(1)=NuclearIconTrans
	NuclearGlowTex=NuclearIconGlow
	NuclearLevelTex(0)=NuclearIconN0
	NuclearLevelTex(1)=NuclearIconN1
	NuclearLevelTex(2)=NuclearIconN2
	NuclearLevelTex(3)=NuclearIconN3
	NuclearLevelTex(4)=NuclearIconN4
	NuclearLevelTex(5)=NuclearIconN5
	itemFontTop(0)=NukeWarnFontA
	itemFontTop(1)=NukeWarnFontB
	itemFontTop(2)=NukeWarnFontC
	itemFontTop(3)=NukeWarnFontD
	itemFontTop(4)=NukeWarnFontE
	itemFontTop(5)=NukeWarnFontF
	itemFontBottom(0)=None
	itemFontBottom(1)=None
	itemFontBottom(2)=None
	itemFontBottom(3)=None
	itemFontBottom(4)=None
	itemFontBottom(5)=None
	ListItemHeight=32.000000
	ListItemWidth=96.000000
	ListItemPadding=4.000000
	NukeIconScale=0.200000
	MainMsgIconScale=0.650000
	itemFadeOutTime=2.000000
	MainIconFadeOutTime=3.000000
	MainIconStayTime=2.000000
	nukeGlowRate=1.000000
	TeamColors(0)=(R=255,G=0,B=0)
	TeamColors(1)=(R=0,G=0,B=255)
	TeamColors(2)=(R=0,G=255,B=0)
	TeamColors(3)=(R=255,G=255,B=0)
	TeamColors(4)=(R=255,G=255,B=255)
	newWarnSnd=nukeWarn
	NuclearLevelTexListOffsetX=0.000000
	NuclearLevelTexListOffsetY=0.000000
	NuclearLevelTexListScale=1.750000
	
	ListStartPosX=0.000000
	ListStartPosY=0.750000
	bHorizontalListing=True
	letClientDecideListStart=False
	WarnColors(0)=(R=0,G=255,B=255)
	WarnColors(1)=(R=0,G=255,B=100)
	WarnColors(2)=(R=190,G=255,B=0)
	WarnColors(3)=(R=255,G=128,B=0)
	WarnColors(4)=(R=255,G=64,B=0)
	WarnColors(5)=(R=255,G=0,B=0)
	WarningUpdateTime=0.500000
	bWarnTeamMates=True
	bWarnInstigator=True
	enableWarnBacksound=True
	enableWarningDetails=True
	enableWarningPlayerName=True
}