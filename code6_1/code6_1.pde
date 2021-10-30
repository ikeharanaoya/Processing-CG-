void setup(){
  size(800, 600);
}
void draw(){
  background(128);
  update(); //状態変更（更新）をまとめて呼び出し
  drawBall();
}
void update(){ //MVCのModelの処理
  moveBall(); //円を移動する
  bounceBall(); //円を床で弾ませる
  checkHitWalls(); //壁反発する
  accelerateBall(); //円を加速する
}
void mouseDragged(){
  centerX = pmouseX; //ボールの位置は1つ前のフレームのカーソルの位置
  centerY = pmouseY; //とする
  dx = mouseX - pmouseX; //ボールの速度は、1つ前から現在のフレームまで
  dy = mouseY - pmouseY; //のカーソル移動量とする
}
void keyPressed(){
  float s = 1.2;
  if (key =='l') radius *= s;
  else if (key =='s') radius /= s;
  radius = min(max(1.0, radius), 200.0);
  diameter = radius * 2;
  println("直径：" + diameter);
}
