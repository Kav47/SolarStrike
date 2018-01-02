//credits to the original author @http://solemone.de/demos/snow-effect-processing/
//have been modified to look like dust particle in the space
class Space {

  int dustQuantitiy = 100;
  int dustMinSize=1;
  int dustMaxSize=3;
  float [] xPos = new float[dustQuantitiy];
  float [] yPos = new float [dustQuantitiy];
  int [] dustSize = new int[dustQuantitiy];
  int [] dustSpeed = new int[dustQuantitiy];  
  //
  
  
  //Constructor
  Space() {
    noStroke();
    smooth();
    
    for(int i=0;i<dustQuantitiy; i++){
      xPos[i] = random(0,width);
      yPos[i] = random(0,height);
      dustSize[i] = (int) random(dustMinSize, dustMaxSize);
      dustSpeed[i] = (int) random(0,1);
      
    }
  }
  void draw() {
    background(0);
    
    for(int x=0;x<dustQuantitiy; x++){
     ellipse(xPos[x],yPos[x],dustSize[x],dustSize[x]);
     
     if(dustSpeed[x] ==0){
       xPos[x] += map(dustSize[x],dustMinSize,dustMaxSize,0.1,0.5);
     }else{
      xPos[x] -= map(dustSize[x],dustMinSize,dustMaxSize,0.1,0.5);
     }
     yPos[x] += dustSize[x]+dustSpeed[x];
     
     if(xPos[x]>width || xPos[x] < 0 || yPos[x] >height){
       xPos[x] = random(0,width);
       yPos[x] = -random(0,height);
     }
    }
  }  
  
}