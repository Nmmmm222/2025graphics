//week04-03-rotateX-radians-mouseY
void setup(){
  size(400,400,P3D);
}
void draw(){
  background(128);
  translate(width/2,height/2);
  //rotateY(radians(mouseX)); //上週的左右轉
  rotateX(radians(-mouseY)); //本週的上下轉
  box(200);
}
