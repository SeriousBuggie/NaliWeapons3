//////////////////////////////////////////////////////////////
//				Feralidragon (26-05-2013)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTCFXCMaster expands RTCFXC;

var bool spawnedRTFX, isTick;
var RTCFXC RTFX[7];

simulated function Tick(float Delta)
{
local int i;
	
	if (!spawnedRTFX && Level.NetMode != NM_DedicatedServer && Owner != None)
	{
		for (i = 0; i < ArrayCount(RTFX); i++)
		{
			RTFX[i] = Spawn(Class'RTCFXC', Owner);
			RTFX[i].InitCFX(i);
		}
		spawnedRTFX = True;
	}
	
	isTick = True;
	Super.Tick(Delta);
	isTick = False;
}

simulated function renderOnCanvas(canvas Canvas)
{
local int i;

	Super.renderOnCanvas(Canvas);
	for (i = 0; i < ArrayCount(RTFX); i++)
	{
		if (RTFX[i] != None && !RTFX[i].bDeleteMe)
			RTFX[i].renderOnCanvas(Canvas);
	}
}

simulated function UpdateCoords(vector newLoc, rotator newRot)
{
local int i;

	Super.UpdateCoords(newLoc, newRot);
	if (isTick || (!updateCoordsOnServer && Level.NetMode == NM_DedicatedServer))
		return;
	
	for (i = 0; i < ArrayCount(RTFX); i++)
	{
		if (RTFX[i] != None && !RTFX[i].bDeleteMe)
			RTFX[i].UpdateCoords(newLoc, RTFX[i].Rotation);
	}
}

simulated function Destroyed()
{
local int i;

	for (i = 0; i < ArrayCount(RTFX); i++)
	{
		if (RTFX[i] != None)
			RTFX[i].Destroy();
		RTFX[i] = None;
	}
	
	Super.Destroyed();
}


defaultproperties
{
}
