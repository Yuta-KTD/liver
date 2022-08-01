import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldScreen extends StatelessWidget {
  const TextFieldScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('textField'),
      ),
      body: const Center(
        child: TextFieldForm(),
      ),
    );
  }
}

class TextFieldForm extends StatefulWidget {
  const TextFieldForm({Key? key}) : super(key: key);

  @override
  State<TextFieldForm> createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm> {
  String _inputText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: <Widget>[
          Text(
            _inputText,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            maxLength: 10,
            maxLengthEnforcement: MaxLengthEnforcement.none,
            onChanged: _handleText,
            decoration: const InputDecoration(helperText: '表示用テスト'),
          ),
        ],
      ),
    );
  }

  _handleText(String? e) {
    setState(() {
      _inputText = e ?? '';
    });
  }
}
