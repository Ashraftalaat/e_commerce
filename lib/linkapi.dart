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

  //======================  Auth  ========================

  static const String signup = "$server/auth/signup.php";
  static const String verfiycode = "$server/auth/verfiycode.php";

}
