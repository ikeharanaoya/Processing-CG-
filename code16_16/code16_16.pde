ArrayList<PVector> ps = new ArrayList<PVector>();// 自由粒子
ArrayList<PVector> c_ps = new ArrayList<PVector>();// 結晶化粒子

final color RED = color(255, 0, 0);
final color BLACK = color(0);

void setup() {
  size(256, 256);
  set(width / 2, height / 2, color(255, 0, 0));
  for (int i = 0; i < 20000; i++) {
    ps.add(new PVector((int)random(width - 5) + 2,
     (int)random(height - 5) + 2));
  }
}

void draw(){
  background(255);
  set(width/2, height/2, RED);

  loadPixels();
  for(int i =0; i < ps.size(); i++){
    PVector p = ps.get(i);
    int x = (int)(p.x);
    int y = (int)(p.y);
    pixels[y*width+x] = BLACK;// 自由粒子の描画
  }
  for(int i =0; i < c_ps.size(); i++){
    PVector p = c_ps.get(i);
    int x = (int)(p.x);
    int y = (int)(p.y);
    pixels[y*width+x] = RED;// 結晶化粒子の描画
  }
  updatePixels();

  randomMove();// 隣接ピクセルへの移動
  crystalize();
}

void randomMove(){
  for(int i =0; i < ps.size(); i++){
    //枠外では上下左右をループ
    PVector p = ps.get(i);
    p.x += (int)random(3)-1;// -1か0か1を加算
    p.y += (int)random(3)-1;
    p.x = (p.x-1+(width-2))%(width -2)+1;// 0なら254,255なら1
    p.y = (p.y-1+(height-2))%(height-2)+1;
  }
}

void crystalize(){
  loadPixels();
  for(int i = ps.size()-1; i>=0; i--){
    PVector p = ps.get(i);
    int x = (int)(p.x);
    int y = (int)(p.y);
    color c0 = pixels[y*width+x-1];
    color c1 = pixels[y*width+x+1];
    color c2 = pixels[y*width+x-height];
    color c3 = pixels[y*width+x+height];
    if(c0 == RED || c1 == RED || c2 == RED || c3 == RED){
      c_ps.add(new PVector(x, y));
      ps.remove(i);
    }
  }
  updatePixels();
}