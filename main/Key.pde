class Key {
  String name; // キーの名前
  char key; // keyの値
  int keyCode; // keyCodeの値
  boolean isPressed; // 押されているか否か

  // コンストラクタ
  Key(String tempName, char tempKey, int tempKeyCode) {
    name = tempName;
    key = tempKey;
    keyCode = tempKeyCode;
    isPressed = false;
  }

  // 引数で指定されたキーと一致するかどうかを判定
  boolean equals(char tempKey, int tempKeyCode) {
    if (tempKey != CODED) {
      if (key == tempKey) {
        return true;
      } else {
        return false;
      }
    } else {
      if (keyCode == tempKeyCode) {
        return true;
      } else {
        return false;
      }
    }
  }

  // 引数で指定されたキーが押された
  void pressed(char tempKey, int tempKeyCode) {
    if (equals(tempKey, tempKeyCode) == true) {
      isPressed = true;
    }
  }

  // 引数で指定されたキーが離された
  void released(char tempKey, int tempKeyCode) {
    if (equals(tempKey, tempKeyCode) == true) {
      isPressed = false;
    }
  }


  //-------移動の操作をする--------
  void walk_right() {
    if (isPressed == true) {
      kid_x += 4;
    }
  }

  void walk_left() {
    if (isPressed == true) {
      kid_x -= 4;
    }
  }


  //ジャンプ操作
  void jump() {
    boolean only_jumped = false;

    //1度だけとさっきまでの　
    if (bl_num == 0) {
      only_jumped = true;
    }

    //上昇量を減らしていく
    if (only_jumped == true) {  
      if (flag_jump == true) {
        if (-15 < height) {
          height -= 0.7;
        }
      }
    }

    //ジャンプ
    if (isPressed == true) {
      if (flag_jump == false) {
        if (kid_y == bl_ground[bl_num]) {
          if (bl_left[bl_num] < kid_x) {
            if (kid_x < bl_right[bl_num]) {
              height = 10;
              flag_jump = true;
              se[0].play();
              se[0].rewind();
            }
          }
        }
      }

      //2段ジャンプ
      if (flag_jump == true) {
        if (flag_2ndjump == true) {
          if (height <= 0) {
            height = 10;
            flag_jump = true;
            flag_2ndjump = false;
            se[0].play();
            se[0].rewind();
          }
        }
      }
    }

    //1fにつき一回だけｙ座標を変化させる
    if (only_jumped == true) { 
      kid_y -= height;
    }
  }
}