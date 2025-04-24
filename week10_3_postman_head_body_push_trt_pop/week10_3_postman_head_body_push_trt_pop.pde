//week10-3-postman-head-body-push-trt-pop
PImage postman,head,body,uparm1,hand1;//lag1;
void setup(){
  size(560,560);
  postman=loadImage("postman.png");
  head=loadImage("head.png");
  body=loadImage("body.png");
  uparm1=loadImage("up left.png");
  hand1=loadImage("hand1.png");
  //lag1=loadImage("lag1.png");
}
void draw(){
  background(#FFFFF2);
  image(postman,0,0); //基礎的郵差先生(全身)
  fill(255,0,255,128); //半透明的紫色
  rect(0,0,560,560); //蓋上去
  pushMatrix(); //要畫左邊的上手臂 手肘
    translate(185,261);
   //rotate(radians(mouseX));
    translate(-185,-261);
    image(uparm1,0,0); //上手臂
    pushMatrix();
      translate(118,265);
      rotate(radians(mouseX));
      translate(-116,-265);
      image(hand1,0,0);
    popMatrix();
  popMatrix();
 // pushMatrix();
    //translate(221,375);
    //rotate(radians(mouseX));
    //translate(-221,-375);
    //image(lag1,0,0);
  //popMatrix();    
  pushMatrix();
    translate(232,200); //再放回去原來的位置
    //rotate(radians(mouseX));
    translate(-232,-200); //把頭的旋轉中心 放到(0,0)
    image(head,0,0); //在畫我們的頭
  popMatrix();
  image(body,0,0); //在畫身體
}
