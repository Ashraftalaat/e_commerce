class AppLinkApi {
  // في حالة الشغل علي localhost
  // هندخل علي CMD
  // ونكتب ipconfig
  // وننسخ IPv4 Address
  // ونضعها بدل localhost
  //http بدل https
  static const String server = "http://192.168.1.4/ecommerce";
  //في حالة host
  //static const String server = "https://ashraftalaat.infinityfreeapp.com/ecommerce";

  static const String test = "$server/test.php";

  //======================= Svg Image ==================
  static const String imagestatic = "http://192.168.1.4/ecommerce/upload";
  static const String imagestcategories = "$imagestatic/categories";
  static const String imagestitems = "$imagestatic/items";

  //======================  Auth  ========================
  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verfiycodesignup = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";

  //======================  ForgetPassword  ========================
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";

  //======================  Home  ========================
  static const String home = "$server/home.php";

  //======================  Items  ========================
  static const String items = "$server/items/items.php";
  static const String searchitems = "$server/items/search.php";

  //======================  favorite  ========================
  static const String addfavorite = "$server/favorite/add.php";
  static const String removefavorite = "$server/favorite/remove.php";
  static const String myfavoriteview = "$server/favorite/view.php";
  static const String deletefromfav = "$server/favorite/deletefromfavorite.php";

  //======================  Cart  ========================
  static const String addcart = "$server/cart/add.php";
  static const String deletecart = "$server/cart/delete.php";
  static const String cartview = "$server/cart/view.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";

  //======================  Address  ========================
  static const String addressview = "$server/address/view.php";
  static const String addressadd = "$server/address/add.php";
  static const String addressedit = "$server/address/edit.php";
  static const String addressdelete = "$server/address/delete.php";

  //======================  Coupon  ========================
  static const String checkcoupon = "$server/coupon/checkcoupon.php";


}
