//week13-2-camera-movie-eye-center-up
//電腦圖學繪圖時，會設定camera的相關係數
import processing.video.*;//要使用影片的外掛喔
Movie movie;//要放影片的變數
void setup(){
  size(720,480,P3D); //要記得加上 P3D 才能有 OpenGL 3D 功能
  movie=new Movie(this,"street.mov");
  movie.loop();//循環播放
}
void draw(){
  background(128);
  //https://processing.org/reference/camera_.html
  camera(mouseX,mouseY,500,360,240,0,0,1,0);
  //很多參數 eyeX,eyeY,eyeZ,centerX,centerY,centerZ,upX,upY,upZ
  //                       現在把影片的中心點當主角
  if(movie.available())movie.read();//有新畫面 就讀入
  image(movie,0,0);//放影片 放在0,0
}
