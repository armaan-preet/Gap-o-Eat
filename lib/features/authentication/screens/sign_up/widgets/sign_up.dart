

// ignore_for_file: camel_case_types

import 'package:gap_o_eat/common/widgets/buttons/elevated_button.dart';
import 'package:gap_o_eat/features/authentication/screens/sign_up/widgets/privacy_policy.dart';
import 'package:gap_o_eat/utils/constants/sizes.dart';
import 'package:gap_o_eat/utils/constants/texts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
class sign_up extends StatelessWidget {
  const sign_up({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       Row(
         children: [
           /// first name and last name
           Row(),
           SizedBox(height: USizes.spaceBtwInputFields),
    
           TextFormField(
             decoration: InputDecoration(
               labelText: UTexts.email,
               prefixIcon: Icon(Iconsax.direct_right)
             ),
           ),
           SizedBox(height: USizes.spaceBtwInputFields),
    
             ///---phone number
           TextFormField(
             decoration: InputDecoration(
               labelText: UTexts.phoneNumber,
               prefixIcon: Icon(Iconsax.call)
             ),
           ),
            SizedBox(height: USizes.spaceBtwInputFields),
    
    
            ///---password
            TextFormField(
             decoration: InputDecoration(
               prefixIcon: Icon(Iconsax.password_check),
               labelText: UTexts.password,
               suffixIcon: Icon(Iconsax.eye)
             ),
            ),
            SizedBox(height: USizes.spaceBtwInputFields/2),
    
             ///---privCacy policy checkbox
            Uprivacy_policy_checkbox(),
            SizedBox(height: USizes.spaceBtwItems),
             ///---create account
            UElevatedButton(onPressed:(){}, child:Text(UTexts.createAccount))
         ],
       ),
       ///---FIRST NAME
       Expanded(child: TextFormField(
         decoration: InputDecoration(
           labelText: UTexts.firstName,
           prefixIcon: Icon(Iconsax.user)
         ),
       )),
       SizedBox(width: USizes.spaceBtwInputFields),
       ///---LAST NAME
       Expanded(child: TextFormField(
         decoration: InputDecoration(
           labelText: UTexts.lastName,
           prefixIcon: Icon(Iconsax.user)
         ),
       )),
     ],
    );
  }
}

