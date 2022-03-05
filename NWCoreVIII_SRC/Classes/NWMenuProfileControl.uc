//////////////////////////////////////////////////////////////
//	Nali Weapons III Profile Dialog Control
//				Feralidragon (26-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWMenuProfileControl expands NWMenuControl;

var() localized string ProfileCaption, CustomNameCaption, SaveCaption;
var() float SaveBtnWidth;

var NWUWindowComboControl ProfilesList;
var NWUWindowEditControl ProfileNameControl;
var NWUWindowButton ProfileSaveBtn;
var class<NWProfile> ProfileClass;

function Created()
{
local byte i;
local float X, Y, W, H;

	Super.Created();

	//Init
	WinHeight = 60;
	X = 10;
	Y = 20;
	W = WinWidth - SaveBtnWidth - 20;
	H = 15;
	
	//List
	ProfilesList = NWUWindowComboControl(CreateWindow(Class'NWUWindowComboControl', X, Y, W, H));
	ProfilesList.SetText(ProfileCaption);
	ProfilesList.SetEditable(False);
	ProfilesList.EditBoxWidth = Int(W/3*2);
	ProfilesList.PageNotifier = Self;
	ProfilesList.NotifyWindow = ControlNotifier;
	
	//Profile name
	Y += 20;
	ProfileNameControl = NWUWindowEditControl(CreateWindow(Class'NWUWindowEditControl', X, Y, W, H));
	ProfileNameControl.SetText(CustomNameCaption);
	ProfileNameControl.EditBoxWidth = Int(W/3*2);
	ProfileNameControl.PageNotifier = Self;
	ProfileNameControl.NotifyWindow = ControlNotifier;
	
	//Profile save button
	ProfileSaveBtn = NWUWindowButton(CreateWindow(Class'NWUWindowButton', X + W + 10, Y, SaveBtnWidth, H));
	ProfileSaveBtn.SetText(SaveCaption);
	ProfileSaveBtn.PageNotifier = Self;
	ProfileSaveBtn.NotifyWindow = ControlNotifier;
}

function InitProfile()
{
local byte i;

	if (ProfileClass == None)
		return;
	
	for (i = 0; i < ArrayCount(ProfileClass.default.ProfileNames); i++)
		AddProfile(ProfileClass.default.ProfileNames[i], i);
	SetProfile(ProfileClass.default.SelectedProfile);
	
	//Init profile info
	if (ProfileClass != None)
		ProfileClass.static.InitProfileInfo(GetPlayerOwner());
}

function AddProfile(string NewProfileName, byte i)
{
	if (ProfilesList != None)
		ProfilesList.AddItem(" "$NewProfileName, String(i));
}

function SetProfile(byte i)
{
	bIgnoreNotfications = True;
	if (ProfilesList != None)
	{
		ProfilesList.SetSelectedIndex(i);
		UpdateProfileName();
	}
	bIgnoreNotfications = False;
}

function UpdateProfileName()
{
	if (ProfilesList != None && ProfileNameControl != None)
		ProfileNameControl.SetValue(Mid(ProfilesList.GetValue(),1));
}

function NotifyControl(UWindowDialogControl C, byte E)
{
local byte n;
local UWindowList CItem;
local string newProfileName;

	if (!bIgnoreNotfications && E == DE_Change)
	{
		if (C == ProfilesList)
		{
			UpdateProfileName();
			if (ProfileClass != None)
			{
				n = Byte(ProfilesList.GetValue2());
				if (n < ArrayCount(ProfileClass.default.ProfileNames))
				{
					ProfileClass.static.ProcessFullProfileChange(n);
					ProfileClass.default.SelectedProfile = n;
					ProfileClass.static.StaticSaveConfig();
				}
			}
		}
	}
	else if (E == DE_Click && C == ProfileSaveBtn && ProfilesList != None && ProfilesList.List != None && 
	ProfilesList.List.Items != None && ProfilesList.List.Items.Next != None && ProfileNameControl.GetValue() != "")
	{
		bIgnoreNotfications = True;
		n = Byte(ProfilesList.GetValue2());
		newProfileName = ProfileNameControl.GetValue();
		if (ProfileClass != None && n < ArrayCount(ProfileClass.default.ProfileNames))
		{
			ProfileClass.default.ProfileNames[n] = newProfileName;
			ProfileClass.static.StaticSaveConfig();
			for (CItem = ProfilesList.List.Items.Next; CItem != None; CItem = CItem.Next)
			{
				if (UWindowComboListItem(CItem) != None && UWindowComboListItem(CItem).Value2 == String(n))
				{
					UWindowComboListItem(CItem).Value = " "$newProfileName;
					break;
				}
			}
			ProfilesList.SetSelectedIndex(n);
			ProfileClass.static.ProcessFullProfileSave(n);
		}
		bIgnoreNotfications = False;
	}
	else if (E != DE_Change)
		Notify(E);
}

defaultproperties
{
	ProfileCaption="Profile"
	CustomNameCaption="Name"
	SaveCaption="Save"
	SaveBtnWidth=50.000000
}
