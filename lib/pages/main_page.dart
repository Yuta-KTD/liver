import 'package:flutter/material.dart';
import 'package:liver/model/routes.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TopPage'),
      ),
      body: Container(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('勉強ページ！'),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text('Riverpod'),
                onPressed: () => Navigator.of(context)
                    .pushNamed(RouteNames.riverpodProviderPath),
              )
            ],
          ),
        ),
      ),
    );
  }
}
