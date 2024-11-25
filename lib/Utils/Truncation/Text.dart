import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TruncatedText extends StatelessWidget {
  final String text;

  TruncatedText({required this.text});

  @override
  Widget build(BuildContext context) {
    // Split the text into words
    List<String> words = text.split(' ');
    // Take only the first two words and join them with a space
    String truncatedText = words.take(2).join(' ');

    return Text(truncatedText,style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis,);
  }
}
