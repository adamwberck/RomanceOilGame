/// @description EndStep
if(scFreezeCheck() == true) exit;
if(scPauseCheck()  == true) exit;

///Shell melee
var en =0;
if(pickup!=0){
	//holding shell
    if(facing==1){
        var en = collision_rectangle(bbox_right,bbox_top,bbox_right+16,bbox_bottom,oParEnemy,false,true)
        if(en!=noone){
            var corpse = instance_create(x,y,oCorpse);
            if(pickup=="oShell")  corpse.sprite_index =  sShell;
            else                  corpse.sprite_index =  sShellR;
            pickup=0;
            with(en) scEnDamage(10,other.vx,other.vy);
        }
    }else{
        var en = collision_rectangle(bbox_left,bbox_top,bbox_left-16,bbox_bottom,oParEnemy,false,true)
        if(en!=noone){
            var corpse = instance_create(x,y,oCorpse);
            if(pickup=="oShell")  corpse.sprite_index =  sShell;
            else                  corpse.sprite_index =  sShellR;
            pickup=0;
            with(en) scEnDamage(10,other.vx,other.vy);
        }
    }
}

///Farore
if(oPlayerStats.powerUp=oPlayerStats.Powers.farore){
	var createPortal = kAction2Press  && kUp;
	var teleport = kAction2Press && !kUp;
	if(instance_exists(portal)){
		if(teleport){
			faroreCharge=true;
			faroreCount=20;
		}
		if(faroreCharge){
			faroreCount++
			//Teleport
			if(faroreCount > 20){
				teleportEffect =true;
				//vx*=1.1;
				//vy*=1.1;
				x = portal.x;
				y = portal.y;
				instance_destroy(portal);
				faroreCount=0;
				faroreCharge=false;
			}
		}
	}else{
		faroreCharge=false;
	}
	if(createPortal && !faroreCharge){
		instance_destroy(portal);
		portal = instance_create_depth(x,y,depth-1,oPortal);
		faroreCount=0;
	}
	if(!kAction){
		//faroreCount=0;
	}
}else{
	faroreCount=0;
	faroreCharge=false;
	instance_destroy(portal);
}




///Spin Attack disabled
#region
/*
var en =0;
if(kHit && oPlayerStats.powerUp="fly" && false){
    spinAttack=true;
    alarm[5]=10;
    dam=false;
}

if(spinAttack && !dam){
    facing*=-1;
    if(!dam){
        var en = collision_rectangle(bbox_right,bbox_top,bbox_right+16,bbox_bottom,oParEnemy,false,true)
        if(en!=noone){
            dam=true;
            with(en) scEnDamage(1,other.vx,other.vy);
        }
        var en = collision_rectangle(bbox_left,bbox_top,bbox_left-16,bbox_bottom,oParEnemy,false,true)
        if(en!=noone){
            dam=true;
            with(en) scEnDamage(1,other.vx,other.vy);
        }
    }
    var brick = collision_rectangle(bbox_right,bbox_top,bbox_right+16,bbox_bottom,oBrick,false,true)
    if(brick!=noone){
        with(brick) sidehit=true;
    }
    var brick = collision_rectangle(bbox_left,bbox_top,bbox_left-16,bbox_bottom,oBrick,false,true)
    if(brick!=noone){
        with(brick) sidehit=true;
    }
}


if(en!=noone){
    with(en){
        isShell = object_get_name(object_index)=="oShell";
        isShell = isShell || object_get_name(object_index)=="oShellR";
        //add flip
    }
}
*/
#endregion


///Movement with collision
// Handle sub-pixel movement
cx += vx;
cy += vy;
vxNew = round(cx);
vyNew = round(cy);
cx -= vxNew;
cy -= vyNew;

jumped = false;
landed = false;

//verticle movement
repeat(abs(vyNew)) {
    if (!PlatformCheck()){
        scPlayerHitCheck();
        y += sign(vy);
    } else {
        vy = 0;
        onGround = true;
        break;
    }
}

if (platformTarget) {
    if (!onGround)
        landed = true;
    
    if (landed)
        with (platformTarget) other.vy = 0;
    else
        with (platformTarget) other.vy = 0;
}

//x movement as well as handling slopes
r=0;
q=0;
var shell;
repeat(abs(vxNew)) {
    //var w=0, e=0;
    moved = false;
    q = sign(vx);
    while (abs(q) != 2){
        r = 3;
        repeat(6){
            if (!place_meeting(x+q,y+r,oParSolid) && !place_meeting(x+q,y+r,oBrick)){
            //only move if place is free
                if (r <= 0 || place_meeting(x,y+1,oParSolid)||place_meeting(x,y+1,oBrick)){
                //if onground or slope goes up moves 
                    scPlayerCollision();//better collison that works OMG!
                    x += q;
                    y += r;
                    w += 1;
                    e -= r;
                    moved = true;
                    break;
                } 
            } 
            r -= 1;
        }
    q += sign(vx);
    }
    if (!moved){
        vx = 0;
        break;
    }
}

if (w>=5) {
    slope = round(e/abs(w)*2)/2 ;
    w=0;
    e=0;
};

// Pit death
if (bbox_right < 0 || bbox_left > room_width || bbox_top > room_height || bbox_bottom < 0){
    instance_destroy();
}

/// Death

// Crushed by moving solid/
if (place_meeting(x, y, oParSolid)){
	instance_destroy();
}
//hp==0
if(oPlayerStats.hp<=0&&global.freeze==false){
    instance_destroy();
}
/// Procedural Animation

xscale = Approach(xscale, 1, 0.05);
yscale = Approach(yscale, 1, 0.05);

///moveout of brick
if(place_meeting(x,y,oBrick)){
    y++;
}

if(oPlayerStats.powerUp!=oPlayerStats.Powers.farore){
		ds_list_destroy(trail);
}
