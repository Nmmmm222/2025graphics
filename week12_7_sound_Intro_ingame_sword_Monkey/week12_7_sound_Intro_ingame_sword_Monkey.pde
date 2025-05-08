//week12-7-sound-Intro-ingame-sword-Monkey
import processing.sound.*;
SoundFile sndInGame,sndIntro,sndMonkey,sndSword;
void setup(){
  size(400,400);
  sndInGame=new SoundFile(this, "In Game Music.mp3");
  sndIntro=new SoundFile(this, "Intro Song_Final.mp3");
  sndMonkey=new SoundFile(this,"Monkey 1.mp3");
  sndSword=new SoundFile(this,"sword slash.mp3");
  sndIntro.play(); // 開場簡介的音樂
}
boolean playingIntro=true;
void keyPressed(){ //按下空白建 會進入遊戲音樂
  if(playingIntro){ //本來在播 開場簡介
    sndIntro.stop(); //開場簡介的音樂stop
    sndInGame.play(); //進入遊戲關卡的音樂play
    playingIntro=false; //現在沒播 開場簡介
  }
  else{ //若沒播 開場簡介
    sndInGame.stop();
    sndIntro.play();
    playingIntro=true;
  }
}
void mousePressed(){
  if(mouseButton==LEFT) sndSword.play();
  if(mouseButton==RIGHT) sndMonkey.play();
}
void draw(){

}
