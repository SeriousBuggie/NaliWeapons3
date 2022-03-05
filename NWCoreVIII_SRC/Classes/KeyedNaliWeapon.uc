//////////////////////////////////////////////////////////////
//	Nali Weapons III special key'ed weapon 
//			(weapon with 0-9 keys support)
//				Feralidragon (15-08-2011)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class KeyedNaliWeapon expands NaliWeapons config(NWeaponsCfg)
abstract;

var(Keys) name NumberAnimIn[10], NumberAnimOut[10];
var(Keys) name EnterKeyModeAnim, LeaveKeyModeAnim, NumberFinishAnimIn, NumberFinishAnimOut;
var(Keys) float NumberPressRate, EnterKeyModeRate, LeaveKeyModeRate, KeysTweenTime;
var(Keys) byte KeysBufferSize;
var(Keys) sound KeyPressSnd, KeyPressFinishSnd;
var(Keys) byte KeyStatesAmount;
var(Keys) bool bFireAsKeyStarter, bAltFireAsKeyStarter, bFireAsKeyEnder, bAltFireAsKeyEnder;
var(Keys) localized string defaultKeysHelpText;
var(Keys) color defaultKeysHelpColor;
var(Keys) bool bLeaveKeyModeOnceSet;

var(ClientConfig) globalconfig bool displayKeysHelp;

var bool hasPlayedKey, hasFinshedPlayingKey, isKeyMode, keepClientKeyMode, isPlayingKeys;
var byte savedKey, keysBufferLoad, curKeyState, curKeyBufferPos;
var string keysBuffer;
var float keyCallbackTimeout;

replication
{
	reliable if (Role == ROLE_Authority)
		savedKey, hasPlayedKey, hasFinshedPlayingKey, keysBufferLoad, 
		curKeyState, curKeyBufferPos;
	reliable if (Role == ROLE_Authority)
		PlayKeyAnim, PlayKeyAnimEnd, PlayKeyMode, ForceClientLeave;
	reliable if (Role < ROLE_Authority)
		toggleHasPlayedKey, toggleHasFinishedPlayingKey, HandleKeyPress, 
		KeyModeToggled, WeaponKeyPressed, resetBufferLoad, PressKey;
}

exec function PressKey(byte K)
{
	if (Pawn(Owner) != None && KeyedNaliWeapon(Pawn(Owner).Weapon) != None && Pawn(Owner).Weapon.IsInState('KeyPressMode'))
		Pawn(Owner).Weapon.WeaponChange(K);
}

simulated function SetupKeyBindings(PlayerPawn PP)
{
local byte i;

	if (PP == None)	
		return;

	for (i = 0; i < 10; i++)
	{
		SetupKey(PP, String(i), i);
		SetupKey(PP, "NumPad"$String(i), i);
	}
}

simulated function SetupKey(PlayerPawn PP, string keyName, byte i)
{
local string bindN, keySep, keyBinding;

	if (i == 0)
		bindN = "10";
	else
		bindN = String(i);

	keyBinding = PP.ConsoleCommand("KEYBINDING"@keyName);
	if (keyBinding == "")
		keySep = "";
	else
		keySep = "|";
	if (!hasStr(keyBinding, "SwitchWeapon") && !hasStr(keyBinding, "PressKey"))
		PP.ConsoleCommand("SET INPUT "@keyName@"PressKey"@bindN$keySep$keyBinding);
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

simulated function PlaySelect()
{
	if (PlayerPawn(Owner) != None && Viewport(PlayerPawn(Owner).Player) != None)
		SetupKeyBindings(PlayerPawn(Owner));
	Super.PlaySelect();
}

function toggleHasPlayedKey(byte setType)
{
	if (setType < 2)
		hasPlayedKey = (setType == 1);
	else
		hasPlayedKey = !hasPlayedKey;
}

simulated function toggleClientHasPlayedKey(byte setType)
{
	if (setType < 2)
		hasPlayedKey = (setType == 1);
	else
		hasPlayedKey = !hasPlayedKey;
	toggleHasPlayedKey(setType);
}

function toggleHasFinishedPlayingKey(byte setType)
{
	if (setType < 2)
		hasFinshedPlayingKey = (setType == 1);
	else
		hasFinshedPlayingKey = !hasFinshedPlayingKey;
}

simulated function toggleClientHasFinishedPlayingKey(byte setType)
{
	if (setType < 2)
		hasFinshedPlayingKey = (setType == 1);
	else
		hasFinshedPlayingKey = !hasFinshedPlayingKey;
	toggleHasFinishedPlayingKey(setType);
}

simulated function PlayKeyAnim(byte k, optional bool isTween)
{
	if (k < 10)
	{
		if (isTween)
			TweenAnim(NumberAnimIn[k], KeysTweenTime);
		else
			PlayAnim(NumberAnimIn[k], NumberPressRate, 0.0);
	}
	else
	{
		if (isTween)
			TweenAnim(NumberFinishAnimIn, KeysTweenTime);
		else
			PlayAnim(NumberFinishAnimIn, NumberPressRate, 0.0);
	}
}

simulated function PlayKeyAnimEnd(byte k, optional bool isTween)
{
	if (k < 10)
	{
		if (isTween)
			TweenAnim(NumberAnimOut[k], KeysTweenTime);
		else
		{
			PlayAnim(NumberAnimOut[k], NumberPressRate, 0.0);
			if (KeyPressSnd != None && Pawn(Owner) != None)
				PlayOwnedSound(KeyPressSnd, SLOT_None, Pawn(Owner).SoundDampening*3.0);
		}
	}
	else
	{
		if (isTween)
			TweenAnim(NumberFinishAnimOut, KeysTweenTime);
		else
		{
			PlayAnim(NumberFinishAnimOut, NumberPressRate, 0.0);
			if (KeyPressFinishSnd != None && Pawn(Owner) != None)
				PlayOwnedSound(KeyPressFinishSnd, SLOT_None, Pawn(Owner).SoundDampening*3.0);
		}
	}
}

simulated function PlayKeyMode(optional bool bLeavingMode, optional bool isTween)
{	
	if (bLeavingMode)
	{
		if (isTween)
			TweenAnim(LeaveKeyModeAnim, KeysTweenTime);
		else
			PlayAnim(LeaveKeyModeAnim, LeaveKeyModeRate, 0.0);
	}
	else
	{
		if (isTween)
			TweenAnim(EnterKeyModeAnim, KeysTweenTime);
		else
			PlayAnim(EnterKeyModeAnim, EnterKeyModeRate, 0.0);
	}
}

simulated function PlayClientKeyMode(optional bool bLeavingMode, optional bool isTween)
{	
	if (bLeavingMode)
	{
		if (isTween)
			TweenAnim(LeaveKeyModeAnim, KeysTweenTime);
		else
			PlayAnim(LeaveKeyModeAnim, LeaveKeyModeRate, 0.0);
	}
	else
	{
		if (isTween)
			TweenAnim(EnterKeyModeAnim, KeysTweenTime);
		else
			PlayAnim(EnterKeyModeAnim, EnterKeyModeRate, 0.0);
	}
}

function PlayServerKeyMode(optional bool bLeavingMode, optional bool isTween)
{	
	if (bLeavingMode)
	{
		if (isTween)
			TweenAnim(LeaveKeyModeAnim, KeysTweenTime);
		else
			PlayAnim(LeaveKeyModeAnim, LeaveKeyModeRate, 0.0);
	}
	else
	{
		if (isTween)
			TweenAnim(EnterKeyModeAnim, KeysTweenTime);
		else
			PlayAnim(EnterKeyModeAnim, EnterKeyModeRate, 0.0);
	}
}


//Implement at subclass
function WeaponKeyPressed(byte k, byte bufferPos);
function KeyStateChange(byte newState);
function KeyModeToggled(bool isKeyMode);
simulated function KeyClientTick(float Delta);

function resetBufferLoad()
{
	keysBufferLoad = 0;
	curKeyBufferPos = 0;
}

function setKeysTimeout(float t)
{
	keyCallbackTimeout = t;
}

function keyCallback()
{
	toggleHasPlayedKey(1);
	PlayKeyAnim(savedKey);
}

function HandleKeyPress(optional byte k, optional bool bNextKey)
{
local byte newK;

	if (bNextKey)
	{
		if (Len(keysBuffer) > 0)
		{
			newK = Byte(Left(keysBuffer,1));
			savedKey = newK;
			curKeyBufferPos++;
			keysBuffer = Mid(keysBuffer,1);
			PlayKeyAnim(newK, True);
			setKeysTimeout(KeysTweenTime);
		}
		else if (keysBufferLoad >= KeysBufferSize && savedKey < 10)
		{
			savedKey = 10;
			PlayKeyAnim(10, True);
			setKeysTimeout(KeysTweenTime);
		}
		else
		{
			if (keysBufferLoad >= KeysBufferSize)
			{
				resetBufferLoad();
				curKeyState++;
				if (curKeyState >= KeyStatesAmount)
				{
					if (bLeaveKeyModeOnceSet)
					{
						KeyStateChange(curKeyState);
						curKeyBufferPos = 0;
						curKeyState = 0;
						PlayKeyMode(True, False);
						isPlayingKeys = False;
						KeyModeToggled(False);
						ForceClientLeave();
						GotoState('Idle');
						return;
					}
					curKeyState = 0;
				}
				KeyStateChange(curKeyState);
			}
			isPlayingKeys = False;
			PlayKeyMode(True, True);
		}
	}
	else if (isPlayingKeys && keysBufferLoad < KeysBufferSize)
	{
		keysBuffer = (keysBuffer $ k);
		keysBufferLoad++;
	}
	else if (keysBufferLoad < KeysBufferSize)
	{
		savedKey = k;
		curKeyBufferPos++;
		PlayKeyAnim(k, True);
		setKeysTimeout(KeysTweenTime);
		keysBufferLoad++;
		isPlayingKeys = True;
	}
}

simulated function ForceClientLeave()
{
	keepClientKeyMode = False;
	GotoState('');
}

function Fire(float Value)
{
	if (bFireAsKeyStarter)
		GotoState('KeyPressMode');
	else
		Super.Fire(Value);
}

function AltFire(float Value)
{
	if (bAltFireAsKeyStarter)
		GotoState('KeyPressMode');
	else
		Super.AltFire(Value);
}

simulated function bool ClientFire(float Value)
{
	if (bFireAsKeyStarter && Role < ROLE_Authority)
	{
		GotoState('ClientKeyPressMode');
		return False;
	}
	else
		return Super.ClientFire(Value);
}

simulated function bool ClientAltFire(float Value)
{
	if (bAltFireAsKeyStarter && Role < ROLE_Authority)
	{
		GotoState('ClientKeyPressMode');
		return False;
	}
	else
		return Super.ClientAltFire(Value);
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	//Deny what TournamentPlayer wants to force, Feralidragon 1 - Epic 0
	if (keepClientKeyMode)
	{
		if (Level.NetMode != NM_DedicatedServer && GetStateName() != 'ClientKeyPressMode')
			GotoState('ClientKeyPressMode');
		KeyClientTick(Delta);
	}
}

simulated function keyCallbackUpdate(float Delta)
{
	if (keyCallbackTimeout > 0.0)
	{
		keyCallbackTimeout -= Delta;
		if (keyCallbackTimeout <= 0.0)
			keyCallback();
	}
}

simulated function TweenToStill()
{
	if (!keepClientKeyMode)
		Super.TweenToStill();
}

simulated function PostRender(canvas Canvas)
{
local string keysHelpTxt, keysHelpLine;
local int tPos;
local float lastY;
local float txtXL, txtYL;

	if (default.displayKeysHelp && (IsInState('KeyPressMode') || IsInState('ClientKeyPressMode')))
	{
		Canvas.bNoSmooth = False;
		Canvas.Style = ERenderStyle.STY_Translucent;
		Canvas.Font = Class'FontInfo'.static.GetStaticBigFont(Canvas.ClipX);
		Canvas.DrawColor = defaultKeysHelpColor;
		Canvas.bCenter = True;
		
		keysHelpTxt = GetKeysHelpText();
		Canvas.TextSize(keysHelpTxt, txtXL, txtYL);
		lastY = txtYL;
		while (InStr(keysHelpTxt, "%n%")>=0)
		{
			tPos = InStr(keysHelpTxt, "%n%");
			keysHelpLine = Left(keysHelpTxt, tPos);
			keysHelpTxt = Mid(keysHelpTxt, tPos + 3);
			Canvas.SetPos(0, lastY);
			Canvas.DrawText(keysHelpLine);
			lastY += (txtYL + 4);
		}
		
		if (Len(keysHelpTxt) > 0)
		{
			Canvas.SetPos(0, lastY);
			Canvas.DrawText(keysHelpTxt);
		}
		
		Canvas.Reset();
	}
		
	Super.PostRender(Canvas);
}

simulated function string GetKeysHelpText()
{
	return defaultKeysHelpText;
}


state Idle
{
Begin:
	bPointing=False;
	if ((AmmoType != None) && (AmmoType.AmmoAmount<=0)) 
		Pawn(Owner).SwitchToBestWeapon();  //Goto Weapon that has Ammo
	if ( Pawn(Owner).bFire!=0 && !isKeyMode) Fire(0.0);
	if ( Pawn(Owner).bAltFire!=0 && !isKeyMode) AltFire(0.0);    
	Disable('AnimEnd');
	PlayIdleAnim();
	isKeyMode = False;
}


state KeyPressMode
{
	function Fire(float Value)
	{
		if (!bFireAsKeyEnder)
			return;
		if (curKeyState == 0 && curKeyBufferPos == 0)
			GotoState('Idle');
	}
	
	function AltFire(float Value)
	{
		if (!bAltFireAsKeyEnder)
			return;
		if (curKeyState == 0 && curKeyBufferPos == 0)
			GotoState('Idle');
	}
	
	function AnimEnd()
	{
		if (hasPlayedKey)
		{
			WeaponKeyPressed(savedKey, curKeyBufferPos-1);
			PlayKeyAnimEnd(savedKey);
			toggleHasPlayedKey(0);
			toggleHasFinishedPlayingKey(1);
		}
		else if (hasFinshedPlayingKey)
		{
			HandleKeyPress(, True);
			toggleHasFinishedPlayingKey(0);
		}
	}

	function bool PutDown()
	{
		bChangeWeapon = False;
		if (isKeyMode && Pawn(Owner) != None && Pawn(Owner).pendingWeapon != None)
		{
			WeaponChange(Pawn(Owner).pendingWeapon.InventoryGroup);
			Pawn(Owner).pendingWeapon = None;
		}
		return True;
	}
	
	function Weapon WeaponChange(byte F)
	{   
		if (Pawn(Owner) != None && Pawn(Owner).Weapon == Self)
		{
			if (isKeyMode)
			{
				if (F == 10) F = 0;
				if (F < 10)
					HandleKeyPress(F);
			}
		}
		return None;
	}
	
	function Tick(float Delta)
	{
		if (PlayerPawn(Owner) != None && PlayerPawn(Owner).IsInState('FeigningDeath'))
			GotoState('Idle');
		else
			keyCallbackUpdate(Delta);
			
		if (Level.NetMode == NM_StandAlone)
			KeyClientTick(Delta);
	}
	
	function EndState()
	{
		toggleHasPlayedKey(0);
		toggleHasFinishedPlayingKey(0);
		keyCallbackTimeout = 0;
		curKeyState = 0;
		resetBufferLoad();
		isPlayingKeys = False;
		PlayServerKeyMode(True);
		KeyModeToggled(False);
	}
	
Begin:
	PlayServerKeyMode();
	FinishAnim();
	Enable('AnimEnd');
	isKeyMode = True;
	KeyModeToggled(True);
}

state ClientKeyPressMode
{
ignores ClientPutDown, TweenToStill, PlaySelect, PlayPostSelect, TweenDown, PlayIdleAnim;

	simulated function bool ClientFire(float Value)
	{
		if (!bFireAsKeyEnder)
			return False;
		if (curKeyState == 0 && curKeyBufferPos == 0)
		{
			PlayClientKeyMode(True);
			keepClientKeyMode = False;
			KeyModeToggled(False);
			GotoState('');
		}
		return False;
	}
	
	simulated function bool ClientAltFire(float Value)
	{
		if (!bAltFireAsKeyEnder)
			return False;
		if (curKeyState == 0 && curKeyBufferPos == 0)
		{
			PlayClientKeyMode(True);
			keepClientKeyMode = False;
			KeyModeToggled(False);
			GotoState('');
		}
		return False;
	}
	
	simulated function AnimEnd()
	{
		if (hasPlayedKey)
		{
			WeaponKeyPressed(savedKey, curKeyBufferPos-1);
			PlayKeyAnimEnd(savedKey);
			toggleClientHasPlayedKey(0);
			toggleClientHasFinishedPlayingKey(1);
		}
		else if (hasFinshedPlayingKey)
		{
			HandleKeyPress(, True);
			toggleClientHasFinishedPlayingKey(0);
		}
	}
	
	simulated function Tick(float Delta)
	{
		if (keepClientKeyMode && PlayerPawn(Owner) != None && PlayerPawn(Owner).IsInState('FeigningDeath'))
		{
			keepClientKeyMode = False;
			toggleClientHasPlayedKey(0);
			toggleClientHasFinishedPlayingKey(0);
			keyCallbackTimeout = 0;
			curKeyState = 0;
			resetBufferLoad();
			isPlayingKeys = False;
			KeyModeToggled(False);
			GotoState('');
		}
		else
			keyCallbackUpdate(Delta);

		KeyClientTick(Delta);
	}
	
	simulated function BeginState()
	{
		if (!keepClientKeyMode)
		{
			PlayClientKeyMode();
			KeyModeToggled(True);
		}
		keepClientKeyMode = True;
	}
}


defaultproperties
{	
	displayKeysHelp=True
	defaultKeysHelpColor=(R=128,G=128,B=128)
	defaultKeysHelpText="Use 0-9 keys (NOT NumPad) to push the buttons.%n%Fire: Leave key editing mode once the keys are set."
}
