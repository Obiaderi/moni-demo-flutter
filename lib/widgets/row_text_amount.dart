import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_text_widget.dart';

class RowTextAmount extends StatelessWidget {
  const RowTextAmount({
    Key? key,
    required this.title,
    this.amount = "0",
    this.amountColor = yellowish,
  }) : super(key: key);

  final String title;
  final String amount;
  final Color amountColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextWidget(
          text: title,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        const Spacer(),
        CustomTextWidget(
          text: amount,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: amountColor,
        ),
      ],
    );
  }
}
