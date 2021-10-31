size(500, 500);
colorMode(HSB, 360, 100, 100);
float step = 10; //三角形を回転させながら描く回数
fill(100, 50, 80, 60);
noStroke();
background(0, 0, 100);

for (float i = 0; i < TWO_PI; i += TWO_PI/step) {
  pushMatrix(); //元の座標系を記録する
  translate(width*0.5, height*0.5);//ウィンドウの中心に座標系を移動
  rotate(i);
  //移動した座標系の原点を三角形の中心として頂点を指定
  triangle(100, -50, -100, -50, 0, 100);//原点を中心として頂点を指定した三角形
  popMatrix();//もとの座標系に戻す
}
