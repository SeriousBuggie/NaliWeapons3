//////////////////////////////////////////////////////////////
//				Feralidragon (08-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyMasterShell expands NaliWActor;

#exec MESH IMPORT MESH=CyMasterShell ANIVFILE=MODELS\CyMasterShell_a.3d DATAFILE=MODELS\CyMasterShell_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CyMasterShell STRENGTH=0
#exec MESH ORIGIN MESH=CyMasterShell X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=CyMasterShell SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CyMasterShell SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CyMasterShell MESH=CyMasterShell
#exec MESHMAP SCALE MESHMAP=CyMasterShell X=0.2 Y=0.2 Z=0.4

#exec TEXTURE IMPORT NAME=CyMasterShell_Sk FILE=SKINS\CyMasterShell_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CyMasterShell NUM=1 TEXTURE=CyMasterShell_Sk


var() float shellMinDist, shellMaxDist, shellMinHeight, shellMaxHeight;
var() int shellMinPitch, shellMaxPitch, shellMinYawRate, shellMaxYawRate;
var bool bOpenShell, bOpenedShell, bOpeningShell, isReversed;
var float shellOpenTime, shellOpenCount, StartYawOffset, StartYaw;

var float desiredPitch, yawRate, curPitch, curYaw;
var vector desiredRelOffset;


replication
{
	reliable if (Role == ROLE_Authority)
		StartYawOffset, StartYaw, shellOpenTime, bOpenShell, isReversed;
}

function OpenShell(float oTime)
{
	shellOpenTime = oTime;
	bOpenShell = True;
}

function Init(float stYawOffset, float stYaw, bool isRev)
{
	StartYawOffset = stYawOffset;
	isReversed = isRev;
	StartYaw = stYaw;
}

simulated function Tick(float Delta)
{
local rotator R, owR;
local float f;

	if (Level.NetMode != NM_DedicatedServer && Owner != None)
	{
		owR.Yaw = StartYaw;
		if (!bOpenShell || !bOpeningShell)
		{
			SetLocation(Owner.Location + Owner.PrePivot);
			R.Yaw = int(StartYawOffset);
			if (isReversed)
				R.Roll = 32768;
			
			if (bOpenShell && !bOpeningShell)
			{
				bOpeningShell = True;
				desiredPitch = RandRange(shellMinPitch, shellMaxPitch);
				if (isReversed)
					desiredPitch = -desiredPitch;
				R.Yaw = int(StartYawOffset);
				curYaw = StartYawOffset;
				desiredRelOffset.X = RandRange(shellMinDist, shellMaxDist);
				desiredRelOffset.Z = RandRange(shellMinHeight, shellMaxHeight);
				if (isReversed)
					desiredRelOffset.Z *= -1.f;
			}
		}
		else 
		{
			if (!bOpenedShell)
			{
				shellOpenCount += Delta;
				if (shellOpenCount >= shellOpenTime)
				{
					shellOpenCount = shellOpenTime;
					bOpenedShell = True;
				}
				else if (yawRate == 0.0 && shellOpenCount >= (shellOpenTime/5.f))
				{
					yawRate = RandRange(shellMinYawRate, shellMaxYawRate);
					if (FRand() > 0.5)
						yawRate *= -1.f;
				}
			}
			
			f = (shellOpenCount / shellOpenTime);
			curYaw += (f * yawRate * Delta);
			while (curYaw >= 65536.f)
				curYaw -= 65536.f;
			
			R.Yaw = int(curYaw);
			R.Pitch = int(f * desiredPitch);
			if (isReversed)
				R.Roll = 32768;
			
			SetLocation(Owner.Location + Owner.PrePivot + f*(desiredRelOffset >> Class'NWUtils'.static.rTurn(owR, R)));
		}
		SetRotation(Class'NWUtils'.static.rTurn(owR, R));
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=CyMasterShell
	bAlwaysRelevant=True
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	
	shellMinDist=40.000000
	shellMaxDist=300.000000
	shellMinHeight=20.000000
	shellMaxHeight=175.000000
	shellMinPitch=1000
	shellMaxPitch=3000
	shellMinYawRate=4000
	shellMaxYawRate=35000
}
