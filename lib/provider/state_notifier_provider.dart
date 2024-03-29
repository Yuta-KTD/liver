import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() {
    state++;
  }
}

final countNotifierProvider =
    StateNotifierProvider.autoDispose<CounterNotifier, int>((ref) {
  return CounterNotifier();
});
