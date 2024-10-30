import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
const HomePage({Key? key}) : super(key: key);
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Home Page')),
    drawer: Drawer(
      child: ListView(
        children: const [
          ListTile(title: Text('Home Page')),
          ListTile(title: Text('About Page')),
        ],
      ),
    ),
    body: const Task(),
    bottomNavigationBar: BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
    ]),
  );
}
}

class Heading extends StatelessWidget {
  final String text;

  const Heading({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class BiggerText extends StatefulWidget {
  final String teks;

  const BiggerText({Key? key, required this.teks}) : super(key: key);

  @override
  State<BiggerText> createState() => _BiggerTextState();
}

class _BiggerTextState extends State<BiggerText> {
  double _textSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.teks,
          style: TextStyle(fontSize: _textSize),
        ),
        ElevatedButton(
          child: Text(_textSize == 16.0 ? "Perbesar" : "Perkecil"),
          onPressed: () {
            setState(() {
              _textSize = _textSize == 16.0 ? 32.0 : 16.0;
            });
          },
        ),
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Colors.red,
      border: Border.all(color: Colors.blue, width: 3),
      borderRadius: BorderRadius.circular(15),
      ),
      child: const Text(
        'Hi',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}

class MyPadding extends StatelessWidget {
  const MyPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: const Text('Hello World!'),
    );
  }
}

class CenteredText extends StatelessWidget {
  const CenteredText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text('Hello World!'),
    );
  }
}

class SizedBoxPage extends StatelessWidget {
  const SizedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Ini Judul',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text('Universitas Logistik dan Bisnis Internasional (ULBI)')
      ],
    );
  }
}

class WidgetRow extends StatelessWidget {
  const WidgetRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(Icons.share),
        Icon(Icons.thumb_up),
        Icon(Icons.thumb_down),
      ],
    );
  }
}

class Task extends StatelessWidget {
  const Task({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('MainAxisAligment.spaceEvenly'),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(Icons.share),
          Icon(Icons.thumb_up),
          Icon(Icons.thumb_down),
          ],
        ),
        Padding(padding: const EdgeInsets.all(20)),

        Text('MainAxisAlignment.spaceAround'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        Padding(padding: const EdgeInsets.all(20)),

        Text('MainAxisAlignment.spaceBetween'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        Padding(padding: const EdgeInsets.all(20)),

        Text('MainAxisAlignment.Start'),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        Padding(padding: const EdgeInsets.all(20)),

        Text('MainAxisAlignment.Center'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        Padding(padding: const EdgeInsets.all(20)),

        Text('MainAxisAlignment.End'),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
      ],
    );
  }
}