/*
To do list:
X 50 100 300
hit acc
score counter
cursor circle thing
hit indicator (started)
show next circle so its actually readable
*/




//var stuff
int stX;
int stY;
int enX;
int enY;
boolean xReached = false;
boolean yReached = false;
int circX = 375;
int circY = 250;
int timer = 0; //pseudo timer utilizing the 60 fps that hopefully wont break
int combo = 0;
int score = 0;

void setup(){
  size(750,500);
  background(200,160,200);
  circDraw();
}

void draw(){
  timer++;
  textSize(36);
  fill(150,110,150);
  text("Combo " + combo,20,480);
  if (timer == 30){
    timer = 0;
    combo = 0;
    background(200,160,200);
    randCirc();
    circDraw();
  }
  if (tap() == true){
    if (timer <= 30 && mouseX >= circX-40 && mouseX <= circX+40 && mouseY <= circY+40 && mouseY >= circY-40){
      combo++;
      timer = 0;
      background(200,160,200);
      randCirc();
      lightning(circX,circY);
      circDraw();
    }
  }
}

public boolean tap(){ //detects tap from m1, x, or z
  if ((mousePressed == true && mouseButton == LEFT) || (keyPressed && (key == 'x' || key == 'z'))){
    return true;
  }
  else
    return false;
}

void lightning(int nextX, int nextY){
  strokeWeight(2);
  stroke(120,120,250);
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
  strokeWeight(3);
  stroke(60,120,230);
  fill(80,140,255);
  ellipse(circX,circY,80,80);
}

void randCirc(){
  circX = (int)(Math.random()*600)+50;
  circY = (int)(Math.random()*400)+50;
}
