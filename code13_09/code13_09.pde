void setup(){
  size(320, 240, P3D); //3Dモード
  frameRate(60);
  noStroke(); //枠線は描画しない
}

void draw(){
  background(0);
  //デフォルトでは白色の球を環境光によって色を変える
  float r = map(mouseX, 0, width, 0, 255);
  ambientLight(r, 255, 255);
  translate(width/2, height/2, 0);
  sphere(30);
}
