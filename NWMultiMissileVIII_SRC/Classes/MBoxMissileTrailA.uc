//////////////////////////////////////////////////////////////
//				Feralidragon (03-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MBoxMissileTrailA expands MissileTrailA;


var MBoxMissileCorLine mbCLine;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		mbCLine = Spawn(Class'MBoxMissileCorLine', Owner);
	Super.PostBeginPlay();
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	if (Level.NetMode != NM_DedicatedServer)
	{
		ScaleGlow = FRand()*default.ScaleGlow/2.f + default.ScaleGlow/2.f;
		if (mbCLine != None)
			mbCLine.PrePivot = PrePivot;
	}
}

simulated function Destroyed()
{
	if (mbCLine != None)
		mbCLine.Destroy();
	mbCLine = None;
	
	Super.Destroyed();
}

defaultproperties
{
	DrawScale=1.000000
	ScaleGlow=1.450000
	SpriteProjForward=24.000000
	PrePivotRel=(X=-48.000000)
}
