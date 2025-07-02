
import 'package:flutter/material.dart';
import 'package:gap_o_eat/utils/constants/colors.dart';
import 'package:gap_o_eat/utils/constants/images.dart';
import 'package:gap_o_eat/utils/constants/sizes.dart';

class UsocialButtons extends StatelessWidget {
  const UsocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton(UImages.GoogleIcon,(){}),
        SizedBox(width: USizes.spaceBtwItems),
        buildButton(UImages.FacebookIcon,(){}),
        
      ],
    );
  }

  Container buildButton( String image, VoidCallback onPressed) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color:UColors.grey),
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(
          onPressed:onPressed,
          icon: Image.asset(
            image,
            height: USizes.iconMd,
            width: USizes.iconMd,
          ),
        ),
      );
  }
}

