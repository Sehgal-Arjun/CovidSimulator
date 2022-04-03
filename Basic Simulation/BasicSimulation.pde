public Person[] people = new Person[400];

int count = 0;

void setup(){
  size(1000,1000);
  for (int i = 0; i < people.length; i++){
    people[i] = new Person();
  }
}

void draw(){
  background(0); 
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
}
