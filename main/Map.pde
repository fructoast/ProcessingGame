int map_MAX = 4;
int map_num = 0, map_num_before = 1;
int next_change;
class Map {

  void map() {
    map_num = 0;
    map_num_before = 1;
  }

  void disp_bg() {
    image(bg, 510, 350);
  }


  //map移動
  void change() {    
    if (1035 < kid_x ) {
      map_num++;
      kid_x = 6;
      kid_y -= 3;
      flag_trap[1] = false;
    }
    if (kid_x < 5) {
      if (0 < map_num) {
        map_num--;
        kid_x = 1034;      
        kid_y -= 3;
        flag_trap[1] = false;
      }
    }

    if (0 <= next_change) {
      map_num = save_map;
    }

    next_change = -1;
  }

  void change_re() {
    next_change = save_map;
  }
}