// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gap_o_eat/common/style/padding.dart';
import 'package:gap_o_eat/features/authentication/screens/Forget_password/reset_password.dart';
import 'package:gap_o_eat/utils/constants/sizes.dart';
import 'package:gap_o_eat/utils/constants/texts.dart';
// ignore: unused_import
import 'package:gap_o_eat/utils/themes/widgets_theme/elevated_button_theme.dart';
// ignore: depend_on_referenced_packages
import "package:iconsax/iconsax.dart";

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});
  
  get Get => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -----[Header]-----
              /// Title
              Text(UTexts.forgetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: USizes.spaceBtwItems/2),
              /// SubTitle
              Text(UTexts.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium),

              SizedBox(height: USizes.spaceBtwSections*2),
              /// -----[Form]-----
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: UTexts.email,
                      prefixIcon: Icon(Iconsax.direct_right)
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwItems),

                  ElevatedButton(onPressed:() => Get.to(() => ResetPasswordScreen()),child:Text(UTexts.submit))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}