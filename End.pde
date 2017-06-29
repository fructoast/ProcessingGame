PImage ending;
boolean get;
class End {

  End() {
    get = false;
    ending = loadImage("end.png");
  }

  //クリアアイテム取得
  void item() {
    if (map_num == 3) { //最終ステージで
      if (get == false) {  //取得するまで
        image(tani, 530, 310);
        image(get_it, 530, 280);
      }
      if (525<kid_x&&kid_x<535&&305<kid_y&&kid_y<315) {
        get =true;
        se[3].play();
      }
    }
  }


  void disp() {
    image(ending, 510, 350);

    bgm[0].close();

    bgm[3].play();
  }
}
