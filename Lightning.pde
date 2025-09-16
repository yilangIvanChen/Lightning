//var stuff
int stX;
int stY;
int enX;
int enY;
boolean xReached = false;
boolean yReached = false;
void setup(){
  size(750,500);
  strokeWeight(3);
  stroke(90,10,225);
}

void draw(){
  if (tap() == true){
  lightning(375,250);
  }
}

public boolean tap(){ //detects tap from m1, x, or c
  if ((mousePressed == true && mouseButton == LEFT) || (keyPressed && (key == 'x' || key == 'z'))){
    return true;
  }
  else
    return false;
}

void lightning(int nextX, int nextY){
  xReached = false;
  yReached = false;
  stX = mouseX;
  stY = mouseY;
  while (xReached == false || yReached == false){ //lightning path finding
    if (stX <= nextX){
      enX = stX+(int)(Math.random()*12)+4;
        if (enX >= nextX)
          xReached = true;
    }
    if (stX >= nextX){
      enX = stX-(int)(Math.random()*12)+4;
        if (enX <= nextX)
          xReached = true;
    }
    if (stY <= nextY){
      enY = stY+(int)(Math.random()*12)+4;
        if (enY >= nextY)
          yReached = true;
    }
    if (stY >= nextY){
      enY = stY-(int)(Math.random()*12)+4;
        if (enY <= nextY)
          yReached = true;
    }
    line(stX,stY,enX,enY);
    stX = enX;
    stY = enY;
  }
}
