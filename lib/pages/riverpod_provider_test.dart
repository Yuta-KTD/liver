import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liver/provider/post_provider.dart';

class RiverpodProviderTest extends ConsumerWidget {
  const RiverpodProviderTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsyncValue = ref.watch(postsProvider);
    return MaterialApp(
      title: 'Flutter demo',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('flutter_riverpod'),
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: true,
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
