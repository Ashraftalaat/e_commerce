import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "اختر اللغة",
          "2": " اختر المنتج",
          "3":
              "لدينا أكثر من 100 ألف منتج، اختر \n منتجك من متجر التجارة الإلكترونية \n الخاص بنا."
        },
        "en": {
          "1": "Chosse Language",
          "2": "Choose Product",
          "3":
              "We Have a 100k+Products Choose \n Your product from our E- \n commerce shop."
        }
      };
}
