private double fractionLength = .8; 
private int smallestBranch = 4; 
private double branchAngle = .45; 
Flower[] bubs = new Flower[200];
public void setup() 
{   
  size(640,480);  
  for(int i = 0; i < bubs.length; i++){
    bubs[i] = new Flower((int)(Math.random()*530)+55, (int)(Math.random()*100)+100);
  }
} 
public void draw() 
{   
  background(0);
  for(int i = 0; i < bubs.length; i++){
    bubs[i].fall();
    bubs[i].show();
  }
  fill(0);
  triangle(0, 0, 250, 0, 0, 250);
  triangle(640, 0, 250, 0, 640, 250);
  stroke(168, 134, 98);  
  strokeWeight(7);
  line(320,480,320,380);   
  drawBranches(320,380,90,3*Math.PI/2);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double a1 = angle - branchAngle;
  double a2 = angle + branchAngle;
  branchLength*=fractionLength;
  int endX1 = (int)(branchLength*Math.cos(a1) + x);
  int endY1 = (int)(branchLength*Math.sin(a1) + y);
  int endX2 = (int)(branchLength*Math.cos(a2) + x);
  int endY2 = (int)(branchLength*Math.sin(a2) + y);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if(branchLength>smallestBranch){
    fill((int)(Math.random()*100)+155, (int)(Math.random()*100)+155, (int)(Math.random()*100)+155);
    stroke(168, 134, 98);
    strokeWeight((float)(branchLength/16)); 
    drawBranches(endX1, endY1, branchLength, a1);
    stroke(168, 134, 98);
    strokeWeight((float)(branchLength/16)); 
    drawBranches(endX2, endY2, branchLength, a2);
    if(branchLength<20){
      noStroke();
      ellipse(endX1, endY1, 3, 5);
      ellipse(endX2, endY2, 5, 3);
    }
  }
} 

class Flower{
 int myX, myY; 
 int mySize, myColor, mySpeed;
  Flower(int x, int y){ //overloaded constructor
   myColor = color((int)(Math.random()*100)+155, (int)(Math.random()*100)+155, (int)(Math.random()*100)+155);
   mySize = (int)(Math.random()*3)+2;
   mySpeed = (int)(Math.random()*4)+3;
   myX = x;
   myY = y;
 }
 void fall(){
   myX += (int)(Math.random()*1);
   myY += mySpeed;
   if(myY>=480)
     myY=(int)(Math.random()*100)+100;
 }
 void show(){
   fill(myColor);
   ellipse(myX, myY, mySize, mySize);
 }
}

