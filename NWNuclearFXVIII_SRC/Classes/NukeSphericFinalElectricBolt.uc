//////////////////////////////////////////////////////////////
//				Feralidragon (28-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeSphericFinalElectricBolt expands NukeSphericElectricBolt;

#exec AUDIO IMPORT NAME="FastEndElectric01" FILE=SOUNDS\FastEndElectric01.wav GROUP="Electric"
#exec AUDIO IMPORT NAME="FastEndElectric02" FILE=SOUNDS\FastEndElectric02.wav GROUP="Electric"
#exec AUDIO IMPORT NAME="FastEndElectric03" FILE=SOUNDS\FastEndElectric03.wav GROUP="Electric"
#exec AUDIO IMPORT NAME="FastEndElectric04" FILE=SOUNDS\FastEndElectric04.wav GROUP="Electric"
#exec AUDIO IMPORT NAME="FastEndElectric05" FILE=SOUNDS\FastEndElectric05.wav GROUP="Electric"
#exec AUDIO IMPORT NAME="FastEndElectric06" FILE=SOUNDS\FastEndElectric06.wav GROUP="Electric"

var() sound ElectricSnds[6];

simulated function SpawnMyCor()
{
	PlayMySound();
}

simulated function PlayMySound()
{
	PlaySound(ElectricSnds[Rand(ArrayCount(ElectricSnds))],, 5.0,, 2500.0);
}

defaultproperties
{
	LifeSpan=0.300000
	ScaleGlow=4.000000
	fadeInTime=0.050000
	ElecRate=5.000000
	
	FXElectric(0)=NukeElectricFX02
	FXElectric(1)=NukeElectricFX03
	FXElectric(2)=NukeElectricFX02
	FXElectric(3)=NukeElectricFX03
	
	ElectricSnds(0)=FastEndElectric01
	ElectricSnds(1)=FastEndElectric02
	ElectricSnds(2)=FastEndElectric03
	ElectricSnds(3)=FastEndElectric04
	ElectricSnds(4)=FastEndElectric05
	ElectricSnds(5)=FastEndElectric06
}
