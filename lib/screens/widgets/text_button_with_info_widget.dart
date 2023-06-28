import 'package:flutter/material.dart';

class TextButtonWithInfo extends StatelessWidget {
  const TextButtonWithInfo({
    super.key,
    required this.infoString,
    required this.textButtonCallback,
    required this.textButtonChild,
  });

  final String infoString;
  final VoidCallback textButtonCallback;
  final String textButtonChild;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(infoString),
          const SizedBox(width: 10),
          TextButton(
            onPressed: textButtonCallback,
            style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            child: Text(textButtonChild),
          )
        ],
      ),
    );
  }
}
