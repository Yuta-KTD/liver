import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liver/provider/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(futureProvider('Test'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: value.when(
            data: (data) => Text(
                  data.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
            error: (error, StackTrace? trace) => Text(
                  error.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}
