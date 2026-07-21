import 'package:intl/intl.dart';

abstract class AppLocalization {
  static bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }
}
