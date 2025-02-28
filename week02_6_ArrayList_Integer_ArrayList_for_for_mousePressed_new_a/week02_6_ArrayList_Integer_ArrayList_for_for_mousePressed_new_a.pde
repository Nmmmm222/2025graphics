//week02-6-ArrayList-Integer-ArrayList-for-for-mousePressed-new-add 
//想要有很多段 不要「一筆畫」一直接著畫
ArrayList<Integer> x,y ;//先有2個還沒準備好的資料結構
ArrayList<ArrayList<Integer> > xx=new ArrayList<ArrayList<Integer> > ();
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
 void mouseDragged(){
   x.add(mouseX);
   y.add(mouseY);
 }
 void mousePressed(){// 滑鼠按下去時 建「新的」資料結構
   x = new ArrayList<Integer>();xx.add(x);
   y= new ArrayList<Integer> (); yy.add(y);
 }
