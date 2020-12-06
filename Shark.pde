
class Shark{
 PVector velocity;
PVector acc;
PVector pos;
PImage img;




   Shark() {
       pos = new PVector(50, height/2);
       velocity = new PVector(0,0);
       acc = new PVector();
       img = loadImage("shark.gif");
    }
    void show() {
        //fill(255, 255, 0);
        //ellipse(pos.x, pos.y, 16*2, 16*2);
        
      
  image(img, pos.x, pos.y, 100, 100);
        /*if(pos.y ==600){
          pos.y = 50;
          pos.x = height/2;
        }*/
        
    }
    
    void applyforce(PVector force){
      acc.add(force);
    
    
    
    }
    void update(){
      applyforce(gravity);
      pos.add(velocity);
      velocity.add(acc);
      velocity.limit(4);
      acc.mult(0);
      
      if(pos.y>height-64){
        pos.y = height-64;
        velocity.mult(0);
      }
     
    }
}
