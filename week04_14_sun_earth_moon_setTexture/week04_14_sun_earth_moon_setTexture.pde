//week04-14-sun-earth-moon-setTexture
PShape sun,earth,moon;
//樓下 剪貼自 week04-08 樓上是 week04-11,12,13
void setup(){
  size(400,400,P3D);
  moon=createShape(SPHERE,10);
  PImage img =loadImage("moon.jpg");
  moon.setTexture(img);
  
  earth=createShape(SPHERE,30);
  img =loadImage("earth.jpg");
  earth.setTexture(img);
  
  sun=createShape(SPHERE,50);
  img =loadImage("sun.jpg");
  sun.setTexture(img);
}
void draw()
{
  background(128);
  translate(width/2,height/2);
  shape(sun);//太陽
  rotateY(radians(frameCount));
  pushMatrix();
    translate(150,0);
    rotateY(radians(frameCount));
    shape(earth); //地球
   pushMatrix();
     translate(50,0);
     rotateY(radians(frameCount));
     shape(moon);//月球
    popMatrix();
   popMatrix();
}
