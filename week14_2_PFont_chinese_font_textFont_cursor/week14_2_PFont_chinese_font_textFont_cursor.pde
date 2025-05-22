//week14-2-PFont-chinese-font-textFont-cursor
PFont font1,font2,font3;
void setup(){
  size(300,300);
  font1=createFont("Times New Roman Bold Italic",50);
  font2=createFont("微軟正黑體 Bold",50);
  font3=createFont("elffont-rock.otf",50);
}
void draw(){
  background(0);//黑色背景
  cursor(CROSS);
  fill(255);//預設是白色的填充色
  textFont(font1);
  text("Hello 中文",mouseX+20,mouseY-20);
  fill(#FF8E8E);
  textFont(font2);
  text("Hello 中文",mouseX+20,mouseY+50);//下面一點點
  textFont(font3); //注音文的精靈字體
  text("ㄅㄆㄇ",mouseX+20,mouseY+100);
}
