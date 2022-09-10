import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liver/provider/provider_provider.dart';

// TODO: ページネーションしてRiverpod関連は全部このページにする
class BasicProviderScreen extends ConsumerWidget {
  const BasicProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(strProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Provider'),
      ),
      body: Center(
        child: Text(
          value,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
