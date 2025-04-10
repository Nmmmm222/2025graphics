//week08-2-PShape-gundam-setup-draw-push-scale-shape-pop
//轉動它 要改成互動模式的程式風格
PShape gundam; //要再把 Gundam.obj 等檔案 拉進來
void setup(){
  size(400,400,P3D);
  gundam=loadShape("Gundam.obj");
}
void draw(){
  background(128);
  translate(width/2,height/2+100);
  pushMatrix();
    scale(10,-10,10);
    rotateY(radians(frameCount));
    shape(gundam,0,0);
  popMatrix();
  pushMatrix();
    translate(100,0,0);
    scale(10,-10,10);
    shape(gundam,0,0);
  popMatrix();
}
