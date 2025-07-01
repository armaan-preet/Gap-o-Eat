import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap_o_eat/common/style/padding.dart';
import 'package:gap_o_eat/utils/constants/images.dart';
import 'package:gap_o_eat/utils/constants/sizes.dart';
import 'package:gap_o_eat/utils/constants/texts.dart';
import 'package:gap_o_eat/utils/helpers/device_helpers.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  
  // ignore: non_constant_identifier_names
  get Get => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
           actions: [
            IconButton(onPressed: () => Get.offAll(()=> LoginScreen()), icon: Icon(CupertinoIcons.clear))
           ],
            
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: UPadding.screenPadding,
            child: Column(
                children: [
                    /// Image
                    Image.asset(UImages.mailSentImage, height: UDeviceHelper.getScreenWidth(context)*0.6),
                    SizedBox(height: USizes.spaceBtwItems),
                    /// Title
                    Text(UTexts.resetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium),
                    SizedBox(height: USizes.spaceBtwItems),

                    /// Email
                    Text(@gmail.com,style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(height: USizes.spaceBtwItems),


                    /// Subtitle
                    Text(UTexts.resetPasswordSubTitle,style: Theme.of(context).textTheme.bodySmall),
                    SizedBox(height: USizes.spaceBtwSections),

                    /// Done
                    ElevatedButton(onPressed: (){}, child: Text(UTexts.done)),
                    /// Resend Email
                    SizedBox(
                        width: double.infinity,
                        child: TextButton(onPressed: (){}, child: Text(UTexts.resendEmail)))
                ],
            ),
          ),
        ),
    );
  }
}