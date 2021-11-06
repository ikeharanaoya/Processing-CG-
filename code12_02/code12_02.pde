//Soundライブラリの読み込み
import processing.sound.*;
//サウンドプレイヤー
SoundFile soundfile;

void setup() {
  //サウンドファイルを読み込んでプレイヤーを初期化
  //ファイル名は読み込んだサウンドファイル名に変更
  soundfile = new SoundFile(this, "sound.aiff");
  //ループ再生
  soundfile.loop();
}

void draw(){
  background(0);
  //マウスのx座標で再生スピードを設定
  float rate = map(mouseX, 0, width, 0.0, 2.0);
  //マウスのy座標で音量を設定
  float amp = map(mouseY, 0, height, 1.0, 0.0);
  //再生スピードを適用
  soundfile.rate(rate);
  //音量を適用
  soundfile.amp(amp);
}
