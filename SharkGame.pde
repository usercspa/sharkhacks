PImage backImg;
int imageMove = -200;
PVector gravity = new PVector(0, 0.2);
Shark shark;
boolean gamestate = false;
int score = 0;
int wid =400;
int hei = 600;
int highScore =0;
int currentScore = 0;

ArrayList<Net> nets= new ArrayList<Net>();
void setup(){
  backImg = loadImage("bg1.png");
  size(400,600);
  textSize(32);
  shark = new Shark();
  
}

void draw(){
  if(gamestate == false){
      imageMode(CORNER);
      image(backImg,imageMove,0);
      image(backImg, imageMove+backImg.width,0);
      imageMove-= 1;
      if(imageMove ==-400){
        imageMove=0;
      };
      textSize(50);
  textAlign(CENTER);
   fill(255,255,255);
  text("Click To Play!",200,300);
  textSize(50);
  if(currentScore!=0){
     textSize(50);
  textAlign(CENTER);
   fill(255,255,255);
  text(currentScore,200,100);
  textAlign(CENTER);
   fill(255,255,255);
  text("HighScore",200,400);
  text(highScore, 200, 450);}
     
      if(mousePressed){
        shark = new Shark();
        gamestate = true;
        nets = new ArrayList<Net>();
      
  }

}else{
      imageMode(CORNER);
      image(backImg,imageMove,0);
      image(backImg, imageMove+backImg.width,0);
      imageMove-= 1;
      if(imageMove ==-400){
        imageMove=0;
      };
      shark.show();
      shark.update();
    
      textSize(50);
  textAlign(CENTER);
   fill(255,255,255);
  text(score,200,100);
  
  if(frameCount%60 == 0){
      nets.add(new Net());
      score++;
  }
  
      if(mousePressed){
        PVector up = new PVector(0, -5);
        shark.applyforce(up);
        
        gamestate = true;
      
      }
      for(int i =nets.size()-1;i>=0;i--){
        Net p = nets.get(i);
        p.update();
        p.show();
        if(p.hits(shark)){
        gamestate = false;
        if(score>highScore){
            highScore = score;
        }
        currentScore = score;
        score=0;
      }
      textSize(50);
  textAlign(CENTER);
   fill(255,255,255);
  text(score,200,100);
      
      }
     
  }
 
  
  /* textSize(32);
  textAlign(CENTER);
   fill(255,0,0);
  text("Hello world",200,300);
 if(frameCount%15==0){
  fill(0, 255,0);
  text("Hello world",200,300);

}*/
 

}
