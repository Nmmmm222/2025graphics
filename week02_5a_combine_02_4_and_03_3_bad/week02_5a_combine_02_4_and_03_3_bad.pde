//week02-5a-combine-02-4-and-03-3-bad
//要描圖 卻出錯了
PImage img;
void setup(){
  size(400,400);
  img=loadImage("cute.png");
 } //記得把圖檔(向上周一樣拉到程式碼裡面)

 void draw(){
   background(img);
   fill(255,200);//半透明的色彩 白色 alpha值是128
   rect(0,0,400,400); //畫超大的四邊形 全都蓋住
   //上面是week02-4 下面是week02-3 但線卻無法上去
   stroke(255,0,0); //紅色的線
  if(mousePressed) line(mouseX,mouseY,pmouseX,pmouseY);
 }
