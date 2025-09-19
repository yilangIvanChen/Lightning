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
boolean toggle = true;

void setup(){
  size(750,500);
  background(200,160,200);
  frameRate(240);
  circDraw();
}

void draw(){
  if (keyPressed && (key == 't')){
    if (toggle)
      toggle = false;
    else
      toggle = true;
  }
  if (keyPressed && (key == 'r')){
    score = 0;
  }
  timer++;
  if (timer == 200){
    timer = 0;
    combo = 0;
    background(200,160,200);
    randCirc();
    circDraw();
  }
  if (tap() == true){
    if (timer <= 200 && mouseX >= circX-50 && mouseX <= circX+50 && mouseY <= circY+50 && mouseY >= circY-50){
      combo++;
      timer = 0;
      background(200,160,200);
      if (timer >= 75 && timer <= 125){
       score += 300;
      }
      else if ((timer < 75 && timer >= 45) || (timer > 125 && timer <= 165)){
      score += 100;
      }
      else if ((timer < 35 && timer >= 0) || (timer > 165 && timer <= 200)){
      score += 50;
      }
      else {
        combo = 0;
      }
      randCirc();
    }
  }
  drawStuff();
}

public boolean tap(){ //detects tap from m1, x, or z
  if ((mousePressed == true && mouseButton == LEFT) || (keyPressed && (key == 'x' || key == 'z'))){
    return true;
  }
  else
    return false;
}

void lightning(int nextX, int nextY){
  if (toggle){
    strokeWeight(2);
    stroke(120,120,250);
    xReached = false;
    yReached = false;
    stX = mouseX;
    stY = mouseY;
    while (xReached == false || yReached == false){ //lightning path finding
      if (stX <= nextX){
        enX = stX+((int)(Math.random()*12)+12);
          if (enX >= nextX)
            xReached = true;
      }
      if (stX >= nextX){
        enX = stX-((int)(Math.random()*12)+12);
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
}

void circDraw(){ //draws hit circle
  strokeWeight(3);
  stroke(60,120,230);
  fill(80,140,255);
  ellipse(circX,circY,100,100);

}

void movingStuff(){
  noFill();
  strokeWeight(8);
  stroke(190,190,255);
  ellipse(circX,circY,200-timer,200-timer);
  fill(215,160,25);
  noStroke();
  ellipse(mouseX,mouseY,34,34);
}

void drawStuff(){
  background(200,160,200);
  lightning(circX,circY);
  circDraw();
  movingStuff();
  textSize(36);
  fill(150,110,150);
  text("Combo " + combo,20,480);
  text(score, 20,40);
}

void randCirc(){
  circX = (int)(Math.random()*600)+50;
  circY = (int)(Math.random()*350)+50;
}
