//////////////////////////////////////////////////////////////
//				Feralidragon (28-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeSphericElectricBoltCor expands NaliWEffects;

#exec MESH IMPORT MESH=NukeSphericElectricBoltCor ANIVFILE=MODELS\NukeSphericElectricBoltCor_a.3d DATAFILE=MODELS\NukeSphericElectricBoltCor_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=NukeSphericElectricBoltCor X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NukeSphericElectricBoltCor SEQ=All STARTFRAME=0 NUMFRAMES=6
#exec MESH SEQUENCE MESH=NukeSphericElectricBoltCor SEQ=ElectricPos01 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeSphericElectricBoltCor SEQ=ElectricPos02 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeSphericElectricBoltCor SEQ=ElectricPos03 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeSphericElectricBoltCor SEQ=ElectricPos04 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeSphericElectricBoltCor SEQ=ElectricPos05 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeSphericElectricBoltCor SEQ=ElectricPos06 STARTFRAME=5 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NukeSphericElectricBoltCor MESH=NukeSphericElectricBoltCor
#exec MESHMAP SCALE MESHMAP=NukeSphericElectricBoltCor X=4.0 Y=4.0 Z=8.0

var() float fadeInTime;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (Default.LifeSpan - LifeSpan <= fadeInTime)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / fadeInTime;
		else
			ScaleGlow = LifeSpan * Default.ScaleGlow / (Default.LifeSpan - fadeInTime);
		
		if (Owner != None)
			DrawScale = Owner.DrawScale / 4;
	}
}

simulated function SetInitScale(float scale)
{
	DrawScale = scale / 4;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=NukeSphericElectricBoltCor
	bUnlit=True
	bParticles=True
	bRandomFrame=True
	Texture=NuclearLightningCor
	MultiSkins(1)=NuclearLightningCor
	MultiSkins(2)=NuclearLightningCor
	bAnimByOwner=True
	Style=STY_Translucent
	LifeSpan=0.600000
	ScaleGlow=4.000000
	fadeInTime=0.100000
}
