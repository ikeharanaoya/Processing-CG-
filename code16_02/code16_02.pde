size(256, 256);
for(int y = 0; y< 256; y++){
  for(int x = 0; x<256; x++){
    float a = dist(64, 64, x, y);
    float b = dist(192, 192, x, y);
    stroke(int(a+b)%25*10);
    stroke(abs(int(a-b))%25*10);
    stroke(int(a+b)%2*255);
    stroke(abs(int(a-b))%2*255);
    stroke(int(a*b)%2*255);
    point(x,y);
  }
}
