int x_save, y_save;
int save_map;
int save_MAX = 3;
boolean[] save_on = new boolean[save_MAX];
double limit;

class Save {
  PImage[] image_save = new PImage[2];

  int[] save_x = new int[save_MAX] ;
  int[] save_y = new int[save_MAX];

  Save() {
    image_save[0] = loadImage("savenow.png");
    image_save[1] = loadImage("save.png");
    save_x[0] = -100;
    save_y[0] = -100;
    //自機位相のセーブ
    x_save = kid_x;
    y_save = kid_y-1;
    save_map = 0;
    int i;
    for (i=0; i<save_MAX; i++) {
      save_on[i] = false;
    }
    limit = 1;
  }

  void make() {
    //mapが変わったら再構成
    if (map_num_before != map_num) {
      int i;
      if (map_num == 0) {
        for (i=0; i<save_MAX; i++) {
          save_x[i] = -100;
          save_y[i] = -100;
        }
      }
      //--------------------------------------------
      else if (map_num == 1) {
        save_x[0] = 90;
        save_y[0] = 510;
        for (i=1; i<save_MAX; i++) {
          save_x[i] = -100;
          save_y[i] = -100;
        }
      }//---------------------------------------------
      else if (map_num == 2) {
        save_x[0] = 50;
        save_y[0] = 510;
        save_x[1] = 930;
        save_y[1] = 270;
        for (i=2; i<save_MAX; i++) {
          save_x[i] = -100;
          save_y[i] = -100;
        }
      }//---------------------------------------------
      else if (map_num == 3) {
        for (i=0; i<save_MAX; i++) {
          save_x[i] = -100;
          save_y[i] = -100;
        }
      }
    }
  }


  //saveを表示
  void disp_save() {
    int i = 0;
    for (i=0; i<save_MAX; i++) {
      image(image_save[(int)limit], save_x[i], save_y[i]);
      if (save_on[i] == true) {
        limit -= 0.06;
        if ( limit < 0) {
          save_on[i] = false;
          limit = 1;
        }
      }


      /*
        image(image_save[1], save_x[i], save_y[i]);
       save_on[i] =false;
       } else {
       image(image_save[0], save_x[i], save_y[i]);
       }*/
    }
  }


  //saveをする
  void saving() {
    int i;
    for (i=0; i<save_MAX; i++) {
      //自機のｙ座標がsave上にあり、
      if (save_y[i]-10 < kid_y) {
        if (kid_y < save_y[i]+10 ) {
          //x座標についても同様のとき、
          if (save_x[i]-10< kid_x) {
            if (kid_x < save_x[i]+10) {
              x_save = save_x[i];
              y_save = save_y[i];
              save_map = map_num;
              save_on[i] = true;
              //se
              se[1].play();
              se[1].rewind();
            }
          }
        }
      }
    }
  }

  //復活、ローディング
  void loading() {

    kid_x = x_save;
    kid_y = y_save;
    alive = true;
    flag_jump = false;
    flag_2ndjump = false;
    flag_fall = false;
    map.change_re();

    //trapのリセット
    int i;
    for (i=0; i<10; i++) {
      flag_trap[i] = false;
    }
    if (map_num ==1) {
      th_y[4] = 710;
    }
    if (map_num == 2) {
      th_x[10] = 990;
    }

    bgm[1].pause();
    bgm[1].rewind();
    bgm[0].loop();
    dead_sec = 0;
  }
}