float centerX = 30.0;
float centerY = 70.0;
float dx = 10.0; //毎フレームのボール水平方向の移動量（水平速度）
float dy = 0.0; //毎フレームのボール垂直方向の移動量（垂直速度）
float radius = 25.0; //ボールの半径
float diameter = radius * 2.0; //ボールの直径
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
void moveBall(){
  centerX += dx; //円の中心を右に移動する
  centerY += dy; //円の中心を下に移動する
}
void bounceBall(){
  float centerYLowest = height - radius; //ボールが床に接しているときのボール中心のy座標
  if (centerY < centerYLowest) return; //床より上に浮いていれば何もしない
  centerY = centerYLowest; //中心高さを調整しボールが床に接するようにする
  dy = -dy; //速度を下向き（正のdy）から上向き（負のdy）に変更する
  applyFriction(); //実際に弾む場合のみ摩擦力を適用する
}
void applyFriction(){
  float frictionX = 0.2; //摩擦力により水平方向速度を減速させる量
  if (abs(dx) < frictionX) dx = 0.0; //水平速度が十分小さければ止めてしまう
  else if (dx < 0.0) dx += frictionX; //左向きの場合は右向きに減速
  else dx -= frictionX; //右向きの場合は左向きに減速
}
void checkHitWalls(){
  float left = radius; //左の壁に当たったときの中心位置x座標
  float right = width - radius; //右の壁に当たったときの中心位置x座標
  if (centerX < left) { //左の壁に当たったら
    centerX = left;
    dx = -dx;
  } else if (right < centerX) { //右の壁に当たったら
    centerX = right;
    dx = -dx;
  }
}
void accelerateBall(){ 
  float gravity = 10.0; //1フレーム辺の重力加速度に相当する画素数
  dy += gravity; //下向きに加速する
}
void drawBall(){ //MVCのViewの処理
  ellipse(centerX, centerY, diameter, diameter);
}
void mouseDragged(){
  centerX = pmouseX; //ボールの位置は1つ前のフレームのカーソルの位置
  centerY = pmouseY; //とする
  dx = mouseX - pmouseX; //ボールの速度は、1つ前から現在のフレームまで
  dy = mouseY - pmouseY; //のカーソル移動量とする
}
