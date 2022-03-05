//////////////////////////////////////////////////////////////
//				Feralidragon (09-08-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WRESoldOversFXA expands WRESoldOversFXB;

#exec MESH IMPORT MESH=WRESoldOversFXA ANIVFILE=MODELS\WRESoldOversFXA_a.3d DATAFILE=MODELS\WRESoldOversFXA_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WRESoldOversFXA STRENGTH=0
#exec MESH ORIGIN MESH=WRESoldOversFXA X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=WRESoldOversFXA SEQ=All STARTFRAME=0 NUMFRAMES=35
#exec MESH SEQUENCE MESH=WRESoldOversFXA SEQ=Open STARTFRAME=0 NUMFRAMES=35 RATE=34.0

#exec MESHMAP NEW MESHMAP=WRESoldOversFXA MESH=WRESoldOversFXA
#exec MESHMAP SCALE MESHMAP=WRESoldOversFXA X=0.1 Y=0.1 Z=0.2


var bool bAnimatedSold;
var() float AnimDelay, AnimEndMargin;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && !bAnimatedSold)
	{
		AnimDelay -= Delta;
		if (AnimDelay <= 0)
		{
			PlayAnim('Open', 1/(default.LifeSpan - default.AnimDelay - default.AnimEndMargin), 0.0);
			bAnimatedSold = True;
		}
	}
	Super.Tick(Delta);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=WRESoldOversFXA
	Texture=WREMetal
	Style=STY_Normal
	ScaleGlow=2.000000
	
	AnimDelay=0.500000
	AnimEndMargin=4.000000
}
