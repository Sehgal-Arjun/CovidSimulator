public Person[] people = new Person[350];

int count = 0;
int amountInfected = 1;
public static float totalInfected = 0;

void setup(){
  size(800,800);
  for (int i = 0; i < people.length; i++){
    people[i] = new Person();
  }
}

void draw(){
  background(0);
  
  int num = 0;
  
  for (int i = 0; i < people.length; i++){
    if (people[i].getType().equals("i")) num++;
  }
  
  if(count == 0){
    amountInfected = 1;
  }
  else{
    amountInfected = num;
  }
  
  if (amountInfected!=0){
    for (int i = 0; i < people.length; i++){
      people[i].update();
      people[i].show();
      
      if (count != 0){
        for (int j = 0; j < i; j++){
          if (people[j].getType().equals("i")){
            if (abs(people[j].getX() - people[i].getX()) <= 1 || abs(people[j].getY() - people[i].getY()) <= 60){
              people[i].infect();
            }
          }
        }
      }
      else{
        people[count].setType("i");    
        count++;
      }
    }
    noFill();
    stroke(255);
    strokeWeight(3);
    circle(width/2, height/2, 50);
  }
  else{
    background(0);
    text("Amount of infected people: " + totalInfected, 320, 350);
    fill(255,255,255);
    text("Amount of non-infected people: " + people.length, 310, 400);
    fill(255,255,255);
    float amount = people.length;
    float percentage = (totalInfected/amount) * 100; 
    text("Infection percentage: " + percentage + "%", 325, 450);
    fill(255,255,255);
  }
}
