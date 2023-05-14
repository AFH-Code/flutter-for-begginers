import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RedTextWidget extends StatelessWidget {
  RedTextWidget({required this.text});

  final String text;

  @override
  Widget build(BuildContext context){
    return AutoSizeText(
      text,
      style: TextStyle(color: Colors.red),
    );
  }
}

