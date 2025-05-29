//week15-5-postman-mouseDragged-head-angleX-0-atan2
// 修改自week11_3_postman_again
// 重新來一次，讓程式架構變更清楚
PImage postman, head, body, uparm1, hand1, uparm2, hand2, foot1, foot2;
void setup(){ //把上面的圖都拉進新專案裡
  size(560,560);
  postman = loadImage("postman.png");
  head = loadImage("head.png");
  body = loadImage("body.png");
  uparm1 = loadImage("uparm1.png");
  hand1 = loadImage("hand1.png");
  uparm2 = loadImage("uparm2.png");
  hand2 = loadImage("hand2.png");
  foot1 = loadImage("foot1.png"); // 增加腳 旋轉中心 220,375
  foot2 = loadImage("foot2.png"); // 增加腳 旋轉中心 260,372
}

float [] angleX = new float[10]; //在3D世界，我們的旋轉，
float [] angleY = new float[10];
int ID = 0; //一開始是頭的關節
ArrayList<String> lines = new ArrayList<String>(); 
void keyPressed(){
  if(key=='s'){ // 現在動作的所有關節，都存起來
    String now = ""; //空字串
    for(int i=0; i<10; i++){
      now += angleX[i] + " "; //後面有空格
      now += angleY[i] + " "; //後面有空格
    }
    lines.add(now); //把現在動作的這行，加到 lines 裡
    String [] arr = new String[lines.size()];
    lines.toArray(arr);
    saveStrings("angle.txt", arr);
    println("現在存檔:" + now);
  }
   if(key=='r'){
     String [] file = loadStrings("angles.txt");
     if(file != null){ // 如果有讀到檔案
        for(int i=0; i<file.length; i++){ // 就檔案內容逐行
          lines.add(file[i]); //加到 lines 資料結構
        }
      }
   }
  if(key=='p') playing = !playing; //動畫 <=> 不播動畫
  if(key=='1') ID = 1; // 左邊臂
  if(key=='2') ID = 2; // 左邊手
  if(key=='3') ID = 3; // 右邊臂
  if(key=='4') ID = 4; // 右邊手
  if(key=='5') ID = 5; // 左邊腳
  if(key=='6') ID = 6; // 右邊腳
  if(key=='0') ID = 0; // 頭
}
boolean playing = false; //一開始，不播放動畫，按下 'p' 可切換

void mouseDragged(){
  //要把原本 mouseX 得左右移動 改成像 IK 的轉動
  //從void draw() 找到頭 掛的位置 +236,+231
  float dx =mouseX-236,dy=mouseY-231;
  angleX[0]=degrees(atan2(dy,dx))+90;
  //angleX[ID]+=mouseX-pmouseX;
  //angleY[ID]+=mouseY-pmouseY; //多了這一行
}
int R = 0;
void myInterpolate(){
  if(lines.size()>=2){ //要有2行以上，才能做內差
    int R2 = (R+1)%lines.size();
    float alpha = (frameCount%30)/30.0; //介於 0.0~1.0 中間的值
    if (alpha==0.0) R = (R+1)%lines.size(); //如果變到0.0就換下一組
    float [] oldAngle = float(split( lines.get(R), ' '));
    float [] newAngle = float(split( lines.get( R2 ), ' '));
    for(int i=0; i<10; i++){
      angleX[i] = oldAngle[i*2+0]*(1-alpha) + newAngle[i*2+0]*alpha;
      angleY[i] = oldAngle[i*2+0]*(1-alpha) + newAngle[i*2+0]*alpha;
    }
  }
}
void draw(){
  background(#FFFFF2);
  if (playing) myInterpolate();
  image(body, 0, 0); // 先畫身體
  
   pushMatrix();
    translate(+236, +231); // 再放回去正確的位置
    rotate(radians(angleX[0]));
    translate(-236, -231); // 把頭的旋轉中心, 放到(0,0)
    image(head, 0, 0); // 再畫頭
  popMatrix();
  
  pushMatrix(); //foot1
    translate(220, 375);
    rotate(radians(angleX[5]));
    translate(-220, -375);
    image(foot1, 0, 0);
  popMatrix();
  pushMatrix(); //foot2
    translate(260, 372);
    rotate(radians(angleX[6]));
    translate(-260, -372);
    image(foot2, 0, 0);
  popMatrix();
  
   pushMatrix(); // 要畫左邊的上手臂、手肘
    translate(+185, +261);
    rotate(radians(angleX[1]));
    translate(-185, -261);
    image(uparm1, 0, 0); // 上手臂
    pushMatrix();
      translate(+116, +265);
      rotate(radians(angleX[2]));
      translate(-116, -265);
      image(hand1, 0, 0);
    popMatrix();
  popMatrix();
  
  pushMatrix(); // 要畫右邊的上手臂、手肘
    translate(290, 262);
    rotate(radians(angleX[3]));
    translate(-290, -262);
    image(uparm2, 0, 0);
    pushMatrix();
      translate(357, 259);
      rotate(radians(angleX[4]));
      translate(-357, -259);
      image(hand2, 0, 0);
    popMatrix();
  popMatrix();
}
