import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram_sample_application/views/components/rich_text/base_text.dart';
import 'package:instagram_sample_application/views/components/rich_text/link_text.dart';

class RichTextWidget extends StatelessWidget {
  final TextStyle? styleForAll;
  final Iterable<BaseText> texts;

  const RichTextWidget({
    Key? key,
    required this.texts,
    this.styleForAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: texts.map(
          (baseText) {
            if (baseText is LinkText) {
              return TextSpan(
                text: baseText.text,
                style: styleForAll?.merge(baseText.style),
                recognizer: TapGestureRecognizer()..onTap = baseText.onTapped,
              );
            } else {
              return TextSpan(
                text: baseText.text,
                style: styleForAll?.merge(baseText.style),
              );
            }
          },
        ).toList(),
      ),
    );
  }
}
