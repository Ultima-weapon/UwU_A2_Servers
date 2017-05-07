// Set Up your locations here--------------------------------------------------------------------------------------
diag_log text format["Nuke Settings: initiated..."];
/* I used triggers in the 3d map editor to set my locations and copied the coordinates here.
PLEASE NOTE
> > Default locations are for Namalsk/Panthera */
_rndSel = floor(random 1); //Set total number of cases here ( 5 Locations = number 5 here )
_rndPosX = floor(random 20400);
_rndPosY = floor(random 20400);
_nukPos = "Target Grid: "+str _rndPosX+","+str _rndPosY;
TTDropPos =
switch (_rndSel) do
{
    //Locations here X,Y,Z and add a name of the location for the messages
	case 0: {[_rndPosX, _rndPosY, 0, "'"+str _nukPos+"'"]};
    //case 0: {[5948.4561, 929.68018, 0, "Zappado"]};
    //case 1: {[3992.4138, 8523.249, 0, "Object A1"]};
    //case 2: {[3992.4138, 8523.249, 0, "Object A1"]};
};
////////////////////////////////////////////////////////////////////////////////////////////////////
// Set up your laptop random position here----------------------------------------------------------------
TTLaptopOn = true; //Leave true for now
TTLapPos = [4270.52, 16205.4, 0]; //(x,y,z)
TTLapDir = 0.00137508; // set the direction the laptop is facing here
TTLapTyp = "Laptop_EP1"; // You can edit it to be anything you like
////////////////////////////////////////////////////////////////////////////////////////////////////
//Set the skins that will block blood loss in the radiation zone----------------------------------
TTAntiR = ["BanditW1_DZ","BanditW2_DZ","Bandit2_DZ","GUE_Soldier_MG_DZ","INS_Lopotev_DZ","Navy_SEAL_TL","RU_Functionary2","UKSF_wdl_op","Desert_SOF_Marksman"];
////////////////////////////////////////////////////////////////////////////////////////////////////
// Set vechile damage & radius of the area vechiles will be destroyed------------------------------
/*PLEASE NOTE
> > Vechiles may get damages if parked on or around buildings that get destroyed */
TTVehDam = true;
TTVehDis = 250;
////////////////////////////////////////////////////////////////////////////////////////////////////
// Set building damage & radius of the area buildings will be destroyed > 400 = 400m ---------------
/* 
PLEASE NOTE
> > Epoch buildables in this zone can be destroyed (NOT TESTED WITH INDESTRUCTIBLE BUILDABLES) */

//REMOVED DUE TO LAG

////////////////////////////////////////////////////////////////////////////////////////////////////
// Set blood loss per second in the radiation zone here for normal skins----------------------------
TTBlood = 20;
////////////////////////////////////////////////////////////////////////////////////////////////////
// Set the radius of the radiation zone size here > 1500 = 1500m------------------------------------
TTRadZ = 500;
////////////////////////////////////////////////////////////////////////////////////////////////////
// Set player death & the radius of the area people will die when the nuke goes off > 400 = 400m----
TTPlyDeath = true;
TTDeaZ = 400;
////////////////////////////////////////////////////////////////////////////////////////////////////
// Option to delete the radiation zone after a set amount of time-----------------------------------
TTNukeRem = true;
TTTimeRem = 1250; //how long after the nuke the radiaition zone gets deleted (in secounds)
////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable a marker to show the radiation zone on map for all players-------------------------------
TTShowMrk = true;
TTTxtMrk = "WARNING: Radiation Zone!!"; // set text that shows on the marker here
////////////////////////////////////////////////////////////////////////////////////////////////////
diag_log text format["Nuke Settings: loaded..."];