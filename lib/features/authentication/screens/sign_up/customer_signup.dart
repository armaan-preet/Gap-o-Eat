import 'package:flutter/material.dart';
import 'package:gap_o_eat/common/style/padding.dart';
import 'package:gap_o_eat/features/authentication/screens/sign_up/widgets/sign_up.dart';
import 'package:gap_o_eat/utils/constants/sizes.dart';
import 'package:gap_o_eat/utils/constants/texts.dart';

class CustomerSignup extends StatelessWidget {
  const CustomerSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding ,
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              ///----HEADER
              ///Title
             Text(UTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
             SizedBox(height: USizes.spaceBtwSections),
            

             ///-----FORM
             sign_up(),
             ///---DIVIDER
             UFormDivider(title: UTexts.orSignInWith ),
             SizedBox(height: USizes.spaceBtwSections),

             ///---footer
             USocialButtons()

           ],
        ),
       ),
      ) ,
    );
  }
}
