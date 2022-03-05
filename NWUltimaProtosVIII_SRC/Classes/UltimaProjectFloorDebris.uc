//////////////////////////////////////////////////////////////
//				Feralidragon (15-10-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProjectFloorDebris expands NaliWEffects;

var() mesh FloorDebris[7];
var() name FloorAnim[8];
var() float FloorBreakTime;
var() float LifeSpanVar;

simulated function PostBeginPlay()
{
	Mesh = FloorDebris[Rand(ArrayCount(FloorDebris))];
	PlayAnim(FloorAnim[Rand(ArrayCount(FloorAnim))], 1/FloorBreakTime, 0.0);
	LifeSpan += (FRand()*LifeSpanVar);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NukeMassDebrisE01
	LifeSpan=9.000000
	DrawScale=1.000000
	
	FloorDebris(0)=NukeMassDebrisE01
	FloorDebris(1)=NukeMassDebrisE02
	FloorDebris(2)=NukeMassDebrisE03
	FloorDebris(3)=NukeMassDebrisE04
	FloorDebris(4)=NukeMassDebrisE05
	FloorDebris(5)=NukeMassDebrisE06
	FloorDebris(6)=NukeMassDebrisE07
	
	FloorAnim(0)=Rise01A
	FloorAnim(1)=Rise01B
	FloorAnim(2)=Rise02A
	FloorAnim(3)=Rise02B
	FloorAnim(4)=Rise03A
	FloorAnim(5)=Rise03B
	FloorAnim(6)=Rise04A
	FloorAnim(7)=Rise04B
	
	FloorBreakTime=0.150000
	LifeSpanVar=6.000000
}
