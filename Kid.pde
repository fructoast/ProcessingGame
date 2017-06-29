int kid_x, kid_y;
int x_before, y_before;
int jump_st;
double height;
boolean flag_jump, flag_2ndjump, flag_fall;
double dead_sec;

class Kid {
  PImage img;
  PImage[] blood = new PImage[5];

  Kid() {
    //自機の初期位相
    kid_x = 100;
 
    kid_y = 590;

    keyController = new KeyController();
    img = loadImage("kid.png");
    blood[0] = loadImage("blood0.png");
    blood[1] = loadImage("blood1.png");
    blood[2] = loadImage("blood2.png");
    blood[3] = loadImage("blood3.png");
    blood[4] = loadImage("blood4.png");   
    dead_sec = 0;

    //jump関係の処理
    height = 0;
    flag_jump = false;
    flag_2ndjump = true;
  }

  void display(int kid_x, int kid_y) {
    image(img, kid_x, kid_y);
  }

  void walk_right() {
    keyController.walk_right();
  }
  void walk_left() {
    keyController.walk_left();
  }  
  void jump() {
    keyController.jump();
  }

  //落ちている判定のセットアップ
  void fall_set() {
    for (bl_num=0; bl_num<bl_MAX; bl_num++) {
      //自機のいるｘ座標上で、
      if (bl_left[bl_num] < kid_x) {
        if (kid_x < bl_right[bl_num]) {
          //ひとつでも地面と接していたら、落ちていないということにする
          if (bl_ground[bl_num]  == kid_y) {
            flag_fall = false;
          }
        }
      }
    }
  }

  //落ちている判定をする
  void fall() {
    for (bl_num=0; bl_num<bl_MAX; bl_num++) {
      //落ちているならば、
      if (flag_fall == true) {
        //空中にいるとする
        flag_jump = true;
      }
    }
  }
  //かべの　なかに　いないように
  void wall_out() {
    for (bl_num=0; bl_num<bl_MAX; bl_num++) {
      //座標が変化したとき、
      if (kid_x != x_before) {
        //自機のｙ座標がblock内にあり、
        if (bl_ground[bl_num] < kid_y) {
          if (kid_y < bl_top[bl_num] ) {
            //x座標についても同様のとき、
            if (bl_left[bl_num]-1 < kid_x+2) {
              if (kid_x-2 < bl_right[bl_num]+1) {
                kid_x = x_before;
              }
            }
          }
        }
      }
    }
  }


  //落ちないように
  void fall_out() {
    for (bl_num=0; bl_num<bl_MAX; bl_num++) {
      //座標が変化したとき、
      if (kid_y != y_before) {
        //さっきまでは土地の上にいて、
        if (y_before < bl_ground[bl_num]) {
          //自機のｙ座標がblock内にあり、
          if (bl_ground[bl_num] < kid_y) {
            if (kid_y < bl_top[bl_num] ) {
              //x座標についても同様で、
              if (bl_left[bl_num]+3 < kid_x) {
                if (kid_x < bl_right[bl_num]-3) {
                  //下降しているとき
                  if (height < 0) {
                    kid_y = bl_ground[bl_num];
                    flag_jump = false;
                    height = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  void lift_out() {
    //突き抜けないように
    for (bl_num=0; bl_num<bl_MAX; bl_num++) {
      //blockを超さないようにする
      //座標が変化したとき、
      if (kid_y != y_before) {
        //空中にいて、
        if (flag_jump == true) {
          //現在のｘ軸上の場所で、
          if (bl_left[bl_num] < kid_x) {
            if (kid_x < bl_right[bl_num]) {
              //直前まで該当するblockのtopの下にいて、
              if (bl_top[bl_num] <= y_before) {
                if (y_before < bl_top[bl_num]+20) {
                  //現在該当するblockのtopを超すなら、
                  if (kid_y < bl_top[bl_num]) {      
                    kid_y = bl_top[bl_num];
                    if (0 < height) {
                      height = 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  //死亡時のエフェクト
  void death() {
    if (dead_sec < 5) {
      image(blood[(int)dead_sec], kid_x, kid_y);
      dead_sec += 0.34;
    }
  }
}