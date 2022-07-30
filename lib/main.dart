import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liver/model/routes.dart';
import 'package:liver/pages/main_page.dart';
import 'package:liver/pages/riverpod_provider_screen.dart';
import 'package:liver/pages/text_field_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
      initialRoute: RouteNames.mainPage,
      routes: <String, WidgetBuilder>{
        RouteNames.riverpodProviderPath: (BuildContext context) =>
            const RiverpodProviderScreen(),
        RouteNames.textFieldPath: (BuildContext context) =>
            const TextFieldScreen(),
      },
    );
  }
}
