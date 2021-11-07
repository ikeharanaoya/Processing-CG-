float rx = 0.0; //x軸回りの回転角度
float ry = 0.0; //y軸回りの回転角度
float rz = 0.0; //z軸回りの回転角度

PImage tex1; //マッピング用の画像１
PImage tex2; //マッピング用の画像２
PImage tex3; //マッピング用の画像３

void setup(){
  size(320, 240, P3D); //3Dモード
  noStroke(); //枠線は描画しない
  frameRate(60);
  
  //テクスチャ用の画像を読み込む
  tex1 = loadImage("smp01.jpg");
  tex2 = loadImage("smp02.jpg");
  tex3 = loadImage("smp03.jpg");
  textureMode(NORMAL); //正規化
}

void draw(){
  //画面をリフレッシュ
  background(31);
  
  //画面の中心に原点を移動
  translate(width/2, height/2, 0);
  rotateX(rx); //x軸回りの回転
  rotateY(ry); //y軸回りの回転
  rotateZ(rz); //z軸回りの回転
  scale(50); //50倍に拡大
  
  //テクスチャをマッピングした立方体を描画
  makeTextureCube(tex1, tex2, tex3);
}

void makeTextureCube(PImage tex1, PImage tex2, PImage tex3){
  //前面
  beginShape(QUADS);
  texture(tex1);
  vertex(-1, -1, 1, 0, 0); //頂点1-A
  vertex(-1, 1, 1, 0, 1); //頂点2-B
  vertex(1, 1, 1, 1, 1); //頂点3-C
  vertex(1, -1, 1, 1, 0); //頂点4-D
  endShape();
  
  //後面
  beginShape(QUADS);
  texture(tex1);
  vertex(1, -1, -1, 0, 0); //頂点8-A
  vertex(1, 1, -1, 1, 0); //頂点7-D
  vertex(-1, 1, -1, 1, 1); //頂点6-C
  vertex(-1, -1, -1, 0, 1); //頂点5-B
  endShape();
  
  //上面
  beginShape(QUADS);
  texture(tex2);
  vertex(-1, -1, 1, 0, 1); //頂点1-B
  vertex(1, -1, 1, 1, 1); //頂点4-C
  vertex(1, -1, -1, 1, 0); //頂点8-D
  vertex(-1, -1, -1, 0, 0); //頂点5-A
  endShape();
  
  //底面
  beginShape(QUADS);
  texture(tex2);
  vertex(-1, 1, 1, 0, 0); //頂点2-A
  vertex(-1, 1, -1, 0, 1); //頂点6-D
  vertex(1, 1, -1, 1, 1); //頂点7-C
  vertex(1, 1, 1, 1, 0); //頂点3-B
  endShape();
  
  //左面
  beginShape(QUADS);
  texture(tex3);
  vertex(-1, -1, -1, 0, 0); //頂点5-A
  vertex(-1, 1, -1, 0, 1); //頂点6-D
  vertex(-1, 1, 1, 1, 1); //頂点2-C
  vertex(-1, -1, 1, 1, 0); //頂点1-B
  endShape();
  
  //右面
  beginShape(QUADS);
  texture(tex3);
  vertex(1, -1, 1, 0, 0); //頂点4-A
  vertex(1, 1, 1, 0, 1); //頂点3-B
  vertex(1, 1, -1, 1, 1); //頂点7-C
  vertex(1, -1, -1, 1, 0); //頂点8-D
  endShape();
}

void keyPressed() {
  if (keyCode == UP) {rx = rx - 0.1;}
  else if (keyCode == DOWN) {rx = rx + 0.1;}
  else if (keyCode ==LEFT) {ry = ry - 0.1;}
  else if (keyCode ==RIGHT) {ry = ry + 0.1;}
}

void mouseDragged(){
  rz = mouseX * 0.01;
}
