//////////////////////////////////////////////////////////////
//				Feralidragon (03-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMissileMBoxMissPH expands NaliWActor;

#exec MESH IMPORT MESH=MultiMissileMBoxMissPH ANIVFILE=MODELS\MultiMissileMBoxMissPH_a.3d DATAFILE=MODELS\MultiMissileMBoxMissPH_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MultiMissileMBoxMissPH STRENGTH=0.0
#exec MESH ORIGIN MESH=MultiMissileMBoxMissPH X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=MultiMissileMBoxMissPH SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=MultiMissileMBoxMissPH SEQ=Unload STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=MultiMissileMBoxMissPH SEQ=Reload STARTFRAME=1 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=MultiMissileMBoxMissPH MESH=MultiMissileMBoxMissPH
#exec MESHMAP SCALE MESHMAP=MultiMissileMBoxMissPH X=0.15 Y=0.15 Z=0.3

#exec TEXTURE IMPORT NAME=Sk_MultiMBoxMissile FILE=SKINS\Sk_MultiMBoxMissile.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissileMBoxMissPH NUM=1 TEXTURE=Sk_MultiMBoxMissile


simulated function setStatus(bool bLoad, optional float loadTime)
{
	loadTime = FMax(loadTime, 0.05);
	if (bLoad)
		PlayAnim('Reload', 1/loadTime, 0.0);
	else
		PlayAnim('Unload', 1/loadTime, 0.0);
}

simulated function AnimEnd()
{
	if (AnimSequence == 'Reload')
		ScaleGlow = default.ScaleGlow;
	else
		ScaleGlow = 0.0;
}

simulated function Tick(float Delta)
{
	if (IsAnimating())
	{
		if (AnimSequence == 'Reload')
			ScaleGlow = 2.f * AnimFrame * default.ScaleGlow;
		else
			ScaleGlow = 2.f * (0.5 - AnimFrame) * default.ScaleGlow;
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=MultiMissileMBoxMissPH
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	Physics=PHYS_None
	LifeSpan=0.000000
	bAlwaysRelevant=True
	bGameRelevant=True
}
