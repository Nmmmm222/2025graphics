//week14-1-PFont-createFont-textSize-text
size(300,300);
textSize(50);//50號字
text("Hello",50,50);//預設字型
PFont font=createFont("Times New Roman",50);
textFont(font);//換字型
text("Hello",10,100);//放下面一點點
//print(RFont.list());//列出現在所有可用的字型
//改用for迴圈 把全部的字型 分行印出來
for(String name:PFont.list()) println(name);
