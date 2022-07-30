import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:liver/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('test', (){
    testWidgets('tap on the floating aciotn button', (WidgetTester tester) async {
      // runApp起動
      app.main();
      // 起動を待つ
      await tester.pumpAndSettle();

      
    });
  });
}