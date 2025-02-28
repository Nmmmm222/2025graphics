//week02-4-PImage-loadImage-background-fill-println
//新的開始 要描圖
PImage img;
void setup(){
  size(400,400);
  img=loadImage("cute.png");
 } //記得把圖檔(向上周一樣拉到程式碼裡面)
 
 void draw(){
   background(img);
   fill(255,mouseX);//半透明的色彩 白色 alpha值是128
   println(mouseX); //把 mouseX 的值 在下面「小黑」印出來
   rect(0,0,400,400); //畫超大的四邊形 全都蓋住
 }
