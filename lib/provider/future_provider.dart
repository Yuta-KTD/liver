import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider =
    FutureProvider.family<String, String>((ref, familyString) {
  return Future.delayed(const Duration(seconds: 5), () {
    return 'Hello Future $familyString';
  });
});
