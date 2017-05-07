if (isNil "TayTayfirstNR") then
{
    cutText ["Setting Up Location 10% done.","PLAIN DOWN",1];
    sleep 1;
    cutText ["Setting Up Location 20% done.","PLAIN DOWN",1];
    sleep 1;
    cutText ["Setting Up Location 30% done.","PLAIN DOWN",1];
    sleep 1;
    cutText ["Setting Up Location 40% done.","PLAIN DOWN",1];
    sleep 1;
    cutText ["Setting Up Location 50% done.","PLAIN DOWN",1];
    sleep 1;
    cutText ["Setting Up Location 60% done.","PLAIN DOWN",1];
    sleep 1;
    cutText ["Setting Up Location 70% done.","PLAIN DOWN",1];
    sleep 1;
    cutText ["Setting Up Location 80% done.","PLAIN DOWN",1];
    sleep 1;
    cutText ["Setting Up Location 90% done.","PLAIN DOWN",1];
    sleep 1;
    cutText ["Setting Up Location 99.9% done.","PLAIN DOWN",4];
    sleep 4;
    cutText ["Launching nuke attack....","PLAIN DOWN"];
    sleep 3;
    deleteVehicle LAPTOP;
	player removeAction s_player_nuke;
	s_player_nuke = -1;
};