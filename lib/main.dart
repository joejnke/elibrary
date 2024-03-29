import 'package:flutter/material.dart';

void main() => runApp(Elibrary());

class Elibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffaa5d62),
          title: Center(
              child: Text('የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተ ክርስቲያን ታሪክ')),
        ),
        backgroundColor: Color(0xffe9b7c3),
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
  bool isPrevActive = false;
  bool isNextActive = true;

  void setNextButtonState () {
    pageNumber == maxPageNumber ? isNextActive = false : isNextActive = true;
  }

  void setPrevButtonState () {
    pageNumber == 0 ? isPrevActive = false : isPrevActive = true;
  }

  void changePage (String direction) {
    if (direction == 'next') {
      ++pageNumber;
      setNextButtonState();
      setPrevButtonState();
    }

    else if (direction == 'prev') {
      --pageNumber;
      setPrevButtonState();
      setNextButtonState();
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
                          backgroundColor: MaterialStateProperty.all(Color(0xff856572))
                        ),
                        onPressed: isPrevActive ?  () {
                          setState (() {
                            changePage('prev');
                          });
                        } : null,
                        child: Text(
                            'ቀዳሚ',
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
                          backgroundColor: MaterialStateProperty.all(Color(0xff8b4a53)),
                      ),
                      onPressed: isNextActive ? () {
                        setState (() {
                          changePage('next');
                        });
                      } : null,
                      child: Text(
                          'ቀጣይ',
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
                backgroundColor: Color(0x99856572),
                color: Color(0xff8b4a53),
              ),
            ),
          ],
    ),
      ),
    );
  }
}
