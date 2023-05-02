import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_text_widget.dart';

class TextRowContainer extends StatelessWidget {
  const TextRowContainer({
    Key? key,
    required this.text,
    required this.text2,
    required this.text2Color,
  }) : super(key: key);

  final String text;
  final String text2;
  final Color text2Color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CustomTextWidget(
              text: text,
              color: white,
              fontWeight: FontWeight.w400,
            ),
          ),
          CustomTextWidget(
            text: text2,
            color: text2Color,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
