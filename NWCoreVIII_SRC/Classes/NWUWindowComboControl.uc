//////////////////////////////////////////////////////////////
//				Feralidragon (23-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWUWindowComboControl expands UWindowComboControl;

var UWindowWindow PageNotifier;

function Created()
{
	Super(UWindowDialogControl).Created();

	EditBox = NWUWindowEditBox(CreateWindow(class'NWUWindowEditBox', 0, 0, WinWidth-12, WinHeight)); 
	EditBox.NotifyOwner = Self;
	EditBoxWidth = WinWidth / 2;
	EditBox.bTransient = True;
	NWUWindowEditBox(EditBox).PageNotifier = Self;

	Button = NWUWindowComboButton(CreateWindow(class'NWUWindowComboButton', WinWidth-12, 0, 12, 10)); 
	Button.Owner = Self;
	NWUWindowComboButton(Button).PageNotifier = Self;

	List = NWUWindowComboList(Root.CreateWindow(class'NWUWindowComboList', 0, 0, 100, 100)); 
	List.LookAndFeel = LookAndFeel;
	List.Owner = Self;
	List.Setup();
	List.HideWindow();
	NWUWindowComboList(List).PageNotifier = Self;
	bListVisible = False;

	SetEditTextColor(LookAndFeel.EditBoxTextColor);
}

function SetButtons(bool bInButtons)
{
	bButtons = bInButtons;
	if(bInButtons)
	{
		LeftButton = NWUWindowComboLeftButton(CreateWindow(class'NWUWindowComboLeftButton', WinWidth-12, 0, 12, 10));
		NWUWindowComboLeftButton(LeftButton).PageNotifier = Self;
		RightButton = NWUWindowComboRightButton(CreateWindow(class'NWUWindowComboRightButton', WinWidth-12, 0, 12, 10));
		NWUWindowComboRightButton(RightButton).PageNotifier = Self;
	}
	else
	{
		LeftButton = None;
		RightButton = None;
	}
}

function MouseMove(float X, float Y)
{
	Super.MouseMove(X, Y);
	if (PageNotifier != None)
		PageNotifier.MouseMove(WinLeft + X, WinTop + Y);
}

defaultproperties
{
}
