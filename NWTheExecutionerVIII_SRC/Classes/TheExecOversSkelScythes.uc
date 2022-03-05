//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2013)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecOversSkelScythes expands NaliWActor;

#exec MESH IMPORT MESH=TheExecOversSkelScythes ANIVFILE=MODELS\TheExecOversSkelScythes_a.3d DATAFILE=MODELS\TheExecOversSkelScythes_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=TheExecOversSkelScythes STRENGTH=0.1
#exec MESH ORIGIN MESH=TheExecOversSkelScythes X=0 Y=0 Z=0 YAW=64

#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=All STARTFRAME=0 NUMFRAMES=152
#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=Still STARTFRAME=51 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=StillAlt STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=Wake STARTFRAME=1 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=Scream STARTFRAME=21 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=CallScythes STARTFRAME=31 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=GetScythes STARTFRAME=41 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=PrepareAttackA STARTFRAME=51 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=DoAttackA STARTFRAME=61 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=StillAttackA STARTFRAME=71 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=PrepareAttackB STARTFRAME=81 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=DoAttackB STARTFRAME=91 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=StillAttackB STARTFRAME=101 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=PrepareAttackC STARTFRAME=111 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=DoAttackC STARTFRAME=121 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=StillAttackC STARTFRAME=131 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=TheExecOversSkelScythes SEQ=Relax STARTFRAME=141 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=TheExecOversSkelScythes MESH=TheExecOversSkelScythes
#exec MESHMAP SCALE MESHMAP=TheExecOversSkelScythes X=3.0 Y=3.0 Z=6.0

#exec TEXTURE IMPORT NAME=TheExecOversSkelScythes_Sk FILE=SKINS\TheExecOversSkelScythes_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=TheExecOversSkelScythes NUM=1 TEXTURE=TheExecOversSkelScythes_Sk


var float cTime;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && TheExecOversSkel(Owner) != None)
	{
		if (cTime < TheExecOversSkel(Owner).GetScythesTime)
		{
			cTime += Delta;
			PrePivot = default.PrePivot * ((TheExecOversSkel(Owner).GetScythesTime - cTime) / TheExecOversSkel(Owner).GetScythesTime);
		}
		else
			PrePivot = Owner.PrePivot;
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=TheExecOversSkelScythes
	
	bAnimByOwner=True
	Texture=TheExecutionerMetal
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	Physics=PHYS_None
	LifeSpan=0.000000
	bAlwaysRelevant=True
	bGameRelevant=True
	PrePivot=(Z=-1200.000000)
}
