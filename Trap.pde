int th_MAX = 14;
int[] th_x = new int[th_MAX], th_y = new int[th_MAX];
int[] th_top = new int[bl_MAX], th_ground = new int[th_MAX];
int[] th_right = new int[th_MAX], th_left = new int[th_MAX];
int tr_1st, tr_2nd;
int th_num;
boolean[] flag_trap = new boolean[10]; 
int trap_before;
class  Trap {

  PImage image_thorn, image_thorn_b, image_thorn_c, image_thorn_d;

  Trap() {
    image_thorn = loadImage("thorn.png");
    image_thorn_b = loadImage("thorn_b.png");
    image_thorn_c = loadImage("thorn_c.png");
    image_thorn_d = loadImage("thorn_d.png");
    ;
    tr_1st = 4;
    tr_2nd = 7;
    th_num = 0;

    int i;
    for (i=0; i<10; i++) {
      flag_trap[i] = false;
    }

    //trapを作成して、上下左右の判定をつくる
    make_thorn();
    set_xy();
  }


  //thornのx,y座標を入力
  void make_thorn() {
    //mapが変わったら再構成
    if (map_num_before != map_num) {
      int i;
      //--------------------------------------------
      if (map_num == 0) {
        //0~3を使用、生成
        tr_1st = 4;
        th_x[0] = 270; 
        th_y[0] = 590;
        th_x[1] = 410; 
        th_y[1] = 590;
        th_x[2] = 430; 
        th_y[2] = 590;
        th_x[3] = 630; 
        th_y[3] = 590;
        th_x[4] = 650; 
        th_y[4] = 590;
        th_x[5] = 670; 
        th_y[5] = 590;
        th_x[6] = 690; 
        th_y[6] = 590;
        th_x[7] = 710; 
        th_y[7] = 590;
        th_x[8] = 730; 
        th_y[8] = 590;
        //残り
        for (i=9; i<th_MAX; i++) {
          th_x[i] = -100;
          th_y[i] = -100;
        }
      }//---------------------------------------------
      else if (map_num == 1) {
        th_x[0] = 630;
        th_y[0] = 590;
        th_x[1] = 650;
        th_y[1] = 590;
        th_x[2] = 670; 
        th_y[2] = 590;
        th_x[3] = 690; 
        th_y[3] = 590;
        th_x[4] = 350;
        th_y[4] = 710;
        //残り
        for (i=5; i<th_MAX; i++) {
          th_x[i] = -100;
          th_y[i] = -100;
        }
      }//-------------------------------------
      else if (map_num ==2) {
        th_x[0] = 230;
        th_y[0] = 230;
        th_x[1] = 250;
        th_y[1] = 230 ;
        th_x[2] = 270;
        th_y[2] = 230;
        th_x[3] = 310;
        th_y[3] = 150;
        th_x[4] = 330;
        th_y[4] = 150;
        th_x[5] = 350;
        th_y[5] = 150;
        th_x[6] = 450;
        th_y[6] = 230;
        th_x[7] = 470;
        th_y[7] = 230;
        th_x[8] = 490;
        th_y[8] = 230;
        th_x[9] = 510;
        th_y[9] = 230;
        th_x[10] = 990;
        th_y[10] = 230;
        th_x[11] = 630;
        th_y[11] = 430;
        th_x[12] = 630;
        th_y[12] = 450;
        th_x[13] = 630;
        th_y[13] = 470;

        for (i=14; i<th_MAX; i++) {
          th_x[i] = -100;
          th_y[i] = -100;
        }//---------------------------------------------------
      } else if (map_num == 3) {
        for (i=0; i<th_MAX; i++) {
          th_x[i] = -100;
          th_y[i] = -100;
        }
      }


      /*
      for (i=0; i<tr_1st; i++) {
       th_x[i] = 330 + i*20 ;        
       th_y[i] = 590;
       }*/
      /*
        for (i=tr_1st; i<tr_2nd; i++) {
       th_x[i] = 390 + i*20;
       th_y[i] = 590;
       }*/
    }
  }


  //thornの端点を作成
  void set_xy() {  
    //mapが変わったら再構成
    if (map_num_before != map_num) {
      for (th_num=0; th_num<th_MAX; th_num++) {
        th_right[th_num] = th_x[th_num] + 20;
        th_left[th_num] = th_x[th_num] - 20;
        th_top[th_num] = th_y[th_num] + 20;
        th_ground[th_num] = th_y[th_num] - 20;
      }
    }
  }

  //trapのフラグ
  void flag_thorn() {
    if (map_num==1 && 260<kid_x && kid_x<340) {
      flag_trap[1] = true;
    }
    if (map_num==2 && 770<kid_x && kid_x<810) {
      flag_trap[0] = true;
    }
  }

  //trapの発動
  void move_thorn() {
    if (flag_trap[0] == true) {
      if (-30 <th_x[10] ) {
        trap_before = th_x[10];
        th_x[10] -= 8;
        if (th_x[10]-10<kid_x && kid_x<trap_before+10 && 225<kid_y && kid_y<235)
        {
          death();
        }
      }
    } else if (flag_trap[1] == true) {
      if (-30 <th_y[4]) {
        trap_before = th_y[4];
        th_y[4] -= 12;
        if (th_y[4]-10<kid_y && kid_y<trap_before+10 || kid_y == th_y[4]) {
          if (th_x[4]-10<kid_x && kid_x<th_x[4]+10) {
            death();
          }
        }
      } else {
        flag_trap[1] = false;
      }
    }
  }


  //trapの描画
  void disp_thorn() {
    for (th_num=0; th_num<th_MAX; th_num++) {
      if (map_num==2) {
        if (th_num==3 || th_num==4 || th_num==5) {
          //180°反転使用
          image(image_thorn_b, th_x[th_num], th_y[th_num]);
        } else if ( th_num==10) {
          //左向き
          image(image_thorn_c, th_x[th_num], th_y[th_num]);
        } else if (th_num==11 || th_num==12 || th_num==13) {
          //右向き
          image(image_thorn_d, th_x[th_num], th_y[th_num]);
        } else {
          //通常
          image(image_thorn, th_x[th_num], th_y[th_num]);
        }
      } else {
        //通常
        image(image_thorn, th_x[th_num], th_y[th_num]);
      }
    }
  }

  //trapの死亡判定
  void death_thorn() {
    for (th_num=0; th_num<th_MAX; th_num++) {
      //自機のｙ座標がだいたいthorn内にあり、
      if (th_ground[th_num]+5 < kid_y) {
        if (kid_y < th_top[th_num] ) {
          //x座標についても同様のとき、
          if (th_left[th_num] < kid_x) {
            if (kid_x < th_right[th_num]) {
              death();
            }
          }
        }
      }
    }
  }



  //死亡時の動作
  void death() {
    alive = false;
    //bgm
    bgm[0].pause();
    bgm[1].play();
    //se
    se[2].play();
    se[2].rewind();
  }
}
