// import 'package:dio/dio.dart';
// import 'package:e_commerce/linkapi.dart';



// //عمل طلب POST ويحتوي على كائن JSON يحتوي على api_key
// // للدفع عبر paymob
// class DioHelper  {
//   // إنشاء كائن Dio
//   static late Dio dio;

//   static initDio() {
//     dio = Dio(
//       BaseOptions(
//           baseUrl: AppLinkApi.baseurl,
//           headers: {
//             'Content-Type': 'application/json',
//           },
//           receiveDataWhenStatusError: true),
//     );
//   }

//   //إرسال طلب POST
//   // باستحدام url, data
//   static Future<Response> postDataDio(
//       {required String url, Map<String, dynamic>? data}) async {
//     return await dio.post(url, data: data);
//   }
// }
