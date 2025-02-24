import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyShare extends StatefulWidget {
  const MyShare({super.key});

  @override
  State<MyShare> createState() => _MyShareState();
}

class _MyShareState extends State<MyShare> {
  late SharedPreferences prefs;

  final _kataController = TextEditingController();

  String? kata = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _kataController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                saveValue();
              },
              child: const Text('Save'),
            ),
            const SizedBox(height: 20),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                hintText: kata,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                getValue().then((value) {
                  setState(() {
                    kata = value ?? 'value sudah dihapus';
                  });
                });
              },
              child: const Text('Get Value'),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                deleteValue();
              },
              child: const Text('Delete Value'),
            ),
          ]
        ),
      ),
    );
  }

  saveValue() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('kata', _kataController.text);
    _kataController.clear();
    setState(() {
      kata = prefs.getString('kata');
    });
  }

  getValue() async {
    prefs = await SharedPreferences.getInstance();
    String? kata = prefs.getString('kata');
    return kata;
  }

  deleteValue() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('kata');
    setState(() {
      kata = '';
    });
  }

  @override
  void dispose() {
    _kataController.dispose();
    super.dispose();
  }
}