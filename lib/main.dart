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
  int pageNumber = 0;
  int maxPageNumber = 35;

  void changePage (String direction) {
    if (direction == 'next') {
      if (pageNumber >= 35)
        pageNumber=0;
      else
        ++pageNumber;
    }

    else if (direction == 'prev') {
      if (pageNumber <= 0)
        pageNumber=35;
      else
        --pageNumber;
    }
  }

  double updateProgress() {
    if (maxPageNumber == 0) {
      return 0;
    }
    else {
      return  pageNumber / maxPageNumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8.0),
                  child: Image.asset('assets/images/page$pageNumber.JPG'),
                ),
            ),
            Row(
              children: [
                Expanded(
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent.shade200)
                        ),
                        onPressed: () {
                          setState (() {
                            changePage('prev');
                          });
                        },
                        child: Text(
                            'Prev',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                      ),
                    ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent.shade200)
                      ),
                      onPressed: () {
                        setState (() {
                          changePage('next');
                        });
                      },
                      child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding
              (
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: LinearProgressIndicator(
                value: updateProgress(),
                backgroundColor: Colors.green.shade200,
              ),
            ),
          ],
    ),
      ),
    );
  }
}
