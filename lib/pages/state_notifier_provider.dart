import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liver/provider/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StateNotifierのサブクラスはStateNotifireProviderインスタンスで.notifierを指定することで取得できる
    final countStateController = ref.read(countNotifierProvider.notifier);
    // StateNotifierのStateはStateNotifierのインスタンスを指定することで取得できる
    final count = ref.watch(countNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotiferProvider Test'),
      ),
      body: Center(
        child: Text(
          count.toString(),
          style: const TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countStateController.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
