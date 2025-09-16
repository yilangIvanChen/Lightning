//var stuff
int stX;
int stY;
int enX;
int enY;
boolean xReached = false;
boolean yReached = false;
int circX;
int circY;

void setup(){
  background(200,160,200);
  size(750,500);
  strokeWeight(1);
}

void draw(){
  if (tap() == true){
  background(200,160,200);
  circDraw();
  stroke(90,10,(int)(Math.random()*155)+100);
  lightning(circX,circY);
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
      enX = stX+((int)(Math.random()*12)+4);
        if (enX >= nextX)
          xReached = true;
    }
    if (stX >= nextX){
      enX = stX-((int)(Math.random()*12)+4);
        if (enX <= nextX)
          xReached = true;
    }
    if (stY <= nextY){
      enY = stY+((int)(Math.random()*12)+4);
        if (enY >= nextY)
          yReached = true;
    }
    if (stY >= nextY){
      enY = stY-((int)(Math.random()*12)+4);
        if (enY <= nextY)
          yReached = true;
    }
    line(stX,stY,enX,enY);
    stX = enX;
    stY = enY;
  }
}

void circDraw(){ //draws hit circle 
  noStroke();
  fill(80,140,255);
  circX = (int)(Math.random()*600)+50;
  circY = (int)(Math.random()*400)+50;
  ellipse(circX,circY,50,50);
}
