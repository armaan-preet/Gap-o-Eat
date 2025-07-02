import 'package:flutter/material.dart';
import 'package:gap_o_eat/utils/constants/colors.dart';
import 'package:gap_o_eat/utils/helpers/helper_function.dart';

class UformDivider extends StatelessWidget {
  const UformDivider({
  super.key,required this.title, required this.dark,
  });

  final bool dark;
  final String title;
  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: 60,
            endIndent: 5,
            thickness: 0.5,
            color: dark ? UColors.darkGrey : Colors.grey,
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Expanded(
          child: Divider(
            indent: 60,
            endIndent: 5,
            thickness: 0.5,
            color: dark ? UColors.darkGrey : Colors.grey,
          ),
        ),
      ],
    );
  }
}
