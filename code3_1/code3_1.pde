float x = 30.0; //変数xの宣言と値の初期化
void setup(){
  size(800, 600);
}
void draw(){
  drawCircle();
}
void drawCircle(){
  ellipse(x, 70.0, 50.0, 50.0); //変数xの値を利用。半径２５の円を描く。
  x += 60.0; //変数xの値の増加
}
