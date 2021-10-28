void setup(){
  size(500, 500);
  stroke(0);
}
void draw(){
  background(255);
  if (mousePressed) { //マウス押下時にtrue
    if (mouseButton == LEFT) {
      ellipse(mouseX, mouseY, 100, 100); //円を描画
    } else {
      // ×を描画
      line(mouseX - 50, mouseY - 50, mouseX + 50, mouseY + 50);
      line(mouseX + 50, mouseY - 50, mouseX - 50, mouseY + 50);
    }
  } else {
    ellipse(mouseX, mouseY, 10, 10);// 小さな円を描画
  }
}
