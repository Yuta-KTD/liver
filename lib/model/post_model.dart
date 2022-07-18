import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

// jsonplaceholder から、データを取得するクラスを定義
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  // コンストラクターを定義
  Post({
    required this.userId,
    required this.body,
    required this.id,
    required this.title,
  });

  // 新しいインスタンスを作成し、jsonを解析してデータを
  // 新しいインスタンスに配置します。(公式を翻訳)
  Post.fromjson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'];

  // インスタンスをマップに変換するtoJson()メソッド
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}

List<Post> parsePosts(String respobseBody) {
  // 引数をキャストしてMap型に変換
  final parsed = convert.jsonDecode(respobseBody).cast<Map<String, dynamic>>();
  // 配列をmapメソッドでループさせる。
  return parsed.map<Post>((json) => Post.fromjson(json)).toList();
}

// 外部からデータを取得するメソッド
Future<List<Post>> fetchPost() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  final response = await http.get(url);
  if (response.statusCode == 200) {
    return compute(parsePosts, response.body);
  } else {
    throw Exception('Failed to load post');
  }
}
