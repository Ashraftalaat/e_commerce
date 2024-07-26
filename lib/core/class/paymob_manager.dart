import 'package:dio/dio.dart';
import 'package:e_commerce/linkapi.dart';

class PaymobManager {
  // ميثود لجلب PaymentKey هتحتاج مبلغ المال و نوع العملة
  Future<String> getPaymentKey(int amount, String currency, String firstname,
      String lastname, String email, String phone) async {
    try {
      // 1-  authanticationKey
      String authanticationKey = await _getAuthanticationKey();

      // 2-  orderId
      int orderId = await _getOrderId(
          //authanticationKey اللي حبناه من الخطوة اللي فاتت
          authanticationKey: authanticationKey,
          //amount int  هنحولها String وهنضربها في 100 عشان هتبقي واحد
          amount: (100 * amount).toString(),
          currency: currency);

      // 3- paymentKey
      String paymentKey = await _getPaymentKey(
        authanticationKey: authanticationKey,
        orderId: orderId.toString(),
        amount: (100 * amount).toString(),
        currency: currency,
        firstname: firstname,
        lastname: lastname,
        email: email,
        phone: phone,
      );
      return paymentKey;
    } catch (e) {
      print("Exc============================");
      print(e.toString());
      // يعني لو حصل Exceptionمترجعش حاجة خالص
      throw Exception();
    }
  }

  //مين اللي جاي يدفع
// اول خطوة هنرسل token الخاص بحسابي عشان نستقبل token الخاص auth
  Future<String> _getAuthanticationKey() async {
    final Response response =
        await Dio().post("https://accept.paymob.com/api/auth/tokens", data: {
      "api_key": AppLinkApi.apikey,
    });
    return response.data["token"];
  }

// عايز يدفع كام
  Future<int> _getOrderId({
    required String authanticationKey,
    required String amount,
    required String currency,
  }) async {
    final Response response = await Dio()
        .post("https://accept.paymob.com/api/ecommerce/orders", data: {
      "auth_token": authanticationKey, //from first Api
      "amount_cents": amount, //  String بتكون
      "currency": currency, // not required
      "delivery_needed": "false", // String مش  bool ملحوظة هامة
      "items": [], // list of map فيه نفاصيل المنتج من اسمه وعدده وسعره والخ
    });
    return response.data["id"]; //int
  }

  Future<String> _getPaymentKey({
    required String authanticationKey,
    required String orderId,
    required String amount,
    required String currency,
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
  }) async {
    final Response response = await Dio()
        .post("https://accept.paymob.com/api/acceptance/payment_keys", data: {
      // كلهم required
      //payment_key صالح لكام ثانية
      "expiration": 3600,
      'auth_token': authanticationKey, //from first Api
      'order_id': orderId, //from first Api <<String>>
      'integration_id': AppLinkApi
          .cardPaymentMethodIntegrationId, //INTEGRATION_ID الخاص payment Method في موقع paymop
      'amount_cents': amount,
      'currency': currency,
      // بعض المعلومات عن المستخدم
      'billing_data': {
        // القيم هنخدها من textform اللي هندخلها
        'first_name': firstname,
        'last_name': lastname,
        'email': email,
        'phone_number': phone,
        // مطلوبة لاكن هندخلها "NA" مش موجودة
        'apartment': 'NA',
        'floor': 'NA',
        'street': 'NA',
        'building': 'NA',
        'shipping_method': 'NA',
        'postal_code': 'NA',
        'city': 'NA',
        'country': 'NA',
        'state': 'NA',
      }
    });
    // احر خطوة بنحصل منها علي PaymentKey
    return response.data["token"]; //int
  }
}
