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

    //======================  users  ========================
  static const String users = "$server/users.php";

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

//======================  Orders  ========================
  static const String checkOut = "$server/orders/checkout.php";
  static const String pendingorders = "$server/orders/pending.php";
  static const String archiveorders = "$server/orders/archive.php";
  static const String ordersdetails = "$server/orders/details.php";
  static const String ordersdelete = "$server/orders/delete.php";

//======================  Notification  ========================
  static const String notification = "$server/notification.php";
  static const String deletenotification = "$server/notification/delete.php";


  //======================  Offers  ========================
  static const String offers = "$server/offers.php";
  static const String rating = "$server/rating.php";


  //========================= Payment Api ===============================
    //  https://accept.paymob.com/api/auth/tokens
  static const String baseurl = "https://accept.paymob.com/api";
  static const String apikey = "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RnME5qZzVMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuRXBOTVFpZGlIbmRzQUExQnBtOTVOYU92YXBwWExvZUh3Q3FTRzJKSlJueVhlRGFFRjBXVTlJVFpyUXJfT2ctLXRmMFNlWndpNXJ3Sk9qZkxQUEpqYWc=";
  static const String getauthtoken = "/auth/tokens";
  // https://accept.paymob.com/api/ecommerce/orders
  static const String getorderid = "/ecommerce/orders";
  // token اللي رجع هنخذنه في متغير بدل منعمل موديل لية لانه token فقط
  static  String paymentfirsttoken = "";
  //orderid اللي رجع هنخذنه في متغير بدل منعمل موديل لية لانه orderid فقط
  static  String paymentorderid = "";
  
  static const String cardPaymentMethodIntegrationId = "4609106";


}
