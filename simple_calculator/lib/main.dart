import 'package:flutter/material.dart';

void main() => runApp(IndexWidget());

class IndexWidget extends StatelessWidget {
  const IndexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Calculator App')]
          )
        )
      ),
    );
  }
}