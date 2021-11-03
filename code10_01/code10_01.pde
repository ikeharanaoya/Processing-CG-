void setup(){
  //画面基本設定
  size(640, 480);
  frameRate(60);
}

void draw(){
  background(0);
  //短形の基準点を中心に
  rectMode(CENTER);
  //色の設定
  fill(255, 190);
  noStroke();
  //マウスのy座標を2つの短形の大きさに
  float rectSizeA = map(mouseY, 0, height, 100, 200);
  float rectSizeB = map(mouseY, 0, height, 200, 100);
  //マウスのx座標で短形のx軸上の位置を動かす
  rect(mouseX, height/2, rectSizeA, rectSizeA);
  rect(width - mouseX, height / 2, rectSizeB, rectSizeB);
}
