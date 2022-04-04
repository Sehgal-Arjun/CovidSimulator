class Person{
  float x;
  float y;
  
  boolean goingToMiddle = false;
  
  float prevX;
  float prevY;
  boolean needToGoBack = false;
  
  String type;
  /*
  n = nothing (not yet infected)
  i = infected
  r = removed / recovered
  */
  
  int counting = 0;
 
  Person(){
    x = random(0,width);
    y = random(0,height);
    type = "n";
    prevX = x;
    prevY = y;
  }
  
  void setType(String newType){
    this.type = newType;
  }
  String getType(){
    return this.type;
  }
  float getX(){
    return this.x;    
  }
  float getY(){
    return this.y;    
  }
  
  void update(){
    if (!goingToMiddle){
      randomMove();
      int chance = (int) random(2000);
      if (chance == 5){
        goingToMiddle = true;
      }
    }
    if (needToGoBack){
      float xDistance = x - prevX;
      float yDistance = y - prevY;
      if (xDistance < -50){
        x++;
      }
      if (yDistance < -50){
        y++;
      }
      if (xDistance > 50){
        x--;
      }
      if (yDistance > 50){
        y--;
      }
      if (xDistance > -50 && xDistance < 50 && yDistance > -50 && yDistance < 50){
        needToGoBack = false;
      }
    }
    if (goingToMiddle){
      float wid = width;
      float hei = height;
      float xDistance = x - wid/2;
      float yDistance = y - hei/2;
      if (xDistance < -5){
        x++;
      }
      if (yDistance < -5){
        y++;
      }
      if (xDistance > 5){
        x--;
      }
      if (yDistance > 5){
        y--;
      }
      if (xDistance > -5 && xDistance < 5 && yDistance > -5 && yDistance < 5){
        goingToMiddle = false;
        needToGoBack = true;
      }
    }
  }
  
  void show(){
    if (type.equals("n")){
      fill(0,255,0);
    }
    else if (type.equals("i") && counting < 300){
      counting++;
      fill(255,0,0);
    }
    else{
      this.type = "r";
      fill(0,0,255);
    }
  
    noStroke();
    ellipse(x,y,8,8);
  }
  
  void infect(){
    float num = random(0,500);
    if (num < 1){
      if (this.type.equals("n")){
        this.type = "i";
        CenterSimulation.totalInfected++;
      }
    }
  }
  
  void randomMove(){
    float xChange = random(-3,3);
      float yChange = random(-3,3);
      if (x + xChange > width){
        x-= xChange;
      }
      else{
        x+=xChange;
      }
      if (y + yChange > height){
        y-= yChange;
      }
      else{
        y+=yChange;
      }
      if (x + xChange < 0){
        x+= abs(xChange);  
      }
      else{
        x+=xChange;
      }
      if (y + yChange < 0){
        y+= abs(yChange);
      }
      else{
        y+=yChange;
      }
  }
}
