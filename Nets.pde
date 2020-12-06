class Net{
  float top;
  float bottom;
  int pipeW = 40;
  int x;
  PImage net;
  
  Net(){
    x = wid+pipeW;
    top = random(100, height/2 - 64);
    bottom = random(100, height/2 - 64); 
    net = loadImage("net.png");
  
  
  }
  
  void update(){
    x-=3;
  
  
  }
  boolean hits(Shark b){
    if((b.pos.x+16>x) && (b.pos.x+16 < x+pipeW)){
       if((b.pos.y < (top+5)) ){
        return true;
       }
    }
   return false;
  
  
  }
  
 void show(){
   fill(13, 255, 178);
     image(net, x, 0, pipeW, top);
      image(net,x, height-bottom,pipeW,bottom);
   //rect(x,0,pipeW,top);
   //rect(x, height-bottom,pipeW,bottom);
 
 }


}
