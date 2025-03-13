//week04-10-earth-createShape-setTexure-shape
//google:procssing sphere texture 可找到程式
size(400,400,P3D);
PShape earth=createShape(SPHERE,100);
PImage img =loadImage("earth.jpg");
earth.setTexture(img);
shape(earth);
