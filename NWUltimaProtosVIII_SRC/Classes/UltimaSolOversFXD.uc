//////////////////////////////////////////////////////////////
//				Feralidragon (02-02-2014)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolOversFXD expands UltimaSolOversFXA;

#exec MESH IMPORT MESH=UltimaSolOversFXD ANIVFILE=MODELS\UltimaSolOversFXA_a.3d DATAFILE=MODELS\UltimaSolOversFXA_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=UltimaSolOversFXD STRENGTH=0
#exec MESH ORIGIN MESH=UltimaSolOversFXD X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=UltimaSolOversFXD SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=UltimaSolOversFXD SEQ=Fluid STARTFRAME=0 NUMFRAMES=20 RATE=19.0

#exec MESHMAP NEW MESHMAP=UltimaSolOversFXD MESH=UltimaSolOversFXD
#exec MESHMAP SCALE MESHMAP=UltimaSolOversFXD X=0.01 Y=0.01 Z=0.02

var() float ElecOdds, ElecStayTime;
var() texture ElecTex[16];
var byte lastElecM;
var float elecCount;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (elecCount > 0.0)
			elecCount -= Delta;
		else
		{
			MultiSkins[lastElecM] = None;
			if (FRand() <= ElecOdds)
			{
				lastElecM = Rand(ArrayCount(MultiSkins));
				MultiSkins[lastElecM] = ElecTex[Rand(ArrayCount(ElecTex))];
				elecCount = ElecStayTime;
			}
		}
	}
	Super.Tick(Delta);
}

defaultproperties
{
	Mesh=UltimaSolOversFXD
	Style=STY_Translucent
	DrawScale=0.035000
	ScaleGlow=1.500000
	bParticles=True
	bRandomFrame=True
	Texture=ElectricSpark01
	MultiSkins(1)=None
	SpriteProjForward=0.000000
	
	renderOnTop=False
	
	ElecOdds=0.075000
	ElecStayTime=0.050000
	ElecTex(0)=ElectricSpark01
	ElecTex(1)=ElectricSpark02
	ElecTex(2)=ElectricSpark03
	ElecTex(3)=ElectricSpark04
	ElecTex(4)=ElectricSpark05
	ElecTex(5)=ElectricSpark06
	ElecTex(6)=ElectricSpark07
	ElecTex(7)=ElectricSpark08
	ElecTex(8)=ElectricSpark09
	ElecTex(9)=ElectricSpark10
	ElecTex(10)=ElectricSpark11
	ElecTex(11)=ElectricSpark12
	ElecTex(12)=ElectricSpark13
	ElecTex(13)=ElectricSpark14
	ElecTex(14)=ElectricSpark15
	ElecTex(15)=ElectricSpark16
}
