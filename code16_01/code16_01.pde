size(256, 256);
for(int y = 0; y < 256; y++){
  for(int x = 0; x<256;x++){
    stroke(x, y, 255);//-------------①
    //stroke((x * y) % 256);
    //stroke(dist(128, 128, x, y)* 5 % 256);
    //stroke(sin(x*0.2)*128+128);
    //stroke(sin(dist(128,128,x,y)*0.2)*128+128);
    point(x, y);
  }
}
