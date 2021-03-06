Ball ball;

void setup(){
  ball = new Ball();
  size(800, 600);
}
void draw(){
  background(128);
  update(); //状態変更（更新）をまとめて呼び出し
  ball.drawBall();
}
void update(){ //MVCのModelの処理
  ball.moveBall(); //円を移動する
  ball.bounceBall(); //円を床で弾ませる
  ball.checkHitWalls(); //壁反発する
  ball.accelerateBall(); //円を加速する
}
void mouseDragged(){
  ball.setCenter(pmouseX, pmouseY);
  ball.setVelociry(mouseX - pmouseX, mouseY - pmouseY);
}
void keyPressed(){
  float s = 1.2;
  if (key =='l') ball.radius *= s;
  else if (key =='s') ball.radius /= s;
  ball.radius = min(max(1.0, ball.radius), 200.0);
  ball.diameter = ball.radius * 2;
  println("直径：" + ball.diameter);
}
