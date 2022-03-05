//////////////////////////////////////////////////////////////
//				Feralidragon (23-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybotAITrigger expands Triggers;

enum EGuardianType
{
	GUARD_None,
	GUARD_Auto,
	GUARD_FreeRun,
	GUARD_ReturnToPoint
};

var() EGuardianType GuardianType;

enum ECybotAttitude
{
	ATT_None,
	ATT_Auto,
	ATT_IgnoreAll,
	ATT_AttackTeamEnemies,
	ATT_AttackTeamMates,
	ATT_AttackPlayers,
	ATT_AttackMonsters,
	ATT_AttackOuterTagPawns,
	ATT_AttackInnerTagPawns,
	ATT_AttackAll
};

var() ECybotAttitude CybotAttitude;

enum ECybotStatus
{
	CST_None,
	CST_Awake,
	CST_Asleep
};

var() ECybotStatus CybotStatus;
var() name FollowReferenceTag;

function Trigger(actor Other, pawn EventInstigator)
{
local Cybot C;
local Actor A, ActorRef;

	if (Event != '')
	{
		if (FollowReferenceTag != '')
		{
			ForEach AllActors(Class'Actor', A, FollowReferenceTag)
			{
				ActorRef = A;
				break;
			}
		}
		
		ForEach AllActors(Class'Cybot', C, Event)
		{
			if (GuardianType > GUARD_None)
				SetGuardianType(C, GuardianType);
			if (CybotAttitude > ATT_None)
				SetCybotAttitude(C, CybotAttitude);
			if (ActorRef != None)
				C.FollowActor = ActorRef;
			
			if (!C.bProcessingSleepAwakeSystem)
			{
				if (CybotStatus == CST_Awake && C.bSleeping)
				{
					C.bSleeping = False;
					C.bProcessingSleepAwakeSystem = True;
					C.GotoState('StartingUp');
				}
				else if (CybotStatus == CST_Asleep && !C.bSleeping)
				{
					C.bSleeping = True;
					C.bProcessingSleepAwakeSystem = True;
					C.GotoState('Sleeping');
				}
			}
			
			C.SetAdvancedTactics();
		}
	}
}

function SetGuardianType(Cybot C, EGuardianType GType)
{
	switch (GType)
	{
		case GUARD_Auto:				C.GuardianType = C.EGuardianType.GUARD_Auto; break;
		case GUARD_FreeRun:				C.GuardianType = C.EGuardianType.GUARD_FreeRun; break;
		case GUARD_ReturnToPoint:		C.GuardianType = C.EGuardianType.GUARD_ReturnToPoint; break;
	}
}

function SetCybotAttitude(Cybot C, ECybotAttitude CAttitude)
{
	switch (CAttitude)
	{
		case ATT_Auto:					C.CybotAttitude = C.ECybotAttitude.ATT_Auto; break;
		case ATT_IgnoreAll:				C.CybotAttitude = C.ECybotAttitude.ATT_IgnoreAll; break;
		case ATT_AttackTeamEnemies:		C.CybotAttitude = C.ECybotAttitude.ATT_AttackTeamEnemies; break;
		case ATT_AttackTeamMates:		C.CybotAttitude = C.ECybotAttitude.ATT_AttackTeamMates; break;
		case ATT_AttackPlayers:			C.CybotAttitude = C.ECybotAttitude.ATT_AttackPlayers; break;
		case ATT_AttackMonsters:		C.CybotAttitude = C.ECybotAttitude.ATT_AttackMonsters; break;
		case ATT_AttackOuterTagPawns:	C.CybotAttitude = C.ECybotAttitude.ATT_AttackOuterTagPawns; break;
		case ATT_AttackInnerTagPawns:	C.CybotAttitude = C.ECybotAttitude.ATT_AttackInnerTagPawns; break;
		case ATT_AttackAll:				C.CybotAttitude = C.ECybotAttitude.ATT_AttackAll; break;
	}
}

defaultproperties
{
}
