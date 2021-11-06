//Soundライブラリの読み込み
import processing.sound.*;
//サウンド入力
AudioIn input;
//音量解析
Amplitude rms;

void setup(){
  size(800, 600);
  fill(0, 127, 255);
  noStroke();
  //サウンド入力を初期化
  input = new AudioIn(this, 0);
  //サウンド入力を開始
  input.start();
  //音量解析を初期化
  rms = new Amplitude(this);
  //音量解析の入力を設定
  rms.input(input);
}

void draw(){
  background(0);
  //音量を解析して値を調整
  float diameter = map(rms.analyze(), 0.0, 1.0, 0.0, width);
  //取得した音量で円を描く
  ellipse(width/2, height/2, diameter, diameter);
}
