// enum لتحديد قيم محددة وثابتة
enum StatusRequest {
  // وقت التحميل
  loading,
  // النجاح وظهور الداتا
  success,
  // no data في حالة البحث  في عمود عن شئ مش موجود
  failure,
  // كتابة لينك خطأ
  serverfailure,
  // لايوجد اتصال بالنت
  offlinefailure
}
