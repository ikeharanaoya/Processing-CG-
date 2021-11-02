float R = 400; //バネの長さ
float weightWidth = 100; //おもりの幅
float weightHeight = 100; //おもりの高さ
float y; //おもりの位置及びバネの長さ
int max = 600; //おもりのy方向の最大値
int min = 200; //おもりのy方向の最小値
boolean movable = false; //ドラック可能かどうかを表す

void setup() {
  size(500, 800);
  rectMode(CENTER);
  stroke(255);
  strokeWeight(5);
  y = R; //初期のバネの長さ（おもりのy）は自然長
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
