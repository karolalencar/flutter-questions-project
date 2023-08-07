import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final void Function() onSelected;

  const Answer(this.text, this.onSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          child: Text(text),
          onPressed: () {
            onSelected();
          },
        ),
      ),
    );
  }
}
