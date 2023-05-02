import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_text_widget.dart';

class CustomExpandDropdown extends StatelessWidget {
  const CustomExpandDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const CustomTextWidget(
        text: "Overdue Loans",
        color: titleTile,
      ),
      children: [
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "images/avatar.png",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          title: RichText(
            text: const TextSpan(
              text: 'Florence Tanika ',
              style: TextStyle(
                color: titleTile,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '.',
                  style: TextStyle(
                    color: dotColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' 3 days over due',
                  style: TextStyle(
                    color: redText,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          subtitle: const CustomTextWidget(
            text: "₦10,555,000 Late loan",
            color: redText,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
