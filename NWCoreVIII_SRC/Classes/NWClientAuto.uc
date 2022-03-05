//////////////////////////////////////////////////////////////
//				Feralidragon (10-03-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWClientAuto expands Mutator config(_nw3);


var() name NWClientName;
var() string ExitCommands[16];
var() float ConsoleCommandDelayOffline;
var() float ConsoleCommandDelayOnline;
var() string NWClientExitFName;

struct KeyOpts
{
	var() string KeyBindCommand;
	var() byte KeyBindAction;
};
var KeyOpts ZHackBindOptions[32];

var globalconfig bool hasZHackEnabled, hasZHackCfg;
var globalconfig bool hasSetupModifierKey;
var bool bInitialized;
var PlayerPawn ClientPP;
var float consoleCommandDelay;
var float playerPawnInitRenderTimeout;

var bool enableShakeFX;
var bool bReplicatedAllData;
var PlayerPawn PPList[48];

replication
{
	reliable if (Role == ROLE_Authority)
		enableShakeFX, ZHackBindOptions, bReplicatedAllData;
}


simulated function PostBeginPlay()
{
local byte i;

	Super.PostBeginPlay();
	if (Role == ROLE_Authority && Class'NWInfo'.default.enableServerNukeCrashFix)
		Spawn(Class'NWNukeDecalKiller');
	if (Role == ROLE_Authority)
	{
		for (i = 0; i < ArrayCount(ZHackBindOptions); i++)
		{
			ZHackBindOptions[i].KeyBindCommand = Class'NWInfo'.static.getZHackBindOptCommand(i);
			ZHackBindOptions[i].KeyBindAction = Class'NWInfo'.static.getZHackBindOptAction(i);
		}
		
		enableShakeFX = Class'NWInfo'.default.enableShakeFX;
		bReplicatedAllData = True;
	}
}

simulated function Tick(float Delta)
{
local PlayerPawn PP;

	if (Level.NetMode != NM_DedicatedServer)
	{
		if (!bHUDMutator)
			RegisterHUDMutator();
	
		if (bReplicatedAllData && playerPawnInitRenderTimeout > 0 && ClientPP == None)
		{
			playerPawnInitRenderTimeout -= Delta;
			if (playerPawnInitRenderTimeout <= 0.0)
			{
				log("Unable to initialize"@Self@"through PostRender, please check if none of your UT currently installed mods, mutators or admin managers are breaking the HUD mutator chain", NWClientName);
				log("Passing to alternate check...", NWClientName);
				Foreach AllActors(Class'PlayerPawn', PP)
				{
					if (Viewport(PP.Player) != None)
					{
						ClientPP = PP;
						break;
					}
				}
				
				if (ClientPP != None)
					log("Client found successfully (alternate), processing...", NWClientName);
				else
					log("WTF? Client NOT found!", NWClientName);
			}
		}
		ManageClient(ClientPP, Delta);
	}
}

simulated function ManageClient(PlayerPawn POwner, float Delta)
{
local bool bNoRenderZHack;
local NWMutator NWM;
local int zHBeh;

	if (POwner != None)
	{
		if (!bInitialized)
		{
			bInitialized = True;
			if (!hasZHackCfg)
			{
				default.hasZHackEnabled = GetZHack(POwner);
				hasZHackEnabled = default.hasZHackEnabled;
				default.hasZHackCfg = True;
				hasZHackCfg = default.hasZHackCfg;
				SaveConfig();
			}
			
			if (Class'NaliWeapons'.default.RenderZHackManager == 1)
				SetupKeyBindings(POwner);
		}
		
		NWM = Class'NWUtils'.static.getNWMutator(Level, True);
		if (NWM != None)
		{
			zHBeh = NWM.getZHackBehavior(POwner);
			if (zHBeh >= 0)
			{
				if (GetZHack(POwner) != Bool(zHBeh))
					SetZHack(POwner, Bool(zHBeh));
				return;
			}
		}
		
		if (hasZHackEnabled && Class'NaliWeapons'.default.RenderZHackManager > 0)
		{
			if (consoleCommandDelay > 0)
				consoleCommandDelay -= Delta;
			bNoRenderZHack = isInvalidRendering(POwner);
			if (bNoRenderZHack)
			{
				if (Level.NetMode == NM_Standalone)
					consoleCommandDelay = ConsoleCommandDelayOffline;
				else
					consoleCommandDelay = ConsoleCommandDelayOnline;
			}
			
			bNoRenderZHack = (bNoRenderZHack || consoleCommandDelay > 0);
			if ((bNoRenderZHack || NaliWeapons(POwner.Weapon) == None) 
				&& Class'NaliWeapons'.default.RenderZHackManager==1 && !GetZHack(POwner))
				SetZHack(POwner, True);
			else if (!bNoRenderZHack && NaliWeapons(POwner.Weapon) != None && GetZHack(POwner))
				SetZHack(POwner, False);
		}
	}
}

simulated function SetupKeyBindings(PlayerPawn PP)
{
local byte i, kAction;
local string keyName, keyBinding;

	if (PP == None)	
		return;

	for (i = 0; i < EInputKey.EnumCount; i++)
	{
		keyName = PP.ConsoleCommand("KEYNAME"@i);
		keyBinding = PP.ConsoleCommand("KEYBINDING"@keyName);
		if (isPotentialQuitCmd(keyBinding) && !hasStr(keyBinding, NWClientExitFName))
		{
			if (keyBinding == "")
				PP.ConsoleCommand("SET INPUT"@keyName@NWClientExitFName);
			else
			{
				kAction = getZHackKeybindingAction(keyBinding);
				if (kAction == 0)
					PP.ConsoleCommand("SET INPUT"@keyName@NWClientExitFName$"|"$keyBinding);
				else if (kAction == 1)
					PP.ConsoleCommand("SET INPUT"@keyName@keyBinding$"|"$NWClientExitFName);
			}
		}
			
		//Modifier lock
		if (!default.hasSetupModifierKey && keyName ~= "Enter" && !hasStr(keyBinding, "ToggleModifierLock"))
		{
			PP.ConsoleCommand("SET INPUT"@keyName@"ToggleModifierLock"$"|"$keyBinding);
			hasSetupModifierKey = True;
			default.hasSetupModifierKey = True;
			SaveConfig();
		}
	}
	
	log("Client keybinds setup OK", NWClientName);
}

simulated function byte getZHackKeybindingAction(string KeyCmd)
{
local byte i;

	if (KeyCmd == "")
		return 0;

	for (i = 0; i < ArrayCount(ZHackBindOptions); i++)
	{
		if (ZHackBindOptions[i].KeyBindCommand == "")
			return 0;
		if (Class'NWUtils'.static.StrMatch(ZHackBindOptions[i].KeyBindCommand, KeyCmd))
			return ZHackBindOptions[i].KeyBindAction;
	}
	return 0;
}
 
simulated function PostRender(canvas Canvas)
{
	if (bReplicatedAllData && ClientPP == None)
	{
		ClientPP = Canvas.Viewport.Actor;
		playerPawnInitRenderTimeout = 0.0;
		if (ClientPP != None)
			log("Client found successfully, processing...", NWClientName);
	}

	if (NextHUDMutator != None)
		NextHUDMutator.PostRender(Canvas);
}

simulated function bool isInvalidRendering(PlayerPawn PP)
{
	return (PP == None || PP.bDeleteMe || PP.bShowMenu || PP.bBehindView || Level.Pauser!="" || PP.Player.bShowWindowsMouse || 
		(PP.Player.Console.bTyping && isPotentialQuitCmd(PP.Player.Console.TypedStr)));
}

simulated function bool isPotentialQuitCmd(coerce string cmdStr)
{
local byte i;

	if (Len(cmdStr) <= 0)
		return False;
		
	for (i = 0; i < ArrayCount(ExitCommands); i++)
	{
		if (hasStr(cmdStr,ExitCommands[i]))
			return True;
	}
	return False;
}

simulated function bool hasStr(coerce string S, coerce string t, optional bool bCaseSensitive)
{
	if (!bCaseSensitive)
	{
		S = Caps(S);
		t = Caps(t);
	}
	return (InStr(S, t) >= 0);
}

simulated function bool GetZHack(PlayerPawn PP)
{
	if (PP != None)
		return bool(PP.ConsoleCommand("GET ini:Engine.Engine.GameRenderDevice ZRangeHack"));
	return False;
}

simulated function SetZHack(PlayerPawn PP, bool zHackBool)
{
local string zHackVal;

	if (PP == None)
		return;
		
	if (zHackBool)
		zHackVal = "True";
	else
		zHackVal = "False";
		
	PP.ConsoleCommand("SET ini:Engine.Engine.GameRenderDevice ZRangeHack "$zHackVal);
}

static function StaticResetZHack(PlayerPawn PP)
{
	if (default.hasZHackCfg && default.hasZHackEnabled && Class'NaliWeapons'.default.RenderZHackManager == 1)
		PP.ConsoleCommand("SET ini:Engine.Engine.GameRenderDevice ZRangeHack True");
}

simulated function ResetZHack(PlayerPawn PP)
{
	if (hasZHackCfg && hasZHackEnabled && Class'NaliWeapons'.default.RenderZHackManager == 1)
	{
		PP.ConsoleCommand("SET ini:Engine.Engine.GameRenderDevice ZRangeHack True");
		if (Level.NetMode == NM_Standalone)
			consoleCommandDelay = ConsoleCommandDelayOffline;
		else
			consoleCommandDelay = ConsoleCommandDelayOnline;
	}
}

simulated function Destroyed()
{
	if (ClientPP != None && Class'NaliWeapons'.default.RenderZHackManager==1 && !GetZHack(ClientPP))
		SetZHack(ClientPP, True);
	Super.Destroyed();
}


//Server -> client replication signal functions (for players who do not have the mod installed)
function ModifyPlayer(Pawn Other)
{
	if (Level.NetMode != NM_StandAlone && PlayerPawn(Other) != None && !hasPlayer(PlayerPawn(Other)))
	{
		addPlayer(PlayerPawn(Other));
		prepareClientSettings(PlayerPawn(Other));
	}
	Super.ModifyPlayer(Other);
}

function bool hasPlayer(PlayerPawn PP)
{
local byte i;

	for (i = 0; i < ArrayCount(PPList); i++)
	{
		if (PP == PPList[i])
			return True;
	}
	return False;
}

function addPlayer(PlayerPawn PP)
{
local byte i;

	if (hasPlayer(PP))
		return;
	for (i = 0; i < ArrayCount(PPList); i++)
	{
		if (PPList[i] == None || PPList[i].bDeleteMe)
		{
			PPList[i] = PP;
			return;
		}
	}
}

function prepareClientSettings(PlayerPawn PP)
{
local int i;
local string clClassStr;
local class<NWClRepl> clClass;

	while (i < 512)
	{
		clClassStr = GetNextInt(String(Class'NWClRepl'), i++);
		if (clClassStr == "")
			return;
		clClass = Class<NWClRepl>(DynamicLoadObject(clClassStr, class'Class'));
		if (clClass == None)
			continue;
		Spawn(clClass, PP);
	}
}

 
defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=True
	bAlwaysTick=True
	playerPawnInitRenderTimeout=2.000000
	
	NWClientName=NWClientAuto_v1
	NWClientExitFName="NWClientExit"
	ConsoleCommandDelayOffline=0.100000
	ConsoleCommandDelayOnline=0.500000
	
	ExitCommands(0)="say !"
	ExitCommands(1)="teamsay !"
	ExitCommands(2)="open "
	ExitCommands(3)="exit"
	ExitCommands(4)="quit"
	ExitCommands(5)="mutate "
	ExitCommands(6)="debug "
	ExitCommands(7)="url "
	ExitCommands(8)="killall "
	ExitCommands(9)="demoplay "
	ExitCommands(10)="killpawns"
	ExitCommands(11)="disconnect"
	ExitCommands(12)="reconnect"
	ExitCommands(13)="servertravel "
	ExitCommands(14)="switchlevel "
	ExitCommands(15)="exec "
}