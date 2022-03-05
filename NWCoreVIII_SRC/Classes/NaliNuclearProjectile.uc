//////////////////////////////////////////////////////////////
//	Nali Weapons III Nuclear Projectile base class
//				Feralidragon (24-06-2011)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NaliNuclearProjectile expands NaliProjectile
abstract;

var() byte NuclearLevel;
var() float CriticalImpactDist, DeathImpactDist, DangerousImpactDist;
var() color defaultInfoColor, warningInfoColor;
var() string defaultInfoText;
var() bool denyNuclearWarning;

var vector ImpactLocation;

replication
{
	reliable if (Role == ROLE_Authority)
		ImpactLocation;
}

function InitNukeWarn()
{
	ImpactLocation = Location;
}

function int getImpactArea(Actor A)
{
local float dist;

	if (A == None)
		return -1;
	
	dist = VSize(ImpactLocation - A.Location);
	if (dist <= CriticalImpactDist)
		return 0;
	else if (dist <= DeathImpactDist)
		return 1;
	else if (dist <= DangerousImpactDist)
		return 2;
	return 3;
}

simulated function string getNukeInfoText()
{
	return defaultInfoText;
}

simulated function color getNukeInfoColor()
{
	return defaultInfoColor;
}

defaultproperties
{
	NuclearLevel=0
	defaultInfoColor=(R=255,G=255,B=255)
	warningInfoColor=(R=255,G=0,B=0)
	defaultInfoText="--:--:--"
}