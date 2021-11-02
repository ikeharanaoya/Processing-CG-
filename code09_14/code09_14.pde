float weightWidth = 100; //おもりの幅
float weightHeight = 100; //おもりの高さ
int max = 600; //おもりのy方向の最大値
int min = 200; //おもりのy方向の最小値
boolean movable = false; //ドラック可能かどうかを表す

// バネのシミュレーションのための定数
float K = 0.2; //バネ定数
float D = 0.92; //減衰
float R = 400; //自然長

// バネの長さ関連の初期値
float y = R; //バネの長さ＝自然長
float v = 0; //おもりの初期速度
float a = 0; //おもりの初期加速度
float f = 0; //バネの復元力F.自然長時は釣り合っているため0

void setup() {
  size(500, 800);
  rectMode(CENTER);
  stroke(255);
  strokeWeight(5);
}
void draw() {
  background(0);
  drawSpring();
}
void drawSpring() {
  if (movable) {
    // バネの長さをマウスドラッグにより指定
    y = mouseY;
    y = constrain(y, min, max);// バネの長さをminからmaxの間に制限
  } else {
    //バネの伸縮時の長さを求める
    f = -K * (y - R); // f= K * l
    a = f; //運動方程式F=ma. mを１とする
    v = v + a; //現在の速度＝前の速度＋加速度
    v = D * v; //また、抵抗を表現するために減衰させる
    y = y + v; //おもりの位置
  }
  line(width / 2, 0, width / 2, y); //バネを描く
  rect(width / 2, y, weightWidth, weightHeight); //おもりを描く
}
void mousePressed() {
  // おもりの上でマウスボタンを押したかどうか
  if (mouseX > width / 2 - weightWidth / 2 && mouseX < width / 2 + weightWidth / 2
    && mouseY > y - weightHeight / 2 && mouseY < y + weightHeight / 2) {
    movable = true;
  } else {
    movable = false;
  }
}

void mouseReleased() {
  //マウスボタンを離すとおもりは移動不可能
  movable = false;
}
