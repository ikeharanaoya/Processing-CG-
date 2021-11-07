float rx = 0.0; //x軸回りの回転角度
float ry = 0.0; //y軸回りの回転角度
float rz = 0.0; //z軸回りの回転角度
boolean flg = true; //透視投影・オン

void setup() {
  size(320, 240, P3D); //3Dモード
  noStroke(); //枠線は描画しない
  frameRate(60);
}

void draw() {
  //画面をリフレッシュ
  background(204);

  //透視投影
  if (flg == true) {
    float aspect = float(width) / float(height);
    perspective(radians(60), aspect, 100, -100);
    translate(width/2, height/2, -50);
  }
  //平行投影
  else {
    ortho(-width/2, width/2, -height/2, height/2);
    translate(width/2, height/2, 0);
  }

  //回転
  rotateX(rx); //x軸回り
  rotateY(ry); //y軸回り
  rotateZ(rz); //z軸回り
  scale(50); //50倍に拡大

  //立方体を描画
  makeCube();
}

void makeCube() {
  beginShape(QUADS);
  //前面
  fill(255, 0, 0); //赤
  vertex(-1, -1, 1); //頂点１
  vertex(-1, 1, 1); //頂点２
  vertex(1, 1, 1); //頂点３
  vertex(1, -1, 1); //頂点４

  //後面
  fill(0, 255, 0); //緑
  vertex(1, -1, -1); //頂点１
  vertex(1, 1, -1); //頂点２
  vertex(-1, 1, -1); //頂点３
  vertex(-1, -1, -1); //頂点４

  //上面
  fill(0, 0, 255); //青
  vertex(-1, -1, 1); //頂点１
  vertex(1, -1, 1); //頂点２
  vertex(1, -1, -1); //頂点３
  vertex(-1, -1, -1); //頂点４

  //前面
  fill(255, 255, 0); //黄
  vertex(-1, 1, 1); //頂点１
  vertex(-1, 1, -1); //頂点２
  vertex(1, 1, -1); //頂点３
  vertex(1, 1, 1); //頂点４

  //前面
  fill(255, 0, 255); //マゼンタ
  vertex(-1, -1, -1); //頂点１
  vertex(-1, 1, -1); //頂点２
  vertex(-1, 1, 1); //頂点３
  vertex(-1, -1, 1); //頂点４

  //前面
  fill(0, 255, 255); //シアン
  vertex(1, -1, 1); //頂点１
  vertex(1, 1, 1); //頂点２
  vertex(1, 1, -1); //頂点３
  vertex(1, -1, -1); //頂点４

  endShape();
}

void keyPressed() {
  if (key == 'p') {flg = true;} //透視投影
  else if (key == 'o') {flg = false;}//平行投影
  
  if (keyCode == UP) {rx = rx - 0.1;}
  else if (keyCode == DOWN) {rx = rx + 0.1;}
  else if (keyCode == LEFT) {ry = ry - 0.1;}
  else if (keyCode == RIGHT) {ry = ry + 0.1;}
}

void mouseDragged(){
  rz = mouseX * 0.01;
}
