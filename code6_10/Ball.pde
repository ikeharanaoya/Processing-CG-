class Ball {
  protected float centerX = 30.0;
  protected float centerY = 70.0;
  protected float dx = 0.0; //毎フレームのボール水平方向の移動量（水平速度）
  protected float dy = 0.0; //毎フレームのボール垂直方向の移動量（垂直速度）
  protected float radius = 25.0; //ボールの半径
  protected float diameter = radius * 2.0; //ボールの直径
  protected color col = color(70);

  void draw() { //MVCのViewの処理
    fill(col); //ボールの色を暗い灰色に設定
    ellipse(centerX, centerY, diameter, diameter);
    drawHightLight(); //ボールに映り込む擬似的なハイライトを描画
  }
  void update() { //MVCのModelの処理
    move(); //ボールを移動する
    checkBounceFloor(); //ボールを検査し床バウンド処理を行う
    checkHitWalls(); //ボールを検査し壁打ち処理を行う
    accelerate(); //ボールを加速する
  }
  void drawHightLight() {
    fill(255); //白に設定
    float hlCenterX = centerX;
    float hlCenterY = centerY - radius / 1.4;
    float hlXSize = radius / 2.5;
    float hlYSize = hlXSize / 1.3;
    ellipse(hlCenterX, hlCenterY, hlXSize, hlYSize);
  }
  void move() {
    centerX += dx; //円の中心を右に移動する
    centerY += dy; //円の中心を下に移動する
  }
  void applyFriction() {
    float frictionX = 0.2; //摩擦力により水平方向速度を減速させる量
    if (abs(dx) < frictionX) dx = 0.0; //水平速度が十分小さければ止めてしまう
    else if (dx < 0.0) dx += frictionX; //左向きの場合は右向きに減速
    else dx -= frictionX; //右向きの場合は左向きに減速
  }
  void checkBounceFloor() {
    float centerYLowest = height - radius; //ボールが床に接しているときのボール中心のy座標
    if (centerY < centerYLowest) return; //床より上に浮いていれば何もしない
    centerY = centerYLowest; //中心高さを調整しボールが床に接するようにする
    dy = -dy; //速度を下向き（正のdy）から上向き（負のdy）に変更する
    applyFriction(); //実際に弾む場合のみ摩擦力を適用する
  }
  void checkHitWalls() {
    float left = radius; //左の壁に当たったときの中心位置x座標
    float right = width - radius; //右の壁に当たったときの中心位置x座標
    if (centerX < left) { //左の壁に当たったら
      centerX = left;
      dx = -dx;
    } else if (right < centerX) { //右の壁に当たったら
      centerX = right;
      dx = -dx;
    }
  }
  void accelerate() { 
    float gravity = 10.0; //1フレーム辺の重力加速度に相当する画素数
    dy += gravity; //下向きに加速する
  }
  void setCenter(float x, float y) {
    centerX = x;
    centerY = y;
  }
  void setVelocity(float x, float y) {
    dx = x;
    dy = y;
  }
  void setRadius(float r){
    radius = r;
    diameter = radius * 2.0;
  }
  void changeSize(int k) {
    float s = 1.2;
    if (k =='l') radius *= s;
    else if (k =='s') radius /= s;
    radius = min(max(1.0, radius), 200.0);
    diameter = radius * 2;
    println("直径：" + diameter);
  }
}
