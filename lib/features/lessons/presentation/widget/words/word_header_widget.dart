import 'package:flutter/material.dart';

class WordHeaderWidget extends StatelessWidget {
  const WordHeaderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Word',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Yomikata',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
          Expanded(
              flex: 2,
              child: Center(
                  child: Text(
                    'Meaning',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
        ],
      ),
    );
  }
}