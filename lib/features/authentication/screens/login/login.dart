import 'package:flutter/material.dart';
import 'package:gap_o_eat/common/style/padding.dart';
import 'package:gap_o_eat/common/widgets/buttons/login_signup/form_divider.dart';
import 'package:gap_o_eat/common/widgets/buttons/social_buttons.dart';
import 'package:gap_o_eat/features/authentication/screens/login/widgets/login_form.dart';
import 'package:gap_o_eat/features/authentication/screens/login/widgets/login_header.dart';
import 'package:gap_o_eat/utils/constants/sizes.dart';
import 'package:gap_o_eat/utils/constants/texts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
      child:Padding(
        padding: UPadding.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///---header
            /// TITLE AND SUBTITLE
            ULoginheader(),
            SizedBox(height: USizes.spaceBtwSections),

            ///---form
            ULoginform(),
            SizedBox(height: USizes.spaceBtwSections),

            ///divider
            UformDivider(title:UTexts.orSignInWith),
            SizedBox(height: USizes.spaceBtwSections),

            ///footer
            UsocialButtons(),
          ],
        ),
      ),
    )
   );
  }
}
