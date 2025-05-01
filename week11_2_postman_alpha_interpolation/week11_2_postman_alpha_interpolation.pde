//week11-1-postman-saveStrings-loadStrings
//修改自week10-6-postman-many-angle-ID-saveString-loadStrings
PImage postman,head,body,uparm1,hand1,uparm2,hand2;
float[]angle=new float[20]; //準備20個關節的變數
int ID=0; //現在要處裡的關節 ID(第幾個關節)
void mouseDragged(){
  angle[ID]+=mouseX-pmouseX;
} //記得把圖檔拉進去
void keyPressed(){
  if(key=='1') ID=1; //左邊臂
  if(key=='2') ID=2; //左邊手
  if(key=='3') ID=3; //右邊臂
  if(key=='4') ID=4; //右邊手
  if(key=='5') ID=5; //(待用)
  if(key=='6') ID=6; //(待用)
  if(key=='0') ID=0; //頭
  if(key=='s'){ //從這裡開始 每次按s就存一組angle
    String now=""; //要放現在全部的關節的
    for(int i=0;i<20;i++){ //利用for迴圈
      now+=angle[i]+" "; //全部塞到 now 裡 記得有空
    }
    lines.add(now); //把現在這行  加到lines裡
    String[]arr=new String[lines.size()];
    lines.toArray(arr);
    saveStrings("angles.txt",arr);
  }
  if(key=='r'){ //replay 照著之前按s存檔的lines重播一次
     if(R==0){
         String[]file=loadStrings("angles.txt");
         if(file!=null){ //如果有讀到檔案
            for(int i=0;i<file.length;i++){//就檔案內容逐行
              lines.add(file[i]); //加到lines資寮結構裡
            }
            }
         }
     if(R<lines.size()){
       float[]now=float(split(lines.get(R),' '));
       for(int i=0;i<20;i++) angle[i]=now[i];
       R=(R+1)%lines.size();
     }
  }
  if(key=='p'){ //按了r之後 想要內插中間的結果
    int R2=(R+1)%lines.size();
    float[]oldAngle=float(split(lines.get(R),' '));
    float[]newAngle=float(split(lines.get(R2),' '));
    float alpha=(frameCount%30)/30.0; //介於0.0~1.0中間的值
    for(int i=0;i<20;i++) angle[i]=oldAngle[i]*(1-alpha)+newAngle[i]*alpha;
  }
}
int R=0;
ArrayList<String> lines=new ArrayList<String>(); //放移動
void setup(){
  size(560,560);
  postman=loadImage("postman.png");
  head=loadImage("head.png");
  body=loadImage("body.png");
  uparm1=loadImage("up left.png");
  hand1=loadImage("hand1.png");
  uparm2=loadImage("up right.png");
  hand2=loadImage("hand2.png");
}
void draw(){
  background(#FFFFF2);
  image(postman,0,0); //基礎的郵差先生(全身)
  fill(255,0,255,128); //半透明的紫色
  rect(0,0,560,560); //蓋上去
  pushMatrix(); //要畫左邊的上手臂 手肘
    translate(185,261);
   rotate(radians(angle[1]));
    translate(-185,-261);
    image(uparm1,0,0); //上手臂
    pushMatrix();
      translate(118,265);
      rotate(radians(angle[2]));
      translate(-116,-265);
      image(hand1,0,0);
    popMatrix();
  popMatrix();
   pushMatrix(); //要畫左邊的上手臂 手肘
    translate(292,263);
    rotate(radians(angle[3]));
    translate(-292,-263);
    image(uparm2,0,0); //上手臂
    pushMatrix();
      translate(354,258);
      rotate(radians(angle[4]));
      translate(-354,-258);
      image(hand2,0,0);
    popMatrix();
  popMatrix();
  pushMatrix();
    translate(232,200); //再放回去原來的位置
    rotate(radians(angle[0]));
    translate(-232,-200); //把頭的旋轉中心 放到(0,0)
    image(head,0,0); //在畫我們的頭
  popMatrix();
  image(body,0,0); //在畫身體
}
