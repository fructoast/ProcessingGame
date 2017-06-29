//音楽ファイル使用のインポート
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

boolean alive;
boolean start;
Block block;
End end;
KeyController keyController;
Kid kid;
Map map;
Save save;
Sound sound;
Trap trap;

PImage title;
PImage gameover;
PImage tani;
PImage get_it;
PImage bg;

void setup() {
  size(1020, 700);
  imageMode(CENTER);

  block = new Block();
  end = new End();
  kid = new Kid();
  keyController = new KeyController();
  map = new Map();
  save = new Save();
  sound = new Sound();
  trap = new Trap();

  //alive状態にする
  alive = true;

  //titleの表示系統
  start = false;

  //音楽ファイルを読み込む
  minim = new Minim(this);
  bgm[0] = minim.loadFile("oo39_ys005.mp3"); //通常
  bgm[1] = minim.loadFile("oo39_ys063.mp3"); //死亡時
  bgm[2] = minim.loadFile("oo39_ys049.mp3"); //タイトル
  bgm[3] = minim.loadFile("oo39_ys028.mp3"); //end
  bgm[2].loop();
  se[0] = minim.loadFile("clap02.mp3"); //ジャンプ
  se[1] = minim.loadFile("magic02.mp3"); //セーブ
  se[2] = minim.loadFile("attack01.mp3"); //死亡
  se[3] = minim.loadFile("button25.mp3"); //アイテム取得
  //se[2] = minim.loadFile("tableware04.mp3"); //死亡

  //画像の読み込みと表示
  title = loadImage("title.png"); //タイトル
  image(title, 510, 350);
  gameover = loadImage("gameover.png"); //gameover
  tani = loadImage("tani.png"); //単位（アイテム）
  get_it = loadImage("get_it.png"); //get it 表示
  bg = loadImage("bg1.png");

  //blockを作成して、上下左右の判定をつくる
  block.make_block();
  block.set_xy();
}  

void keyPressed() {
  keyController.pressed(key, keyCode);
}

void keyReleased() {
  keyController.released(key, keyCode);
}

//”クリックで開始”を実現
void mousePressed() {
  //メイン処理
  start = true;
  //bgm再生
  bgm[2].close(); //スタート画面の音楽を停止
  bgm[0].loop();  //ループ再生開始
  //ロードする
  save.loading(); //マウスクリックで常時ロードとなる
}


//--------------------------------------------------------------------------------
//よく知らんがここで1fごとに実行するらしい                                          
//--------------------------------------------------------------------------------
void draw() {
  //クリックされたら始める
  if (start) {
    //アイテムが入手されたら停止する
    if (get == false) {

      background(170, 230, 255);


      fill(40, 240, 140);
      map.disp_bg();

      //ブロックの生成
      block.make_block();
      block.set_xy();

      //ブロックの描画
      for (bl_num=0; bl_num<bl_MAX; bl_num++) {
        block.disp(bl_x[bl_num], bl_y[bl_num]);
      }

      //thornの生成
      trap.make_thorn();
      trap.set_xy();

      //thornの描画
      trap.disp_thorn();

      //saveの作成
      save.make();

      //saveの描画
      save.disp_save();

      //trapの発動
      trap.move_thorn();

      //ロード
      if (keyPressed) { 
        if (key == 'r') {
          save.loading();
        }
      }

      //クリアアイテム
      end.item();


      //------------------------------------------------------------------------------------
      //生きている間だけ
      //------------------------------------------------------------------------------------
      if (alive == true) {
        //座標保存
        x_before = kid_x;
        y_before = kid_y;

        //セーブ動作
        save.saving();

        //左右移動
        kid.walk_right(); 
        kid.walk_left(); 

        //jump
        for (bl_num=0; bl_num<bl_MAX; bl_num++) {
          if (kid_y == bl_ground[bl_num]) {
            if (bl_left[bl_num] < kid_x) {
              if (kid_x < bl_right[bl_num]) {
                flag_jump = false; 
                flag_2ndjump = true;
                height = 0;
              }
            }
          }    
          kid.jump();
        }

        //めり込み判定
        kid.wall_out();
        //落ちる判定
        flag_fall = true;
        kid.fall_set();
        kid.fall();
        //突き抜け判定
        kid.lift_out();
        //床抜け判定
        kid.fall_out();

        //落下死
        if (700 <kid_y) {
          trap.death();
        }

        //自殺
        if (keyPressed) { 
          if (key == 'q') {
            trap.death();
          }
        }

        //trapのフラグ
        trap.flag_thorn();

        //デバッグ用ワープ
            if (keyPressed) { 
         if (key == 'w') {
         kid_x = 980;
         kid_y = 300;
         }
         }
        

        //死亡判定
        trap.death_thorn();

        //map番号管理
        map_num_before = map_num;

        //map移動
        map.change();

        //デバッグ
        /*if(map == 1){
         if(630 > kid_y){
         */

        //自機の描画
        kid.display(kid_x, kid_y);
      } else {
        //-----------------------------------------------------------------------------
        //死んでいる時だけ
        //-----------------------------------------------------------------------------
        //血飛沫
        kid.death();

        //gameover表示
        image(gameover, 510, 350);
      }
    } else {
      //最後画面の処理
      end.disp();

      //終了コマンド
      if (mousePressed) {
        exit();
      }
    }
  }
}

void  stop() {
  int i;
  for (i=0; i<bgm_MAX; i++) {
    bgm[i].close();  //  AudioPlayerの機能を終了する
  }
  for (i=0; i<se_MAX; i++) {
    se[i].close();  //  AudioPlayerの機能を終了する
  }
  minim.stop();  //  Minimの機能を停止する
  super.stop();  //  停止の際のおまじない
}

