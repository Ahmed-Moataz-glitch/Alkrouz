// ignore_for_file: unintended_html_in_doc_comment

String formatNumber(String number) {
  final intValue = int.tryParse(number) ?? 0;
  if (intValue >= 1000000) {
    return '${(intValue / 1000000).round()} مليون';
  } else if (intValue >= 1000) {
    return '${(intValue / 1000).round()} ألف';
  } else {
    return intValue.toString();
  }
}

String formatPublishedDate(String dateString) {
  final dt = DateTime.tryParse(dateString)?.toLocal();
  if (dt == null) return '';

  final now = DateTime.now();
  var diff = now.difference(dt);

  if (diff.isNegative) return 'الآن';

  if (diff.inSeconds < 60) return 'قبل لحظات';

  if (diff.inMinutes < 60) {
    return _ytAgo(
      diff.inMinutes,
      singular: 'دقيقة',
      dual: 'دقيقتين',
      few: 'دقائق',
      many: 'دقيقة',
    );
  }

  if (diff.inHours < 24) {
    return _ytAgo(
      diff.inHours,
      singular: 'ساعة',
      dual: 'ساعتين',
      few: 'ساعات',
      many: 'ساعة',
    );
  }

  if (diff.inDays < 7) {
    return _ytAgo(
      diff.inDays,
      singular: 'يوم',
      dual: 'يومين',
      few: 'أيام',
      many: 'يوم',
    );
  }

  if (diff.inDays < 30) {
    final weeks = (diff.inDays / 7).floor();
    return _ytAgo(
      weeks,
      singular: 'أسبوع',
      dual: 'أسبوعين',
      few: 'أسابيع',
      many: 'أسبوع',
    );
  }

  if (diff.inDays < 365) {
    final months = (diff.inDays / 30).floor();
    return _ytAgo(
      months,
      singular: 'شهر',
      dual: 'شهرين',
      few: 'أشهر',
      many: 'شهر',
    );
  }

  final years = (diff.inDays / 365).floor();
  return _ytAgo(
    years,
    singular: 'سنة',
    dual: 'سنتين',
    few: 'سنوات',
    many: 'سنة',
  );
}

/// YouTube-like Arabic pluralization:
/// 1  => قبل <unit> واحد/واحدة
/// 2  => قبل <dual>
/// 3-10 => قبل n <few>
/// 11+ => قبل n <many> (usually singular form in Arabic UI)
String _ytAgo(
  int n, {
  required String singular,
  required String dual,
  required String few,
  required String many,
}) {
  if (n <= 0) return 'قبل لحظات';
  if (n == 1) return 'قبل $singular';
  if (n == 2) return 'قبل $dual';

  final mod100 = n % 100;
  if (mod100 >= 3 && mod100 <= 10) {
    return 'قبل $n $few';
  }
  return 'قبل $n $many';
}

String formatLikeCount(String likeCount) {
  final intValue = int.tryParse(likeCount) ?? 0;
  if (intValue >= 1000000) {
    return '${(intValue / 1000000).round()} مليون';
  } else if (intValue >= 1000) {
    return '${(intValue / 1000).round()} ألف';
  } else {
    return intValue.toString();
  }
}

String formatNumberWithCommas(String number) {
  final intValue = int.tryParse(number) ?? 0;
  return intValue.toString().replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (Match m) => '${m[1]},',
  );
}

String formatDate(String dateString) {
  final dateTime = DateTime.parse(dateString);
  return '${dateTime.year}/${dateTime.month}/${dateTime.day}';
}
