counter++;
if(counter>20){
    image_angle+=20;
    if(y>orginaly-35&& !down){
        y-=3;
    }
    else{
        down = true;
        y+=3;
    }
}

