//////////////////////////////////////////////////////////////
//				Feralidragon (17-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWUDamOV expands NaliTrail;

#exec MESH IMPORT MESH=NWUDamOV ANIVFILE=MODELS\NWUDamOV_a.3d DATAFILE=MODELS\NWUDamOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWUDamOV STRENGTH=0.15
#exec MESH ORIGIN MESH=NWUDamOV X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NWUDamOV SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWUDamOV SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWUDamOV MESH=NWUDamOV
#exec MESHMAP SCALE MESHMAP=NWUDamOV X=0.07 Y=0.07 Z=0.14

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && Owner != None)
	{
		bHidden = Owner.bHidden;
		if (!bHidden)
			Super.Tick(Delta);
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWUDamOV
	Style=STY_Translucent
	bUnlit=True
	ScaleGlow=3.000000
	MultiSkins(1)=Texture'PurpleN_Over'
}
