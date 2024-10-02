import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RowActionsBook extends StatelessWidget {
  const RowActionsBook({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomButton(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            text: r"19.99$",
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
            child: CustomButton(
          backgroundColor: Color(0xffEF8262),
          textColor: Colors.white,
          text: "Free Preview",
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        )),
      ],
    );
  }
}
