PImage baseImg; //PImage型の画像の変数を用意する
PImage stamp;

void setup() {
  //画像を読み込む
  baseImg = loadImage("scene.jpg");
  stamp = loadImage("stamp.png");
  size(640, 480);
  //size(baseImg.width, baseImg.height);
  image(baseImg, 0, 0); //baseImg画像を(0, 0)に表示する
}
void draw() {
}
void mousePressed() {
  //スタンプ画像の中心をクリックした場所にする
  imageMode(CENTER);
  //クリックした場所にスタンプ画像を表示
  image(stamp, mouseX, mouseY);
}
