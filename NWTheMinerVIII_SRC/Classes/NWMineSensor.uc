//////////////////////////////////////////////////////////////
//				Feralidragon (24-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class NWMineSensor expands Triggers;

var NWMine myMine;
var bool bAISensor;
var bool bReady;
var Bot AngryBotList[4];

struct ActorsMineInfo
{
	var Actor ActorToKill;
	var bool hasTouched;
};
var ActorsMineInfo ActorsToKill[8];


function PostBeginPlay(){	SetTimer(0.1, False);}

function SetMineProperties( float newR, float newH, NWMine newMine, optional bool isAI)
{
	myMine = newMine;
	bAISensor = isAI;
	SetCollisionSize(newR, newH);
}

function Touch(Actor Other)
{
local bool touchedKillActor;

	if (bReady)
	{
		if (myMine != None)
		{
			if (!bAISensor)
			{
				if (FastTrace(Other.Location, myMine.Location))
				{
					touchedKillActor = True;
					myMine.SensorTouch(Other);
				}
				
				if (myMine.killThisActor(Other))
				{
					addToKillList(Other, touchedKillActor);
					SetTimer(0.1, False);
				}
			}
			else if (Class'NWUtils'.static.isValidBot(Pawn(Other)))
				tellBotToShootMe(Pawn(Other));
		}
		else
			Destroy();
	}
}

function addToKillList(Actor O, optional bool hTouched)
{
local byte i;

	if (existsInKillList(O))
		return;

	for (i = 0; i < ArrayCount(ActorsToKill); i++)
	{
		if (ActorsToKill[i].ActorToKill == None)
		{
			ActorsToKill[i].ActorToKill = O;
			ActorsToKill[i].hasTouched = hTouched;
			return;
		}
	}
}

function removeFromKillList(optional byte j, optional Actor O)
{
local byte i;

	if (O != None && !existsInKillList(O))
		return;

	if (O != None)
	{
		do
		{
			j = i;
			i++;
		}
		until (ActorsToKill[i].ActorToKill != O && i < ArrayCount(ActorsToKill))
	}
	else if (j >= ArrayCount(ActorsToKill))
		return;
	
	if (j == ArrayCount(ActorsToKill) - 1)
	{
		ActorsToKill[j].ActorToKill = None;
		return;
	}
	
	for (i = j; i < ArrayCount(ActorsToKill) - 1; i++)
	{
		ActorsToKill[i].ActorToKill = ActorsToKill[i+1].ActorToKill;
		ActorsToKill[i].hasTouched = ActorsToKill[i+1].hasTouched;
	}
}

function bool existsInKillList(Actor O)
{
local byte i;

	if (O == None)
		return False;
		
	for (i = 0; i < ArrayCount(ActorsToKill); i++)
	{
		if (ActorsToKill[i].ActorToKill == O)
			return True;
	}
	return False;
}

function tellBotToShootMe(Pawn P)
{
local Bot B;

	if (!Class'NWUtils'.static.isElegibleBotAI(P, True, FRand()*10.0 - 0.75) || !myMine.killThisActor(P))
		return;
	
	if (!Class'NWUtils'.static.isElegibleBotAI(P, False, FRand()*10.0 - 0.5))
		P.FearThisSpot(self);
	
	B = Bot(P);
	if (B != None && (B.Enemy == None || !B.LineOfSightTo(B.Enemy)) && (B.Target == None || NWMine(B.Target) == None || B.Target.bDeleteMe) 
	&& B.Weapon != None && !B.Weapon.bMeleeWeapon && B.LineOfSightTo(myMine))
	{
		B.ShootTarget(myMine);
		AddBotToList(B);
	}
}

function AddBotToList(Bot B)
{
local byte i;

	i = 0;
	while (i < ArrayCount(AngryBotList))
	{
		if (AngryBotList[i] == None)
		{
			AngryBotList[i] = B;
			SetTimer(0.1, False);
			i = ArrayCount(AngryBotList);
		}
		i++;
	}
}

function Timer()
{
local byte i;
local bool hasBot, isVisible;
local Bot B;

	if (!bReady)
	{
		bReady = True;
		return;
	}
	
	if (myMine == None)
		return;
		
	if (!bAISensor)
	{	
		for (i = 0; i < ArrayCount(ActorsToKill); i++)
		{
			if (ActorsToKill[i].ActorToKill == None)
				return;
			
			if (isTouching(ActorsToKill[i].ActorToKill))
			{
				isVisible = FastTrace(ActorsToKill[i].ActorToKill.Location, myMine.Location);
				if (!ActorsToKill[i].hasTouched && isVisible)
				{
					ActorsToKill[i].hasTouched = True;
					myMine.SensorTouch(ActorsToKill[i].ActorToKill);
				}
				else if (ActorsToKill[i].hasTouched && !isVisible)
				{
					ActorsToKill[i].hasTouched = False;
					myMine.SensorUnTouch(ActorsToKill[i].ActorToKill);
				}
				else
					SetTimer(0.1, False);
			}
			else
			{
				if (ActorsToKill[i].hasTouched)
					myMine.SensorUnTouch(ActorsToKill[i].ActorToKill);
				removeFromKillList(i);
			}
		}
	}
	else
	{
		for (i = 0; i < ArrayCount(AngryBotList); i++)
		{
			B = AngryBotList[i];
			if (B != None)
			{
				if (B.Enemy == None && B.Weapon != None && !B.Weapon.bMeleeWeapon && B.LineOfSightTo(myMine))
				{
					B.ShootTarget(myMine);
					hasBot = True;
				}
				else
				{
					if (B.IsInState('Roaming') && B.bCamping)
					{
						B.SetPeripheralVision();
						B.TweenToRunning(0.1);
						B.bCamping = false;
						B.GotoState('Roaming', 'SpecialNavig');
					}
					
					AngryBotList[i] = None;
				}
			}
		}
		
		if (hasBot)
			SetTimer(0.1, False);
	}
}

function bool isTouching(actor A)
{
	return (Abs(Location.Z - A.Location.Z) <= (CollisionHeight + A.CollisionHeight) &&
		VSize((Location - A.Location)*vect(1,1,0)) <= (CollisionRadius + A.CollisionRadius));
}

defaultproperties
{
	RemoteRole=ROLE_None
}
