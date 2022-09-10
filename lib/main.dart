import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liver/model/routes.dart';
import 'package:liver/pages/basic_provider_screen.dart';
import 'package:liver/pages/clip_board_screen.dart';
import 'package:liver/pages/main_page.dart';
import 'package:liver/pages/riverpod_provider_screen.dart';
import 'package:liver/pages/state_notifier_provider.dart';
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
      theme: ThemeData.dark(),
      routes: <String, WidgetBuilder>{
        RouteNames.riverpodProviderPath: (BuildContext context) =>
            const RiverpodProviderScreen(),
        RouteNames.textFieldPath: (BuildContext context) =>
            const TextFieldScreen(),
        RouteNames.clipBoardPath: (BuildContext context) =>
            const ClipBoardScreen(),
        RouteNames.basicProviderPath: (context) => const BasicProviderScreen(),
        RouteNames.stateNotifierPath: (context) =>
            const StateNotifierProviderScreen(),
      },
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        fontFamily: 'NotoSansCJKJp',
      ),
    );
  }
}
