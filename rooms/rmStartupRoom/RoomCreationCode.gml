global.freeze =false;
global.paused =false;
global.room_debug=0;


var i=0;
while(room_exists(i)){
    var roomName = room_get_name(i)
    if(roomName == "rmStart"){
        room_goto(i);
        break;
    }else{
        i++;
    }
}