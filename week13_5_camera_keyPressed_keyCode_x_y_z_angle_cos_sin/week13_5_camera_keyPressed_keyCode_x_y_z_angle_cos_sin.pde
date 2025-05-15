//week13-5-camera-keyPressed-keyCode-x-y-z-angle-cos-sin
//利用 方向鍵(上下左右鍵)來移動我們的主角
//修改自week13-4-camera-chessboard-texture-front-left
PImage img;
void setup(){
  size(400,400,P3D);
  img=loadImage("chessboard.png");
  textureMode(NORMAL);
}
float x=200,y=200,z=200,angle=180;
void keyPressed(){ //按方向鍵
  if(keyCode==LEFT) angle--;
  if(keyCode==RIGHT) angle++;
  if(keyCode==UP){
    x+=cos(radians(angle));
    z+=sin(radians(angle)); //小心 是z(3D前後) 不是 y(3D上下)
  }
  if(keyCode==DOWN){
    x-=cos(radians(angle));
    z-=sin(radians(angle)); //小心 是z(3D前後) 不是 y(3D上下)
  }
}
void draw(){ //攝影機往前方看 mouse左右、前後移動
  //camera(mouseX,200,mouseY,mouseX,200,mouseY-10,0,1,0);
  if(keyPressed) keyPressed(); //補強一下 讓按鍵按下去 會一直更新
  camera(x,y,z,x+cos(radians(angle)),y,z+sin(radians(angle)),0,1,0);
  background(128);//灰背景
  beginShape(); //正前方
    texture(img);
    vertex(0,0,0,0,0); //x,y,z,u,v
    vertex(400,0,0,1,0);
    vertex(400,400,0,1,1);
    vertex(0,400,0,0,1);
  endShape();
  beginShape(); //左方 x座標都放0
    texture(img);
    vertex(0,0,0,0,0); //x,y,z,u,v
    vertex(0,400,0,1,0);
    vertex(0,400,400,1,1);
    vertex(0,0,400,0,1);
  endShape();
}
