import 'package:get/get.dart';

class FavoriteController extends GetxController {
  // key => id items
// value => 1 or 0
// يعني عند فتح صفحة items هتتملي كل items = 1 و 0 في Map
  Map isFavorite = {};
//عند الضغط علي الزر
// هياخد id بتاع المنتج و اللي حقل المفضلة قيمته سواء 1 او 0
  setFavorite( id,String val) {
    // Map favrite = {} ;
// favorite['2'] = 1
// favorite['5'] = 0
// اذن
// favorite
// {
//  2 : 1 ,
//  5 : 0
// }
    isFavorite['id'] = val;
    update();
  }
}
