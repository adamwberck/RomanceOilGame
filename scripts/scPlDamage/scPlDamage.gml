//scEnDamage(damage)
var damage = argument0;
if(!hurt){
    action=RUN;
    rotate=0;
    oPlayerStats.hp-= damage;
    state = scHurt;
    alarm[2] = 80;
    hurt = true;

    if(!global.freeze){
        global.freeze=true;
        
        if(oPlayerStats.hp<=0){
            oGame.alarm[1] = abs((room_height-y+30));
            instance_create(x,y,oPlayerCorpse);
            visible=false;
        }else{
            oGame.alarm[1] = 30;
        }
    }
    
}

///Player Size
scPlayerSize();
