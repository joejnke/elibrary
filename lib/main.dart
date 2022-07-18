import 'package:flutter/material.dart';

void main() => runApp(Elibrary());

class Elibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text('E-library')),
        ),
        backgroundColor: Colors.blue,
        body: SafeArea(
            child: ebook(),
        ),
      ),
    );
  }
}

class ebook extends StatefulWidget {
  @override
  State<ebook> createState() => _ebookState();
}

class _ebookState extends State<ebook> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          'Selam Ethiopia',
    ),
    );
  }
}
