void setup(){
  size(300, 300, P3D); //3Dモード
  noStroke();
  frameRate(60);
}

void draw(){
  background(0);
  
  //デフォルトのライトを定義
  lights();
  
  translate(0, height/2, -height/2); //原点を移動
  fill(158);
  box(50);
  
  translate(width, 0, 0); //原点をさらに移動
  fill(255);
  sphere(50); //描画するボックスの大きさは上記と同じ
}
