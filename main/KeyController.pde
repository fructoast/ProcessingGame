 // ゲームに使うキーのコントローラーのクラス
class KeyController {
  Key upKey, downKey, leftKey, rightKey, shiftKey; // 使用するキー
  Key[] keys; // キーを入れる配列

  KeyController() 
  {
    // キーを作る
    leftKey  = new Key("LEFT", (char)CODED, LEFT);
    rightKey = new Key("RIGHT", (char)CODED, RIGHT);
    shiftKey   = new Key("SHIFT", (char)CODED, SHIFT);
   

    // 作ったキーを登録する
    keys = new Key[3];
    keys[0] = leftKey;
    keys[1] = rightKey;
    keys[2] = shiftKey;
  }

  // 引数で指定されたキーが押された
  void pressed(char tempKey, int tempKeyCode) {
    // 全キーに引数で指定されたキーが押されたことを通知
    for (int i = 0; i < keys.length; i++) {
      keys[i].pressed(tempKey, tempKeyCode);
    }
  }

  // 引数で指定されたキーが押された
  void released(char tempKey, int tempKeyCode) {
    // 全キーに引数で指定されたキーが離されたことを通知
    for (int i = 0; i < keys.length; i++) {
      keys[i].released(tempKey, tempKeyCode);
    }
  }

  //キーに対応した動作をする
  void walk_right() {
    rightKey.walk_right();
  }

  void walk_left() {
    leftKey.walk_left();
  }

  void jump() {
    shiftKey.jump();
  }
}