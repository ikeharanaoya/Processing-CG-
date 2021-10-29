float centerX = 30.0; //ボール中心のx座標とうい状態を格納するグローバル変数
float centerY = 70.0; //ボール中心のy座標という状態を格納するグローバル変数
float dx = 10.0; //毎フレームのボール水平方向の移動量（水平速度）
float radius = 25.0; //ボールの半径
float diameter = radius * 2.0; //ボールの直径
void setup(){
  size(800, 600);
}
void draw(){
  background(128); //ウィンドウの描画領域全体（背景）を灰色でクリアする
  drawBall();
  moveBall(); //ボールを移動する
}
void drawBall(){
  ellipse(centerX, centerY, diameter, diameter);
}
void moveBall(){
  centerX += dx; //円の中心を右に10画素移動する  
}
void mousePressed(){// マウスボタンが押されるたびに１回呼び出される
  centerX = mouseX; //状態の変更。カーソル一のx座標を円中心x座標とする
  centerY = mouseY; //状態の変更。カーソル一のy座標を円中心y座標とする
}
