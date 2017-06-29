int bl_num, bl_MAX = 250;
int bl_1st=53, bl_2nd=83, bl_3rd, bl_4th, bl_5th, bl_6th, bl_7th, bl_8th, bl_9th;
int bl_10th, bl_11th, bl_12th, bl_13th;
int[] bl_x = new int[bl_MAX], bl_y = new int[bl_MAX];
int[] bl_top = new int[bl_MAX], bl_ground = new int[bl_MAX];
int[] bl_right = new int[bl_MAX], bl_left = new int[bl_MAX];

class Block {

  PImage image_1;

  Block() {
    image_1 = loadImage("block_1.png");
  }

  //blockのx,y座標を入力
  void make_block() {
    //mapが変わったら再構成
    if (map_num_before != map_num) {
      int i;
      //----------------------------------------
      if (map_num == 0) {
        //床と言える足場を作成、0~52使用
        bl_1st=53;
        for (i=0; i<bl_1st; i++) {
          bl_x[i] = -10 + i*20 ;        
          bl_y[i] = 610 ;
        }
        //壁,53~83
        bl_2nd=83;
        for (i=bl_1st; i<bl_2nd; i++) {
          bl_x[i] = 10;
          bl_y[i] = 590 - (i-bl_1st)*20;
        }
        //残り
        for (i=bl_2nd; i<bl_MAX; i++) {
          bl_x[i] = -100;
          bl_y[i] = -100;
        }
      } //------------------------------------
      else if (map_num == 1) {
        //床
        bl_1st = 10;
        for (i=0; i<bl_1st; i++) {
          bl_x[i] = -10 + i*20 ;        
          bl_y[i] = 610 ;
        }
        //島
        bl_2nd = 15;
        for (i=bl_1st; i<bl_2nd; i++) {
          bl_x[i] = 230 + (i-bl_1st)*20;
          bl_y[i] = 550;
        }
        //島
        bl_3rd = 20;
        for (i=bl_2nd; i<bl_3rd; i++) {
          bl_x[i] = 410 + (i-bl_2nd)*20;
          bl_y[i] = 450;
        }
        //島
        bl_4th = 50;
        for (i=bl_3rd; i<bl_4th; i++) {
          bl_x[i] = 630 + (i-bl_3rd)*20 ;        
          bl_y[i] = 610 ;
        }
        //残り
        for (i=bl_4th; i<bl_MAX; i++) {
          bl_x[i] = -100;
          bl_y[i] = -100;
        }
      }//-----------------------------------
      else if (map_num ==2) {
        //
        bl_1st = 6;
        for (i=0; i<bl_1st; i++) {
          bl_x[i] = -10 +i*20;
          bl_y[i] = 610;
        }
        //
        bl_2nd =32;
        for (i=bl_1st; i<bl_2nd; i++) {
          bl_x[i] = 10 ;
          bl_y[i] = 510 - (i - bl_1st)*20 ;
        }
        //
        bl_3rd = 83;
        for (i=bl_2nd; i<bl_3rd; i++) {
          bl_x[i] = 30 + (i-bl_2nd)*20 ;
          bl_y[i] = 10;
        }
        //
        bl_4th = 88;
        for (i= bl_3rd; i<bl_4th; i++) {
          bl_x[i] = 110+(i-bl_3rd)*20 ;
          bl_y[i] = 490;
        }
        //
        bl_5th = 91;
        for (i=bl_4th; i<bl_5th; i++) {
          bl_x[i] = 30 +(i-bl_4th)*20 ;
          bl_y[i] = 390;
        }
        //
        bl_6th = 124;
        for (i=bl_5th; i<bl_6th; i++) {
          bl_x[i] = 190+(i-bl_5th)*20 ;
          bl_y[i] = 250;
        }
        //
        bl_7th = 141;
        for (i=bl_6th; i<bl_7th; i++) {
          bl_x[i] = 190+(i-bl_6th)*20 ;
          bl_y[i] = 130;
        }
        //
        bl_8th =160;
        for (i=bl_7th; i<bl_8th; i++) {
          bl_x[i] = 1010 ;
          bl_y[i] = 30+(i-bl_7th)*20 ;
        }
        //
        bl_9th = 168;
        for (i=bl_8th; i<bl_9th; i++) {
          bl_x[i] = 1010-(i-bl_8th)*20 ;
          bl_y[i] = 390 ;
        }
        //
        bl_10th = 192;
        for (i=bl_9th; i<bl_10th; i++) {
          bl_x[i] = 610 ;
          bl_y[i] = 270 + (i-bl_9th)*20 ;
        }
        //
        bl_11th = 199;
        for (i=bl_10th; i<bl_11th; i++) {
          bl_x[i] = 1010-(i-bl_10th)*20 ;
          bl_y[i] = 470 ;
        }
        //残り
        for (i=bl_11th; i<bl_MAX; i++) {
          bl_x[i] = -100;
          bl_y[i] = -100;
        }
      }//---------------------------------------------------------------
      else if (map_num ==3) {
        //
        bl_1st=43;
        for (i=0; i<bl_1st; i++) {
          bl_x[i] = -30+i*20 ;
          bl_y[i] = 470 ;
        }
        //
        bl_2nd = 56;
        for (i=bl_1st; i<bl_2nd; i++) {
          bl_x[i] = 10+(i-bl_1st)*20 ;
          bl_y[i] = 390 ;
        }
        //
        bl_3rd = 73;
        for (i=bl_2nd; i<bl_3rd; i++) {
          bl_x[i] = 250 ;
          bl_y[i] = 370-(i-bl_2nd)*20 ;
        }
        //
        bl_4th = 101;
        for (i=bl_3rd; i<bl_4th; i++) {
          bl_x[i] = 250+(i-bl_3rd)*20 ;
          bl_y[i] = 50 ;
        }
        //
        bl_5th = 122;
        for (i=bl_4th; i<bl_5th; i++) {
          bl_x[i] = 810 ;
          bl_y[i] = 30 - (i-bl_5th)*20;
        }
        //
        bl_6th = 135;
        for (i=bl_5th; i<bl_6th; i++) {
          bl_x[i] = 670+(i-bl_6th)*20 ;
          bl_y[i] = 330  ;
        }




        //残り
        for (i=bl_6th; i<bl_MAX; i++) {
          bl_x[i] = -100;
          bl_y[i] = -100;
        }
      }
    }
  }

  //blockの端点を作成
  void set_xy() {  
    //mapが変わったら再構成
    if (map_num_before != map_num) {
      for (bl_num=0; bl_num<bl_MAX; bl_num++) {
        bl_right[bl_num] = bl_x[bl_num] + 20 ; 
        bl_left[bl_num] = bl_x[bl_num] - 20 ; 
        bl_top[bl_num] = bl_y[bl_num] + 20; 
        bl_ground[bl_num] = bl_y[bl_num] - 20;
      }
    }
  }

  //通常のblockを表示
  void disp(int bl_x, int bl_y) {
    image(image_1, bl_x, bl_y);
  }
}
