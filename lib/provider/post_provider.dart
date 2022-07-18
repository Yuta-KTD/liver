import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liver/model/post_model.dart';

// Post モデルを使えるようにするプロバイダーを定義
// List 型に Post クラスを肩として使う
// post_model.dartから、fetchPostsメソッドを呼び出す。
final postsProvider = FutureProvider<List<Post>>((ref) async {
  return fetchPost();
});
