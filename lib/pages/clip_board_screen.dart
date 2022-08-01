import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClipBoardScreen extends StatelessWidget {
  const ClipBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clip Board'),
      ),
      body: const Center(
        child: ClipBoardForm(),
      ),
    );
  }
}

class ClipBoardForm extends StatefulWidget {
  const ClipBoardForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ClipBoardState();
}

class _ClipBoardState extends State<ClipBoardForm> {
  final _firstField = FocusNode();
  final _pasteTextController = TextEditingController();
  String? clipedText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: _handleText,
            decoration: const InputDecoration(
              hintText: 'Clip Board Test',
            ),
            focusNode: _firstField,
          ),
          ElevatedButton(
            onPressed: _clipText,
            child: const Text('クリップボードにコピー'),
          ),
          ElevatedButton(
            onPressed: _focusField,
            child: const Text('上のテキストフィールドにフォーカス'),
          ),
          TextField(
            enabled: false,
            controller: _pasteTextController,
          ),
          ElevatedButton(
            onPressed: _pasteText,
            child: const Text('上のフィールドにペースト'),
          ),
        ],
      ),
    );
  }

  _handleText(String? value) {
    clipedText = value ?? '';
  }

  _clipText() async {
    final data = ClipboardData(text: clipedText);
    final dataText = data.text;
    await Clipboard.setData(data).then((_) {
      if (Platform.isAndroid) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$dataTextをコピーしました")));
      }
    });
  }

  _focusField() {
    _firstField.requestFocus();
  }

  _pasteText() async {
    final data = await Clipboard.getData("text/plain");
    _pasteTextController.text = data?.text ?? '';
  }
}
