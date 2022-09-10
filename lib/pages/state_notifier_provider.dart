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
    final countWatch = ref.watch(countNotifierProvider);
    final countRead = ref.read(countNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotiferProvider Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Watch',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              countWatch.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Read',
              style: TextStyle(fontSize: 20),
            ),
            // watchしているものがあると、同じタイミングでリビルドが走るので値が更新されてしまう
            Text(
              countRead.toString(),
              style: const TextStyle(fontSize: 30),
            ),
          ],
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
