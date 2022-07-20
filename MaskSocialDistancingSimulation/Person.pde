class Person{
  float x;
  float y;
  float infectionRate = 1000; // 500 is basic, but 1000 is mask
  
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
    float num = random(0,infectionRate);
    if (num < 1){
      if (this.type.equals("n")){
        this.type = "i";
        MaskSocialDistancingSimulation.totalInfected++;
      }
    }
  }
}
