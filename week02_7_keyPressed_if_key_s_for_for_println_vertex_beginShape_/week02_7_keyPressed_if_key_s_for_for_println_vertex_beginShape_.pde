//week02-7-keyPressed-if-key-s-for-for-println-vertex-beginShape-endShape
//想要把劃出來得座標 變成們的程式碼!!
ArrayList<Integer> x,y ;//先有2個還沒準備好的資料結構
ArrayList<ArrayList<Integer> > xx=new ArrayList<ArrayList<Integer> > ();//大的資料結構
ArrayList<ArrayList<Integer> > yy=new ArrayList<ArrayList<Integer> >();
PImage img;
void setup(){
  size(400,400);
  img=loadImage("cute.png");//每次新的檔案 要在把圖「拉進來」
 } //記得把圖檔(向上周一樣拉到程式碼裡面)

 void draw(){
   background(img);
   fill(255,200);//半透明的色彩 白色 alpha值是128
   rect(0,0,400,400); //畫超大的四邊形 全都蓋住
   //上面是week02-4 下面用迴圈 把資料結構寫出來
  for(int I=0;I<xx.size();I++){ //大寫I 對應大的資料結構
    ArrayList<Integer> x=xx.get(I); //取出裡面的小的資料結構
    ArrayList<Integer> y=yy.get(I);
    for(int i=1;i<x.size();i++){ //小的 在照舊畫
      line(x.get(i),y.get(i),x.get(i-1),y.get(i-1));
    }
  }
 }
 void keyPressed(){//小心注音輸入法 會卡住按鍵要換英文輸入
   if(key=='s' || key=='S'){//如果按下英文的小寫 or 大寫s 想save存檔的話
     for(int I=0;I<xx.size();I++){ //大寫I 對應大的資料結構
      ArrayList<Integer> x=xx.get(I); //取出裡面的小的資料結構
      ArrayList<Integer> y=yy.get(I);
      println("beginShape():");//beginShape();
      for(int i=1;i<x.size();i++){ //小的 在照舊畫
        println("vertex("+x.get(i)+","+y.get(i)+");");
      }//改在 keyPressed() 按下 s 或 S 時 在全部印!
      println("endShape();");//endShape();
   }
 }
 }
 void mouseDragged(){
  // println("vertex(mouseX,mouseY);");
  //println("vertex("+mouseX+","+mouseY+");");//不要在這裡印
   x.add(mouseX);
   y.add(mouseY);
 }
 void mousePressed(){// 滑鼠按下去時 建「新的」資料結構
   x = new ArrayList<Integer>();xx.add(x);
   y= new ArrayList<Integer> (); yy.add(y);
 }
