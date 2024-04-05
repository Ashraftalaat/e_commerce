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
  static const String login = "$server/auth/login.php";
  static const String verfiycodesignup = "$server/auth/verfiycode.php";

  //======================  ForgetPassword  ========================
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String resetpassword = "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword = "$server/forgetpassword/verifycode.php";


}
