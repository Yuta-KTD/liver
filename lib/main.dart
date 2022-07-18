import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liver/provider/post_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsyncValue = ref.watch(postsProvider);
    return MaterialApp(
      title: 'Flutter demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter_riverpodでhttpやってみる!'),
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: postAsyncValue.when(
            data: (posts) {
              return ListView.builder(
                itemCount: 99,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(posts[index].title),
                    subtitle: Text(posts[index].userId.toString()),
                  );
                },
              );
            },
            error: (error, stack) => Center(
              child: Text(error.toString()),
            ),
            loading: (() => const Center(child: CircularProgressIndicator())),
          ),
        ),
      ),
    );
  }
}
