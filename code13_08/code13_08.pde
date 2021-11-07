float rx = 0.0; //x軸回りの回転角度
float ry = 0.0; //y軸回りの回転角度
float rz = 0.0; //z軸回りの回転角度

void setup(){
  size(320, 240, P3D); //3Dモード
  frameRate(60);
  noStroke(); //枠線は描画しない
}

void draw(){
  //画面をリフレッシュ
  background(31);
  
  //デフォルトのライトを点灯
  lights();
  //画面の中心に原点を移動
  translate(width/2, height/2, -50);
  rotateX(rx); //x軸回りの回転
  rotateY(ry); //y軸回りの回転
  rotateZ(rz); //z軸回りの回転
  scale(50); //50倍に拡大
  
  //立方体を描画
  makeCube();
}

void makeCube(){
  beginShape(QUADS);
  //前面
  vertex(-1, -1, 1); //頂点１
  vertex(-1, 1, 1); //頂点２
  vertex(1, 1, 1); //頂点３
  vertex(1, -1, 1); //頂点４

  //後面
  vertex(1, -1, -1); //頂点８
  vertex(1, 1, -1); //頂点７
  vertex(-1, 1, -1); //頂点６
  vertex(-1, -1, -1); //頂点５

  //上面
  vertex(-1, -1, 1); //頂点１
  vertex(1, -1, 1); //頂点４
  vertex(1, -1, -1); //頂点８
  vertex(-1, -1, -1); //頂点５

  //前面
  vertex(-1, 1, 1); //頂点２
  vertex(-1, 1, -1); //頂点６
  vertex(1, 1, -1); //頂点７
  vertex(1, 1, 1); //頂点３

  //前面
  vertex(-1, -1, -1); //頂点５
  vertex(-1, 1, -1); //頂点６
  vertex(-1, 1, 1); //頂点２
  vertex(-1, -1, 1); //頂点１

  //前面
  vertex(1, -1, 1); //頂点４
  vertex(1, 1, 1); //頂点３
  vertex(1, 1, -1); //頂点７
  vertex(1, -1, -1); //頂点８
  endShape();
}

void keyPressed() {
  if (keyCode == UP) {rx = rx - 0.1;}
  else if (keyCode == DOWN) {rx = rx + 0.1;}
  else if (keyCode == LEFT) {ry = ry - 0.1;}
  else if (keyCode == RIGHT) {ry = ry + 0.1;}
}

void mouseDragged(){
  rz = mouseX * 0.01;
}
